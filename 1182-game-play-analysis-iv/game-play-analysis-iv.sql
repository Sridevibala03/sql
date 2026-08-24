WITH t AS (
    SELECT 
        player_id,
        event_date,
        LEAD(event_date) OVER (PARTITION BY player_id ORDER BY event_date ASC) AS next_date
    FROM activity
),
f AS (
    SELECT COUNT(DISTINCT player_id) AS c_d 
    FROM activity
),
tod AS (
    SELECT 
        t.player_id, 
        t.event_date, 
        t.next_date, 
        f.c_d , row_number() over (partition by t.player_id) as ro
    FROM t 
    CROSS JOIN f
)
SELECT 
    Coalesce(ROUND(COUNT(DISTINCT player_id) / MAX(c_d), 2),0) AS fraction
FROM tod
WHERE DATEDIFF(next_date, event_date) = 1 and ro = 1;
