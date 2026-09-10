--Q1 Find all patients who have Diabetes.
SELECT * FROM patients
WHERE chronic_condition = 'Diabetes';

--Q2 Find all claims where the claim amount is greater than $10,000.
SELECT * FROM claims
WHERE claim_amount > 10000;

--Q3 Find all claims that were Denied.
SELECT * FROM claims
WHERE claim_status = 'Denied';

--Q4 Find the total number of patients by insurance type.
SELECT insurance_type,COUNT(patient_id) FROM patients
GROUP BY insurance_type;

--Q5 Find the average claim amount.
SELECT ROUND(AVG(claim_amount),2)
FROM claims;

--Q6 Find the total claim amount by claim_type.
SELECT claim_type,SUM(claim_amount)
FROM claims
GROUP BY claim_type;


