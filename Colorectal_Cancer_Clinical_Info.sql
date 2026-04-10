CREATE TABLE Colorectal_Cancer_Clinical_Info (
    Sl_No INT PRIMARY KEY,                       -- Serial Number
    NCB_SRA_ID VARCHAR(255) NOT NULL,            -- NCB SRA ID
    SEX VARCHAR(10),                             -- SEX
    AGE VARCHAR(10),                              -- AGE
    BMI VARCHAR(10),                              -- BMI
    CENTER_NAME VARCHAR(255),                    -- CENTER NAME
    COLLECTION_PROCEDURE VARCHAR(255),           -- COLLECTION PROCEDURE
    DEVELOPMENTAL_STAGE VARCHAR(255),            -- DEVELOPMENTAL STAGE
    SCOPE VARCHAR(255),                          -- SCOPE
    TISSUE VARCHAR(255),                          -- TISSUE
    TISSUE1 VARCHAR(255),                          -- TISSUE
    Url VARCHAR(255)  Default ''                        -- Url
);


-- Insert(Add url)
INSERT INTO Colorectal_Cancer_Clinical_Info (Sl_No, NCB_SRA_ID, SEX, AGE, BMI, CENTER_NAME, COLLECTION_PROCEDURE, DEVELOPMENTAL_STAGE, SCOPE, TISSUE, TISSUE1)
VALUES
(1, 'SRR14684620', 'Male', '76', '-', 'M.M. SHEMYAKIN AND YU.A. OVCHINNIKOV INSTITUTE OF BIOORGANIC CHEMISTRY OF THE RUSSIAN ACADEMY OF SCI', '-', '-', '-', 'FFPE*', 'Colorectal cancer'),
(2, 'SRR15987777', 'NA', '-', '-', 'UNIVERSITY OF BIRMINGHAM', '-', '-', '-', 'FFPE', 'Primary colorectal cancer'),
(3, 'SRR14463450', 'Male', '62', '-', 'CENTRE GEORGES FRANCOIS LECLERC', '-', '-', '-', 'liver metastasis',''),
(4, 'SRR15987799', 'NA', '-', '-', 'UNIVERSITY OF BIRMINGHAM', '-', '-', '-', 'FFPE', 'Primary colorectal cancer'),
(5, 'SRR15987796', 'NA', '-', '-', 'UNIVERSITY OF BIRMINGHAM', '-', '-', '-', 'FFPE', 'Primary colorectal cancer'),
(6, 'SRR15987795', 'NA', '-', '-', 'UNIVERSITY OF BIRMINGHAM', '-', '-', '-', 'FFPE', 'Primary colorectal cancer'),
(7, 'SRR15987790', 'NA', '-', '-', 'UNIVERSITY OF BIRMINGHAM', '-', '-', '-', 'FFPE', 'Primary colorectal cancer'),
(8, 'SRR15987786', 'NA', '-', '-', 'UNIVERSITY OF BIRMINGHAM', '-', '-', '-', 'FFPE', 'Primary colorectal cancer'),
(9, 'SRR15987785', 'NA', '-', '-', 'UNIVERSITY OF BIRMINGHAM', '-', '-', '-', 'FFPE', 'Primary colorectal cancer'),
(10, 'SRR15987792', 'NA', '-', '-', 'UNIVERSITY OF BIRMINGHAM', '-', '-', '-', 'FFPE', 'Primary colorectal cancer'),
(11, 'SRR24927859', 'Female', '77', '24.7', 'Beatson Institute for Cancer Research', 'Right hemicolectomy', 'Adenoma', 'Multispecies', 'Caecum', ''),
(12, 'SRR24927860', 'Female', '78', '26', 'Beatson Institute for Cancer Research', 'Extended right hemicolectomy', 'Tumour', 'Multispecies', 'Transverse', ''),
(13, 'SRR24927861', 'Female', '72', '18', 'Beatson Institute for Cancer Research', 'Anterior resection', 'Tumour', 'Multispecies', 'Upper rectum', ''),
(14, 'SRR24927862', 'Male', '62', '30', 'Beatson Institute for Cancer Research', 'Anterior resection', 'Tumour', 'Multispecies', 'Upper rectum', ''),
(15, 'SRR24927863', 'Female', '85', '30', 'Beatson Institute for Cancer Research', 'NR', 'Tumour', 'Multispecies', 'Hepatic flexure', ''),
(16, 'SRR24927864', 'Male', '75', 'NR', 'Beatson Institute for Cancer Research', 'Anterior resection', 'Tumour', 'Multispecies', 'Rectum', ''),
(17, 'SRR24927865', 'Female', '79', '29', 'Beatson Institute for Cancer Research', 'Right hemicolectomy', 'Tumour', 'Multispecies', 'Caecum', ''),
(18, 'SRR24927866', 'Female', '35', '-', 'Beatson Institute for Cancer Research', 'EMR', 'Adenoma', 'Multispecies', 'Sigmoid', ''),
(19, 'SRR24927867', 'Female', '44', 'NR', 'Beatson Institute for Cancer Research', 'Rectum polypectomy', 'Adenoma', 'Multispecies', 'Rectum', ''),
(20, 'SRR24927868', 'NR', 'NR', 'NR', 'Beatson Institute for Cancer Research', 'Anterior resection', 'Adenoma', 'Multispecies', 'Rectum', ''),
(21, 'SRR24927869', 'Male', '57', 'NR', 'Beatson Institute for Cancer Research', 'EMR', 'Adenoma', 'Multispecies', 'Sigmoid', ''),
(22, 'SRR24927870', 'Male', '65', '23.46', 'Beatson Institute for Cancer Research', 'AP resection', 'Tumour', 'Multispecies', 'Lower Rectum', ''),
(23, 'SRR24927871', 'Female', '65', '17', 'Beatson Institute for Cancer Research', 'Right hemicolectomy', 'Tumour', 'Multispecies', 'Caecum', ''),
(24, 'SRR24927872', 'Female', '85', '20.8', 'Beatson Institute for Cancer Research', 'EUA and Biopsy', 'Tumour', 'Multispecies', 'Lower Rectum', ''),
(25, 'SRR24927873', 'Male', '72', '23', 'Beatson Institute for Cancer Research', 'Anterior resection', 'Tumour', 'Multispecies', 'Rectum', ''),
(26, 'SRR24927874', 'Male', '82', '22', 'Beatson Institute for Cancer Research', 'Anterior resection', 'Tumour', 'Multispecies', 'Upper rectum', ''),
(27, 'SRR24927875', 'Female', '65', '22', 'Beatson Institute for Cancer Research', 'Right hemicolectomy', 'Tumour', 'Multispecies', 'Transverse', ''),
(28, 'SRR24927876', 'Male', '77', '18', 'Beatson Institute for Cancer Research', 'Right hemicolectomy', 'Tumour', 'Multispecies', 'Ascending', ''),
(29, 'SRR24927877', 'Female', '68', '24', 'Beatson Institute for Cancer Research', 'Anterior resection', 'Tumour', 'Multispecies', 'Upper rectum', ''),
(30, 'SRR24927878', 'Female', '56', '34', 'Beatson Institute for Cancer Research', 'Right hemicolectomy', 'Adenoma', 'Multispecies', 'Caecum', ''),
(31, 'SRR15987787', 'NA', 'NA', '-', 'UNIVERSITY OF BIRMINGHAM', '-', '-', '-', 'Primary colorectal cancer', ''),
(32, 'SRR14463458', 'female', '65', NULL, 'Center Georges Francois Leclerc', '-', '-', '-', '-', ''),
(33, 'SRR14463455', 'male', '67', '-', 'Center Georges Francois Leclerc', '-', '-', 'Multiisolate', '-', ''),
(34, 'SRR14463453', 'female', '46', NULL, 'Center Georges Francois Leclerc', '-', '-', 'Multiisolate', '-', ''),
(35, 'SRR10530602', 'female', '50', NULL, 'Peking university health science center', '-', '-', 'Monoisolate', '-', '');
