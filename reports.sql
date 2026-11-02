-- =====================================================================
-- Project: Micro-Warehouse Inventory Tracker
-- File: reports.sql
-- Description: Analytical queries with plain-English explanations 
--              breaking down each operational business question.
-- =====================================================================

USE Inventory_Tracker_db;

-- ---------------------------------------------------------------------
-- QUESTION 1: "What items do we have in a specific warehouse right now?"
-- ---------------------------------------------------------------------
-- Plain-English Breakdown:
-- Imagine you are the manager of the Central Distribution Hub (Facility ID 1). 
-- You want a printed checklist of every single item sitting in your warehouse, 
-- including its name, category, how many units you have, and when it was last counted.
--
-- How the code solves it:
-- Because the warehouse name lives in the `warehouses` table, the product 
-- details live in the `items` table, and the quantities live in the `stock_levels` 
-- table, we use `INNER JOIN` to connect all three tables together. Then, we use 
-- a `WHERE` clause to pick only the warehouse we care about (`facility_id = 1`).
-- ---------------------------------------------------------------------
SELECT 
    w.facility_id,
    w.location_name,
    i.sku,
    i.description,
    i.category,
    s.quantity,
    s.last_audit_date
FROM stock_levels s
INNER JOIN warehouses w ON s.facility_id = w.facility_id
INNER JOIN items i ON s.item_id = i.item_id
WHERE w.facility_id = 1;


-- ---------------------------------------------------------------------
-- QUESTION 2: "What is the total financial value of the inventory in each warehouse?"
-- ---------------------------------------------------------------------
-- Plain-English Breakdown:
-- The finance department comes to you and asks, "How much money is our stock 
-- actually worth in total at each location?" 
--
-- How the code solves it:
-- For every product row, we multiply how many items we have by their price 
-- (`quantity * unit_price`). Then, we use the `SUM()` function to add them all 
-- up together, and we group the results by each warehouse using `GROUP BY` 
-- so we get a neat total for each location.
-- ---------------------------------------------------------------------
SELECT 
    w.facility_id,
    w.location_name,
    SUM(s.quantity * i.unit_price) AS total_inventory_valuation
FROM stock_levels s
INNER JOIN warehouses w ON s.facility_id = w.facility_id
INNER JOIN items i ON s.item_id = i.item_id
GROUP BY w.facility_id, w.location_name;


-- ---------------------------------------------------------------------
-- QUESTION 3: "Which items are running dangerously low on stock?"
-- ---------------------------------------------------------------------
-- Plain-English Breakdown:
-- We don't want to run out of essential items like packing tape or safety boots. 
-- We need a quick warning report showing any item where we have fewer than 30 
-- units left in stock, no matter which warehouse it's in.
--
-- How the code solves it:
-- We join all three tables together so we know *what* the item is and *where* 
-- it is located, but we add a filter (`WHERE s.quantity < 30`) to hide 
-- everything except the items that are running low.
-- ---------------------------------------------------------------------
SELECT 
    w.facility_id,
    w.location_name,
    i.sku,
    i.description,
    s.quantity,
    s.last_audit_date
FROM stock_levels s
INNER JOIN warehouses w ON s.facility_id = w.facility_id
INNER JOIN items i ON s.item_id = i.item_id
WHERE s.quantity < 30;