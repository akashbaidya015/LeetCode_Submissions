-- Step 1: Find user with most ratings
WITH UserRatings AS (
    SELECT u.name, COUNT(*) AS rating_count
    FROM MovieRating mr
    JOIN Users u ON mr.user_id = u.user_id
    GROUP BY u.name
),
TopUser AS (
    SELECT name
    FROM UserRatings
    ORDER BY rating_count DESC, name ASC
    LIMIT 1
),

-- Step 2: Find movie with highest avg rating in Feb 2020
MovieRatingsFeb AS (
    SELECT m.title, AVG(mr.rating) AS avg_rating
    FROM MovieRating mr
    JOIN Movies m ON mr.movie_id = m.movie_id
    WHERE mr.created_at BETWEEN '2020-02-01' AND '2020-02-29'
    GROUP BY m.title
),
TopMovie AS (
    SELECT title
    FROM MovieRatingsFeb
    ORDER BY avg_rating DESC, title ASC
    LIMIT 1
)

-- Step 3: Combine results
SELECT name AS results FROM TopUser
UNION ALL
SELECT title AS results FROM TopMovie;
