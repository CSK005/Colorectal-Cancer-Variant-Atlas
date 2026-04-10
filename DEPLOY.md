# Colorectal Cancer Variant Atlas (CRC-VA) — Deployment Guide

This is a **fully static** rebuild of the original PHP/MySQL site. The data
lives in a single SQLite file (`data/crc_va.db`) that is loaded directly in
the browser using [sql.js](https://sql.js.org/) (SQLite compiled to
WebAssembly). There is **no backend** and **no database server** to maintain.

This makes it ideal for a PhD thesis: free to host, nothing to keep alive,
and citable for as long as the GitHub repository exists.

---

## 1. Project layout

```
ui3.0/
├── index.html                       # Landing page (logo, summary, iframes)
├── full_cancer_view.html            # Cancer dataset table
├── full_ncb_sra.html                # Normal-tissue dataset table
├── table_somatic_variants.html      # Somatic variant counts
├── table_germline_variants.html     # Germline variant counts
├── view_details_cancer_study.html   # Per-sample cancer clinical info
├── view_details_normal_study.html   # Per-sample normal clinical info
├── js/
│   └── crc-db.js                    # Shared sql.js loader + DataTables helper
├── data/
│   └── crc_va.db                    # SQLite database (built from .sql files)
├── img/                             # Logo, workflow & variant graphs
├── updated-db-scripts/              # Original MySQL .sql sources (kept for reference)
├── build_db.py                      # Rebuilds data/crc_va.db from the .sql files
└── DEPLOY.md                        # This file
```

The **old `.php` files are no longer used** but have been left in place so
nothing is lost. You can delete them once you're happy with the new site.

## 2. Rebuilding the database

Whenever you edit anything under `updated-db-scripts/`, regenerate the
SQLite file:

```bash
py build_db.py
```

This produces `data/crc_va.db`. Commit the new `.db` file to git so GitHub
Pages serves it.

## 3. Running locally

You **cannot** just double-click `index.html` — browsers block `fetch()`
on `file://` URLs, so sql.js will not be able to load `data/crc_va.db`.
You need any tiny local web server. Pick one:

```bash
# From inside the ui3.0/ directory:
py -m http.server 8000
```

Then open <http://localhost:8000/index.html>.

## 4. Free hosting on GitHub Pages (recommended)

GitHub Pages is free for public repositories, has no idle timeout, and
gives you a permanent URL you can cite in your thesis.

1. **Create a GitHub account** (if you don't already have one) at
   <https://github.com/signup>.
2. **Create a new public repository** named e.g. `crc-va`.
3. **Push the `ui3.0/` contents to the repo root** (not inside a
   subfolder), so `index.html` sits at the top of the repo:

   ```bash
   cd ui3.0
   git init
   git add .
   git commit -m "Initial CRC-VA static site"
   git branch -M main
   git remote add origin https://github.com/<your-username>/crc-va.git
   git push -u origin main
   ```

4. **Enable Pages**: in your repo on github.com, go to
   **Settings → Pages**. Under **Source**, choose **Deploy from a branch**,
   pick branch **`main`** and folder **`/ (root)`**. Click **Save**.
5. Wait ~1 minute. Your site will be live at:

   ```
   https://<your-username>.github.io/crc-va/
   ```

That's it. No build step, no server, no credentials.

### Alternative free hosts (all work the same way)

| Host             | URL                       | Notes                                  |
| ---------------- | ------------------------- | -------------------------------------- |
| GitHub Pages     | `*.github.io`             | Recommended for academic projects.     |
| Netlify          | `*.netlify.app`           | Drag-and-drop deploy from the dashboard. |
| Cloudflare Pages | `*.pages.dev`             | Connects to a GitHub repo.             |
| Vercel           | `*.vercel.app`            | Connects to a GitHub repo.             |

## 5. How the data flow works

```
Browser
  └─ loads index.html
       └─ iframe → full_cancer_view.html
            └─ <script src="js/crc-db.js">
                 ├─ loads sql.js from CDN (sql-wasm.js + .wasm)
                 └─ fetch('data/crc_va.db')          ← your SQLite file
                      └─ new SQL.Database(buffer)
                           └─ db.exec("SELECT * FROM Colorectal_Cancer_Exome_Dataset")
                                └─ DataTables renders the result
```

The whole database is downloaded once (~76 KB) and queried entirely in the
browser. No round trips after the first load.

## 6. Adding or editing data

1. Edit the relevant file in `updated-db-scripts/` (or add a new `.sql`).
   If you add a new file, also add its filename to the `SQL_FILES` list at
   the top of `build_db.py`.
2. Run `py build_db.py`.
3. `git add data/crc_va.db updated-db-scripts/*.sql && git commit && git push`.
4. GitHub Pages will redeploy automatically within ~1 minute.

## 7. Citing the database in your thesis

Once it's live, you can cite it as e.g.:

> Chandrashekar K., Setlur A. S., Niranjan V., Gautam A., Ishwar K. (2026).
> *Colorectal Cancer Variant Atlas (CRC-VA)*.
> Available at: https://&lt;your-username&gt;.github.io/crc-va/

GitHub also lets you mint a **DOI** for the repo via Zenodo
(<https://guides.github.com/activities/citable-code/>) — recommended for a
thesis dataset.

## 8. Removing the old PHP files (optional)

Once the static site is verified, you can delete:

```
full_cancer_view.php
full_ncb_sra.php
table_germline_variants.php
table_somatic_variants.php
view_details_cancer_study.php
view_details_normal_study.php
```

They contained the AWS RDS credentials, which are no longer needed.
**Strongly recommended**: rotate/disable that AWS RDS password in the AWS
console, since it was hardcoded in the old PHP files and may already be
exposed in your git history.
