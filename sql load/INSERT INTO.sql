INSERT INTO Service_Type_Dim
SELECT
    500000 + gs,
    'Government Service ' || gs
FROM generate_series(1,100) gs;


INSERT INTO Citizen_Dim
SELECT

    100000000 + gs,

    7000000000 + gs,

    (
      ARRAY[
      'James','John','Robert','Michael','David',
      'Sarah','Emma','Emily','Olivia',
      'Sophia','Daniel','William',
      'Alexander','Lucas','Ethan'
      ]
    )[floor(random()*15+1)],

    (
      ARRAY[
      'Smith','Johnson','Brown',
      'Jones','Taylor','Wilson',
      'Thomas','Moore','White',
      'Martin','Clark'
      ]
    )[floor(random()*11+1)],

    CASE
        WHEN random()<0.49 THEN 'Male'
        WHEN random()<0.98 THEN 'Female'
        ELSE 'Other'
    END,

    DATE '1940-01-01'
    + floor(random()*30000)::INT,

    CASE
        WHEN random()<0.45 THEN 'Married'
        WHEN random()<0.75 THEN 'Single'
        WHEN random()<0.90 THEN 'Divorced'
        ELSE 'Widowed'
    END,

    CASE
        WHEN random()<0.55 THEN 'Employed'
        WHEN random()<0.75 THEN 'Self-Employed'
        WHEN random()<0.90 THEN 'Retired'
        ELSE 'Unemployed'
    END,

    ROUND((15000 + random()*185000)::NUMERIC,2),

    CASE
        WHEN random()<0.25 THEN 'High School'
        WHEN random()<0.50 THEN 'Associate'
        WHEN random()<0.80 THEN 'Bachelor'
        WHEN random()<0.95 THEN 'Master'
        ELSE 'Doctorate'
    END,

    CASE
        WHEN random()<0.35 THEN 'London'
        WHEN random()<0.55 THEN 'Birmingham'
        WHEN random()<0.70 THEN 'Manchester'
        WHEN random()<0.82 THEN 'Leeds'
        WHEN random()<0.90 THEN 'Liverpool'
        ELSE 'Bristol'
    END,

    'England',

    LPAD(
       FLOOR(10000 + random()*89999)::TEXT,
       5,
       '0'
    ),

    DATE '2016-01-01'
    + FLOOR(random()*3000)::INT,

    random() < 0.96,

    NOW() -
    ((random()*3650)::INT || ' days')::INTERVAL

FROM generate_series(1,250000) gs;


SELECT MIN(Citizen_ID), MAX(Citizen_ID)
FROM Citizen_Dim
WHERE Citizen_ID > 100245000;


INSERT INTO Citizen_Service_Request
SELECT

    900000000 + gs,

    FLOOR(
       100000001 + random()*244999
    )::BIGINT,

    FLOOR(
       100000001 + random()*244999
    )::BIGINT,

    CASE
        WHEN random()<0.30 THEN 'Permit Renewal'
        WHEN random()<0.50 THEN 'Benefit Application'
        WHEN random()<0.65 THEN 'Tax Inquiry'
        WHEN random()<0.78 THEN 'Property Registration'
        WHEN random()<0.88 THEN 'License Application'
        WHEN random()<0.95 THEN 'Complaint'
        ELSE 'General Inquiry'
    END,

    CASE
        WHEN random()<0.40 THEN 'Administration'
        WHEN random()<0.65 THEN 'Benefits'
        WHEN random()<0.80 THEN 'Revenue'
        WHEN random()<0.92 THEN 'Housing'
        ELSE 'Public Works'
    END,

    CASE
        WHEN random()<0.10 THEN 'Critical'
        WHEN random()<0.30 THEN 'High'
        WHEN random()<0.75 THEN 'Medium'
        ELSE 'Low'
    END,

    CASE
        WHEN random()<0.35 THEN 'Submitted'
        WHEN random()<0.55 THEN 'In Review'
        WHEN random()<0.80 THEN 'Approved'
        WHEN random()<0.88 THEN 'Rejected'
        WHEN random()<0.98 THEN 'Completed'
        ELSE 'Escalated'
    END,

    TIMESTAMP '2020-01-01'
    + random()*INTERVAL '6 years',

    NOW()
    - random()*INTERVAL '365 days',

    NOW()
    + random()*INTERVAL '90 days',

    FLOOR(random()*120)::INT,

    CASE
        WHEN random()<0.50 THEN 'Portal'
        WHEN random()<0.75 THEN 'Mobile App'
        WHEN random()<0.90 THEN 'Call Center'
        ELSE 'Walk-In'
    END,

    CASE
        WHEN random()<0.30 THEN 'Revenue'
        WHEN random()<0.55 THEN 'Benefits'
        WHEN random()<0.75 THEN 'Housing'
        WHEN random()<0.90 THEN 'Transportation'
        ELSE 'Environment'
    END,

    CASE
        WHEN random()<0.35 THEN 'London'
        WHEN random()<0.55 THEN 'Birmingham'
        WHEN random()<0.70 THEN 'Manchester'
        WHEN random()<0.82 THEN 'Leeds'
        WHEN random()<0.90 THEN 'Liverpool'
        ELSE 'Bristol'
    END,

    ROUND((50+random()*10000)::NUMERIC,2),

    ROUND((50+random()*9000)::NUMERIC,2),

    CASE
        WHEN random()<0.1
        THEN NULL
        ELSE FLOOR(random()*5+1)
    END,

    random()<0.08,

    FLOOR(random()*5),

    md5(random()::TEXT)

FROM generate_series(1,1000000) gs;

ALTER TABLE Citizen_Service_Request
ADD CONSTRAINT FK_CITIZEN
FOREIGN KEY (Citizen_ID)
REFERENCES Citizen_Dim(Citizen_ID);

ALTER TABLE Citizen_Service_Request
ADD CONSTRAINT FK_SUPERVISOR
FOREIGN KEY (Supervisor_Citizen_ID)
REFERENCES Citizen_Dim(Citizen_ID);

CREATE INDEX IDX_REQ_CITIZEN
ON Citizen_Service_Request(Citizen_ID);

CREATE INDEX IDX_REQ_STATUS
ON Citizen_Service_Request(Request_Status);

CREATE INDEX IDX_REQ_DATE
ON Citizen_Service_Request(Submission_Date);

CREATE INDEX IDX_REQ_CITY
ON Citizen_Service_Request(City);