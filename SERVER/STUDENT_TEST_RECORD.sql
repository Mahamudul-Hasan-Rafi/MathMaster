SET SERVEROUTPUT ON;
SET VERIFY OFF;

BEGIN
	DBMS_OUTPUT.PUT_LINE(CHR(10));
	DBMS_OUTPUT.PUT_LINE('********************MARK RECORD**********************');
	DBMS_OUTPUT.PUT_LINE(CHR(10));
	
	DBMS_OUTPUT.PUT_LINE('STUDENT_ID  '||'NAME     '||'QUESION_TYPE     '||'OBTAINED   '||'TOTAL_MARKS   '||'DATE');
	DBMS_OUTPUT.PUT_LINE('----------  '||'----     '||'------------     '||'--------   '||'-----------   '||'-----');
	FOR R IN (SELECT * FROM STUDENT_RECORD UNION SELECT * FROM STUDENT_RECORD_SITE1@site1) LOOP
		DBMS_OUTPUT.PUT_LINE(R.ID||'          '||R.NAME||'       '||R.QTYPE||'         '||R.OBTAINED||'        '||R.TOT_MARKS||'          '||R.DATE_EXAM);
	END LOOP;
END;
/