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