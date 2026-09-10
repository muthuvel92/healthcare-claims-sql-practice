-- CASE WHEN Focused Questions

--Q17-Create a claim category & return
SELECT claim_id,claim_amount,
	CASE
		WHEN claim_amount < 2000 THEN 'Low'
		WHEN claim_amount >=2000 AND claim_amount<= 10000 THEN 'Medium'
		WHEN claim_amount >10000 THEN 'High'
	END as claim_category
FROM claims;

--Q18--Calculate the percentage of claims that were paid versus denied
SELECT * FROM claims
WITH paid AS (
	SELECT COUNT(claim_status) AS paidcount FROM claims 
	WHERE claim_status = 'Paid'
),
denied AS (
SELECT COUNT(claim_status) AS deniedcount FROM claims 
	WHERE claim_status = 'Denied'
)

SELECT
	((SELECT deniedcount FROM denied)::NUMERIC / NULLIF((SELECT paidcount FROM paid),0)*100) AS paidvsdenied;
--Q18 Alternative
SELECT
    claim_status,
    COUNT(*) AS claim_count,
    COUNT(*) * 100.0 / SUM(COUNT(*)) OVER () AS percentage
FROM claims
GROUP BY claim_status;

--Q19 Create a column are considered high risk.
SELECT * FROM patients
SELECT patient_id,chronic_condition,
	CASE
		WHEN chronic_condition IN ('Diabetes', 'Heart Disease') THEN 'High Risk'
		ELSE 'Low Risk'
	END AS risk_category
FROM patients;

--Q20 Calculate the reimbursement rate for each claim:
SELECT * FROM payments
SELECT payment_id,claim_id,paid_amount FROM payments
ORDER BY paid_amount




