# 📊 Netflix Data Analysis Project (SQL)

![Netflix_Logo](https://github.com/ritikrajput93400-tech/NETFLIX_SQL-_PROJECT/blob/main/pngwing.com.png)


📌 Project Overview



This project performs exploratory data analysis (EDA) on a Netflix dataset using SQL.
The goal is to analyze movies and TV shows available on Netflix and answer real-world business questions related to content type, ratings, countries, genres, actors, directors, and trends over time.

🛠️ Tools & Technologies

Database: PostgreSQL

Language: SQL

Concepts Used:

Aggregations (COUNT, AVG)

Window Functions (RANK)

CTE (WITH)

String Functions (SPLIT_PART, STRING_TO_ARRAY, UNNEST)

Date Functions (TO_DATE, EXTRACT)

Conditional Logic (CASE WHEN)

🗂️ Database Schema
CREATE TABLE netflix (
    show_id VARCHAR(10),
    type VARCHAR(10),
    title VARCHAR(150),
    director VARCHAR(210),
    casts VARCHAR(1000),
    country VARCHAR(150),
    date_added VARCHAR(50),
    release_year INT,
    rating VARCHAR(10),
    duration VARCHAR(15),
    listed_in VARCHAR(100),
    description VARCHAR(250)
);

📈 Business Problems Solved
1️⃣ Count total Movies and TV Shows
2️⃣ Find the most common rating for Movies and TV Shows
3️⃣ List all Movies released in a specific year (e.g., 2020)
4️⃣ Top 5 countries with the most Netflix content
5️⃣ Identify the longest movie
6️⃣ Find content added in the last 5 years
7️⃣ Find Movies/TV Shows by a specific director
8️⃣ List TV Shows with more than 5 seasons
9️⃣ Count content items in each genre
🔟 Year-wise average content released in India (Top 5 years)
1️⃣1️⃣ List all Documentary movies
1️⃣2️⃣ Find content without a director
1️⃣3️⃣ Movies featuring Salman Khan in the last 10 years
1️⃣4️⃣ Top 10 actors in Indian-produced movies
1️⃣5️⃣ Categorize content as Bad or Good based on keywords (kill, violence)
