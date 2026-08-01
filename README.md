# Music Database Management System (PostgreSQL)

A relational database management system designed for the music industry using PostgreSQL. This project demonstrates database design, normalization, indexing strategies, data manipulation, and complex SQL queries for managing songs, artists, record labels, and related business information.

---

## Project Overview

This project develops a relational database for managing music industry data, including songs, artists, producers, songwriters, record labels, genres, and countries.

The database supports common business operations such as:

- Maintaining artist and record label information
- Tracking songs and ownership history
- Managing relationships between artists, producers, writers, and labels
- Updating business records over time
- Performing analytical SQL queries for reporting

The project demonstrates practical database design principles and advanced SQL techniques using PostgreSQL.

---

## Business Problem

Music companies manage large amounts of interconnected data involving artists, songs, producers, writers, and record labels.

Without a properly designed relational database, it becomes difficult to:

- Maintain data consistency
- Track ownership changes
- Analyze artist performance
- Generate business reports efficiently
- Avoid redundant data

This project addresses these challenges through a normalized relational database and optimized SQL queries.

---

# Technologies

- PostgreSQL
- SQL
- Relational Database Design

---

# Database Design

The database consists of multiple related entities, including:

- Songs
- Artists (Persons)
- Record Labels
- Producers
- Songwriters
- Genres
- Countries

Several many-to-many relationships are implemented through bridge tables, including:

- Songs ↔ Singers
- Songs ↔ Producers
- Songs ↔ Writers
- Songs ↔ Labels
- Singers ↔ Labels

Temporal relationships are managed using PostgreSQL `daterange`, allowing historical ownership and contract tracking.

---

# Database Features

The project demonstrates:

- Database normalization
- Primary and foreign key constraints
- Bridge tables for many-to-many relationships
- Referential integrity
- Historical relationship tracking
- Index optimization
- Data insertion
- Data updates
- Analytical SQL queries

---

# Data Management

The database supports common business operations including:

### Insert Operations

- Add new artists
- Add new record labels
- Add new songs
- Create relationships between songs and artists
- Assign producers and songwriters
- Track label ownership over time

### Update Operations

- Update artist information
- Update record label information
- Update song statistics
- Track contract changes using date ranges

Deletion is intentionally restricted to preserve data integrity.

---

# SQL Techniques Demonstrated

This project utilizes a variety of SQL features, including:

- INNER JOIN
- GROUP BY
- Aggregate Functions
- Common Table Expressions (CTE)
- Window Functions
- ROW_NUMBER()
- PostgreSQL `daterange`
- UPDATE
- INSERT
- Index Optimization

---

# Example Business Queries

Example analytical queries include:

- Number of songs released by each artist
- Total song sales by artist
- Number of award-winning songs
- Most popular music genres for each record label
- Top record labels within each genre
- Current artists signed by each label
- Historical ownership of songs and artists

These queries demonstrate how SQL can be used to generate meaningful business insights from relational data.

---

# Project Structure

```
Music-Database-Management-System
│
├── README.md
├── schema.sql
├── sample_data.sql
├── queries.sql
├── indexes.sql
└── images
    ├── er_diagram.png
    └── schema.png
```

---

# Future Improvements

- Develop stored procedures for common business operations.
- Implement triggers for automatic data validation and auditing.
- Create views for frequently used business reports.
- Optimize query performance for larger datasets.
- Build a dashboard using Power BI or Tableau connected to the PostgreSQL database.

---

# Author

**Chenyin Luo**

M.S. in Data Analytics  
Tufts University

GitHub: https://github.com/chenyin9808
