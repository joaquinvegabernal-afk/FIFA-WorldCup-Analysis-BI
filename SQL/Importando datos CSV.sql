
SET GLOBAL local_infile = 1;

LOAD DATA LOCAL INFILE 'C:/Users/Joaco/OneDrive/Documentos/Joaquin/Cursos/Proyecto BA/Proyectos/FIFA-WorldCup-Analysis/data/processed/WorldCupMatches.csv'
INTO TABLE matches
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"' 
LINES TERMINATED BY '\r\n' 
IGNORE 1 ROWS; 

LOAD DATA LOCAL INFILE 'C:/Users/Joaco/OneDrive/Documentos/Joaquin/Cursos/Proyecto BA/Proyectos/FIFA-WorldCup-Analysis/data/processed/WorldCupPlayers.csv'
INTO TABLE players
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"' 
LINES TERMINATED BY '\r\n' 
IGNORE 1 ROWS; 

LOAD DATA LOCAL INFILE 'C:/Users/Joaco/OneDrive/Documentos/Joaquin/Cursos/Proyecto BA/Proyectos/FIFA-WorldCup-Analysis/data/processed/WorldCups.csv'
INTO TABLE world_cup
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"' 
LINES TERMINATED BY '\r\n' 
IGNORE 1 ROWS; 








