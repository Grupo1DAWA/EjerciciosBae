--20�

select count(RequiredAge), RequiredAge from juegos
group by RequiredAge
order by RequiredAge

--21�

select COUNT(Nombre), ReleaseDate from juegos
group by ReleaseDate
having count(Nombre) < 300
order by ReleaseDate

--22�

select Nombre  from juegos
where PlatformWindows like '%False%' and PlatformMac like '%True%'

select Nombre, PriceInitial, PriceFinal from juegos
where PriceInitial < PriceFinal --no hay juegos 

--24�

select Nombre, PriceCurrency  from juegos
where PriceCurrency not like '%USD%' 

--25�

select Nombre, Metacritic  from juegos
where Metacritic != 0 and Metacritic < 50

--26�

select top 15 with ties DLCCount, Nombre from juegos
order by DLCCount desc

--27�

select Nombre, SupportedLanguages from juegos
where SupportedLanguages = 'English'

--28�


select lower(Nombre), upper(Website), Genre from juegos
where Genre = ' Actio' or Genre =  ' Casual'

--29�

select top 1 Metacritic, Nombre from juegos
where Genre = ' indie' 
order by Metacritic desc

--30�

select top 1 Metacritic, Nombre from juegos
where Genre = ' indie' 
order by Metacritic asc

--31�

select top 1 * from juegos
where Metacritic > '0'
order by Metacritic asc

--32�
select * from juegos
where Metacritic > (select AVG (Metacritic) from juegos where Metacritic != 0)

--33�

select top 1 Metacritic, ReleaseDate, Nombre from juegos
where ReleaseDate = '2008'
order by Metacritic desc

--34�

select * from juegos
where PriceFinal > (select AVG (PriceFinal) from juegos where PriceFinal != 0)

--35�

select * from juegos
where PlatformLinux = 'True' and AchievementCount = (select Max (AchievementCount) from juegos where PlatformLinux = 'True')