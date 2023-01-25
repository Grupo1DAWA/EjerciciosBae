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
