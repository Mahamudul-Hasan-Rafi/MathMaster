clear screen;

SET SERVEROUTPUT ON;
SET VERIFY OFF;

DROP TABLE STUDENT_RECORD CASCADE CONSTRAINTS;
DROP TABLE REGISTERED_STUDENTS CASCADE CONSTRAINTS;

CREATE TABLE REGISTERED_STUDENTS(
	ID NUMBER,
	NAME VARCHAR2(8),
	PASSWORD VARCHAR2(30),
	PRIMARY KEY(ID)
);

CREATE TABLE STUDENT_RECORD(
	RECORD_NO NUMBER,
	ID NUMBER,
	NAME VARCHAR2(8),
	QTYPE VARCHAR2(27),
	TOT_QUES NUMBER,
	CORRECTED_QUES NUMBER,
	OBTAINED NUMBER,
	TOT_MARKS NUMBER,
	DATE_EXAM DATE,
	PRIMARY KEY(RECORD_NO)
);

