-- muzstore, таблицы

-- таблица жанров
CREATE table if not exists Genres
(
	GenreId integer PRIMARY KEY,
	GenreName varchar(30) NOT NULL
);

-- таблица исполнителей
CREATE table if not exists Performers
(
	PerfId integer PRIMARY KEY,
	PerfName varchar(30) NOT NULL
);

-- таблица соотношения исполнитель-жанр
CREATE table if not exists Perfgenre
(
	PerfId integer references Performers(PerfId),
	GenreId integer references Genres(GenreId),	
	PRIMARY KEY(GenreId, PerfId) 
);

-- таблица альбомов
CREATE table if not exists Albums
(
	AlbumId integer PRIMARY KEY,
	AlbumName varchar(30) NOT NULL,
	AlbumDate date NOT NULL	
);

-- таблица альбом-исполнитель
CREATE table if not exists Albumperformers
(
	AlbumId integer REFERENCES Albums(AlbumId),
	PerfId integer REFERENCES Performers(PerfId),
	PRIMARY KEY(AlbumId, PerfId)  
);

-- трэклист
CREATE table if not exists Tracks
(
	TrackId integer PRIMARY KEY,
	AlbumId integer REFERENCES Albums(AlbumId),
	TrackName varchar(30) NOT NULL,
	TrackLength INTERVAL NOT NULL
);

-- compilations
CREATE table if not exists Compilations
(
	CompId integer PRIMARY KEY,
	CompName varchar(30) NOT NULL,
	CompDate date NOT NULL
);

-- tracks & compilations references
CREATE table if not exists Comptracks
(
	CompId integer REFERENCES Compilations(CompId),
	TrackId integer REFERENCES Tracks(TrackId),
	PRIMARY KEY(CompId, TrackId)
);