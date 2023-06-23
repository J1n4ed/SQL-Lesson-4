-- не менее 4 исполнителей,
-- не менее 3 жанров,
-- не менее 3 альбомов,
-- не менее 6 треков,
-- не менее 4 сборников.

-- inserting genres
-- id, name

insert into genres (genreid, genrename)
values
(1, 'Heavy Metal'),
(2, 'Popular'),
(3, 'Metal'),
(4, 'Classic'),
(5, 'Symphometal'),
(6, 'Doom Core'),
(7, 'Alternative'),
(8, 'Jazz'),
(9, 'Folk'),
(10, 'Tribal'),
(11, 'Rock-n-Roll');

-- inserting performers
-- id, name

insert into performers(perfid, perfname)
values
(1, 'John Kilmer'),
(2, 'Mary Brown'),
(3, 'Franc Ulbrand'),
(4, 'Olga Noeva'),
(5, 'Karl Murr'),
(6, 'Vasya Kolesnikov'),
(7, 'Sergey Miloslavsky'),
(8, 'Carry Flop'),
(9, 'John Doe');

-- Performers with single word name

insert into performers(perfid, perfname)
values
(10, 'Sovngard'),
(11, 'Bestie'),
(12, 'V');

-- add extra performer

insert into performers(perfid, perfname)
values
(13, 'DeWinter');

-- insert perfgeners
-- performer id + genres id

insert into perfgenre
values(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(9, 11),
(8, 10),
(4, 3),
(5, 2),
(6, 1);

insert into perfgenre
values
(10, 1),
(10, 2),
(11, 3),
(12, 4);

insert into perfgenre
values
(13, 10);

-- insert albums
-- id, name, date

insert into albums
values
(1, 'My Darling', TO_DATE('01/20/1988', 'MM/DD/YYYY')),
(2, 'Extra Pain', TO_DATE('02/13/1998', 'MM/DD/YYYY')),
(3, 'Gears of Music', TO_DATE('01/21/2003', 'MM/DD/YYYY')),
(4, 'Urgent Godzilla Annihilation 10000', TO_DATE('03/16/1987', 'MM/DD/YYYY')),
(5, 'Trinity Ward', TO_DATE('05/15/1959', 'MM/DD/YYYY')),
(6, 'Relaxed Tunes', TO_DATE('08/28/1991', 'MM/DD/YYYY')),
(7, 'Asphalt Rover', TO_DATE('07/17/1961', 'MM/DD/YYYY')),
(8, 'Fatigued Owl', TO_DATE('02/11/2011', 'MM/DD/YYYY')),
(9, 'Blowpipe', TO_DATE('11/03/2015', 'MM/DD/YYYY')),
(10, 'Teenage Mini Paper Swirrels', TO_DATE('05/05/1998', 'MM/DD/YYYY')),
(11, 'Hilarious Fantasy for the Beaver', TO_DATE('09/20/2005', 'MM/DD/YYYY')),
(12, 'Jokes Aside', TO_DATE('11/16/1982', 'MM/DD/YYYY')),
(13, 'Bunny Hop', TO_DATE('01/12/2009', 'MM/DD/YYYY')),
(14, 'Million Stars Hotel', TO_DATE('03/09/2019', 'MM/DD/YYYY')),
(15, 'Eleven Reasons to Deploy', TO_DATE('03/10/2003', 'MM/DD/YYYY')),
(16, 'I Emit Broken Commit', TO_DATE('05/23/1977', 'MM/DD/YYYY')),
(17, 'Party Like A Big L', TO_DATE('11/07/1917', 'MM/DD/YYYY')),
(18, 'Clown Zone', TO_DATE('12/08/1994', 'MM/DD/YYYY')),
(19, 'Teleporter Blaze', TO_DATE('01/03/2021', 'MM/DD/YYYY')),
(20, 'Catsanity', TO_DATE('02/13/2005', 'MM/DD/YYYY')),
(21, 'Esta Bien', TO_DATE('07/14/2007', 'MM/DD/YYYY')),
(22, 'Dig the Grave', TO_DATE('07/05/1986', 'MM/DD/YYYY')),
(23, 'Psyhorhymes', TO_DATE('06/17/1996', 'MM/DD/YYYY'));

-- albums 2019-2020

insert into albums
values
(24, 'Tetraventra', TO_DATE('01/20/2019', 'MM/DD/YYYY')),
(25, 'Indigo Trails', TO_DATE('02/13/2020', 'MM/DD/YYYY')),
(26, 'Groundbreaker', TO_DATE('05/21/2019', 'MM/DD/YYYY'));

-- insert album to performer connection
-- album id, perf id

insert into albumperformers 
values
(1, 1),
(1, 3),
(1, 5),
(2, 1),
(2, 4),
(3, 5),
(4, 5),
(4, 6),
(4, 2),
(4, 3),
(5, 6),
(6, 7),
(7, 7),
(7, 6),
(7, 5),
(8, 8),
(8, 4),
(9, 3),
(10, 9),
(11, 1),
(12, 1),
(13, 2),
(13, 7),
(14, 9),
(15, 8),
(15, 4),
(15, 2),
(16, 7),
(17, 3),
(18, 8),
(19, 1),
(20, 2),
(21, 3),
(22, 4),
(23, 9),
(23, 5);

insert into albumperformers 
values
(24, 11),
(24, 8),
(24, 7),
(25, 6),
(25, 10),
(26, 12);

insert into albumperformers 
values
(26, 13);

-- insert compilations
-- id, name, date

insert into compilations 
values
(1, 'The Best for the Beast', TO_DATE('1/11/1995', 'MM/DD/YYYY')),
(2, 'To Beat or not to Beat', TO_DATE('2/14/1998', 'MM/DD/YYYY')),
(3, 'Iron Curtain', TO_DATE('3/17/2001', 'MM/DD/YYYY')),
(4, 'This Years Besty Ultra Rhymes', TO_DATE('4/21/1988', 'MM/DD/YYYY')),
(5, 'Who is John Cina?', TO_DATE('5/23/1978', 'MM/DD/YYYY')),
(6, 'Orchestra', TO_DATE('6/28/2008', 'MM/DD/YYYY'));

-- compilations between 2018 & 2020

insert into compilations 
values
(7, 'Groundbeat', TO_DATE('1/11/2019', 'MM/DD/YYYY')),
(8, 'My Little Wonnie', TO_DATE('2/14/2020', 'MM/DD/YYYY'));

-- insert tracks
-- track id, album id, name, length

insert into tracks 
values
(1, 1, 'Inferno', interval '5' minute + interval '51' second),
(2, 1, 'Crater', interval '6' minute + interval '52' second),
(3, 1, 'My Mosquito', interval '7' minute + interval '23' second),
(4, 2, 'Fight the Porno', interval '8' minute + interval '16' second),
(5, 2, 'Literal Trip', interval '3' minute + interval '32' second),
(6, 2, 'Semper Fidelis', interval '4' minute + interval '22' second),
(7, 3, 'Join the Parade', interval '5' minute + interval '56' second),
(8, 3, 'Unforseen Consequences', interval '2' minute + interval '11' second),
(9, 3, 'de_dust 2', interval '5' minute + interval '30' second),
(10, 4, 'Multiuniverse of cringe', interval '4' minute + interval '42' second),
(11, 4, 'Elluminate me plenty', interval '1' minute + interval '42' second),
(12, 4, 'Savage Cast', interval '6' minute + interval '32' second),
(13, 5, 'Pop the Flop', interval '6' minute + interval '33' second),
(14, 5, 'Hurricane', interval '4' minute + interval '33' second),
(15, 5, 'Mindblow', interval '3' minute + interval '44' second),
(16, 6, 'Explicit Theory', interval '4' minute + interval '18' second),
(17, 6, 'Nine Candles to the Mess', interval '3' minute + interval '35' second),
(18, 6, 'Increment This', interval '4' minute + interval '13' second),
(19, 7, 'Madness in the Parking Lot', interval '2' minute + interval '05' second),
(20, 7, 'Throwing Jokes', interval '3' minute + interval '03' second),
(21, 7, 'Jizz the Squizz', interval '3' minute + interval '10' second),
(22, 8, 'Hit the Road', interval '5' minute + interval '38' second),
(23, 8, 'Doomfy', interval '5' minute + interval '30' second),
(24, 8, 'The Second Winner', interval '6' minute + interval '32' second),
(25, 9, 'Graphit', interval '4' minute + interval '20' second),
(26, 9, 'Nihilistic Preacher', interval '4' minute + interval '41' second),
(27, 9, 'Kaer Jull', interval '3' minute + interval '45' second),
(28, 10, 'In canta periodica', interval '2' minute + interval '30' second),
(29, 10, 'Ocular Wind', interval '5' minute + interval '30' second),
(30, 10, 'Them, who Stood on the Square', interval '6' minute + interval '53' second),
(31, 11, 'Nothing around my head', interval '5' minute + interval '25' second),
(32, 11, 'Eardrop', interval '4' minute + interval '23' second),
(33, 11, 'Cathedral Mutilation', interval '3' minute + interval '52' second),
(34, 12, 'Blinded by the Wraith', interval '7' minute + interval '44' second),
(35, 12, 'Ten-Four', interval '6' minute + interval '41' second),
(36, 12, 'Kill the Mill', interval '5' minute + interval '42' second),
(37, 13, 'Lover Romacticide', interval '2' minute + interval '45' second),
(38, 13, 'Gendalf The Rock Star', interval '4' minute + interval '30' second),
(39, 13, '99 Reasons', interval '5' minute + interval '15' second),
(40, 14, 'Step after Step', interval '6' minute + interval '16' second),
(41, 14, 'Lightning Bold (in early 30)', interval '5' minute + interval '17' second),
(42, 14, 'In Times of My Good Mood', interval '4' minute + interval '23' second),
(43, 15, 'One step forward', interval '5' minute + interval '24' second),
(44, 15, 'Two steps backward', interval '4' minute + interval '25' second),
(45, 15, 'Sanity for the Crowd', interval '5' minute + interval '36' second),
(46, 16, 'Dark Corner', interval '5' minute + interval '37' second),
(47, 16, 'Cicero', interval '4' minute + interval '12' second),
(48, 16, 'Trapped in the City', interval '5' minute + interval '13' second),
(49, 17, 'Xeno Soul', interval '3' minute + interval '17' second),
(50, 17, 'Bouncer', interval '5' minute + interval '51' second),
(51, 17, 'Ninja Troll', interval '2' minute + interval '52' second),
(52, 18, 'Pay Me Plenty', interval '2' minute + interval '55' second),
(53, 18, 'Hack-n-Smack', interval '3' minute + interval '57' second),
(54, 18, 'Axed to Death', interval '3' minute + interval '30' second),
(55, 19, 'Flight of the TV', interval '4' minute + interval '41' second),
(56, 19, 'Electrocuted', interval '4' minute + interval '44' second),
(57, 19, 'Fathers of the Despair', interval '5' minute + interval '46' second),
(58, 20, 'Brilliant Fool', interval '6' minute + interval '41' second),
(59, 20, 'Joker or being devorced with extra steps', interval '6' minute + interval '05' second),
(60, 20, 'Ballad for Salad', interval '6' minute + interval '05' second),
(61, 21, 'Wild Drill Noises', interval '7' minute + interval '09' second),
(62, 21, 'Flat Screw', interval '7' minute + interval '10' second),
(63, 21, 'Nail This', interval '8' minute + interval '31' second),
(64, 22, 'Broken and Glued Back', interval '8' minute + interval '35' second),
(65, 22, 'Pony Scroller', interval '1' minute + interval '08' second),
(66, 22, '100 sharpened bunny ears', interval '1' minute + interval '51' second),
(67, 23, 'In the Name of Rice', interval '2' minute + interval '37' second),
(68, 23, 'Phoned the Phony', interval '2' minute + interval '41' second),
(69, 23, 'Hooked in the Club', interval '2' minute + interval '49' second),
(70, 1, 'Kick the Jingle Jizzles', interval '3' minute + interval '39' second),
(71, 2, 'Pew Pew Pew', interval '3' minute + interval '31' second),
(72, 3, 'Airplane', interval '3' minute + interval '33' second),
(73, 4, 'Hilltop Diver', interval '3' minute + interval '34' second),
(74, 5, 'Mother 9', interval '4' minute + interval '27' second),
(75, 6, 'Liquid Dreams', interval '4' minute + interval '25' second),
(76, 7, 'Burn the Heretics', interval '4' minute + interval '29' second),
(77, 8, 'Masterplant', interval '5' minute + interval '20' second),
(78, 9, 'Ops I Bomb it Again', interval '8' minute + interval '19' second),
(79, 10, 'Scandic Brandt', interval '9' minute + interval '11' second),
(80, 11, 'Killswitch', interval '5' minute + interval '09' second);

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

-- insert compilation tracks
-- comp id, track id
-- 6 compilations to fill

insert into comptracks 
values
(1, 1),
(1, 2),
(1, 3),
(1, 8),
(1, 18),
(1, 22),
(2, 22),
(2, 18),
(2, 64),
(2, 80),
(2, 32),
(2, 12),
(3, 37),
(3, 51),
(3, 52),
(3, 58),
(3, 22),
(4, 21),
(4, 18),
(4, 6),
(4, 17),
(5, 74),
(5, 72),
(5, 50),
(5, 41),
(5, 46),
(5, 12),
(6, 17),
(6, 14),
(6, 74),
(6, 71),
(6, 50),
(6, 41),
(6, 30),
(6, 12);

insert into comptracks 
values
(7, 11),
(7, 12),
(7, 13),
(8, 16),
(8, 2),
(8, 22),
(8, 60);
