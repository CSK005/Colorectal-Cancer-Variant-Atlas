CREATE TABLE Normal_Colon_Exome_Datasets (
    Sl_No INT PRIMARY KEY,                       -- Serial Number
    NCB_SRA_ID VARCHAR(255) NOT NULL,            -- NCB SRA ID
    Design VARCHAR(255),                         -- Design
    Instrument VARCHAR(255),                     -- Instrument
    Strategy VARCHAR(255),                       -- Strategy
    Source VARCHAR(255),                         -- Source
    Selection VARCHAR(255),                      -- Selection
    Layout VARCHAR(255),                          -- Layout
    Url VARCHAR(255)    Default ''                      -- Url
);


-- Insert 
INSERT INTO Normal_Colon_Exome_Datasets (Sl_No, NCB_SRA_ID, Design, Instrument, Strategy, Source, Selection, Layout)
VALUES
(1, 'SRR10550022', 'Whole exome sequencing (WXS)', 'Illumina HiSeq 1000', 'WXS', 'Genomic', 'PCR', 'Paired'),
(2, 'SRR10550023', 'Whole exome sequencing (WXS)', 'Illumina HiSeq 1000', 'WXS', 'Genomic', 'PCR', 'Paired'),
(3, 'SRR10550024', 'Whole exome sequencing (WXS)', 'Illumina HiSeq 1000', 'WXS', 'Genomic', 'PCR', 'Paired'),
(4, 'SRR10550025', 'Whole exome sequencing (WXS)', 'Illumina HiSeq 1000', 'WXS', 'Genomic', 'PCR', 'Paired'),
(5, 'SRR10550026', 'Whole exome sequencing (WXS)', 'HiSeq X Ten', 'WXS', 'Genomic', 'PCR', 'Paired'),
(6, 'SRR10550027', 'Whole exome sequencing (WXS)', 'HiSeq X Ten', 'WXS', 'Genomic', 'PCR', 'Paired'),
(7, 'SRR10550028', 'Whole exome sequencing (WXS)', 'HiSeq X Ten', 'WXS', 'Genomic', 'PCR', 'Paired'),
(8, 'SRR10550029', 'Whole exome sequencing (WXS)', 'HiSeq X Ten', 'WXS', 'Genomic', 'PCR', 'Paired'),
(9, 'SRR10550030', 'Whole exome sequencing (WXS)', 'HiSeq X Ten', 'WXS', 'Genomic', 'PCR', 'Paired'),
(10, 'SRR10550031', 'Whole exome sequencing (WXS)', 'HiSeq X Ten', 'WXS', 'Genomic', 'PCR', 'Paired'),
(11, 'SRR10550018', 'Whole exome sequencing (WXS)', 'HiSeq X Ten', 'WXS', 'Genomic', 'PCR', 'Paired'),
(12, 'SRR10550019', 'Whole exome sequencing (WXS)', 'Illumina HiSeq 1000', 'WXS', 'Genomic', 'PCR', 'Paired'),
(13, 'SRR10550020', 'Whole exome sequencing (WXS)', 'Illumina HiSeq 1000', 'WXS', 'Genomic', 'PCR', 'Paired'),
(14, 'SRR10550021', 'Whole exome sequencing (WXS)', 'Illumina HiSeq 1000', 'WXS', 'Genomic', 'PCR', 'Paired'),
(15, 'SRR10550033', 'Whole exome sequencing (WXS)', 'HiSeq X Ten', 'WXS', 'Genomic', 'PCR', 'Paired'),
(16, 'SRR10550035', 'Whole exome sequencing (WXS)', 'HiSeq X Ten', 'WXS', 'Genomic', 'PCR', 'Paired'),
(17, 'SRR10550034', 'Whole exome sequencing (WXS)', 'HiSeq X Ten', 'WXS', 'Genomic', 'PCR', 'Paired'),
(18, 'SRR10550036', 'Whole exome sequencing (WXS)', 'Illumina HiSeq 1000', 'WXS', 'Genomic', 'PCR', 'Paired'),
(19, 'SRR10550037', 'Whole exome sequencing (WXS)', 'Illumina HiSeq 1000', 'WXS', 'Genomic', 'PCR', 'Paired'),
(20, 'SRR8433150', 'SureSelect Human Exon v3 50Mb (Agilent Technologies)', 'Illumina HiSeq 2000', 'WXS', 'Genomic', 'Hybrid', 'Paired'),
(21, 'SRR8433152', 'SureSelect Human Exon v3 50Mb (Agilent Technologies)', 'Illumina HiSeq 2000', 'WXS', 'Genomic', 'Hybrid', 'Paired'),
(22, 'SRR8433155', 'SureSelect Human Exon v3 50Mb (Agilent Technologies)', 'Illumina HiSeq 2000', 'WXS', 'Genomic', 'Hybrid', 'Paired'),
(23, 'SRR8433157', 'SureSelect Human Exon v3 50Mb (Agilent Technologies)', 'Illumina HiSeq 2000', 'WXS', 'Genomic', 'Hybrid', 'Paired'),
(24, 'SRR8433158', 'SureSelect Human Exon v3 50Mb (Agilent Technologies)', 'Illumina HiSeq 2000', 'WXS', 'Genomic', 'Hybrid', 'Paired'),
(25, 'SRR8433159', 'SureSelect Human Exon v3 50Mb (Agilent Technologies)', 'Illumina HiSeq 2000', 'WXS', 'Genomic', 'Hybrid', 'Paired'),
(26, 'SRR8433168', 'SureSelect Human Exon v3 50Mb (Agilent Technologies)', 'Illumina HiSeq 2000', 'WXS', 'Genomic', 'Hybrid', 'Paired'),
(27, 'SRR8433171', 'SureSelect Human Exon v3 50Mb (Agilent Technologies)', 'Illumina HiSeq 2000', 'WXS', 'Genomic', 'Hybrid', 'Paired'),
(28, 'SRR8433179', 'SureSelect Human Exon v3 50Mb (Agilent Technologies)', 'Illumina HiSeq 2000', 'WXS', 'Genomic', 'Hybrid', 'Paired'),
(29, 'SRR8433180', 'SureSelect Human Exon v3 50Mb (Agilent Technologies)', 'Illumina HiSeq 2000', 'WXS', 'Genomic', 'Hybrid', 'Paired'),
(30, 'SRR8433154', 'SureSelect Human Exon v3 50Mb (Agilent Technologies)', 'Illumina HiSeq 2000', 'WXS', 'Genomic', 'Hybrid', 'Paired');
