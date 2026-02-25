-- Identify unusually high claims
SELECT 
    provider_id,
    COUNT(*) AS total_claims,
    AVG(claim_amount) AS avg_claim_amount,
    MAX(claim_amount) AS max_claim_amount
FROM claims
GROUP BY provider_id
ORDER BY avg_claim_amount DESC;

-- Identify duplicate claims same patient same day
SELECT 
    patient_id,
    claim_date,
    COUNT(*) AS duplicate_claims
FROM claims
GROUP BY patient_id, claim_date
HAVING COUNT(*) > 1;

-- Identify high-risk providers
SELECT 
    provider_id,
    SUM(claim_amount) AS total_claim_value
FROM claims
GROUP BY provider_id
ORDER BY total_claim_value DESC;
