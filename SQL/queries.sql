--- Isolate (or group) the transactions of each cardholder
CREATE VIEW transactions_per_cardholder AS
SELECT cc.cardholder_id, t.amount
FROM transaction AS t
JOIN credit_card as cc
ON t.card = cc.card
GROUP BY cc.cardholder_id,t.amount 
--- HAVING cc.cardholder_id = id (if you want to look for a specific cardholder)
ORDER BY cc.cardholder_id;

--- Count the number of transactions of each cardholder
CREATE VIEW count_transaction_per_cardholder AS
SELECT cc.cardholder_id, COUNT(t.amount) as count_transactions
FROM transaction AS t
JOIN credit_card as cc
ON t.card = cc.card
GROUP BY cc.cardholder_id
ORDER BY cc.cardholder_id;

--- Count the transactions that are less than $2.00 per cardholder
CREATE VIEW small_transaction AS
SELECT cc.cardholder_id, COUNT(t.amount) as count_small_trans
FROM transaction as t
JOIN credit_card as cc
ON t.card = cc.card
WHERE t.amount <2 
GROUP BY cc.cardholder_id
ORDER BY COUNT(t.amount) DESC;


--- Top 100 highest transactions made between 7:00 am and 9:00 am
CREATE VIEW highest_trans_early_morning AS
SELECT cc.cardholder_id, t.amount,t.date
FROM transaction AS t
JOIN credit_card as cc
ON t.card = cc.card
WHERE EXTRACT(HOUR FROM t.date) <= 9 AND EXTRACT(HOUR FROM t.date) >=7
ORDER BY t.amount DESC
LIMIT 100;

--- Top 100 highest transactions made not between 7:00 am and 9:00 am
CREATE VIEW highest_trans_not_early AS
SELECT cc.cardholder_id, t.amount, t.date
FROM transaction AS t
JOIN credit_card as cc
ON t.card = cc.card
WHERE EXTRACT(HOUR FROM t.date) != 9 OR EXTRACT(HOUR FROM t.date) != 8 OR EXTRACT(HOUR FROM t.date)!=7
ORDER BY t.amount DESC
LIMIT 100; 

CREATE VIEW small_transaction_per_merchant AS
SELECT m.id, count(t.amount) as small_trans
from merchant as m
join transaction as t on m.id = t.id_merchant
where t.amount < 2.00 
group by m.id 
order by count(t.amount) desc

SELECT * FROM small_transaction_per_merchant


