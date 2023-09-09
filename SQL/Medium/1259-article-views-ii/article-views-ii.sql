SELECT
    DISTINCT viewer_id id
FROM
    (SELECT
        viewer_id, view_date, COUNT(DISTINCT article_id) amount
    FROM
        Views
    GROUP BY
        viewer_id, view_date
    HAVING
        amount > 1) a;