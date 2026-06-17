/*Q-4 · Escalation Rate Trend — Rolling 3-Month Average */
WITH monthly_escalation AS (
    SELECT
        DATE_TRUNC('month', Submission_Date) AS month,

        COUNT(*) AS total_requests,

        SUM(
            CASE
                WHEN Escalation_Flag = TRUE THEN 1
                ELSE 0
            END
        ) AS escalated_requests,

        ROUND(
            100.0 * SUM(
                CASE
                    WHEN Escalation_Flag = TRUE THEN 1
                    ELSE 0
                END
            ) / COUNT(*),
            2
        ) AS escalation_rate_pct

    FROM Citizen_Service_Request
    GROUP BY DATE_TRUNC('month', Submission_Date)
)

SELECT
    month,
    total_requests,
    escalated_requests,
    escalation_rate_pct,

    ROUND(
        AVG(escalation_rate_pct) OVER (
            ORDER BY month
            ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
        ),
        2
    ) AS rolling_3_month_avg_pct

FROM monthly_escalation
ORDER BY month;