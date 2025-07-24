CREATE TABLE job_applied (
    job_id INT,
    application_sent_date DATE,
    custom_resume BOOLEAN,
    resume_file_name VARCHAR(255),
    cover_letter_sent BOOLEAN,
    cover_letter_file_name VARCHAR(255),
    status VARCHAR(50)
);

INSERT INTO job_applied (
    job_id,
    application_sent_date,
    custom_resume,
    resume_file_name,
    cover_letter_sent,
    cover_letter_file_name,
    status
)
VALUES (
    1,
    '2024-02-10',
    true,
    'resume_01.pdf',
    true,
    'cover_letter_01.pdf',
    'submitted'
),
(
    2,
    '2024-02-11',
    true,
    'resume_02.pdf',
    true,
    'cover_letter_02.pdf',
    'submitted'
),
(
    3,
    '2024-02-12',
    true,
    'resume_03.pdf',
    true,
    'cover_letter_03.pdf',
    'submitted'
);

ALTER TABLE job_applied
ADD contact VARCHAR(50);

UPDATE job_applied
SET contact = 'Erlich Bachman'
WHERE job_id = 1;

UPDATE job_applied
SET contact = 'Rory Derham'
WHERE job_id = 2;

UPDATE job_applied
SET contact = 'Heather Rowe'
WHERE job_id = 3;

SELECT *
FROM job_applied;

ALTER TABLE job_applied
RENAME CONTACT  TO CONTACT_NAME;

ALTER TABLE job_applied
ALTER COLUMN CONTACT_NAME TYPE TEXT;

ALTER TABLE job_applied
DROP COLUMN CONTACT_NAME;

DROP TABLE job_applied;