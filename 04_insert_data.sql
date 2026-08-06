-- =====================================================
-- Music Industry Relational Database
-- PostgreSQL
--
-- File: 04_insert_data.sql
--
-- Execute after:
--     01_create_tables.sql
--     02_foreign_keys.sql
--
-- Description:
--     Inserts sample data into all tables.
-- =====================================================

SET search_path TO music_database_project;

-- =====================================================
-- TABLE: countries
-- IMPORT DATA FROM csv
-- =====================================================


-- =====================================================
-- TABLE: genres
-- =====================================================

INSERT INTO genres(genre)
VALUES
	('Blues'),('Country'),('Electronic'),('Hip hop'),('Jazz'),('Pop'),('R&B'),('Rock');

-- =====================================================
-- TABLE: persons
-- =====================================================

INSERT INTO persons(name, birthdate, country, fans)
VALUES
	('Harry Styles', '1994-02-01', 'United Kingdom', 38316521),
    ('Dave Bayley', '1989-06-07', 'United Kingdom', 172000),
    ('Adele Laurie Blue Adkins', '1988-05-05', 'United Kingdom', 27668351),
    ('Glass Animal', '2012-03-18', 'United Kingdom', 332000),
    ('Kid Harpoon', '1982-04-20', 'United Kingdom', 87400),
    ('Tyler Johnson', '1992-09-26', 'United States', 24000),
    ('Greg Kurstin', '1969-05-05', 'United States', 20559),
    ('The Beatles', '1960-08-12', 'United Kingdom', 37000000),
    ('Lennon McCartney', '1940-10-09', 'United Kingdom', 28000000),
    ('George Gershwin', '1898-09-26', 'United States', 213100)
;

-- =====================================================
-- TABLE: labels
-- =====================================================

INSERT INTO labels(name, founded, country)
VALUES
	('Wolf Tone','2012-10-3','United Kingdom'),
	('XL Recordings','1989-1-1','United Kingdom'),
	('Columbia Records','1990-1-15','United States'),
	('Republic Records','1995-1-1','United States'),
	('Asylum Records','1971-1-1','United States'),
	('Syco Records','2002-1-15','United Kingdom'),
    ('Warner Chappell Music','1987-1-1','United States'),
    ('Capitol Records','1942-3-27','United States'),
    ('Parlophone Records','1896-1-1','United Kingdom'),
    ('Apple Records','1968-8-1','United Kingdom')
;

-- =====================================================
-- TABLE: songs
-- =====================================================

INSERT INTO songs(name,english,length,released,genre,accolade,sell,billboard)
VALUES
	('As It Was',true,'2m47s','2022-4-1','Rock',true,13000,2),
	('Heat Waves',true,'3m58s','2020-6-29','R&B',true,15000,1),
	('Easy on Me',true,'3m44s','2021-10-15','Pop',true,23000,4),
	('Hello',true,'4m56s','2015-10-23','Jazz',true,14000,7),
	('Yesterday',true,'2m3s','1965-8-6','Pop',true,42000,NULL),
	('Summertime',true,'2m54s','1935-1-1','Jazz',true,41000,NULL)
;

-- =====================================================
-- TABLE: songs_artists
-- =====================================================

INSERT INTO songs_artists(song_id, artist_name)
VALUES
	(1,'Harry Styles'),
	(2,'Glass Animal'),
	(3,'Adele Laurie Blue Adkins'),
	(4,'Adele Laurie Blue Adkins'),
	(5,'The Beatles'),
	(6,'George Gershwin')
;

-- =====================================================
-- TABLE: songs_writers
-- =====================================================

INSERT INTO songs_writers(song_id, writer_name)
VALUES
	(1,'Harry Styles'),
	(1,'Kid Harpoon'),
	(1,'Tyler Johnson'),
	(2,'Dave Bayley'),
	(3,'Greg Kurstin'),
	(3,'Adele Laurie Blue Adkins'),
	(4,'Adele Laurie Blue Adkins'),
	(4,'Greg Kurstin'),
	(5,'Lennon McCartney'),
	(6,'George Gershwin')
;

-- =====================================================
-- TABLE: songs_producers
-- =====================================================

INSERT INTO songs_producers 
VALUES
	(1,'Kid Harpoon'),
	(1,'Tyler Johnson'),
	(2,'Dave Bayley'),
	(3,'Greg Kurstin'),
	(4,'Greg Kurstin')
	;

-- =====================================================
-- TABLE: songs_labels
-- =====================================================

INSERT INTO songs_labels(song_id,label_name,period) 
VALUES
	(1,'Columbia Records',daterange('2022-4-1','infinity')),
	(2,'Wolf Tone',daterange('2020-6-29','infinity')),
	(3,'Columbia Records',daterange('2021-10-15','infinity')),
	(4,'XL Recordings',daterange('2015-10-23','2017-9-2')),
	(4,'Columbia Records',daterange('2017-9-3','infinity')),
	(5,'Parlophone Records',daterange('1962-6-6','1968-11-9')),
	(5,'Apple Records',daterange('1968-11-9','infinity')),
	(6,'Warner Chappell Music',daterange('1916-1-1','infinity'))
;


-- =====================================================
-- TABLE: artists_labels
-- =====================================================

INSERT INTO artists_labels(artist_name,label_name,period) 
VALUES
	('Harry Styles','Syco Records',daterange('2011-1-1','2016-6-3')),
	('Harry Styles','Columbia Records',daterange('2016-6-23','infinity')),
	('Adele Laurie Blue Adkins','XL Recordings',daterange('2006-9-1','2008-03-01')),
	('Adele Laurie Blue Adkins','Columbia Records',daterange('2008-3-1','infinity')),
	('Glass Animal','Wolf Tone',daterange('2012-3-18','infinity')),
	('The Beatles','Parlophone Records',daterange('1962-6-6','1968-11-9')),
	('The Beatles','Apple Records',daterange('1968-11-9','1974-12-29')),
	('George Gershwin','Warner Chappell Music',daterange('1916-1-1','1937-6-11'))
;

-- =====================================================
-- End of table creation
-- =====================================================