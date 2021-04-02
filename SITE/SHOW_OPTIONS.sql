SET SERVEROUTPUT ON
SET VERIFY OFF

CREATE OR REPLACE TRIGGER LOGGED_OUT
AFTER DELETE
ON CURRENT_RECORD
BEGIN
	DBMS_OUTPUT.PUT_LINE('LOGGED OUT!!');
END;
/

CREATE OR REPLACE PROCEDURE CHOOSE_CHOICE
IS

INVALID EXCEPTION;
CH NUMBER;
T NUMBER;

BEGIN
	DBMS_OUTPUT.PUT_LINE(CHR(10));
	DBMS_OUTPUT.PUT_LINE('INSERT CHOICE: ');
	DBMS_OUTPUT.PUT_LINE('1. TEST YOUR SKILL');
	DBMS_OUTPUT.PUT_LINE('2. PAST_RECORDS');
	DBMS_OUTPUT.PUT_LINE('3. LEADERBOARD');
	DBMS_OUTPUT.PUT_LINE('4. LOGOUT');

	CH:=4;     ---SELECTING CHOICE
	DBMS_OUTPUT.PUT_LINE(CHR(10));
	DBMS_OUTPUT.PUT_LINE('ENTER CHOICE:  '||CH);
	DBMS_OUTPUT.PUT_LINE(CHR(10));
	
	IF CH=1 THEN
		DBMS_OUTPUT.PUT_LINE('--------TEST YOUR SKILL-----------');
		DBMS_OUTPUT.PUT_LINE(CHR(10));
		DBMS_OUTPUT.PUT_LINE('QUESTION TYPES: ');
		DBMS_OUTPUT.PUT_LINE('1. MATHEMATICAL COMPUTATION');
		DBMS_OUTPUT.PUT_LINE('2. PERMUTATION AND COMBINATION');
		DBMS_OUTPUT.PUT_LINE('3. TRIGONOMETRIC');
		DBMS_OUTPUT.PUT_LINE('4. GEOMETRY');
		DBMS_OUTPUT.PUT_LINE('5. ALL');
		T:=1;   ---SELECTING OPTION
		DBMS_OUTPUT.PUT_LINE(CHR(10));
		DBMS_OUTPUT.PUT_LINE('ENTER TYPE:  '||T);
		DBMS_OUTPUT.PUT_LINE(CHR(10));
		TEST_SKILL(T); ---SKILL TEST
		
	ELSIF CH=2 THEN
		SHOW_ALL_RESULTS;  ---TEST REPORTS
	ELSIF CH=3 THEN
		DBMS_OUTPUT.PUT_LINE('--------SELECT CATEGORY-----------');
		DBMS_OUTPUT.PUT_LINE(CHR(10));
		DBMS_OUTPUT.PUT_LINE('QUESTION TYPES: ');
		DBMS_OUTPUT.PUT_LINE('1. MATHEMATICAL COMPUTATION');
		DBMS_OUTPUT.PUT_LINE('2. PERMUTATION AND COMBINATION');
		DBMS_OUTPUT.PUT_LINE('3. TRIGONOMETRIC');
		DBMS_OUTPUT.PUT_LINE('4. GEOMETRY');
		DBMS_OUTPUT.PUT_LINE('5. ALL');
		T:=2;   ---SELECTING CATEGORY
		DBMS_OUTPUT.PUT_LINE(CHR(10));
		DBMS_OUTPUT.PUT_LINE('ENTER TYPE:  '||T);
		DBMS_OUTPUT.PUT_LINE(CHR(10));
		SHOW_MERIT(T);  ---SHOW LEADERBOARD
	ELSIF CH=4 THEN
		DELETE FROM CURRENT_RECORD;
		DBMS_OUTPUT.PUT_LINE('LOGGED OUT!!');
	ELSE
		RAISE INVALID;
	END IF;
	
	EXCEPTION
		WHEN INVALID THEN
			DBMS_OUTPUT.PUT_LINE('INVALID CHOICE');
END CHOOSE_CHOICE;
/