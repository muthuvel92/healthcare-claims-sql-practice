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

<img width="1164" height="2239" alt="mermaid-diagram" src="https://github.com/user-attachments/assets/d9ba10fa-21e3-4383-a9d0-2327b075180c" />

