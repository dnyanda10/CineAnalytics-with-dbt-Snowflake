# 🎬 CineAnalytics with dbt + Snowflake

![Architecture](movielens_dbt_architecture.png)

----------

## 📌 Overview

This project demonstrates how to transform raw MovieLens datasets into an analytics-ready data warehouse using dbt on Snowflake. It covers ingestion, transformation, testing, snapshots, and mart-level modeling for movie and rating analytics.

The objective is to showcase solid data engineering & analytics engineering practices using dbt:
- Source-to-mart modeling
- Seeds & snapshots
- Data quality & business rule tests
- Custom dbt macros
- Analytical queries in /analyses

----------------------------------

## 🛠 Tech Stack
- Data Warehouse: Snowflake
- Transformation Tool: dbt (Data Build Tool)
- Dataset: MovieLens

  ------------
## 📂 Project Structure
```bash
.
├── models/
│   ├── staging/               # Raw → clean source-aligned tables
│   ├── dim/                   # Dimensions (dim_movies)
│   ├── fct/                   # Facts (fct_ratings)
│   ├── mart/                  # Analytical marts (mart_movies_releases)
│   ├── snapshots/             # Snapshots for SCD tracking (snap_tags)
│   ├── schema.yml             # Documentation + column tests
│
├── seeds/
│   ├── movie_release_dates.csv   # Enrich movies with release date metadata
│
├── macros/
│   ├── no_nulls_in_columns.sql   # Custom generic test
│
├── analyses/
│   ├── movie_analysis.sql        # Custom analysis query
│
├── tests/
│   ├── test_valid_ratings.sql    # Ratings between 0.5–5
│   ├── test_unique_movies.sql    # Movie IDs unique
│   ├── test_ratings_movie_id_fk.sql  # Referential integrity
│
├── dbt_project.yml

```
-------

## 🚀 Setup & Run

### 1. Clone the repository
```bash
git clone https://github.com/dnyanda10/CineAnalytics-with-dbt-Snowflake.git
cd CineAnalytics-with-dbt-Snowflake

```

### 2- Configure Snowflake profile (profiles.yml)
```bash
  movielens:
  target: dev
  outputs:
    dev:
      type: snowflake
      account: <account>
      user: <username>
      password: <password>
      role: <role>
      database: MOVIELENS
      warehouse: COMPUTE_WH
      schema: DEV
```

### 3- Load Seeds
```bash
   dbt seed
 ``` 

### 4- Run Models
```bash
   dbt run
```

### 5- Run All Tests
```bash
   dbt test
``` 

### 6- Explore DAG / Docs
```bash
   dbt docs generate
   dbt docs serve
```
----------------

## ✅ Features Implemented
- Sources: r_movies, r_ratings, r_tags, r_links
- Dimensions: dim_movies
- Facts: fct_ratings
- Snapshots: snap_tags (tracks changing tags with SCD2)
- Marts: mart_movies_releases (movies enriched with release dates)
- Seeds: movie_release_dates.csv
- Macros: no_nulls_in_columns (custom reusable test)
- Analyses: movie_analysis.sql → contains custom analytics query for insights_
- Tests: Referential integrity, ranges, uniqueness

----------------
## 📊 Example DAG
- RAW.R_MOVIES → dim_movies → mart_movies_releases
- RAW.R_RATINGS → fct_ratings
- RAW.R_TAGS → snap_tags

## 📜 License
MIT License — free to use and modify.












