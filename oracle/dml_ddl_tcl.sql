-- DML : INSERT / UPDATE / DELETE

-- ���̺� �纻�� �ϳ� ����
CREATE TABLE DEPT_TEMP
    AS SELECT * FROM DEPT;

SELECT * FROM DEPT_TEMP;

-- INSERT INTO ~ : ���̺� ���� �߰�
INSERT INTO DEPT_TEMP
        VALUES (60,'NETWORK','TAEJEON' );
        
INSERT INTO DEPT_TEMP
        VALUES (70,'SCHOOL','SEOUL' );

INSERT INTO DEPT_TEMP
        VALUES (80,NULL,NULL);

SELECT * FROM DEPT_TEMP;        

-- DELETE FROM ~: ���̺��� ���� ����
DELETE FROM DEPT_TEMP
    WHERE DNAME = 'NETWORK';

DELETE FROM DEPT_TEMP
    WHERE LOC = 'SEOUL';

SELECT * FROM DEPT_TEMP; 

-- UPDATE ~ SET ~: ���̺��� �����͸� ����
UPDATE  DEPT_TEMP
     SET  DNAME = 'DATABASE',
          LOC = 'SEOUL'
    WHERE DEPTNO = 60;

-- TCL
-- Ʈ������� ��� �Ϸ�
COMMIT;

-- Ʈ������� ��� ���
ROLLBACK;

-- DDL  : CREATE/DROP/ALTER/TRUNCATE/RENAME

-- ���̺� ����
CREATE TABLE EMP_DDL (
    EMPNO    NUMBER(4) PRIMARY KEY, -- NN�� UNIQUE�� ����
    ENAME    VARCHAR2(10) NOT NULL,  -- NULL�����͸� ������� ����
    JOB      VARCHAR2(9) UNIQUE, --�ߺ��� ������� ����
    HIREDATE DATE,
    SAL      NUMBER(7,2), --��ü 7�ڸ�,�Ҽ����� 2�ڸ�, 12345.67
    DEPNO    NUMBER(5) DEFAULT 0
);

DESC EMP_DDL;  


-- ALTER ���̺��� ����
ALTER TABLE EMP_DDL
    ADD HP VARCHAR2(20);  -- ���̺� ���ο� ���� �߰�

ALTER TABLE EMP_DDL
    RENAME COLUMN HP TO TEL; -- ���̸��� ����
    
ALTER TABLE EMP_DDL
    DROP COLUMN TEL; -- ���̺��� ���� ����


-- ���̺� �����͸� ��� ����
TRUNCATE TABLE DEPT_TEMP;
SELECT * FROM DEPT_TEMP; 
  
--���̺� ����
DROP TABLE EMP_DDL;

DESC EMP_DDL; --> ����

-- ���̺� �̸� �ٲٱ�
RENAME DEPT_TEMP TO DEPT_RENAME;

DESC DEPT_TEMP;  

DESC DEPT_RENAME;  

