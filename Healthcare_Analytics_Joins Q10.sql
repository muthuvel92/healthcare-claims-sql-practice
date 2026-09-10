--Q10 Display: claim_id,patient_id,patient_gender,provider_name,claim_amount
SELECT c.claim_id,c.patient_id,p.gender,i.provider_name,c.claim_amount
FROM claims c
JOIN patients p
	ON c.patient_id = p.patient_id
JOIN providers i
	ON c.provider_id = i.provider_id;
	
--Q11 Find the total claim amount for each provider along with the provider's name and specialty.
SELECT * FROM claims;
SELECT * FROM providers;
SELECT c.provider_id,i.provider_name,i.specialty,SUM(c.claim_amount) AS total_claim_amount
FROM claims c
JOIN providers i
	ON c.provider_id = i.provider_id
GROUP BY c.provider_id,i.provider_name,i.specialty
ORDER BY total_claim_amount DESC;

--Q12 Find the total amount paid for claims for each patient.
SELECT * FROM patients;
SELECT patient_id, SUM(claim_amount)
FROM claims
GROUP BY patient_id;

--Q13 Find all Diabetes patients who have submitted at least one claim.
SELECT c.patient_id,c.claim_id,p.chronic_condition FROM claims c
JOIN patients p
ON c.patient_id = p.patient_id
WHERE p.chronic_condition = 'Diabetes'
ORDER BY c.patient_id ASC;

--Q14 Find patients who have never submitted a claim.
SELECT p.patient_id,c.claim_id FROM patients p
LEFT JOIN claims c
	ON p.patient_id = c.patient_id
WHERE p.patient_id IS NULL
ORDER BY c.patient_id ASC

--Q15 Find providers who have never handled a claim.
SELECT c.claim_id,i.provider_id,i.provider_name
FROM claims c
LEFT JOIN providers i
	ON c.provider_id = i.provider_id
WHERE c.provider_id IS NULL;

--Q16 Find the average claim amount by provider specialty.
SELECT * FROM providers;
SELECT p.specialty,ROUND(AVG(c.claim_amount),2) AS average_claim_amount
FROM claims c
LEFT JOIN providers p
	ON c.provider_id = p.provider_id
GROUP BY p.specialty;
