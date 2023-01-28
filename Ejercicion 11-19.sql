select * from juegos

--11. Devuelve todos los juegos que sean de la saga Final Fantasy.
select nombre from juegos where Nombre like '%Final Fantasy%';

--12. Devuelve todos los juegos que sean de deportes y haya trabajado más de 3 desarrolladores.
select nombre, DeveloperCount,Genre from juegos where DeveloperCount>2 and Genre like '%sports%'

--13. ¿Cuántos juegos hay asociados a cada categoría?
select Category, count(category) from juegos group by Category

--14. ¿Cuántos juegos se han sacado en cada año?
select ReleaseDate,COUNT(ReleaseDate) from juegos group by ReleaseDate order by ReleaseDate asc

--15. En base a la consulta anterior, devuelve aquellos años en los que la media de puntuación esté entre un 6 y un 8,
select ReleaseDate,COUNT(ReleaseDate) from juegos where Metacritic>=60 and Metacritic<=80 group by ReleaseDate order by ReleaseDate asc

--16. ¿Cuál es la máxima, mínima y puntuación mínima por género?
select Genre,max(Metacritic) as Maximo,MIN(Metacritic) as Minimo from juegos group by Genre order by max(Metacritic) desc

--17. Usando LIMIT, devuelve el top 10 de juegos con mayor puntuación del 2012.
select top(10) Nombre,Metacritic from juegos where ReleaseDate = '2012' order by Metacritic desc

--18. Usando LIMIT, devuelve el top 10 de juegos más nuevos de género single player.
select top(10) nombre,ReleaseDate from juegos where Genre like '%Single Player%' order by ReleaseDate desc

--19. Devuelve la media de nota de todos aquellos juegos que sean para mayores de 18 años.
select nombre,AVG(Metacritic) as Medianota from juegos where RequiredAge = '18' group by Nombre
