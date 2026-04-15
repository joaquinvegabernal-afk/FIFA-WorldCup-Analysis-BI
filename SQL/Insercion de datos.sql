
SET GLOBAL local_infile = 1;

LOAD DATA LOCAL INFILE  'C:/Users/Joaco/OneDrive/Documentos/Joaquin/Cursos/Proyecto BA/Proyectos/FIFA-WorldCup-Analysis/data/processed/WorldCups_Clean.csv'
INTO TABLE world_cup
FIELDS TERMINATED BY ','
IGNORE 1 LINES;

