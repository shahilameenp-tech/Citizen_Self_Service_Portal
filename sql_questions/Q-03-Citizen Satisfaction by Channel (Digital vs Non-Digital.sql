/* Q 03: Citizen Satisfaction by Channel (Digital vs Non-Digital)*/


SELECT
    CASE
        WHEN Service_Channel IN ('Portal', 'Mobile App')
            THEN 'Digital'
        ELSE 'Non-Digital'
    END AS Channel_Type,

    COUNT(*) AS Total_Responses,

    ROUND(AVG(Satisfaction_Score), 2) AS Avg_Satisfaction,

    ROUND(
        AVG(Satisfaction_Score) * 20,
        2
    ) AS Satisfaction_Percentage
FROM Citizen_Service_Request
WHERE Satisfaction_Score IS NOT NULL
GROUP BY 1;