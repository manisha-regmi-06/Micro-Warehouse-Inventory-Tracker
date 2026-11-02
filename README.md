Hey there! This is a relational database project I built with a specific goal in mind: to master the core fundamentals of SQL while getting comfortable with real-world, industry-level architecture, documentation, and technical language. 

Instead of just writing basic queries, this project simulates a real-time scenario where a regional logistics company needs to track stock levels, asset valuation, and facility audits across multiple warehouses using MySQL.

---

## Task Specification & Objective

**Objective:** Provision a relational database schema and baseline reporting scripts for a regional fulfillment hub to track assets across designated storage locations.

### **1. Scope & Architecture Requirements**
Design and implement a relational database containing the following entities:
* **`warehouses`**: Tracks physical storage facilities (must capture facility identifiers, location names, and operational status).
* **`items`**: Tracks product catalog details (must capture item SKUs, descriptions, category classifications, and unit pricing).
* **`stock_levels`**: Manages the mapping between warehouses and items, tracking precise stock quantities and last-audit timestamps.

### **2. Deliverables & Operational Query Requirements**
Implement scripts satisfying the following technical criteria:
1. **DDL Implementation (`schema.sql`)**: Complete table creation scripts featuring proper primary keys, foreign key constraints, data types, and default values.
2. **DML Implementation (`seed.sql`)**: Initial data insertion scripts containing a representative sample of records across all entities to validate schema integrity.
3. **Reporting & Analytical Queries (`reports.sql`)**:
   * Retrieve all active inventory items located within a specified warehouse facility.
   * Calculate the total valuation ($\text{quantity} \times \text{unit price}$) of stock per warehouse using aggregate functions.
   * Identify items where current stock quantities fall below a defined operational threshold.

_*(Note:Further details, plain-English task breakdowns, and step-by-step explanations for these queries can be found directly inside the `.sql` files alongside the code comments.)*_

---

**## Project Structure**

micro-warehouse-tracker/
│
├── README.md         # Project documentation and breakdown (you are here!)
├── schema.sql        # Database initialization and DDL statements
├── seed.sql          # Sample operational data (DML)
└── reports.sql       # Analytical queries and reporting tasks

---

**How to Run This Project**

Open up your preferred SQL client (such as MySQL Workbench, DBeaver, DataGrip, or the MySQL command line) and execute the script files in this exact order:

schema.sql — Provisions the database and sets up all tables with proper constraints and foreign keys.

seed.sql — Populates the database with realistic sample data.

reports.sql — Runs the analytical queries.

---
