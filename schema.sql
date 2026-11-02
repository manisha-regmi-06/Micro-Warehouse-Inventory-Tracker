-- =====================================================================
-- Project: Micro-Warehouse Inventory Tracker
-- File: schema.sql
-- Description: Handles database initialization, dependency-aware table 
--              drops, and entity relational definitions.
-- =====================================================================

DROP DATABASE IF EXISTS Inventory_Tracker_db;
CREATE DATABASE Inventory_Tracker_db;
USE Inventory_Tracker_db;

-- Drop child tables first to prevent foreign key constraint violations during resets
DROP TABLE IF EXISTS stock_levels;
DROP TABLE IF EXISTS items;
DROP TABLE IF EXISTS warehouses;

-- Table 1: Warehouses Entity
-- Stores physical facility details and operational statuses.
CREATE TABLE warehouses (
    facility_id INT PRIMARY KEY AUTO_INCREMENT,
    location_name VARCHAR(150) NOT NULL DEFAULT 'Unknown',
    operational_status VARCHAR(50) NOT NULL DEFAULT 'Active'
);

-- Table 2: Items Catalog Entity
-- Stores global product catalog details, pricing, and category classifications.
CREATE TABLE items (
    item_id INT PRIMARY KEY AUTO_INCREMENT,
    sku VARCHAR(50) UNIQUE NOT NULL,
    description VARCHAR(255) NOT NULL,
    category VARCHAR(100) NOT NULL,
    unit_price DECIMAL(10, 2) NOT NULL DEFAULT 0.00
);

-- Table 3: Stock Levels Junction/Mapping Entity
-- Links warehouses and items together to track exact inventory quantities and audit cycles.
CREATE TABLE stock_levels (
    stock_id INT PRIMARY KEY AUTO_INCREMENT,
    facility_id INT NOT NULL,
    item_id INT NOT NULL,
    quantity INT NOT NULL DEFAULT 0,
    last_audit_date DATE NOT NULL,
    CONSTRAINT fk_warehouse FOREIGN KEY (facility_id) REFERENCES warehouses(facility_id) ON DELETE CASCADE,
    CONSTRAINT fk_item FOREIGN KEY (item_id) REFERENCES items(item_id) ON DELETE CASCADE
);