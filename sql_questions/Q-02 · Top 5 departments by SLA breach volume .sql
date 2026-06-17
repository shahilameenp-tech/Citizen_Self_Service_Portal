 /*Q-05 · Top 5 departments by SLA breach volume */
SELECT
    Department,
    COUNT(*) AS sla_breach_count
FROM Citizen_Service_Request
WHERE processing_days > 30
GROUP BY Department
ORDER BY sla_breach_count DESC
LIMIT 5;


