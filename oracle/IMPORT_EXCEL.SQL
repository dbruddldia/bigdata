-- IMPORT_EXCEL.SQL
-- excel_exam.xlsx ������ import �Ͽ� EXAM ���̺� �����ϱ�

-- [1] Table �����
CREATE TABLE EXAM (
    ID      NUMBER(2)   PRIMARY KEY,
    CLASS   NUMBER(2)   NOT NULL,
    MATH    NUMBER(3),
    ENGLISH NUMBER(3),
    SCIENCE NUMBER(3)
);

DESC EXAM;

-- ���̺��� �߸� ����������� DROP���ɾ�� �����ϰ� �ٽ� CREATE����
-- DROP TABLE EXAM;

-- [2] ���� �����͸� IMPORT �ϱ�(Toad����)

-- Toad����  Database -->Import --> Import Table Data ����

-- Object Name : EXAM  ������  -> NEXT

-- Excel file�� üũ �����ϰ� excel_exam.xlsx ������ �������ش� -> NEXT

-- First Row:2 (����� ����) , Last Row : �Է¾��ϰų� ���ϴ� �� �Է� �� -> NEXT

-- ���� ��� NEXT�� OK�� ������ EXECUTE�� ������ �Ϸ��Ѵ�

-- IMPORT�� �����͸� Ȯ���غ���
SELECT *
FROM EXAM;

-- [3] ������ �м��ϱ�

--(1) ��������: �� �����ϱ�
SELECT ID,CLASS,MATH
FROM EXAM;

--(2) ������ : �� �����ϱ�
SELECT ID,CLASS,MATH
FROM EXAM
WHERE MATH >= 60;

SELECT *
FROM EXAM
WHERE CLASS = 1;

SELECT *
FROM EXAM
WHERE CLASS IN (1,3,5);

SELECT *
FROM EXAM
WHERE CLASS = 5
    AND MATH > 70;

--(3) ������ ����� �÷��� �߰�, ����� ������������ ����ϱ�
SELECT ID, CLASS,MATH,ENGLISH,SCIENCE,
   MATH+ENGLISH+SCIENCE AS "����",
   ROUND((MATH+ENGLISH+SCIENCE)/3) AS "���"
  FROM EXAM  
  ORDER BY ROUND((MATH+ENGLISH+SCIENCE)/3);
  
--(4) �÷����� ��� ���ϱ�
SELECT  AVG(MATH)    AS "�������",
        AVG(ENGLISH) AS "�������",
        AVG(SCIENCE) AS "�������"
    FROM EXAM;

--(5) �ݺ� ��� ���ϱ� 
SELECT CLASS, AVG(MATH) AS "�������"
 FROM EXAM
GROUP BY CLASS; 

SELECT CLASS, AVG(MATH) AS "�������"
 FROM EXAM
GROUP BY CLASS
    HAVING AVG(MATH) > 60;

--(6) �ݺ� �л���(��) ���ϱ�
SELECT CLASS, COUNT(*) AS CNT
FROM EXAM
GROUP BY CLASS
ORDER BY CLASS;

--(7) NULL ����ġ ó�� 
-- �׽�Ʈ�� ���� ���� �����͸� ����
INSERT INTO EXAM (ID,CLASS,MATH,ENGLISH,SCIENCE)
        VALUES ( 21,6, NULL,NULL,95);
        
INSERT INTO EXAM (ID,CLASS,MATH,ENGLISH,SCIENCE)
        VALUES ( 22,6, 80,NULL,NULL);

INSERT INTO EXAM (ID,CLASS,MATH,ENGLISH,SCIENCE)
        VALUES ( 23,6, NULL,75,NULL);

SELECT *
FROM EXAM; 

-- �� ����
DELETE FROM EXAM
WHERE ID IN (21,22,23);

-- ����ġ�� 0���� �����Ͽ� ���� ���ϱ�
SELECT ID, CLASS,MATH,ENGLISH,SCIENCE,
   MATH+ENGLISH+SCIENCE AS "NULL_����",
   NVL(MATH,0)+NVL(ENGLISH,0)+NVL(SCIENCE,0) AS "NVL_����"
  FROM EXAM;  