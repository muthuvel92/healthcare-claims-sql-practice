# healthcare-claims-sql-practice
A practical SQL project using a healthcare claims dataset to practice PostgreSQL concepts commonly used. The project covers Joins, GROUP BY, HAVING, CASE WHEN, CTEs, Subqueries, Window Functions, LAG/LEAD, Ranking, Aggregations, and Healthcare Analytics.  
| Table                | Description                                                                                                                   |
| -------------------- | ----------------------------------------------------------------------------------------------------------------------------- |
| **patients**         | Contains patient information such as gender, birth year, state, insurance type, and chronic conditions.                       |
| **providers**        | Contains healthcare provider details such as provider name, specialty, and state.                                             |
| **claims**           | Main healthcare claims table containing patient, provider, claim date, claim type, diagnosis, claim amount, and claim status. |
| **claim_procedures** | Contains procedure details associated with each claim.                                                                        |
| **payments**         | Contains payment information for claims, including allowed amount, paid amount, and patient responsibility.                   |

patients
   │
   └── patient_id ──► claims ◄── provider_id ── providers
                         │
                         └── claim_id ──► claim_procedures
                         │
                         └── claim_id ──► payments
