# healthcare-claims-sql-practice
A practical SQL project using a healthcare claims dataset to practice PostgreSQL concepts commonly used. The project covers Joins, GROUP BY, HAVING, CASE WHEN, CTEs, Subqueries, Window Functions, LAG/LEAD, Ranking, Aggregations, and Healthcare Analytics.  
| Table                | Description                                                                                                                   |
| -------------------- | ----------------------------------------------------------------------------------------------------------------------------- |
| **patients**         | Contains patient information such as gender, birth year, state, insurance type, and chronic conditions.                       |
| **providers**        | Contains healthcare provider details such as provider name, specialty, and state.                                             |
| **claims**           | Main healthcare claims table containing patient, provider, claim date, claim type, diagnosis, claim amount, and claim status. |
| **claim_procedures** | Contains procedure details associated with each claim.                                                                        |
| **payments**         | Contains payment information for claims, including allowed amount, paid amount, and patient responsibility.                   |

## Database Relationship Diagram

erDiagram
    PATIENTS ||--o{ CLAIMS : submits
    PROVIDERS ||--o{ CLAIMS : handles
    CLAIMS ||--o{ CLAIM_PROCEDURES : contains
    CLAIMS ||--o{ PAYMENTS : has

    PATIENTS {
        string patient_id PK
        string gender
        int birth_year
        string state
        string insurance_type
        string chronic_condition
        date registration_date
    }

    PROVIDERS {
        string provider_id PK
        string provider_name
        string specialty
        string state
    }

    CLAIMS {
        string claim_id PK
        string patient_id FK
        string provider_id FK
        date claim_date
        string claim_type
        string diagnosis_code
        decimal claim_amount
        string claim_status
    }

    CLAIM_PROCEDURES {
        string claim_id FK
        string procedure_code
        string procedure_name
    }

    PAYMENTS {
        string payment_id PK
        string claim_id FK
        decimal allowed_amount
        decimal paid_amount
        decimal patient_responsibility
        date payment_date
    }
