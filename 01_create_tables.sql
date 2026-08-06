-- =====================================================
-- Music Industry Relational Database
-- PostgreSQL
--
-- File: 01_create_tables.sql
-- Description:
--     Creates all database tables.
--     Primary keys are defined here.
--     Foreign keys are added separately.
-- =====================================================

SET search_path TO music_database_project;

CREATE EXTENSION IF NOT EXISTS btree_gist;

-- =====================================================
-- TABLE: countries
-- =====================================================

DROP TABLE IF EXISTS countries CASCADE;

CREATE TABLE countries (
    country VARCHAR(40),
	
    CONSTRAINT pk_countries PRIMARY KEY (country)
);

-- =====================================================
-- TABLE: genres
-- =====================================================

DROP TABLE IF EXISTS genres CASCADE;

CREATE TABLE genres (
    genre VARCHAR(20),

    CONSTRAINT pk_genres PRIMARY KEY (genre)
);

-- =====================================================
-- TABLE: persons
-- =====================================================

DROP TABLE IF EXISTS persons CASCADE;

CREATE TABLE persons (
    name VARCHAR(50),
    birthdate DATE NOT NULL,
    country VARCHAR(40),
    fans INTEGER DEFAULT 0,

    CONSTRAINT pk_persons PRIMARY KEY (name),
	CONSTRAINT ck_persons_birthdate CHECK(birthdate >= DATE '1880-01-01'),
	CONSTRAINT ck_persons_fans CHECK(fans >= 0)
);

-- =====================================================
-- TABLE: labels
-- =====================================================

DROP TABLE IF EXISTS labels CASCADE;

CREATE TABLE labels (
    name VARCHAR(50),
    founded DATE NOT NULL,
    country VARCHAR(40),

    CONSTRAINT pk_labels PRIMARY KEY (name)
);

-- =====================================================
-- TABLE: songs
-- =====================================================

DROP TABLE IF EXISTS songs CASCADE;

CREATE TABLE songs (
	song_id SMALLINT GENERATED ALWAYS AS IDENTITY,
	name VARCHAR(50) NOT NULL,
    english BOOLEAN NOT NULL DEFAULT TRUE,
	length INTERVAL NOT NULL,
	released DATE NOT NULL,
	genre VARCHAR(20) NOT NULL,
	accolade BOOLEAN NOT NULL DEFAULT FALSE,
	sell INT NOT NULL,
	billboard SMALLINT,
	
    CONSTRAINT pk_songs PRIMARY KEY (song_id),
	CONSTRAINT uq_song_name_released UNIQUE (name,released)
);

-- =====================================================
-- TABLE: songs_artists
-- =====================================================

DROP TABLE IF EXISTS songs_artists CASCADE;

CREATE TABLE songs_artists (
    song_id SMALLINT,
    artist_name VARCHAR(50),

    CONSTRAINT pk_songs_artists PRIMARY KEY (song_id, artist_name)
);

-- =====================================================
-- TABLE: songs_writers
-- =====================================================

DROP TABLE IF EXISTS songs_writers CASCADE;

CREATE TABLE songs_writers (
    song_id SMALLINT,
    writer_name VARCHAR(50),

    CONSTRAINT pk_songs_writers PRIMARY KEY (song_id, writer_name)
);

-- =====================================================
-- TABLE: songs_producers
-- =====================================================

DROP TABLE IF EXISTS songs_producers CASCADE;

CREATE TABLE songs_producers (
    song_id SMALLINT,
    producer_name VARCHAR(50),

    CONSTRAINT pk_songs_producers PRIMARY KEY (song_id, producer_name)
);

-- =====================================================
-- TABLE: songs_labels
-- =====================================================

DROP TABLE IF EXISTS songs_labels CASCADE;

CREATE TABLE songs_labels (
    id SMALLINT GENERATED ALWAYS AS IDENTITY,
    song_id SMALLINT NOT NULL,
    label_name VARCHAR(50) NOT NULL,
    period DATERANGE NOT NULL,

    CONSTRAINT pk_songs_labels PRIMARY KEY (id),
	CONSTRAINT ex_songs_labels EXCLUDE USING GIST (period WITH &&, song_id WITH =)
);

-- =====================================================
-- TABLE: artists_labels
-- =====================================================

DROP TABLE IF EXISTS artists_labels CASCADE;

CREATE TABLE artists_labels (
    id SMALLINT GENERATED ALWAYS AS IDENTITY,
    artist_name VARCHAR(50) NOT NULL,
    label_name VARCHAR(50) NOT NULL,
    period DATERANGE NOT NULL,

	CONSTRAINT pk_artists_labels PRIMARY KEY (id),
	CONSTRAINT ex_artists_labels EXCLUDE USING GIST (period WITH &&, artist_name WITH =)
);

-- =====================================================
-- End of table creation
-- =====================================================