-- Задание 2

--Написать SELECT-запросы, которые выведут информацию согласно инструкциям ниже.

--Внимание: результаты запросов не должны быть пустыми, учтите это при заполнении таблиц.

--Название и продолжительность самого длительного трека.

select trackname, tracklength from tracks
where tracklength = (select max(tracklength) from tracks);

--Название треков, продолжительность которых не менее 3,5 минут.

select trackname, tracklength from tracks
where tracklength >= (interval '3' minute + interval '30' second);


--Названия сборников, вышедших в период с 2018 по 2020 год включительно.

select compname, compdate
from compilations
where compdate >= to_date('01/01/2018', 'DD/MM/YYYY') and compdate <= to_date('31/12/2020', 'DD/MM/YYYY'); 

--Исполнители, чьё имя состоит из одного слова.

select perfname
from performers
where perfname not like '% %';

--Название треков, которые содержат слово «мой» или «my».

select trackname
from tracks
where trackname like '%my%' or trackname like '%мой%';

--Задание 3
--Написать SELECT-запросы, которые выведут информацию согласно инструкциям ниже.

--Внимание: результаты запросов не должны быть пустыми, при необходимости добавьте данные в таблицы.

--Количество исполнителей в каждом жанре.

select genrename, count (perfid) perf_num
from perfgenre p
join genres g on p.genreid = g.genreid
group by genrename 
order by perf_num desc;

--Количество треков, вошедших в альбомы 2019–2020 годов.

select albumname, count (t.albumid) track_num
from tracks t
join albums a on a.albumid = t.albumid 
where albumdate  >= to_date('01/01/2019', 'DD/MM/YYYY') and albumdate <= to_date('31/12/2020', 'DD/MM/YYYY')
group by albumname 
order by track_num desc;

--Средняя продолжительность треков по каждому альбому.

select albumname, avg (t.tracklength) track_l
from tracks t 
join albums a on a.albumid = t.albumid 
group by albumname
order by track_l desc;

--Все исполнители, которые не выпустили альбомы в 2020 году

select perfname
from albumperformers a
join performers p on p.perfid = a.perfid 
join albums a2 on a2.albumid  = a.albumid 
where a2.albumdate  < to_date('01/01/2020', 'DD/MM/YYYY') or a2.albumdate > to_date('31/12/2020', 'DD/MM/YYYY')
group by perfname;

--Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами).

-- Sergey Miloslavsky

select perfname, c2.compname 
from performers p 
join albumperformers a on a.perfid = p.perfid
join albums a2 on a2.albumid = a.albumid 
join tracks t on t.albumid = a2.albumid 
join comptracks c on c.trackid = t.trackid 
join compilations c2 on c2.compid = c.compid 
where perfname = 'Sergey Miloslavsky'
group by compname, perfname;

--Задание 4*
--Написать SELECT-запросы, которые выведут информацию согласно инструкциям ниже.

--Внимание: результаты запросов не должны быть пустыми, при необходимости добавьте данные в таблицы.

--Названия альбомов, в которых присутствуют исполнители более чем одного жанра.

select albumname, perfname
from albums a
join albumperformers a2 on a2.albumid = a.albumid 
join performers p on p.perfid = a2.perfid 
join perfgenre p2 on p2.perfid = p.perfid 
join genres g on g.genreid = p2.genreid 
group by albumname, perfname
having count(p2.perfid) > 1;

--Наименования треков, которые не входят в сборники.

select trackname 
from tracks t 
left join comptracks c on c.trackid = t.trackid 
where c.compid is null
group by trackname;

--Исполнитель или исполнители, написавшие самый короткий по продолжительности трек, — теоретически таких треков может быть несколько.

select perfname, albumname, trackname ,tracklength
from performers p 
join albumperformers a on a.perfid = p.perfid  
join albums a2 on a2.albumid = a.albumid 
join tracks t on t.albumid = a2.albumid 
where tracklength = (select min(tracklength) from tracks)
group by perfname, albumname, trackname , tracklength;

--Названия альбомов, содержащих наименьшее количество треков.

select albumname, count(distinct trackid), (select min(c)
                       from (
                       	select count(*) c
                        from tracks
                        group by albumid
                       ) y
                      )
from tracks t 
join albums a on a.albumid = t.albumid
group by albumname
having count(distinct trackid) = (select min(c)
                       from (
                        select count(distinct trackid) c
                        from tracks  
                        group by albumid
                       ) x
             );