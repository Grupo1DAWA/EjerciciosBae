use steam

-- 1. Lista todas las columnas de la tabla.

select *
from dbo.juegos columns

-- 2. Lista todos los diferentes g�neros, eliminando duplicados.

select Genre
from dbo.juegos
group by Genre

-- 3. Lista �nicamente aquellos juegos que puedan ser jugados �nicamente en Linux

select Nombre as Juegos
from dbo.juegos
where PlatformLinux = 'True' and PlatformMac = 'False' and PlatformWindows = 'False'

-- 4. Lista todos los juegos de RPG, ordenador por nota.

select Nombre as Juegos
from dbo.juegos
where Genre LIKE '%RPG'
order by Metacritic

-- 5. Lista todos aquellos juegos que puedan ser jugados en Espa�ol pero no en Frances

select Nombre as Juegos, SupportedLanguages
from juegos 
where SupportedLanguages like '%Spanish%' and SupportedLanguages not like '%French%'

-- 6. Lista el nombre del juego, su precio inicial, su precio final y la diferencia entre ambos en una nueva columna.

select Nombre, PriceInitial as Precio_Inicial, PriceFinal as Precio_Final, (PriceInitial - PriceFinal) as  Diferencia
from juegos

-- 7. �Cu�ntos juegos hay del siglo pasado?

select count(Nombre) as N�_Juegos_Siglo_pasado
from juegos 
where ReleaseDate < 2000


-- 8. Devuelve todos los juegos que terminen o en N o en O.

select Nombre
from juegos
where Nombre like '%n' or Nombre like '%o'

-- 9. Devuelve todos los juegos que empiecen por A y que se puedan jugar con mando.

select Nombre as Juegos
from juegos
where Nombre like 'A%' and ControllerSupport = 'True'

-- 10. Devuelve todos aquellos juegos que est�n entre el 2000 y el 2010.

select *
from juegos
where ReleaseDate > 2000 and ReleaseDate < 2010

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

--20º

select count(RequiredAge), RequiredAge from juegos
group by RequiredAge
order by RequiredAge

--21º

select COUNT(Nombre), ReleaseDate from juegos
group by ReleaseDate
having count(Nombre) < 300
order by ReleaseDate

--22º

select Nombre  from juegos
where PlatformWindows like '%False%' and PlatformMac like '%True%'

select Nombre, PriceInitial, PriceFinal from juegos
where PriceInitial < PriceFinal --no hay juegos 

--24º

select Nombre, PriceCurrency  from juegos
where PriceCurrency not like '%USD%' 

--25º

select Nombre, Metacritic  from juegos
where Metacritic != 0 and Metacritic < 50

--26º

select top 15 with ties DLCCount, Nombre from juegos
order by DLCCount desc

--27º

select Nombre, SupportedLanguages from juegos
where SupportedLanguages = 'English'

--28º


select lower(Nombre), upper(Website), Genre from juegos
where Genre = ' Actio' or Genre =  ' Casual'

--29º

select top 1 Metacritic, Nombre from juegos
where Genre = ' indie' 
order by Metacritic desc

--30º

select top 1 Metacritic, Nombre from juegos
where Genre = ' indie' 
order by Metacritic asc

--31º

select top 1 * from juegos
where Metacritic > '0'
order by Metacritic asc

--32º

select * from juegos
where Metacritic > (select AVG (Metacritic) from juegos where Metacritic != 0)

--33º

select top 1 Metacritic, ReleaseDate, Nombre from juegos
where ReleaseDate = '2008'
order by Metacritic desc

--34º

select * from juegos
where PriceFinal > (select AVG (PriceFinal) from juegos where PriceFinal != 0)

--35º

select * from juegos
where PlatformLinux = 'True' and AchievementCount = (select Max (AchievementCount) from juegos where PlatformLinux = 'True')