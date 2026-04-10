"""
Build crc_va.db (SQLite) from the MySQL-style .sql scripts in updated-db-scripts/.
Run: py build_db.py
Output: data/crc_va.db
"""
import os
import re
import sqlite3

ROOT = os.path.dirname(os.path.abspath(__file__))
SCRIPTS_DIR = os.path.join(ROOT, "updated-db-scripts")
OUT_DIR = os.path.join(ROOT, "data")
DB_PATH = os.path.join(OUT_DIR, "crc_va.db")

# Order matters only for FK references; here tables are independent.
SQL_FILES = [
    "Colorectal_Cancer_Datasets.sql",
    "Colorectal_Cancer_Clinical_Info.sql",
    "Normal_Colon_Exome_Datasets.sql",
    "Normal_Colon_Exome_Datasets_Cli.sql",
    "Germline_Variant_Data.sql",
    "Somatic_Variant_Data.sql",
    "Mutation_Data.sql",
]


def mysql_to_sqlite(sql: str) -> str:
    # Strip line comments (-- ...) but keep statements intact
    sql = re.sub(r"--[^\n]*", "", sql)
    # AUTO_INCREMENT -> AUTOINCREMENT (SQLite requires INTEGER PRIMARY KEY AUTOINCREMENT)
    sql = re.sub(r"INT\s+AUTO_INCREMENT\s+PRIMARY\s+KEY",
                 "INTEGER PRIMARY KEY AUTOINCREMENT", sql, flags=re.IGNORECASE)
    sql = re.sub(r"AUTO_INCREMENT", "", sql, flags=re.IGNORECASE)
    return sql


def dedupe_create_columns(stmt: str) -> str:
    """Inside a CREATE TABLE (...) statement, drop any column whose name
    repeats an earlier column. Mutation_Data.sql declares SIFT_pred twice,
    which MySQL tolerated historically but SQLite rejects."""
    m = re.match(r"(CREATE\s+TABLE\s+\S+\s*\()(.*)(\)\s*)$",
                 stmt, flags=re.IGNORECASE | re.DOTALL)
    if not m:
        return stmt
    head, body, tail = m.group(1), m.group(2), m.group(3)
    # Split top-level commas (no parentheses nesting in our schemas, so simple split is fine)
    parts = [p.strip() for p in body.split(",")]
    seen = set()
    kept = []
    for p in parts:
        col_match = re.match(r"(\w+)\s+", p)
        if col_match:
            col = col_match.group(1).lower()
            if col in seen:
                continue
            seen.add(col)
        kept.append(p)
    return head + ",\n    ".join(kept) + tail


def split_statements(sql: str):
    """Split on ';' but ignore semicolons inside single-quoted string literals.
    Handles SQL-style escaped quotes (''). Works for our INSERT data which
    contains ';' inside values like 'SureSelectXT reagent kit; all exon v5'."""
    statements = []
    buf = []
    in_str = False
    i = 0
    n = len(sql)
    while i < n:
        ch = sql[i]
        if ch == "'":
            if in_str and i + 1 < n and sql[i + 1] == "'":
                buf.append("''")
                i += 2
                continue
            in_str = not in_str
            buf.append(ch)
        elif ch == ";" and not in_str:
            stmt = "".join(buf).strip()
            if stmt:
                statements.append(stmt)
            buf = []
        else:
            buf.append(ch)
        i += 1
    tail = "".join(buf).strip()
    if tail:
        statements.append(tail)
    return statements


def main():
    os.makedirs(OUT_DIR, exist_ok=True)
    if os.path.exists(DB_PATH):
        os.remove(DB_PATH)
    conn = sqlite3.connect(DB_PATH)
    cur = conn.cursor()

    total = 0
    for fname in SQL_FILES:
        path = os.path.join(SCRIPTS_DIR, fname)
        with open(path, "r", encoding="utf-8") as f:
            raw = f.read()
        cleaned = mysql_to_sqlite(raw)
        for stmt in split_statements(cleaned):
            stmt = dedupe_create_columns(stmt)
            try:
                cur.execute(stmt)
                total += 1
            except sqlite3.Error as e:
                print(f"[ERROR] {fname}: {e}")
                print("  Statement preview:", stmt[:120].replace("\n", " "))
                raise
        print(f"[OK] {fname}")

    conn.commit()

    # Quick row count summary
    print("\nRow counts:")
    for (name,) in cur.execute(
        "SELECT name FROM sqlite_master WHERE type='table' ORDER BY name"
    ).fetchall():
        n = cur.execute(f"SELECT COUNT(*) FROM {name}").fetchone()[0]
        print(f"  {name}: {n}")

    conn.close()
    size_kb = os.path.getsize(DB_PATH) / 1024
    print(f"\nWrote {DB_PATH} ({size_kb:.1f} KB), executed {total} statements.")


if __name__ == "__main__":
    main()
