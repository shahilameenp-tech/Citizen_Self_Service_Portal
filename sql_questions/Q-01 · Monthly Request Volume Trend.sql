/*Q-01 · Monthly Request Volume Trend*/

SELECT
    TO_CHAR(Submission_Date, 'YYYY-MM') AS month,
    COUNT(*) AS total_requests
FROM Citizen_Service_Request
GROUP BY month
ORDER BY month;


