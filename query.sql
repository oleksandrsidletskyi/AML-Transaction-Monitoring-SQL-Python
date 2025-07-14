
-- Create Tables
CREATE TABLE clients (
    client_id INTEGER PRIMARY KEY,
    full_name TEXT,
    is_pep BOOLEAN,
    is_sanctioned BOOLEAN
);

CREATE TABLE transactions (
    transaction_id INTEGER PRIMARY KEY,
    client_id INTEGER,
    amount REAL,
    country TEXT,
    timestamp TEXT,
    FOREIGN KEY (client_id) REFERENCES clients(client_id)
);

CREATE TABLE countries_risk (
    country TEXT PRIMARY KEY,
    risk_level TEXT
);

-- Flag Suspicious Transactions
SELECT 
    t.transaction_id,
    c.full_name,
    t.amount,
    t.country,
    cr.risk_level,
    c.is_pep,
    c.is_sanctioned
FROM transactions t
JOIN clients c ON t.client_id = c.client_id
LEFT JOIN countries_risk cr ON t.country = cr.country
WHERE 
    c.is_pep = 1 OR 
    c.is_sanctioned = 1 OR 
    cr.risk_level = 'High' OR 
    t.amount > 40000;
