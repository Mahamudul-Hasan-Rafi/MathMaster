clear screen;

SET SERVEROUTPUT ON;
SET VERIFY OFF;

DROP TABLE LEADERBOARD_SERVER;
CREATE TABLE LEADERBOARD_SERVER(
	STUDENT_ID NUMBER,
	NAME VARCHAR2(8),
	QUESION_TYPE VARCHAR2(27),
	AVERAGE_MARK__PERCENTAGE NUMBER
);

BEGIN
	FOR R IN (SELECT * FROM LEADERBOARD_SITE@site1 ORDER BY AVERAGE_MARK__PERCENTAGE DESC) LOOP
		INSERT INTO LEADERBOARD_SERVER VALUES (R.STUDENT_ID,R.NAME,R.QUESION_TYPE,R.AVERAGE_MARK__PERCENTAGE);
		COMMIT;
	END LOOP;
	
	DBMS_OUTPUT.PUT_LINE(CHR(10));
	DBMS_OUTPUT.PUT_LINE('********************LEADERBOARD**********************');
	DBMS_OUTPUT.PUT_LINE(CHR(10));
	
	DBMS_OUTPUT.PUT_LINE('********************LEADERBOARD[MATHEMATICAL COMPUTATION]**********************');
	DBMS_OUTPUT.PUT_LINE(CHR(10));
	DBMS_OUTPUT.PUT_LINE('STUDENT_ID  '||'NAME     '||'QUESION_TYPE     '||'AVERAGE_MARK__PERCENTAGE   ');
	DBMS_OUTPUT.PUT_LINE('----------  '||'----     '||'------------     '||'------------------------   ');
	FOR R IN (SELECT * FROM LEADERBOARD_SERVER WHERE QUESION_TYPE='MATHEMATICAL COMPUTATION') LOOP
		DBMS_OUTPUT.PUT_LINE(R.STUDENT_ID||'          '||R.NAME||'       '||R.QUESION_TYPE||'           '||R.AVERAGE_MARK__PERCENTAGE||'     ');
	END LOOP;
	
	DBMS_OUTPUT.PUT_LINE(CHR(10));
	DBMS_OUTPUT.PUT_LINE('************LEADERBOARD[PERMUTATION AND COMBINATION]**************');
	DBMS_OUTPUT.PUT_LINE(CHR(10));
	DBMS_OUTPUT.PUT_LINE('STUDENT_ID  '||'NAME     '||'QUESION_TYPE     '||'AVERAGE_MARK__PERCENTAGE   ');
	DBMS_OUTPUT.PUT_LINE('----------  '||'----     '||'------------     '||'------------------------   ');
	FOR R IN (SELECT * FROM LEADERBOARD_SERVER WHERE QUESION_TYPE='PERMUTATION AND COMBINATION') LOOP
		DBMS_OUTPUT.PUT_LINE(R.STUDENT_ID||'          '||R.NAME||'       '||R.QUESION_TYPE||'           '||R.AVERAGE_MARK__PERCENTAGE||'     ');
	END LOOP;
	
	DBMS_OUTPUT.PUT_LINE(CHR(10));
	DBMS_OUTPUT.PUT_LINE('********************LEADERBOARD[TRIGONOMETRIC]**********************');
	DBMS_OUTPUT.PUT_LINE(CHR(10));
	DBMS_OUTPUT.PUT_LINE('STUDENT_ID  '||'NAME     '||'QUESION_TYPE     '||'AVERAGE_MARK__PERCENTAGE   ');
	DBMS_OUTPUT.PUT_LINE('----------  '||'----     '||'------------     '||'------------------------   ');
	FOR R IN (SELECT * FROM LEADERBOARD_SERVER WHERE QUESION_TYPE='TRIGONOMETRIC') LOOP
		DBMS_OUTPUT.PUT_LINE(R.STUDENT_ID||'          '||R.NAME||'       '||R.QUESION_TYPE||'           '||R.AVERAGE_MARK__PERCENTAGE||'     ');
	END LOOP;
	
	DBMS_OUTPUT.PUT_LINE(CHR(10));
	DBMS_OUTPUT.PUT_LINE('********************LEADERBOARD[GEOMETRY]**********************');
	DBMS_OUTPUT.PUT_LINE(CHR(10));
	DBMS_OUTPUT.PUT_LINE('STUDENT_ID  '||'NAME     '||'QUESION_TYPE     '||'AVERAGE_MARK__PERCENTAGE   ');
	DBMS_OUTPUT.PUT_LINE('----------  '||'----     '||'------------     '||'------------------------   ');
	FOR R IN (SELECT * FROM LEADERBOARD_SERVER WHERE QUESION_TYPE='GEOMETRY') LOOP
		DBMS_OUTPUT.PUT_LINE(R.STUDENT_ID||'          '||R.NAME||'       '||R.QUESION_TYPE||'           '||R.AVERAGE_MARK__PERCENTAGE||'     ');
	END LOOP;
	
	DBMS_OUTPUT.PUT_LINE(CHR(10));
	DBMS_OUTPUT.PUT_LINE('********************LEADERBOARD[ALL]************************');
	DBMS_OUTPUT.PUT_LINE(CHR(10));
	DBMS_OUTPUT.PUT_LINE('STUDENT_ID  '||'NAME     '||'QUESION_TYPE     '||'AVERAGE_MARK__PERCENTAGE   ');
	DBMS_OUTPUT.PUT_LINE('----------  '||'----     '||'------------     '||'------------------------   ');
	FOR R IN (SELECT * FROM LEADERBOARD_SERVER WHERE QUESION_TYPE='ALL') LOOP
		DBMS_OUTPUT.PUT_LINE(R.STUDENT_ID||'          '||R.NAME||'       '||R.QUESION_TYPE||'           '||R.AVERAGE_MARK__PERCENTAGE||'     ');
	END LOOP;

END;
/