CREATE TABLE Normal_Colon_Exome_Datasets_Cli (
    Sl_No INT PRIMARY KEY,                      -- Serial Number
    NCB_SRA_ID VARCHAR(255) NOT NULL,           -- NCB SRA ID
    SEX VARCHAR(10),                            -- SEX
    AGE VARCHAR(10),                            -- AGE
    BIOPROJECT VARCHAR(255),                    -- BIOPROJECT
    BIOSAMPLE VARCHAR(255),                     -- BIOSAMPLE
    CENTER_NAME VARCHAR(255),                   -- CENTER NAME
    SCOPE VARCHAR(255),                         -- SCOPE
    TISSUE VARCHAR(255)                         -- TISSUE
);

INSERT INTO Normal_Colon_Exome_Datasets_Cli (Sl_No, NCB_SRA_ID, SEX, AGE, BIOPROJECT, BIOSAMPLE, CENTER_NAME, SCOPE, TISSUE)
VALUES
(1, 'SRR10550022', 'Female', '43', 'PRJNA588158', 'SAMN13230737', 'Peking University Health Science Center', 'Monoisolate', 'Sigmoid colon'),
(2, 'SRR10550023', 'Female', '73', 'PRJNA588158', 'SAMN13230487', 'Peking University Health Science Center', 'Monoisolate', 'Ascending colon'),
(3, 'SRR10550024', 'Female', '67', 'PRJNA588158', 'SAMN13230427', 'Peking University Health Science Center', 'Monoisolate', 'Ascending colon'),
(4, 'SRR10550025', 'Male', '62', 'PRJNA588158', 'SAMN13230579', 'Peking University Health Science Center', 'Monoisolate', 'Ascending colon'),
(5, 'SRR10550026', 'Male', '71', 'PRJNA588158', 'SAMN13230736', 'Peking University Health Science Center', 'Monoisolate', 'Sigmoid colon'),
(6, 'SRR10550027', 'Female', '52', 'PRJNA588158', 'SAMN13230735', 'Peking University Health Science Center', 'Monoisolate', 'Sigmoid colon'),
(7, 'SRR10550028', 'Male', '58', 'PRJNA588158', 'SAMN13230587', 'Peking University Health Science Center', 'Monoisolate', 'Sigmoid colon'),
(8, 'SRR10550029', 'Male', '58', 'PRJNA588158', 'SAMN13230583', 'Peking University Health Science Center', 'Monoisolate', 'Ascending colon'),
(9, 'SRR10550030', 'Female', '55', 'PRJNA588158', 'SAMN13230582', 'Peking University Health Science Center', 'Monoisolate', 'Ascending colon'),
(10, 'SRR10550031', 'Male', '62', 'PRJNA588158', 'SAMN13230558', 'Peking University Health Science Center', 'Monoisolate', 'Ascending colon'),
(11, 'SRR10550018', 'Male', '62', 'PRJNA588158', 'SAMN13229262', 'PEKING UNIVERSITY HEALTH SCIENCE CENTER', 'Monoisolate', 'Sigmoid Colon'),
(12, 'SRR10550019', 'Female', '43', 'PRJNA588158', 'SAMN13230590', 'PEKING UNIVERSITY HEALTH SCIENCE CENTER', 'Monoisolate', 'Descending Colon'),
(13, 'SRR10550020', 'Female', '76', 'PRJNA588158', 'SAMN13230581', 'PEKING UNIVERSITY HEALTH SCIENCE CENTER', 'Monoisolate', 'Ascending Colon'),
(14, 'SRR10550021', 'Female', '55', 'PRJNA588158', 'SAMN13230738', 'PEKING UNIVERSITY HEALTH SCIENCE CENTER', 'Monoisolate', 'Sigmoid Colon'),
(15, 'SRR10550033', 'Female', '23', 'PRJNA588158', 'SAMN13230474', 'PEKING UNIVERSITY HEALTH SCIENCE CENTER', 'Monoisolate', 'Sigmoid Colon'),
(16, 'SRR10550034', 'Male', '75', 'PRJNA588158', 'SAMN13229397', 'PEKING UNIVERSITY HEALTH SCIENCE CENTER', 'Monoisolate', 'Ascending Colon'),
(17, 'SRR10550035', 'Male', '56', 'PRJNA588158', 'SAMN13229264', 'PEKING UNIVERSITY HEALTH SCIENCE CENTER', 'Monoisolate', 'Ascending Colon'),
(18, 'SRR10550036', 'Female', '50', 'PRJNA588158', 'SAMN13230739', 'PEKING UNIVERSITY HEALTH SCIENCE CENTER', 'Monoisolate', 'Sigmoid Colon'),
(19, 'SRR10550037', 'Female', '37', 'PRJNA588158', 'SAMN13229396', 'PEKING UNIVERSITY HEALTH SCIENCE CENTER', 'Monoisolate', 'Sigmoid Colon'),
(20, 'SRR8433150', 'N/A', 'Adult', 'PRJNA514428', 'SAMN10724398', 'UNIVERSITY OF GENEVA', 'Multispecies', 'Colorectal'),
(21, 'SRR8433152', 'N/A', 'Adult', 'PRJNA514428', 'SAMN10724400', 'UNIVERSITY OF GENEVA', 'Multispecies', 'Colorectal'),
(22, 'SRR8433155', 'N/A', 'Adult', 'PRJNA514428', 'SAMN10724427', 'UNIVERSITY OF GENEVA', 'Multispecies', 'Colorectal'),
(23, 'SRR8433157', 'N/A', 'Adult', 'PRJNA514428', 'SAMN10724407', 'UNIVERSITY OF GENEVA', 'Multispecies', 'Colorectal'),
(24, 'SRR8433158', 'N/A', 'Adult', 'PRJNA514428', 'SAMN10724418', 'UNIVERSITY OF GENEVA', 'Multispecies', 'Colorectal'),
(25, 'SRR8433159', 'N/A', 'Adult', 'PRJNA514428', 'SAMN10724419', 'UNIVERSITY OF GENEVA', 'Multispecies', 'Colorectal'),
(26, 'SRR8433168', 'N/A', 'Adult', 'PRJNA514428', 'SAMN10724392', 'UNIVERSITY OF GENEVA', 'Multispecies', 'Colorectal'),
(27, 'SRR8433171', 'N/A', 'Adult', 'PRJNA514428', 'SAMN10724395', 'UNIVERSITY OF GENEVA', 'Multispecies', 'Colorectal'),
(28, 'SRR8433179', 'N/A', 'Adult', 'PRJNA514428', 'SAMN10724412', 'UNIVERSITY OF GENEVA', 'Multispecies', 'Colorectal'),
(29, 'SRR8433180', 'N/A', 'Adult', 'PRJNA514428', 'SAMN10724415', 'UNIVERSITY OF GENEVA', 'Multispecies', 'Colorectal'),
(30, 'SRR8433154', 'N/A', 'Adult', 'PRJNA514428', 'SAMN10724421', 'UNIVERSITY OF GENEVA', 'Multispecies', 'Colorectal');
