-- =====================================================
-- Music Industry Relational Database
-- PostgreSQL
--
-- File: 02_foreign_keys.sql
-- Description:
--     Adds all foreign key constraints after the tables
--     have been created.
-- =====================================================

SET search_path TO music_database_project;


-- =====================================================
-- FOREIGN KEY: labels → countries
-- =====================================================

ALTER TABLE labels
ADD CONSTRAINT fk_labels_countries FOREIGN KEY (country)
REFERENCES countries (country)
ON UPDATE CASCADE
ON DELETE RESTRICT;


-- =====================================================
-- FOREIGN KEY: persons → countries
-- =====================================================

ALTER TABLE persons
ADD CONSTRAINT fk_persons_countries FOREIGN KEY (country)
REFERENCES countries (country)
ON UPDATE CASCADE
ON DELETE RESTRICT;


-- =====================================================
-- FOREIGN KEY: songs → genres
-- =====================================================

ALTER TABLE songs
ADD CONSTRAINT fk_songs_genres FOREIGN KEY (genre)
REFERENCES genres (genre)
ON UPDATE CASCADE
ON DELETE RESTRICT;


-- =====================================================
-- FOREIGN KEYS: songs_artists
-- =====================================================

ALTER TABLE songs_artists
ADD CONSTRAINT fk_songs_artists_songs FOREIGN KEY (song_id)
REFERENCES songs (song_id)
ON UPDATE CASCADE
ON DELETE RESTRICT;

ALTER TABLE songs_artists
ADD CONSTRAINT fk_songs_artists_persons FOREIGN KEY (artist_name)
REFERENCES persons (name)
ON UPDATE CASCADE
ON DELETE RESTRICT;


-- =====================================================
-- FOREIGN KEYS: songs_writers
-- =====================================================

ALTER TABLE songs_writers
ADD CONSTRAINT fk_songs_writers_songs FOREIGN KEY (song_id)
REFERENCES songs (song_id)
ON UPDATE CASCADE
ON DELETE RESTRICT;

ALTER TABLE songs_writers
ADD CONSTRAINT fk_songs_writers_persons FOREIGN KEY (writer_name)
REFERENCES persons (name)
ON UPDATE CASCADE
ON DELETE RESTRICT;


-- =====================================================
-- FOREIGN KEYS: songs_producers
-- =====================================================

ALTER TABLE songs_producers
ADD CONSTRAINT fk_songs_producers_songs FOREIGN KEY (song_id)
REFERENCES songs (song_id)
ON UPDATE CASCADE
ON DELETE RESTRICT;

ALTER TABLE songs_producers
ADD CONSTRAINT fk_songs_producers_persons FOREIGN KEY (producer_name)
REFERENCES persons (name)
ON UPDATE CASCADE
ON DELETE RESTRICT;


-- =====================================================
-- FOREIGN KEYS: songs_labels
-- =====================================================

ALTER TABLE songs_labels
ADD CONSTRAINT fk_songs_labels_songs FOREIGN KEY (song_id)
REFERENCES songs (song_id)
ON UPDATE CASCADE
ON DELETE RESTRICT;

ALTER TABLE songs_labels
ADD CONSTRAINT fk_songs_labels_labels FOREIGN KEY (label_name)
REFERENCES labels (name)
ON UPDATE CASCADE
ON DELETE RESTRICT;


-- =====================================================
-- FOREIGN KEYS: artists_labels
-- =====================================================

ALTER TABLE artists_labels
ADD CONSTRAINT fk_artists_labels_persons FOREIGN KEY (artist_name)
REFERENCES persons (name)
ON UPDATE CASCADE
ON DELETE RESTRICT;

ALTER TABLE artists_labels
ADD CONSTRAINT fk_artists_labels_labels FOREIGN KEY (label_name)
REFERENCES labels (name)
ON UPDATE CASCADE
ON DELETE RESTRICT;


-- =====================================================
-- End of foreign key creation
-- =====================================================