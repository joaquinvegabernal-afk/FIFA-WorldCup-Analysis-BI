-- CREANDO LA BASE DE DATOS
CREATE DATABASE IF NOT EXISTS FIFA_WorldCup;
USE FIFA_WorldCup;

-- CREANDO LAS TABLAS 
CREATE TABLE matches (
anio INT,
datetime DATETIME ,
stage VARCHAR(200),
stadium VARCHAR(200),
city VARCHAR(200),
home_team_name VARCHAR(200),
home_team_goals INT,
away_team_goals INT,
away_team_name VARCHAR(200),
win_conditions VARCHAR(200),
attendance INT,
half_time_home_goals INT,
half_time_away_goals INT,
referee VARCHAR(200),
assistant1 VARCHAR(200),
assistant2 VARCHAR(200),
roundid INT,
matchid INT PRIMARY KEY,
home_team_initials VARCHAR(20),
away_team_initials VARCHAR(20)
);

CREATE TABLE players (
roundid INT,
matchid INT,
team_initials VARCHAR(20),
coach_name VARCHAR(200),
line_up VARCHAR(20),
shirt_number INT,
player_name VARCHAR(200),
position VARCHAR(20),
event1  VARCHAR(200),
PRIMARY KEY (matchid, player_name),
FOREIGN KEY (matchid) REFERENCES matches (matchid)
);

CREATE TABLE world_cup (
anio INT PRIMARY KEY,
country VARCHAR(200),
winner VARCHAR(200),
runners_up VARCHAR(200),
third VARCHAR(200),
fourth VARCHAR(200),
goalsscored INT,
qualifiedteams INT,
matchesplayed INT,
attendance INT
);
