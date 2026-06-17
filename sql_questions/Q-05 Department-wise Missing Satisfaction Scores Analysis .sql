/*—Q-06 · Department-wise Missing Satisfaction Scores Analysis */

SELECT
    Department,
    COUNT(*) AS Total_Requests,

    COUNT(*) FILTER (
        WHERE Satisfaction_Score IS NULL
    ) AS Missing_Satisfaction_Scores,

    ROUND(
        100.0 *
        COUNT(*) FILTER (
            WHERE Satisfaction_Score IS NULL
        ) / COUNT(*),
        2
    ) AS Missing_Percentage

FROM Citizen_Service_Request
GROUP BY Department
ORDER BY Missing_Percentage DESC;