-- hospital_db SQL Queries
-- ======================================

-- Part 1: INSERT Data
-- ======================================

-- 1.1) Add a new patient with the following details:
-- First Name: John
-- Last Name: Doe
-- Date of Birth: 15-11-1980
-- Gender: Male
-- Language: English

USE hospital_db;


INSERT INTO patients (first_name, last_name, date_of_birth, gender, language)
VALUES ('John', 'Doe', '1980-11-15', 'Male', 'English');


-- Part 2: UPDATE Data
-- ======================================

-- 2.1) Change John Doe's language from "English" to "Spanish"

UPDATE patients
SET language = 'Spanish'
WHERE first_name = 'John' AND last_name = 'Doe' AND date_of_birth = '1980-11-15';


-- Part 3: DELETE Data
-- ======================================

-- 3.1) Delete the patient with the patient_id number 10

DELETE FROM patients
WHERE patient_id = 10;


-- Part 4: Handling NULL Values
-- ======================================

-- 4.1) Find all the names and emails of the providers, replacing NULL emails with 'N/A'

SELECT first_name, last_name,
       COALESCE(email_address, 'N/A') AS email_address
FROM providers;


-- 4.2) Retrieve the names and contact details (email and phone number) of providers. 
-- If either of the two is missing, replace it with 'Missing details'

SELECT first_name, last_name,
       COALESCE(email_address, 'Missing details') AS email_address,
       COALESCE(phone_number, 'Missing details') AS phone_number
FROM providers;


-- Bonus Question
-- ======================================

-- Retrieve all providers whose specialty is 'pediatrics' 
-- and who are missing either email or phone number.

SELECT first_name, last_name, email_address, phone_number
FROM providers
WHERE provider_speciality = 'pediatrics'
  AND (email_address IS NULL OR phone_number IS NULL);