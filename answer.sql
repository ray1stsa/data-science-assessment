SELECT
    investor_transactions.investor_id,
    sectors.sector_name,
    ROUND(
        (investor_transactions.no_of_shares * 100.0 /
         SUM(investor_transactions.no_of_shares)
         OVER (PARTITION BY investor_transactions.investor_id)),
        2) AS share_percentage
FROM investor_transactions
JOIN sectors
ON investor_transactions.sector_id = sectors.sector_id
ORDER BY
    investor_transactions.investor_id,
    share_percentage DESC;
