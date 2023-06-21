
--Добавляем доп инфу на таблицы чтобы выборки в заданиях работали

-- compilations between 2018 & 2020

insert into compilations 
values
(7, 'Groundbeat', TO_DATE('1/11/2019', 'MM/DD/YYYY')),
(8, 'My Little Wonnie', TO_DATE('2/14/2020', 'MM/DD/YYYY'));

insert into comptracks 
values
(7, 11),
(7, 12),
(7, 13),
(8, 16),
(8, 2),
(8, 22),
(8, 60);

-- Performers with single word name

insert into performers(perfid, perfname)
values
(10, 'Sovngard'),
(11, 'Bestie'),
(12, 'V');

insert into perfgenre
values
(10, 1),
(10, 2),
(11, 3),
(12, 4);

-- albums 2019-2020

insert into albums
values
(24, 'Tetraventra', TO_DATE('01/20/2019', 'MM/DD/YYYY')),
(25, 'Indigo Trails', TO_DATE('02/13/2020', 'MM/DD/YYYY')),
(26, 'Groundbreaker', TO_DATE('05/21/2019', 'MM/DD/YYYY'));

insert into albumperformers 
values
(24, 11),
(24, 8),
(24, 7),
(25, 6),
(25, 10),
(26, 12);

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

----------------------------------------------------------------------------------------

-- need to add few tracks to new albums (!)

insert into tracks 
values
(81, 24, 'Critical Mass', interval '5' minute + interval '51' second),
(82, 24, 'Ultra Death Core', interval '6' minute + interval '52' second),
(83, 24, 'Biscuit Jazz', interval '7' minute + interval '23' second),
(84, 24, 'Deleted IRL', interval '8' minute + interval '16' second),
(85, 25, 'Lipstick Misctic', interval '3' minute + interval '32' second),
(86, 25, 'My Castles', interval '4' minute + interval '22' second),
(87, 25, 'Gasoline Dreams', interval '5' minute + interval '56' second),
(88, 25, 'Dreamgrinder', interval '2' minute + interval '11' second),
(89, 26, 'Mercenary John', interval '5' minute + interval '30' second),
(90, 26, 'Twisted Hipster', interval '4' minute + interval '42' second),
(91, 26, 'Nimblefinger', interval '1' minute + interval '42' second),
(92, 26, 'Business Cat', interval '6' minute + interval '32' second);

-- ----------------------------------------------------------------------

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


------------------
-- add extra performer

insert into performers(perfid, perfname)
values
(13, 'DeWinter');

insert into perfgenre
values
(13, 10);

insert into albumperformers 
values
(26, 13);

-----------------

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