SELECT * FROM matches;
SELECT * FROM players;
SELECT * FROM world_cup;
-- Evolución del Rating de Goleo
SELECT YEAR(datetime) AS "Anio Mundialista",
ROUND(AVG(home_team_goals + away_team_goals),2) AS "Promedio de goles por mundial" 
FROM 
matches
WHERE 
YEAR(datetime) <> 0
GROUP BY 
YEAR(datetime)
ORDER BY 
YEAR(datetime) ASC;

-- El "Top 5" de Sedes Históricas
SELECT 
city,
Count(*) AS "Numero de apariciones en mundiales",
SUM(home_team_goals + away_team_goals) 
FROM
matches
GROUP BY 
city
ORDER BY 
Count(*) DESC
LIMIT
5;

-- Dominio Local vs. Visitante
SELECT SUM(home_team_goals > away_team_goals) AS "Tota de victorias de equipos locales" ,
SUM(home_team_goals < away_team_goals) AS "Tota de victorias de equipos visitantes"
FROM 
matches;
-- Estadios de Alto Impacto superior a los 70,000 espectadores que no sean fase de grupos 
SELECT stadium, ROUND(AVG(attendance),2) AS "Promedio de asistencia" FROM matches
WHERE stage NOT LIKE 'Group%'
GROUP BY stadium
HAVING AVG(attendance) > 70000
ORDER BY  AVG(attendance) DESC;

-- Rendimiento por Siglo
SELECT  
ROUND(AVG(CASE WHEN datetime < 2000 THEN home_team_goals + away_team_goals END),2) AS "Promedio de goles del siglo XX" ,
ROUND(AVG(CASE WHEN datetime >= 2000 THEN home_team_goals + away_team_goals END),2) AS "Promedio de goles del siglo XXI"
FROM 
matches;

-- Partidos con "Lluvia de Goles"
SELECT datetime, 
home_team_name,
home_team_goals,
away_team_goals,
away_team_name,
home_team_goals + away_team_goals AS "Total de goles del partido"
FROM 
matches
WHERE 
home_team_goals + away_team_goals >= 7;

-- Equipos que mas han ganado en tiempo extra en Tiempos Extra Y promedio de goles totales en esos partidos 
SELECT 
CASE 
WHEN 
home_team_goals > away_team_goals 
THEN home_team_name 
ELSE away_team_name 
END AS "Equipos que mas han ganado en tiempo extra" ,
COUNT(*) AS 'Numero de veces',
ROUND(AVG(home_team_goals + away_team_goals),2) AS 'Promedio de Goles'
FROM
matches
WHERE 
LOWER(win_conditions) LIKE '%extra time'
OR LOWER(win_conditions) LIKE '%penalties%'
GROUP BY 
CASE 
WHEN 
home_team_goals > away_team_goals 
THEN home_team_name 
ELSE away_team_name 
END ;

-- Quiénes son los jugadores que han anotado en partidos donde hubo más de 100,000 personas
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

SELECT SUM(home_team_goals) + SUM(away_team_goals) FROM matches
WHERE datetime <> 0;
 






