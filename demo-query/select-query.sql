-- Total
SELECT * FROM [currents].[dbo].[users_messages_pushnotification_Send]

-- Row Count
SELECT [SourceFileName], COUNT(*) AS Row_Count
FROM [currents].[dbo].[users_messages_pushnotification_Send]
GROUP BY [SourceFileName]