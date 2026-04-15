Create view vw_matches AS
SELECT 
    YEAR(datetime) AS anio,
    CASE 
        WHEN YEAR(datetime) < 2000 THEN 'Siglo XX'
        ELSE 'Siglo XXI'
    END AS siglo,
    datetime,
    home_team_name,
    away_team_name,
    home_team_goals,
    away_team_goals,
    (home_team_goals + away_team_goals) AS total_goles,
    CASE 
        WHEN home_team_goals > away_team_goals THEN 'Local'
        WHEN home_team_goals < away_team_goals THEN 'Visitante'
        ELSE 'Empate'
    END AS resultado_tipo,
    stadium,
    city,
    stage,
    matchid
FROM 
    matches
WHERE 
    YEAR(datetime) <> 0;

CREATE VIEW vw_sedes_asistencia AS
SELECT 
city,
(home_team_goals + away_team_goals) AS total_goles,
stadium,
attendance,
stage,
YEAR(datetime)
FROM 
matches
WHERE 
attendance IS NOT NULL;


CREATE VIEW vw_ranking_victorias_extratimeopenalties AS
SELECT 
matchid,
datetime,
CASE 
WHEN 
home_team_goals > away_team_goals 
THEN 
home_team_name
ELSE 
away_team_name
END AS "Equipo ganador",
(home_team_goals + away_team_goals) AS "Total de goles",
win_conditions
FROM matches
WHERE 
LOWER(win_conditions) LIKE '%extra time%' 
OR
LOWER(win_conditions) LIKE '%penalties%' ;

CREATE VIEW vw_goles_juagdores AS 
SELECT 
p.player_name,
p.team_initials,
m.attendance,
p.event1,
m.matchid
FROM 
matches m 
JOIN 
players p
ON m.matchid = p.matchid
WHERE  m.attendance > 100000
AND (p.event1 LIKE 'P%' 
OR p.event1 LIKE 'G%')
ORDER BY m.attendance DESC;
