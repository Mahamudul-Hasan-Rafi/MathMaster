SET SERVEROUTPUT ON;
SET VERIFY OFF;

DROP TABLE LEADERBOARD_SITE;

CREATE TABLE LEADERBOARD_SITE(
	STUDENT_ID NUMBER,
	NAME VARCHAR2(8),
	QUESION_TYPE VARCHAR2(30),
	AVERAGE_MARK__PERCENTAGE NUMBER
);

CREATE OR REPLACE PACKAGE LD_BOARD AS
	FUNCTION SEARCH_BOARD(ID_ IN NUMBER, QTYP IN VARCHAR)
	RETURN NUMBER;
END LD_BOARD;
/

CREATE OR REPLACE PACKAGE BODY LD_BOARD AS
	FUNCTION SEARCH_BOARD(ID_ IN NUMBER, QTYP IN VARCHAR)
	RETURN NUMBER
	IS
	BEGIN
		FOR R IN (SELECT * FROM LEADERBOARD_SITE) LOOP
			IF R.STUDENT_ID=ID_ AND R.QUESION_TYPE=QTYP THEN
				RETURN 1;
			END IF;
		END LOOP;
		RETURN 0;
	END SEARCH_BOARD;
END LD_BOARD;
/

CREATE OR REPLACE PROCEDURE SHOW_MERIT(T IN NUMBER)
IS
AVG_MARKS NUMBER;
T_MARKS NUMBER;
Q_T VARCHAR2(30);
BEGIN

	IF T=1 THEN
		Q_T:='MATHEMATICAL COMPUTATION';
	ELSIF T=2 THEN
		Q_T:='PERMUTATION AND COMBINATION';
	ELSIF T=3 THEN
		Q_T:='TRIGONOMETRIC';
	ELSIF T=4 THEN
		Q_T:='GEOMETRY';
	ELSE
		Q_T:='ALL';
	END IF;
	
	DBMS_OUTPUT.PUT_LINE('QTYPE:   '||Q_T);
	FOR R IN (SELECT * FROM STUDENT_RECORD_SITE1 WHERE QTYPE=Q_T) LOOP
		--DBMS_OUTPUT.PUT_LINE('HELLLLO:   ');
		SELECT AVG(OBTAINED) INTO AVG_MARKS FROM STUDENT_RECORD_SITE1 WHERE ID=R.ID AND QTYPE=Q_T;
		SELECT AVG(TOT_MARKS) INTO T_MARKS FROM STUDENT_RECORD_SITE1 WHERE ID=R.ID AND QTYPE=Q_T;
		
		AVG_MARKS:=ROUND((AVG_MARKS/T_MARKS)*100,2);
		--DBMS_OUTPUT.PUT_LINE('HOLA AMIGOSOP     '||AVG_MARKS);
		IF LD_BOARD.SEARCH_BOARD(R.ID, R.QTYPE)=0 THEN
			INSERT INTO LEADERBOARD_SITE VALUES(R.ID, R.NAME, R.QTYPE, AVG_MARKS);
			COMMIT;
		ELSE
			UPDATE LEADERBOARD_SITE SET AVERAGE_MARK__PERCENTAGE=AVG_MARKS WHERE STUDENT_ID=R.ID;
			COMMIT;
		END IF;	
	END LOOP;
	
	DBMS_OUTPUT.PUT_LINE('********************LEADERBOARD*********************');
	DBMS_OUTPUT.PUT_LINE(CHR(10));
	DBMS_OUTPUT.PUT_LINE('STUDENT_ID  '||'NAME     '||'QUESION_TYPE     '||'AVERAGE_MARK__PERCENTAGE   ');
	DBMS_OUTPUT.PUT_LINE('----------  '||'----     '||'------------     '||'------------------------   ');
	FOR R IN (SELECT * FROM LEADERBOARD_SITE WHERE QUESION_TYPE=Q_T ORDER BY AVERAGE_MARK__PERCENTAGE DESC) LOOP
		DBMS_OUTPUT.PUT_LINE(R.STUDENT_ID||'          '||R.NAME||'       '||R.QUESION_TYPE||'           '||R.AVERAGE_MARK__PERCENTAGE||'     ');
	END LOOP;
	
END SHOW_MERIT;
/