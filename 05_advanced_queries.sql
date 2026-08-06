-- =====================================================
-- Music Industry Relational Database
-- PostgreSQL
--
-- File: 05_advanced_queries.sql
--
-- Execute after:
--     01_create_tables.sql
--     02_foreign_keys.sql
--     03_indexes.sql
--     04_insert_data.sql
--
-- Description:
--     Demonstrates analytical SQL queries and advanced
--     PostgreSQL features used in the project.
-- =====================================================

SET search_path TO music_database_project;

-- =====================================================
-- QUERY 1: Artist Performance Summary
-- Displays the number of songs, total sales,
-- and accolade songs for each artist.
-- =====================================================

SELECT
    p.name,
    COUNT(s.song_id) AS number_of_songs,
    SUM(s.sell) AS total_sales,
    COUNT(
        CASE
            WHEN s.accolade = TRUE THEN 1
        END
    ) AS accolade_songs
FROM persons AS p
INNER JOIN songs_artists AS sa
    ON p.name = sa.artist_name
INNER JOIN songs AS s
    ON s.song_id = sa.song_id
GROUP BY p.name;


-- =====================================================
-- QUERY 2: Genre Distribution by Record Label
-- =====================================================

SELECT
    l.name,
    s.genre,
    COUNT(s.genre) AS number_of_songs
FROM labels AS l
INNER JOIN songs_labels AS sl
    ON l.name = sl.label_name
INNER JOIN songs AS s
    ON s.song_id = sl.song_id
GROUP BY l.name, s.genre
ORDER BY l.name, number_of_songs;


-- =====================================================
-- QUERY 3: Top Three Genres for Each Label
-- =====================================================

WITH genre_summary AS
(
    SELECT
        l.name,
        s.genre,
        COUNT(s.genre) AS number_of_songs
    FROM labels AS l
    INNER JOIN songs_labels AS sl
        ON l.name = sl.label_name
    INNER JOIN songs AS s
        ON s.song_id = sl.song_id
    GROUP BY l.name, s.genre
)

SELECT
    name,
    genre,
    number_of_songs
FROM
(
    SELECT *,
           ROW_NUMBER() OVER
           (
               PARTITION BY name
               ORDER BY number_of_songs DESC
           ) AS row_id
    FROM genre_summary
) ranked
WHERE row_id <= 3
ORDER BY name;


-- =====================================================
-- QUERY 4: Top Three Labels for Each Genre
-- =====================================================

WITH genre_summary AS
(
    SELECT
        l.name,
        s.genre,
        COUNT(s.genre) AS number_of_songs
    FROM labels AS l
    INNER JOIN songs_labels AS sl
        ON l.name = sl.label_name
    INNER JOIN songs AS s
        ON s.song_id = sl.song_id
    GROUP BY l.name, s.genre
)

SELECT
    genre,
    name,
    number_of_songs
FROM
(
    SELECT *,
           ROW_NUMBER() OVER
           (
               PARTITION BY genre
               ORDER BY number_of_songs DESC
           ) AS row_id
    FROM genre_summary
) ranked
WHERE row_id <= 3
ORDER BY genre;


-- =====================================================
-- QUERY 5: Active Artists by Record Label
-- =====================================================

SELECT
    label_name,
    COUNT(*) AS number_of_artists
FROM artists_labels
WHERE CURRENT_DATE <@ period
GROUP BY label_name;


-- =====================================================
-- QUERY 6: Artists Recording Outside Their Current Label
-- Finds artists whose currently released songs belong
-- to a different label than their active contract.
-- =====================================================

SELECT
    a.artist_name,
    a.label_name AS current_label,
    s.name AS song_name,
    sl.label_name AS song_label
FROM artists_labels AS a
LEFT JOIN songs_artists AS sa
    ON a.artist_name = sa.artist_name
LEFT JOIN songs_labels AS sl
    ON sa.song_id = sl.song_id
LEFT JOIN songs AS s
    ON s.song_id = sl.song_id
WHERE CURRENT_DATE <@ a.period
  AND CURRENT_DATE <@ sl.period
  AND a.label_name <> sl.label_name;

-- =====================================================
-- ADVANCED FEATURE
-- Table Partitioning
-- Demonstrates PostgreSQL LIST partitioning by role.
-- =====================================================

DROP TABLE IF EXISTS persons_partitioned CASCADE;

CREATE TABLE persons_partitioned
(
    name VARCHAR(50) NOT NULL,
    birthdate DATE NOT NULL,
    fans INTEGER NOT NULL DEFAULT 0,
    role VARCHAR(8) NOT NULL,

    CONSTRAINT pk_persons_partitioned
        PRIMARY KEY (name, role),

    CONSTRAINT ck_persons_partitioned_birthdate
        CHECK (birthdate >= DATE '1880-01-01'),

    CONSTRAINT ck_persons_partitioned_fans
        CHECK (fans >= 0)
)
PARTITION BY LIST (role);

CREATE TABLE artists
PARTITION OF persons_partitioned
FOR VALUES IN ('artist');

CREATE TABLE writers
PARTITION OF persons_partitioned
FOR VALUES IN ('writer');
