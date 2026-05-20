# 🍽️ Zomato Restaurant Data Analysis using SQL

![SQL](https://img.shields.io/badge/SQL-MySQL-blue)
![Power BI](https://img.shields.io/badge/Visualization-PowerBI-yellow)
![Status](https://img.shields.io/badge/Project-Completed-brightgreen)

---

# 📌 Project Overview

The **Zomato Restaurant Data Analysis** project focuses on analyzing restaurant data using **SQL** to generate meaningful business insights.  
The project helps understand restaurant trends, customer preferences, online ordering behavior, customer engagement, and restaurant performance.

The dataset was collected from **Kaggle** and analyzed using **MySQL Workbench**.  
Various SQL concepts such as filtering, sorting, grouping, aggregate functions, joins, Common Table Expressions (CTEs), and window functions were used to perform detailed analysis.

---

# 🎯 Project Objectives

- Analyze restaurant ratings, votes, pricing, and ordering patterns.
- Identify top-rated and highly voted restaurants.
- Study customer preferences based on restaurant types and ratings.
- Understand online ordering and table booking trends.
- Perform data cleaning and exploratory data analysis using SQL.
- Use advanced SQL concepts like:
  - Joins
  - Window Functions
  - CTEs
  - RANK()
  - PARTITION BY
- Create dashboard-ready analytical outputs.

---

# 🛠️ Technologies Used

| Technology | Purpose |
|------------|----------|
| SQL | Data Analysis |
| MySQL Workbench | Database Management |
| Power BI | Data Visualization |
| Excel | Dataset Handling |

---

# 📂 Dataset Information

| Feature | Details |
|---------|----------|
| Dataset Name | Zomato Restaurant Dataset |
| Source | Kaggle |
| Total Records | 148 Restaurants |
| Total Columns | 7 |

### Dataset Includes:
- Restaurant Name
- Ratings
- Votes
- Approximate Cost
- Online Ordering
- Table Booking
- Restaurant Type

---

# 🗄️ Database Setup

## Step 1 — Create Database

```sql
CREATE DATABASE zomato_analysis;
```

## Step 2 — Use Database

```sql
USE zomato_analysis;
```

## Step 3 — Import Dataset

Imported the CSV dataset into MySQL using the **Table Data Import Wizard**.

---

# 🧹 Data Cleaning

Performed data cleaning operations to prepare the dataset for analysis.

### Cleaning Tasks:
- Removed unwanted characters from ratings
- Standardized column values
- Verified missing/null values
- Prepared dataset for SQL analysis

### Example Query

```sql
UPDATE zomato
SET rate = REPLACE(rate, '/5', '');
```

---

# 📊 Exploratory Data Analysis (EDA)

## 1️⃣ Display Restaurant Details

```sql
SELECT name, rate, votes, rest_type
FROM zomato;
```

---

## 2️⃣ Top 10 Highest Rated Restaurants

```sql
SELECT name, rate
FROM zomato
ORDER BY rate DESC
LIMIT 10;
```

---

## 3️⃣ Restaurants with Highest Votes

```sql
SELECT name, votes
FROM zomato
ORDER BY votes DESC;
```

---

## 4️⃣ Analyze Online Ordering

```sql
SELECT online_order,
       COUNT(*) AS total_restaurants
FROM zomato
GROUP BY online_order;
```

---

## 5️⃣ Analyze Table Booking

```sql
SELECT book_table,
       COUNT(*) AS total_restaurants
FROM zomato
GROUP BY book_table;
```

---

## 6️⃣ Most Common Restaurant Types

```sql
SELECT rest_type,
       COUNT(*) AS total
FROM zomato
GROUP BY rest_type
ORDER BY total DESC;
```

---

## 7️⃣ Average Restaurant Rating

```sql
SELECT ROUND(AVG(rate),2) AS average_rating
FROM zomato;
```

---

# 🔥 Advanced SQL Concepts Used

---

# ✅ Window Function — RANK()

Used the `RANK()` window function to rank restaurants based on ratings.

```sql
SELECT name,
       rate,
       RANK() OVER (ORDER BY rate DESC) AS ranking
FROM zomato;
```

### Purpose:
- Identify top-performing restaurants
- Compare restaurant rankings

---

# ✅ PARTITION BY with RANK()

Used `PARTITION BY` to rank restaurants within each category.

```sql
SELECT name,
       rest_type,
       rate,
       RANK() OVER (
           PARTITION BY rest_type
           ORDER BY rate DESC
       ) AS category_rank
FROM zomato;
```

### Purpose:
- Category-wise ranking
- Identify top restaurants within each type

---

# ✅ Common Table Expression (CTE)

Used CTE to analyze highly-rated restaurants.

```sql
WITH top_restaurants AS (
    SELECT name,
           rate,
           votes
    FROM zomato
    WHERE rate > 4
)
SELECT *
FROM top_restaurants
ORDER BY votes DESC;
```

### Purpose:
- Simplify complex queries
- Improve readability
- Analyze highly-rated restaurants

---

# 🔗 SQL Joins

Created normalized tables:
- Restaurants Table
- Ratings Table
- Restaurant Details Table

---

## INNER JOIN Example

```sql
SELECT r.restaurant_name,
       rt.rating,
       rt.votes
FROM restaurants r
INNER JOIN ratings rt
ON r.restaurant_id = rt.restaurant_id;
```

### Purpose:
- Combine restaurant and ratings data
- Display top-rated restaurants

---

# 📈 Key Insights

✅ Identified top-rated restaurants  
✅ Analyzed customer engagement using votes  
✅ Found popular restaurant categories  
✅ Studied online ordering trends  
✅ Compared restaurant performance category-wise  
✅ Used advanced SQL analytical functions

---

# 📷 Project Presentation

This repository contains:
- SQL Queries
- Dataset
- Project PPT Presentation

### File Included:
📄 `Zomato_Data_Analysis_ppt.pptx`

---

# 🚀 Future Improvements

- Create interactive Power BI dashboard
- Add predictive analytics
- Perform sentiment analysis on reviews
- Use larger real-world datasets

---

# 📚 Learning Outcomes

This project helped improve:
- SQL Query Writing
- Database Management
- Data Cleaning Techniques
- Analytical Thinking
- Business Insight Generation
- Real-world Data Analysis Skills

---

# 🤝 Conclusion

The **Zomato Restaurant Data Analysis** project successfully demonstrated how SQL can be used for real-world business analysis and insight generation.

Using advanced SQL concepts such as:
- Aggregate Functions
- Joins
- Window Functions
- Ranking Functions
- Common Table Expressions (CTEs)

the project generated meaningful insights about restaurant performance, customer preferences, and ordering behavior.

This project improved practical knowledge of SQL, database management, and analytical problem-solving skills by working with real-world restaurant data.

---

# 👨‍💻 Author

## Manasvi Garud
Aspiring Data Analyst | SQL | Power BI | Python

---

# ⭐ If you like this project, give it a star on GitHub!
```
