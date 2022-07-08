-- Selezionare tutte le nazioni il cui nome inizia con la P e la cui
-- area è maggiore di 1000 kmq

select country_id , name, area
from countries c 
where name like 'p%' and area >1000;



-- Selezionare le nazioni il cui national day è avvenuto più di 100 anni fa

select country_id , name, national_day 
from countries c 
where timestampdiff (year, national_day, curdate()) > 100;  



-- Selezionare il nome delle regioni del continente europeo, in ordine alfabetico

select region_id , name, continent_id  
from regions r 
where r.continent_id = 4
order by name;



-- Contare quante lingue sono parlate in Italia

select count(language_id) as number_language, cl.country_id, c.name  
from country_languages cl
inner join countries c 
on cl.country_id = c.country_id 
where c.name like 'Italy';



-- Selezionare quali nazioni non hanno un national day
select country_id, name, national_day  from countries c 
where national_day is null ;



-- Per ogni nazione selezionare il nome, la regione e il continente
select c. name, r.name ,c2.name  from countries c 
inner join regions r 
on c.region_id = r.region_id 
inner join continents c2 
on r.continent_id = c2.continent_id;



-- Modificare la nazione Italy, inserendo come national day il 2 giugno 1946
select * from countries c where name like 'italy';

update countries SET national_day  = '1946-06-02' where name like 'italy';
select * from countries c where name like 'italy';



 -- Per ogni regione mostrare il valore dell'area totale

select sum(c.area) as count_area, r.region_id, r.name  
from countries c 
inner join regions r 
on c.region_id = r.region_id
group by r.name ;



-- Selezionare le lingue ufficiali dell'Albania

select *
from country_languages cl 
inner join countries c 
on cl.country_id = c.country_id 
where c.country_id = 5 and official =1;



-- Selezionare il Gross domestic product (GDP) medio dello
-- United Kingdom tra il 2000 e il 2010

select cs.country_id ,c.name, cs.gdp , cs.`year`  
from country_stats cs 
inner join countries c 
on cs.country_id = c.country_id 
where c.name like 'United Kingdom' and `year`>=2000 and `year` <=2010;



-- Selezionare tutte le nazioni in cui si parla hindi, ordinate
-- dalla più estesa alla meno estesa

select *
from countries c 
inner join country_languages cl 
on c.country_id = cl.country_id 
inner join languages l 
on l.language_id =cl.language_id 
where l.`language` like 'hindi'
order by c.area desc ; 



--  Per ogni continente, selezionare il numero di nazioni con
-- area superiore ai 10.000 kmq ordinando i risultati a partire dal
-- continente che ne ha di più

select sum(c.area) as tot_area,c2.name 
from countries c
inner join regions r  
on r.region_id = c.region_id 
inner join continents c2 
on c2.continent_id = r.continent_id 
where c.area > 10000  
group by c2.name  
order by tot_area  desc;





