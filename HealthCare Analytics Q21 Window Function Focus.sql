-- Window function Focused Questions
--Q21 For each provider, rank their claims from highest to lowest claim amount.
SELECT provider_id,
	claim_id,
	claim_amount,
	ROW_NUMBER() OVER(
		PARTITION BY provider_id
		ORDER BY claim_amount DESC
	) AS rnk
FROM claims;

--Q22 Top 3 Highest claim amount of providers
WITH ranked AS(
	SELECT provider_id,
		claim_id,
		claim_amount,
		DENSE_RANK() OVER(
			PARTITION BY provider_id
			ORDER BY claim_amount DESC
		) AS rnk
	FROM claims
)
SELECT * FROM ranked
WHERE rnk <=3;

--Q23 Calculate the cumulative claim amount for each provider ordered by claim date.
SELECT claim_id,
	provider_id,
	claim_date,
	SUM(claim_amount) OVER(
		PARTITION BY provider_id
		ORDER BY claim_date
	) AS running_total
FROM claims;

--Q24 For each patient, display: Previous Claim amount
--SELECT * FROM claims; -- for reference table view
SELECT patient_id,
	claim_date,
	claim_amount,
	LAG(claim_amount) OVER(
		PARTITION BY patient_id
		ORDER BY claim_date
	) AS previous_claim
FROM claims;

--Q25 For each patient, display their next claim date.
SELECT patient_id,
	claim_date,
	claim_amount,
	LEAD(claim_date) OVER(
		PARTITION BY patient_id
		ORDER BY claim_date
	) AS next_claim_date
FROM claims;

--Q26 For each patient, calculate: current claim amount,previous claim amount,difference


--Q27 Rank providers by total reimbursement amount within each specialty.


--Q28 For every claim, calculate what percentage of the provider's total claim amount 
	--that claim represents.