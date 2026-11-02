-- =====================================================================
-- Project: Micro-Warehouse Inventory Tracker
-- File: seed.sql
-- Description: Populates baseline operational records across all entities.
-- =====================================================================

USE Inventory_Tracker_db;

-- Seed Warehouses
INSERT INTO warehouses (location_name, operational_status) VALUES
('Central Distribution Hub - Kathmandu', 'Active'),
('Western Fulfillment Center - Butwal', 'Active'),
('Eastern Logistics Depot - Biratnagar', 'Maintenance');

-- Seed Product Catalog
INSERT INTO items (sku, description, category, unit_price) VALUES
('SKU-LOG-001', 'Industrial Pallet Jack', 'Equipment', 350.00),
('SKU-PKG-102', 'Heavy Duty Packing Tape (Roll)', 'Consumables', 4.50),
('SKU-ELC-204', 'Barcode Scanner Wireless', 'Electronics', 120.00),
('SKU-SAF-305', 'Steel Toe Safety Boots (Size 10)', 'Safety', 75.50),
('SKU-BOX-409', 'Corrugated Shipping Boxes (Pack of 25)', 'Packaging', 22.00);

-- Seed Stock Levels Mapping
INSERT INTO stock_levels (facility_id, item_id, quantity, last_audit_date) VALUES
(1, 1, 15, '2026-10-15'),
(1, 2, 250, '2026-10-18'),
(1, 3, 40, '2026-10-20'),
(2, 2, 100, '2026-10-12'),
(2, 4, 25, '2026-10-14'),
(2, 5, 80, '2026-10-16'),
(3, 1, 5, '2026-09-30'),
(3, 3, 12, '2026-10-01');
