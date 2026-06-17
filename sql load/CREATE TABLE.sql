CREATE SCHEMA citizen_portal;
SET search_path TO citizen_portal;


CREATE TABLE Citizen_Dim
(
    Citizen_ID BIGINT PRIMARY KEY,
    National_ID BIGINT UNIQUE,

    First_Name VARCHAR(50),
    Last_Name VARCHAR(50),

    Gender VARCHAR(20),

    Date_Of_Birth DATE,

    Marital_Status VARCHAR(20),

    Employment_Status VARCHAR(30),

    Annual_Income NUMERIC(12,2),

    Education_Level VARCHAR(50),

    City VARCHAR(100),

    State_Province VARCHAR(100),

    Postal_Code VARCHAR(20),

    Registration_Date DATE,

    Is_Active BOOLEAN,

    Created_Timestamp TIMESTAMP
);


CREATE TABLE Citizen_Service_Request
(
    Request_ID BIGINT PRIMARY KEY,

    Citizen_ID BIGINT,

    Supervisor_Citizen_ID BIGINT,

    Request_Type VARCHAR(100),

    Request_Category VARCHAR(100),

    Request_Priority VARCHAR(20),

    Request_Status VARCHAR(30),

    Submission_Date TIMESTAMP,

    Last_Update_Date TIMESTAMP,

    Resolution_Date TIMESTAMP,

    Processing_Days INTEGER,

    Service_Channel VARCHAR(50),

    Department VARCHAR(100),

    City VARCHAR(100),

    Estimated_Cost NUMERIC(12,2),

    Actual_Cost NUMERIC(12,2),

    Satisfaction_Score INTEGER,

    Escalation_Flag BOOLEAN,

    Reopened_Count INTEGER,

    Notes VARCHAR(500)
);


CREATE TABLE Service_Type_Dim
(
    Service_Type_ID BIGINT PRIMARY KEY,
    Service_Type_Name VARCHAR(100)
);


