-- =====================================================
-- Music Industry Relational Database
-- PostgreSQL
--
-- File: 03_indexes.sql
--
-- Execute after:
--     01_create_tables.sql
--     02_foreign_keys.sql
--
-- Description:
--     Creates indexes to improve query performance
--     and optimize join operations.
-- =====================================================

SET search_path TO music_database_project;


-- =====================================================
-- INDEXES: artists_labels
-- =====================================================

DROP INDEX IF EXISTS idx_artists_labels_artist_name;

CREATE INDEX IF NOT EXISTS idx_artists_labels_artist_name
ON artists_labels (artist_name);


DROP INDEX IF EXISTS idx_artists_labels_label_name;

CREATE INDEX IF NOT EXISTS idx_artists_labels_label_name
ON artists_labels (label_name);


DROP INDEX IF EXISTS idx_artists_labels_period;

CREATE INDEX IF NOT EXISTS idx_artists_labels_period
ON artists_labels (period);


-- =====================================================
-- INDEXES: songs
-- =====================================================

DROP INDEX IF EXISTS idx_songs_genre;

CREATE INDEX IF NOT EXISTS idx_songs_genre
ON songs (genre);


-- =====================================================
-- INDEXES: songs_artists
-- =====================================================

DROP INDEX IF EXISTS idx_songs_artists_song_id;

CREATE INDEX IF NOT EXISTS idx_songs_artists_song_id
ON songs_artists (song_id);


DROP INDEX IF EXISTS idx_songs_artists_artist_name;

CREATE INDEX IF NOT EXISTS idx_songs_artists_artist_name
ON songs_artists (artist_name);


-- =====================================================
-- INDEXES: songs_writers
-- =====================================================

DROP INDEX IF EXISTS idx_songs_writers_song_id;

CREATE INDEX IF NOT EXISTS idx_songs_writers_song_id
ON songs_writers (song_id);


DROP INDEX IF EXISTS idx_songs_writers_writer_name;

CREATE INDEX IF NOT EXISTS idx_songs_writers_writer_name
ON songs_writers (writer_name);


-- =====================================================
-- INDEXES: songs_labels
-- =====================================================

DROP INDEX IF EXISTS idx_songs_labels_song_id;

CREATE INDEX IF NOT EXISTS idx_songs_labels_song_id
ON songs_labels (song_id);


DROP INDEX IF EXISTS idx_songs_labels_label_name;

CREATE INDEX IF NOT EXISTS idx_songs_labels_label_name
ON songs_labels (label_name);


DROP INDEX IF EXISTS idx_songs_labels_period;

CREATE INDEX IF NOT EXISTS idx_songs_labels_period
ON songs_labels (period);


-- =====================================================
-- End of index creation
-- =====================================================