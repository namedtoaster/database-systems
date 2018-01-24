SELECT 51000 AS "Starting Principal", (51000 * 1.1) AS "New Principal", ((51000 * 1.1) * .065) AS "Interest",
((51000 * 1.1) + ((51000 * 1.1) * 0.65)) AS "Principal + Interest"
TO_CHAR(sysdate, 'dd-mon-yyyy hh24:mi:ss') AS "System Date"
FROM dual;