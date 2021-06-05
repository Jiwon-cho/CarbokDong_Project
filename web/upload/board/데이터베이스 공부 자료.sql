SELECT * FROM DBA_USERS; -- ���� �����ͺ��̽��� ��ϵ� ������ ��ȸ�ϴ� ��ɾ�

-- �⺻���� ��ɾ �����Ϸ��� ��ɾ� �ۼ�LINE�� Ŀ���� ���� CTRL+ENTER;
SELECT * FROM TAB; --���� ������ ��ϵǾ��ִ� ���̺��� ��ȸ�ϴ� ��ɾ�

--������ �̿��� DBA_USERS, TAB, ROLE_SYS_PRIVS ���̺��� ����Ŭ�� �̿��ڿ��� DB�� ���� ������
-- �����ϱ� ���� ����� ���� ������ ���̺� -> DATA DICTIONARY

-- ����Ŭ�� �⺻������ DB�� �����ϴ� ������ �ڵ��� �ο��� ��.
-- SYSTEM : �Ϲݰ����� ���� -> �����ͺ��̽��� ����/���� �� ������ ����, ����ڰ����� ���, ���Ѻο� �� ����
-- SYS : ���۰����� ���� -> �����ͺ��̽��� �����ϰ�, ���� �� ������ �ְ�, ����ڰ����� ���, ���Ѻο� ���ҵ� ��.
-- SYS AS SYSDBA

-- �⺻������ DB�� �̿��ϴ� ����� ������ ����ϰ� �̿��غ���
-- ����� ������ SYSTEM/SYS AS SYSDBA������ ����� ��
-- ����Ŭ DB�� �̿��Ϸ��� �ݵ�� ������ �־�� ��.
-- ������ �����ϴ� ��ɾ�
-- CREATE USER ������ IDENTIFIED BY ��й�ȣ
-- �������� ��ҹ��� �������� �ʰ�, ��й�ȣ�� ��ҹ��� ������ ��.

CREATE USER KH IDENTIFIED BY KH;
SELECT * FROM DBA_USERS;
-- ���Ѻο��ϱ�
-- GRANT ����||��(ROLE) [,���� || ROLE] TO ������;
--CONNECT(ROLE) : ������ DB�� ����(����)�� �� �ִ� ���� �ο�
GRANT CONNECT TO KH;--������ �� �ִ� ������ �ο�

--������ KH�������� ��ȸ�غ���
SELECT * FROM TAB;-- ������ ������ �ִ� ���̺� ��ȸ

CREATE TABLE TEST1(
    NAME VARCHAR2(20)
);

--DROP TABLE TEST1;
--���̺�(�������:�����͸� ������ ���ִ�)�� ������ �� �ִ� ������ �ο��Ǿ���.
-- RESOURCE (ROLE)�� �ο� : ���̺��� �����ϰ� �̿��� �� �ִ� ������ �ִ� ROLE;
GRANT RESOURCE TO KH;


-- TEST/TEST������ �����ϰ� ���Ѻο��ϰ�  �̿��� �� �ְ� ������.
CREATE USER TEST IDENTIFIED BY TEST;
GRANT CONNECT, RESOURCE TO TEST;

--DATA DICTIONARY
SELECT * FROM DICT;-- �����ڰ���, ����ڰ����� �̿�

--KH���� Ȱ���� ��񳻿� Ȯ��
SELECT * FROM EMPLOYEE;-- ���̺��� �����͸� ��ȸ
DESC EMPLOYEE;
SELECT * FROM DEPARTMENT;
SELECT * FROM JOB;
SELECT * FROM LOCATION;
SELECT * FROM NATIONAL;
SELECT * FROM SAL_GRADE;

--�⺻ SELECT�� Ȱ���ϱ�
-- SELECT ����� ���ϴ� �÷��� [, �÷���....]
-- FROM ���̺�;

SELECT EMP_ID, EMP_NAME, EMP_NO, EMAIL, PHONE, TEST1
FROM EMPLOYEE;

-- EMPLOYEE ���̺��� ��ü �÷��� ��ȸ�ϱ�
DESC EMPLOYEE;

SELECT EMP_ID, EMP_NAME,EMP_NO, EMAIL, PHONE,DEPT_CODE,.....
FROM EMPLOYEE;

-- ���̺� �ִ� ��ü �÷��� �ҷ��ö��� ���ϵ�ī��(*) 
SELECT *
FROM EMPLOYEE;

-- RESULT SET���� ROW(DATA) ���͸�(���ϴ� ���ǿ� �´� �����͸�) ���������� WHERE 
--WHERE��
-- SELECT �÷���,�÷���, �÷���./...
-- FROM ���̺��
-- [WHERE ���ǽ�(==, !=, >, < )]
SELECT *
FROM EMPLOYEE
WHERE SALARY>=3000000;

-- DB������ ���� ���͵� SELECT���ȿ��� �̷���� -> �Լ�����, �������..
-- SELECT������ ��������ϱ� -> +, -, *, /
-- �÷����� ���� ������ ��������� �� �� �ֵ�.
SELECT 10+20,2/5, 20*40, 10-50
FROM DUAL; -- ORACLE�� �����ϴ� �׽�Ʈ�� ���̺�

-- ��������� ���ͷ��� �����Ѱ� �ƴϴ�. �÷����� ������ ó���� ������.
-- �������ÿ��� �ڷ����� NUMBERŸ���̾�� �Ѵ�.
-- ���ڿ� : VARCHAR2 CHAR
-- ���� : NUMBER
-- ��¥ : DATE

SELECT SALARY 
FROM EMPLOYEE;
DESC EMPLOYEE;

-- �÷�, ���ͷ� ��������ϱ�
SELECT SALARY, SALARY+200000
FROM EMPLOYEE;

-- �÷�, �÷��� ��������ϱ�
SELECT SALARY, BONUS, SALARY*BONUS
FROM EMPLOYEE;

-- NULL���� ����ó���� ���� �ʴ´�!

-- EMPLOYEE���̺��� �� ����� ������ ��ȸ����
-- EMP_NAME, EMP_NO, DEPT_CODE, SALARY, ����
SELECT EMP_NAME, EMP_NO, DEPT_CODE SALARY,
                SALARY * 12
FROM EMPLOYEE;

-- ���ʽ��� �߰��� �ݾ����� ����غ���.(����+���ʽ��ݾ�)*12
SELECT EMP_NAME, EMP_NO, DEPT_CODE, SALARY,
                (SALARY+(SALARY*BONUS))*12
FROM EMPLOYEE;           

--����Ŭ���� ' ' ���ڿ� ���ͷ� ǥ��
SELECT '20'+30, '�̽�'+'���' --�̽�30
FROM DUAL;


-- RESTULSET �÷����� �����ϱ� -> �÷��� ��Ī�ο�
-- �÷��� AS ������ �÷��̸� ||  �÷��� ������ �÷���

SELECT EMP_NAME AS �����, PHONE AS ��ȭ��ȣ, EMAIL �̸���, SALARY*12 ����
FROM EMPLOYEE;

-- ��Ī�ο��ÿ� ����, Ư����ȣ�� ����� �� �ֳ�? �ִ�! " "
SELECT EMP_NAME AS "�� �� ��", SALARY AS "����(��)", SALARY*12
FROM EMPLOYEE;

-- SELECT���� �÷��� ���°��� ���ͷ��� �ۼ��ϸ�? 
SELECT EMP_NAME, '��', 100
FROM EMPLOYEE;


-- �÷��� �ִ� �ߺ����� �����ϰ� ����ϴ� ����� : DISTINCT
SELECT DISTINCT DEPT_CODE
FROM EMPLOYEE;

-- DISTINCT������ SELECT���� �Ѱ��� ����� ������.
-- SELECT DISTINCT DEPT_CODE, DISTINCT JOB_CODE
SELECT DISTINCT DEPT_CODE, JOB_CODE
FROM EMPLOYEE;

-- ���Ῥ���� : �ڹٿ��� ���ڿ������Ѱ� + -> || 
-- �÷��� �÷� �Ǵ� �÷��� ���ͷ��� ����
SELECT '������'||'��������'||'�ݿ���'
FROM DUAL;

SELECT EMP_NAME||'��',SALARY||'��'
FROM EMPLOYEE;


-- ��, ������
-- ����񱳿��� : =
-- EMPLOYEE ���̺��� ������� �������� ����� ��ü�÷� ��ȸ����.
SELECT *
FROM EMPLOYEE
WHERE EMP_NAME='������';

-- EMPLOYEE ���̺��� DEPT_CODE D5�� ����� ��ü �÷� ��ȸ����.
SELECT * 
FROM EMPLOYEE
WHERE DEPT_CODE='D5';

-- 200�鸸�� �̻� ������ �޴� ��� ��ȸ�ϱ�
SELECT * 
FROM EMPLOYEE
WHERE SALARY>2000000;

-- JOB_CODE J5�ƴ� ����� ��ȸ�ϱ�
SELECT *
FROM EMPLOYEE
--WHERE JOB_CODE !='J5';
--WHERE JOB_CODE <>'J5';
WHERE JOB_CODE ^= 'J5';

-- ������ �����ϱ� : AND, OR, NOT
-- EMPLOYEE���̺��� DEPT_CODE D5�̸鼭 SALARY�� 300�鸸�� �̻��� ���.
SELECT * 
FROM EMPLOYEE
WHERE DEPT_CODE='D5' AND SALARY>=3000000;

-- EMPLOYEE ���̺��� DEPT_CODE�� D5�̰ų� D6�� ����� �̸�, �޿� �μ��ڵ带 ��ȸ����
SELECT EMP_NAME, SALARY, DEPT_CODE
FROM EMPLOYEE
WHERE DEPT_CODE='D5' OR DEPT_CODE='D6';

-- NOT 
-- �μ��ڵ尡 D5�� �ƴ� ����� ��ȸ�ϼ���
SELECT *
FROM EMPLOYEE
WHERE NOT DEPT_CODE='D5';

-- EMPLOYEE ���̺��� �޿��� 300�����̻� ���� 500�������� ���̹޴� ����� �̸�, �޿� �μ��ڵ带 ��ȸ�ϱ�
SELECT EMP_NAME, SALARY DEPT_CODE
FROM EMPLOYEE
--WHERE SALARY >=3000000 AND SALARY <= 5000000;
WHERE NOT (SALARY >=3000000 AND SALARY <= 5000000);


-- ORALCE���� �����ϴ� �񱳿�����
-- BETWEEN AND -> Ư�������� ��ȸ�Ҷ� ����ϴ� ������
-- �÷��� BETWEEN �� AND �� == ��<=�÷��� AND ��>=�÷���

SELECT EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
--WHERE SALARY BETWEEN 3000000 AND 5000000;
WHERE SALARY NOT BETWEEN 3000000 AND 5000000;

-- ������ ���ϰų� ��Һ񱳸� �Ҷ� ��¥ ���� �����Ѱ�???
DESC EMPLOYEE;

-- ������� 00/01/01������ �Ի��� ����� �̸�, �μ�, ����� ������
SELECT EMP_NAME, DEPT_CODE, HIRE_DATE
FROM EMPLOYEE
WHERE HIRE_DATE < '00/01/01';

-- ������� 90/01/01 ���� 01/01/01���� �Ի��� ����� �̸�, �μ�, ����� ��ȸ�ϱ�
SELECT EMP_NAME, DEPT_CODE, HIRE_DATE
FROM EMPLOYEE
WHERE HIRE_DATE BETWEEN '90/01/01' AND '01/01/01';


-- LIKE : Ư�� ������ ���ڰ��� ��ȸ�ϴ� ��� ' '
-- ���ϵ�ī�带 ����ؼ� ��ȸ %, _ ��ȣ
-- % : 0�� �̻��� ������ ���� ǥ��
    -- LIKE '%�ȳ�' -> �ȳ�(0), �Ͼȳ�(0) �Ƹ��̤��������ȳ�(0) �ư������ھ� ��(x) -> �ȳ����� ������ ���ڿ�
    -- LIKE 'ȫ%' -> ȫ���� �����ϴ� ���ڿ� ���!
    -- LIKE '%��%' -> ���� �����ϰ� �ִ� ���ڿ�
    
-- _ : 1���� ������ ���� ǥ��
    -- LIKE '_�ȳ�' -> �ȳ�(x) �Ͼȳ�(0) 1�ȳ�(0) -> �ȳ����� ������ 3����
    -- LIKE '___' -> 3���� ���ڿ�
    -- LIKE '_��_' -> 
    
-- �ΰ��� ������ �� ����
    -- LIKE '%�ȳ�_' -> �ȳ����� ������ �ѱ��� �� �ִ� ���ڿ�
    -- LIKE '_��_%' -> 3���� �̻� �ι�°���ڰ� �� �� ���ڿ�
    -- LIKE '_��%' -> 
    
-- SELECT ASDLKASJDF FROM ���̺�� WHERE �÷��� LIKE '����';

-- ���� ���� ���� ����� ��ȸ�ϱ� �����, �μ��ڵ�, �޿�
SELECT EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
--WHERE EMP_NAME LIKE '��_%';
WHERE EMP_NAME LIKE '��__';


-- ����̸� ��ü�� �̰� ���Ե� ����� ��ȸ ��ü�÷�
SELECT *
FROM EMPLOYEE
WHERE EMP_NAME LIKE '%��%';

-- EMAIL �� _���� 3�ڸ��� ������ ��ȸ�Ѵٸ�?
SELECT EMP_NAME, EMAIL
FROM EMPLOYEE
--WHERE EMAIL LIKE '___^_%' ESCAPE '^';
WHERE EMAIL LIKE '___\_%' ESCAPE '\';
--ESCAPE������ ����� �ؼ� ����ؾ���.

--�̾��� �ƴ� ����� ��ü �÷��� ��ȸ�غ���.
SELECT * 
FROM EMPLOYEE
WHERE EMP_NAME NOT LIKE '��_%';

SELECT * FROM EMPLOYEE;


-- NULL�� ã�ƺ���.
--���ʽ��� ���� �ʴ� ����� ���غ���.
SELECT *
FROM EMPLOYEE
--WHERE BONUS = NULL;
WHERE BONUS = (null);
-- NULL���� �ƹ��ǹ̾��� �������� ����ó���� ��������!
-- IS NULL : �÷��� �ִ� NULL���� ��ȸ�ϴ� ������
-- IS NOT NULL : �÷��� NULL�� �ƴѰ��� ��ȸ ������

SELECT *
FROM EMPLOYEE
WHERE BONUS IS NULL;

--���ʽ��� �޴� ��� ��ȸ�ϱ�
SELECT * 
FROM EMPLOYEE
WHERE BONUS IS NOT NULL;

-- �μ��� ������ �ȵ� ����� �̸�, �̸��� ��ȭ��ȣ�� ��ȸ�ϼ���
SELECT EMP_NAME, EMAIL, PHONE
FROM EMPLOYEE
WHERE DEPT_CODE IS NULL;

-- IN / NOT IN : ����� ���� ����� 
-- DEPT_CODE D5 �̰ų� D6�� ����� ��ȸ
SELECT EMP_NAME, DEPT_CODE
FROM EMPLOYEE
--WHERE DEPT_CODE='D5' OR DEPT_CODE='D6';
--WHERE DEPT_CODE IN('D5','D6'); -- �������� ���� �����༭�������� ���Ҷ� ���
WHERE DEPT_CODE NOT IN('D5','D6');


-- ����� ��å�ڵ尡 J7 �Ǵ� J2�̰�, �޿��� 200�鸸���� ����� �̸�, �޿�, �μ��ڵ带 ��ȸ
SELECT EMP_NAME, SALARY, JOB_CODE
FROM EMPLOYEE
WHERE (JOB_CODE='J7' OR JOB_CODE='J2') AND SALARY>2000000;


SELECT * FROM EMPLOYEE;

-- �������� ���������ϱ�.
-- ORDER BY : ����, ������������, ->  �÷��� �������� ����
-- ���� : ���� -> ū�� : ASC �������� / ū�� -> ������ DESC  ��������
-- ���ڿ� : ������ �� -> �� ASC / ������ �� -> �� DESC 
-- ��¥ : ������ -> ������¥ ASC / ������¥ -> ������¥ DESC
-- ORDER BY �÷��� ���ı���(ASC/DESC)
-- SELECT �÷���, �÷���, �÷���.....
-- FROM ���̺��
-- [WHERE]
-- [ORDER BY �÷��� ���ı���]
-- ORDER BY ������ SELECT���� �� �������� �ۼ��Ѵ�.
SELECT * 
FROM EMPLOYEE
--ORDER BY EMP_NAME ASC;
--ORDER BY SALARY DESC;
--ORDER BY EMAIL;-- DEFAULT���� ASC �����ϸ� �������� ������ �Ѵ�.
--�Ѱ��̻��� �÷��� �ۼ��� ������.
ORDER BY DEPT_CODE , EMP_NAME DESC;
--NULL�� ���� : ASC -> �ǾƷ�, DESC -> �� ��
SELECT DEPT_CODE, EMP_NAME
FROM EMPLOYEE
--ORDER BY DEPT_CODE NULLS FIRST;
ORDER BY DEPT_CODE DESC NULLS LAST;

--DEPT_CODE D5�� ����� ������ ���� ���� ��������� ��ü �÷� ��ȸ�ϱ�
SELECT *
FROM EMPLOYEE
WHERE DEPT_CODE='D5'
ORDER BY SALARY DESC;

-- ORDER BY ������ �÷��� ���� �ε����� �������� ������ �� �ִ�.
-- ����Ŭ�� �ε����� 1���� ����.
SELECT EMP_NAME, DEPT_CODE, SALARY, EMAIL
FROM EMPLOYEE
ORDER BY 1;

SELECT EMP_NAME, (SALARY+(SALARY*BONUS))*12
FROM EMPLOYEE
ORDER BY 2 DESC NULLS LAST;

-- ORDER BY �������� �÷��� �ο��� ��Ī�� �̿��� �� �ִ�.
SELECT EMP_NAME, (SALARY +(SALARY*BONUS))*12 AS ����
FROM EMPLOYEE
WHERE (SALARY +(SALARY*BONUS))*12 >=40000000
ORDER BY ���� DESC;

SELECT * FROM EMPLOYEE;

-- ����Ŭ�� �����ϴ� �Լ��� ���� �˾ƺ���
-- ���ڿ�ó���Լ�
-- 1. LENGTH : ���ڿ��� ���̸� ��Ÿ���� �Լ�
-- LENGTH(���ڿ�||�÷���) ���ڸ� ��ȯ
SELECT LENGTH('����3��') 
FROM DUAL;
SELECT LENGTH(EMAIL)
FROM EMPLOYEE;
--EMAIL�� ���̰� 16�̻��� ����� ��ü �÷� ��ȸ�ϱ�
SELECT *
FROM EMPLOYEE
WHERE LENGTH(EMAIL)>=16;

--LENGTHB(���ڿ�||�÷���) : ���ڿ� BYTEũ��
--�ѱ��� 3BYTE�� ó����. EXPRESS��������....
SELECT LENGTHB('������'),  LENGTH('������'),LENGTHB('ABC')
FROM DUAL;
SELECT LENGTHB(EMP_NAME), LENGTHB(EMAIL)
FROM EMPLOYEE;

-- INSTR : ã�¹��ڸ� ���ڿ�||�÷�����  ������ ��ġ���� ������ ȸ����°�� ��Ÿ�� ���ڿ� �ε��� ��ȯ.
-- INSTR(����ڿ�||�÷�, ã�� ����[,������ġ, Ƚ��]) == INDEXOF�� ���
SELECT INSTR('KH����������KH','KH') FROM DUAL;--������ġ, Ƚ�� ����  DEFAULT=1;
SELECT INSTR('KH���������� KH RCLASS ȭ����','KH',4) 
FROM DUAL;
SELECT INSTR('KH���������� KH RCLASS ȭ���� KH�� ����','KH',1,3)
FROM DUAL;-- Ƚ���� �ߺ����� �������� ��ȿ��.

--������ġ�� ����(-)�� ���� �� ����. == LASTINTDEXOF
SELECT INSTR('KH���������� KH RCLASS ȭ���� KH�� ����','KH',-7,4)
FROM DUAL;

--EMAIL���� @�� ��ġ�� ã�ƺ���.
-- EMAIL���� �ι�° . �� ��ġ�� ã�ƺ���.
SELECT INSTR(EMAIL,'@'), INSTR(EMAIL,'.',1,2)
FROM EMPLOYEE;


--LPAD / RPAD
--Ư�� ������ ������ ����� �� ������ Ư�����ڷ� ä��� �Լ�
--LPAD/RPAD(����ڿ�, ��������[,Ư������])
SELECT '�ȳ�', LPAD('�ȳ�',10) FROM DUAL;--Ư�����ڸ� �������� ������ ���Ⱑ ��.
SELECT '�ȳ�',LPAD('�ȳ�',10,'#') FROM DUAL;
SELECT '�ȳ�',RPAD('�ȳ�',10,'#') FROM DUAL;
SELECT EMAIL, RPAD(EMAIL,16,'*') FROM EMPLOYEE;


-- LTRIM/RTRIM
--����, �������� ����, Ư�� ��ȣ�� �����ϴ°�
--LTRIM/RTRIM(�����||�÷�[,����])
SELECT '     ���޵ڼ��� ��������?', LTRIM('     ���޵ڼ��� ��������?')
FROM DUAL;
SELECT '���������������� �Ƿξ�!', LTRIM('������������������ �Ƿξ�!','��')
FROM DUAL;
SELECT '�����ٰ������������ٴٴٰ��ٴٰ��̷��Ծ��Ŵ�?���ٳ����ٳ�',
            LTRIM('�����ٰ������������ٴٴٰ��ٴٰ��̷��Ծ��Ŵ�?�����ٰ��ٳ�','������'),
            RTRIM('�����ٰ������������ٴٴٰ��ٴٰ��̷��Ծ��Ŵ�?�����ٰ��ٳ�','������')
FROM DUAL;

-- ���ٳ��ٳ��������������� �̰ſ��� ���������켼�� �����ٰ��������������ٴٴ�
SELECT RTRIM(LTRIM('���ٳ��ٳ��������������� �̰ſ��� ���������켼�� �����ٰ��������������ٴٴ�','������'),'������')
FROM DUAL;

-- TRIM : ���ʿ� �ִ� ����,Ư������ ����
-- �ɼǿ� ���� ����, �����ʿ� Ư������,������ ������ ���� ����.
-- �Ѱ����ڸ� ������.
--TRIM(����||�÷�)
--TRIM('Ư������' FROM ���ڿ�||�÷���) 
-- TRIM( LEADING 'Ư������' FROM ���ڿ�||�÷���) --����
-- TRIM( TRAILING 'Ư������' FROM ���ڿ�||�÷���) -- ������
-- TRIM( BOTH 'Ư������' FROM ���ڿ�||�÷���) -- ����
SELECT '    ������   ', TRIM('   ������   ') FROM DUAL;

SELECT '�������������¤�������', TRIM('��' FROM '�������������¤�������') 
FROM DUAL;

SELECT '�������������¤�������', TRIM(LEADING '��' FROM '�������������¤�������') 
FROM DUAL;

SELECT '�������������¤�������', TRIM(TRAILING '��' FROM '�������������¤�������') 
FROM DUAL;

SELECT '�������������¤�������', TRIM(BOTH '��' FROM '�������������¤�������') 
FROM DUAL;

--�Ѱ� Ư�����ڸ� ���Ű� ����
SELECT '�������������¤�������', TRIM( '��1' FROM '�������������¤�������') 
FROM DUAL;


-- SUBSTR : ���ϴ� ��ġ�� ���ڸ� �߶󳻴� ���
-- SUBSTR('���ڿ�',�����ε���[,����])
SELECT SUBSTR('HELLO FUNCTION',6) FROM DUAL;
SELECT SUBSTR('HELLO FUNCTION',7,2) FROM DUAL;
--������ġ�� ������ ������ �ڿ������� ����
SELECT SUBSTR('HELLO FUNCTION',-8,3) FROM DUAL;

SELECT SUBSTR('HELLO FUNCTION',INSTR('HELLO FUNCTION','F'),3) FROM DUAL;

-- EMPLOYEE���̺��� ����� ���� ����ϱ�.
SELECT SUBSTR(EMP_NAME,1,1) FROM EMPLOYEE;

--EMPLOYEE���̺��� ���ڻ���� ����ϱ�.
SELECT * 
FROM EMPLOYEE
WHERE SUBSTR(EMP_NO,8,1)='2';

-- LOWER/UPPER/INITCAP
SELECT LOWER('Welcome to My world') FROM DUAL;
SELECT UPPER('Welcome to My world') FROM DUAL;
SELECT INITCAP('Welcome to My world') FROM DUAL;

-- CONCAT : ���ڿ� ����, ��ġ�� == ||
SELECT CONCAT('����... ','����ð�') 
FROM DUAL;
SELECT CONCAT(EMP_NAME, SALARY)
FROM EMPLOYEE;

--REPLACE : �÷�||���ڿ��� �����κ��� �����ϴ� �Լ�
--REPLACE(����||�÷�, �����, ������ ����)
SELECT REPLACE('I LOVE YOU','LOVE','HATE') FROM DUAL;

SELECT REPLACE(EMAIL,'kh.or.kr','rclass.com') 
FROM EMPLOYEE;

SELECT * FROM EMPLOYEE;


--REVERSE : ��������
SELECT REVERSE('I LOVE YOU') FROM DUAL;
SELECT REVERSE(REVERSE('I LOVE YOU')) FROM DUAL;
SELECT REVERSE('���� �� ����ð�') FROM DUAL;
SELECT REVERSE(REVERSE('���� �� ����ð�')) FROM DUAL;


-- TRANSLATE : Ư�����ڸ� ������ ���ڷ� �ڵ����� �����ؼ� ������ִ� ���
SELECT TRANSLATE('010-3644-6259','0123456789','�����̻�����ĥ�ȱ�')
FROM DUAL;


-- EMPLOYEE���̺��� �����ȣ, �����, �ֹι�ȣ, ������ ��ȸ
-- �ֹι�ȣ�� ������� �� ����ϰ� �������� *�� ǥ��

SELECT EMP_ID, EMP_NAME, SUBSTR(EMP_NO,1,6)||'*******' AS �ֹι�ȣ
FROM EMPLOYEE;

-- �������ڿ����� �յ� ��� ���ڸ� �����ϼ���.
-- '982341678934509hello89798739273402'
SELECT RTRIM(LTRIM('982341678934509hello89798739273402','1234567890'),'1234567890')
FROM DUAL;


--����ó���Լ�
--ABS : �������� ����
SELECT ABS(10),ABS(-10) FROM DUAL;

-- MOD : ���������� == %
--MOD(����, ������) : ���������� ��ȯ
SELECT MOD(10,3) FROM DUAL;
SELECT MOD(10,2) FROM DUAL;
SELECT MOD(10,4) FROM DUAL;


--�Ǽ�ó���Լ�
--ROUND : �ݿø��ϴ� �Լ�
--ROUND(�Ǽ�, �Ҽ����ڸ���) : �Ǽ��� �Ҽ��� �ڸ������� �ݿø���
SELECT ROUND(126.4565,3) FROM DUAL;
SELECT ROUND(126.34,1) FROM DUAL;
SELECT ROUND(126.456,-2) FROM DUAL;
SELECT ROUND(126.456,-1) FROM DUAL;

--FLOOR : �Ҽ��� �ڸ� ����
SELECT FLOOR(126.456) FROM DUAL;
SELECT FLOOR(126.656) FROM DUAL;

--TRUC :  ���ϴ� ��ġ�� �Ҽ��� �ڸ� ����
SELECT TRUNC(126.456,2) FROM DUAL;
SELECT TRUNC(126.456,1) FROM DUAL;
SELECT TRUNC(126.456,-1) FROM DUAL;

-- CEIL : ������ �ø�.
SELECT CEIL(126.456) FROM DUAL;


SELECT (SALARY+(SALARY*BONUS))*12 FROM EMPLOYEE;

SELECT FLOOR(SYSDATE-HIRE_DATE) FROM EMPLOYEE;


-- ��¥ó�� �Լ�
-- ��¥���� ������� -> ����(����)
-- ��¥�ϰ� ���ڸ� ������� -> ��¥(���ڸ�ŭ ���ڸ� ���)

-- ���糯¥ ���ϱ� -> SYSDATE
SELECT SYSDATE FROM DUAL;
-- ���糯¥ �ú��� �и������ʱ��� -> SYSTIMESTAMP
SELECT SYSTIMESTAMP FROM DUAL;

SELECT SYSDATE, TO_CHAR(SYSDATE,'HH:MI:SS')
FROM DUAL;


--���� ���� ���� ����ϱ�
SELECT SYSDATE-1 AS ����, SYSDATE AS ����, SYSDATE+1 AS ����
FROM DUAL;

-- �������� ����Ϸ���
-- ADD_MONTHS : �������� �����ִ� �Լ�
SELECT SYSDATE, ADD_MONTHS(SYSDATE, 2) FROM DUAL;
-- ����� �Ի��� �� �Ѵ޵ڸ� ��ȸ�ϱ� ����� �����
SELECT EMP_NAME, ADD_MONTHS(HIRE_DATE,1) FROM EMPLOYEE;

-- ��¥�� �������̸� ���Ϸ���
-- MONTHS_BETWEEN : �ΰ��� ��¥�� �޾Ƽ� �γ�¥�� ���������̸� ������ִ� �Լ�
SELECT MONTHS_BETWEEN(SYSDATE, ADD_MONTHS(SYSDATE,10))
FROM DUAL;

--EMPLOYEE���̺��� ����� �ٹ��������� ���Ͻÿ� �����, �μ��ڵ�, �޿� �ٹ�������
SELECT EMP_NAME, DEPT_CODE, SALARY, FLOOR(MONTHS_BETWEEN(SYSDATE,HIRE_DATE)/12)
FROM EMPLOYEE;


-- NEXT_DAY : ���� ����� ���� ���� ��¥�� �����ִ� �Լ�
SELECT NEXT_DAY(SYSDATE, '��') FROM DUAL;
SELECT NEXT_DAY(SYSDATE, '�ݿ���') FROM DUAL;

SELECT NEXT_DAY(SYSDATE,'MON') FROM DUAL;
SELECT NEXT_DAY(SYSDATE,'FRI') FROM DUAL;

SELECT * FROM V$NLS_PARAMETERS;

ALTER SESSION SET NLS_LANGUAGE=KOREAN;

-- LAST_DAY : �״��� ������ �� ���
SELECT LAST_DAY(SYSDATE) FROM DUAL;


-- EXTRACT : ��, ��, ��, ��, ��, �� �� ���� ���������� ���� �� �ִ� �Լ�
-- EXTRACT(YEAR FROM ��¥) : ���� ���ڷ� ��ȯ
-- EXTRACT(MONTH FROM ��¥) : ���� ���ڷ� ��ȯ
-- EXTRACT(DAY FROM ��¥) : ���� ���ڷ� ��ȯ
SELECT EXTRACT(YEAR FROM SYSDATE)+20 FROM DUAL;
SELECT EXTRACT(MONTH FROM SYSDATE)+5 FROM DUAL;
SELECT  EXTRACT(DAY FROM SYSDATE)+50 FROM DUAL;

-- �ú���
SELECT EXTRACT(HOUR FROM CAST(SYSDATE AS TIMESTAMP)) FROM DUAL;
SELECT EXTRACT(MINUTE FROM CAST(SYSDATE AS TIMESTAMP)) FROM DUAL;
SELECT EXTRACT(SECOND FROM CAST(SYSDATE AS TIMESTAMP)) FROM DUAL;


-- ����ȯ �Լ�
-- ����Ŭ���� ����ȯ �ڵ����� ���ִ� ��찡 ����.
-- '00/01/01'
-- TO_CHAR : ����||��¥�� ���ڷ� �������ִ� �Լ�
-- TO_CHAR(��¥[, FORMAT]) : ��¥�� ���ڷ� ����
-- TO_CHAR(����[, FORMAT]) : ���ڸ� ���ڷ� ����

YYYY : �⵵ 4�ڸ�
YY : �⵵ 2�ڸ�
MONTH : �� LOCALE���� FULL
MM : ���� ���ڷ�
DD : ��¥ ǥ��
D : ������ ���ڷ� ǥ��
DAY : ���� ǥ��
DY : ���� �ձ��ڸ�
HH : �ð�
MI : ��
SS : ��

SELECT SYSDATE, TO_CHAR(SYSDATE,'YY-MM-DD DAY HH:MI:SS') 
FROM DUAL;

--������̺��� �����, �����(1990/2/20(ȭ)) ����ϱ�
SELECT TO_CHAR(HIRE_DATE,'YYYY/MM/DD (DY)') FROM EMPLOYEE;

-- ���ڸ� ���ڷ� �����ϱ�
-- 1,000,000 / \1,000,000
-- 9 : �ش� �ڸ����� ���ڰ� ������ ǥ��, ������ ǥ�� ���� ����
-- 0 : �ش� �ڸ����� ���ڰ� ������ ǥ��, ������ 0���� ǥ�� 

SELECT TO_CHAR(1000000,'999,999,999')
FROM DUAL;
SELECT TO_CHAR(1000000,'000,000,000')
FROM DUAL;

--ȥ������ ����� ����
SELECT TO_CHAR(1000000,'999,999,999.00')
FROM DUAL;

--�� ȭ���ȣ�� ǥ��
SELECT TO_CHAR(1000000,'L999,999,999')
FROM DUAL;


-- TO_DATE : ����, ���ڿ� ��¥�������� �����ϴ� �Լ�
--TO_DATE('���ڿ�','YYYMMDD') FROM DUAL;
SELECT TO_DATE('19960930','YYYYMMDD') FROM DUAL;
SELECT  TO_DATE('980124','YYMMDD') FROM DUAL;

SELECT TO_DATE(19960925,'YYYYMMDD') FROM DUAL;
SELECT  TO_DATE(010224,'YYMMDD') FROM DUAL;
--�������¿��� ��¥�� ����ȯ�� ���� �Ǿտ� 0�� ����ϸ�ȵ�.
--'99/10/22'
SELECT  TO_CHAR(TO_DATE('19960925 10:35:22','YYYYMMDD HH:MI:SS'),'YYYY-MM-DD HH:MI:SS') FROM DUAL;



--TO_NUMBER : �������·� �����ϴ� �Լ� ���ڿ��� ����

SELECT TO_NUMBER('1,000,000','999,999,999') FROM DUAL;--����ҷ���.
SELECT TO_NUMBER('1,000,000��','999,999,999') FROM DUAL;

-- ���úη� �쿵���� ���뿡 �� �������ϴ�..
-- �����Ⱓ�� 1�� 6�����̶�� �ϸ� ���볯¥�� ���ϰ�
-- ������� �Դ� «���� ���� ���ϼ��� 1�� 3�� ����
SELECT SYSDATE AS "�쿵�� �߰�", ADD_MONTHS(SYSDATE,18) AS "�쿵�� ����߾�"
            ,TO_CHAR((ADD_MONTHS(SYSDATE,18)-SYSDATE)*3,'999,999,999') AS «��
FROM DUAL;


-- NULLó�� �Լ�
-- NVL() : DATA���� NULL�� ��ü�ϴ� ���� ����
SELECT BONUS, NVL(BONUS,0) FROM EMPLOYEE;
SELECT (SALARY+SALARY*NVL(BONUS,0))*12 ���� FROM EMPLOYEE;
SELECT EMP_NAME, NVL(DEPT_CODE,'����') FROM EMPLOYEE;

--NVL2 : 
SELECT BONUS, NVL2(BONUS,'�ִ�','����') 
FROM EMPLOYEE;

--SELECT���� ���ǿ� ���� �б��غ��� 
--DECODE�Լ� �̿��ϱ�
--�ڹ��� SWITCH�����.
--DECODE(���ذ�,����1,���1,����2,���2,.... ���(DEFAULT))
--���� �÷��� ������ �� ����
SELECT EMP_NAME, EMP_NO,
            DECODE(SUBSTR(EMP_NO,8,1),'1','����','����')
FROM EMPLOYEE;       

--CASE�� : ���ǿ� ���� �б� ó���Ǵ� �Լ�
-- CASE 
--    WHEN ���� THEN ���౸��
--    WHEN ���� THEN ���౸��
--    ELSE
-- END;
SELECT EMP_NAME, EMP_NO,
            CASE
                WHEN SUBSTR(EMP_NO,8,1)='1' THEN '����'
                WHEN SUBSTR(EMP_NO,8,1)='2' THEN '����'
            END AS ����
FROM EMPLOYEE;

SELECT EMP_NAME, EMP_NO,
        CASE SUBSTR(EMP_NO,8,1)
            WHEN '1' THEN '����'
            ELSE '����'
        END AS ����
FROM EMPLOYEE;

/* ���� :  ����⵵-�¾ �⵵ +1
-------------------------------------------------------------------------
�����ȣ    �����       �ֹι�ȣ        ����   ���糪��
-------------------------------------------------------------------------
200	       ������	  621235-1*******	   ��	    57
201	       ������	  631156-1*******	   ��	    56
202	       ���ö	  861015-1*******	   ��	    33
                        .
                        .
                        .
-------------------------------------------------------------------------
*/
SELECT EMP_ID AS �����ȣ,
                EMP_NAME AS �����,
                CONCAT(SUBSTR(EMP_NO,1,8),'*******') AS �ֹι�ȣ,
                CASE WHEN SUBSTR(EMP_NO,8,1) ='1' THEN '��' ELSE '��' END AS ����,
                EXTRACT(YEAR FROM SYSDATE)
                -EXTRACT(YEAR FROM TO_DATE(SUBSTR(EMP_NO,1,2),'YY'))+1 AS "���糪��(YY)",
                EXTRACT(YEAR FROM SYSDATE)
                -EXTRACT(YEAR FROM TO_DATE(SUBSTR(EMP_NO,1,2),'RR'))+1 AS "���糪��(RR)",
                TO_NUMBER(EXTRACT(YEAR FROM SYSDATE))
                -(TO_NUMBER(SUBSTR(EMP_NO,1,2))
                    +CASE WHEN SUBSTR(EMP_NO,8,1) IN('1','2') THEN 1900 ELSE 2000 END)+1 AS ���糪��
FROM EMPLOYEE;

--�⵵�� ���ڸ��� �����ö� YY, RR���
--YY ��� -> 2020 -- 20 1998 -- 98 -> ������ ���缼�⸦ �������� ������,
-- 20 -> 2020 / 98 -> 2098 / 01 -> 2001 / 88 -> 2088
--RR ��� 
insert into KH.EMPLOYEE (EMP_ID,EMP_NAME,EMP_NO,EMAIL,PHONE,DEPT_CODE,JOB_CODE,SAL_LEVEL,SALARY,BONUS,MANAGER_ID,HIRE_DATE,ENT_DATE,ENT_YN) 
values ('250','��ι�','470808-2123341','go_dm@kh.or.kr',null,'D2','J2','S5',4480000,null,null,to_date('94/01/20','RR/MM/DD'),null,'N');

-- �׷��Լ� 
-- ����� �Ѱ� ROW�� ��µ�.
-- SUM
SELECT SUM(SALARY)
FROM EMPLOYEE
WHERE DEPT_CODE='D6';

-- ���ڻ���� �޿��� ������ ��ȸ�ϱ�
SELECT SUM(SALARY)
FROM EMPLOYEE
WHERE SUBSTR(EMP_NO,8,1)='2';

-- ��ü ��� ���� ������ ���ϼ��� ���ʽ� ���� ������ 0���� ���.
SELECT SUM((SALARY+SALARY*NVL(BONUS,0))*12)
FROM EMPLOYEE;

--AVG : �׷��� ����� ���ϴ� �Լ�
SELECT TO_CHAR(FLOOR(AVG(SALARY)), 'L999,999,999') AS ��ձ޿�
FROM EMPLOYEE;

-- COUNT : �׷��� ROW���� ���ϴ� �Լ�
-- ��ü ������� ���ϼ���
SELECT COUNT(*) 
FROM EMPLOYEE;

-- �޿��� 300���� �̻�޴� ����� ��
SELECT COUNT(*) 
FROM EMPLOYEE 
WHERE SALARY>=3000000;
-- COUNT(*||�÷���)
 SELECT COUNT(*), COUNT(BONUS), COUNT(DEPT_CODE)
 FROM EMPLOYEE;
 
SELECT COUNT(*)
FROM EMPLOYEE
WHERE BONUS IS NOT NULL;

--�׷��Լ��� �ѹ��� ����� ����
SELECT DEPT_CODE,COUNT(*), SUM(SALARY), AVG(SALARY)
FROM EMPLOYEE;

-- MAX/MIN
-- ����� �޿��� ���� ���� ����� �޿�, ���� ���� ����� �޿� ��ȸ
SELECT  MAX(SALARY), MIN(SALARY)
FROM EMPLOYEE;

SELECT MAX(HIRE_DATE), MIN(HIRE_DATE)
FROM EMPLOYEE;

-- GROUP BY ��
-- Ư�� �÷��� �������� �׷��� �����ִ� ��
-- �μ��� �޿��հ踦 ��ȸ
SELECT DEPT_CODE, SUM(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_CODE;

-- �μ��� ������� ��ȸ�ϼ���
SELECT DEPT_CODE, COUNT(*)
FROM EMPLOYEE
GROUP BY DEPT_CODE;

-- ���޺� �޿��հ�, ���, �ο����� ��ȸ�ϱ�
SELECT JOB_CODE, SUM(SALARY), FLOOR(AVG(SALARY)), COUNT(*) AS �ο���
FROM EMPLOYEE
GROUP BY JOB_CODE
ORDER BY AVG(SALARY) DESC;

SELECT JOB_CODE, SALARY
FROM EMPLOYEE ORDER BY JOB_CODE;

--EMPLOYEE ���̺��� ������ J1�� �����ϰ�, ���޺� ����� �� ��ձ޿��� ����ϼ���.
    SELECT JOB_CODE, COUNT(*), AVG(SALARY)
    FROM EMPLOYEE
    WHERE JOB_CODE<>'J1'
    GROUP BY JOB_CODE;

--EMPLOYEE���̺��� ������ J1�� �����ϰ�,  �Ի�⵵�� �ο����� ��ȸ�ؼ�, �Ի�� �������� �������� �����ϼ���.
    SELECT EXTRACT(YEAR FROM HIRE_DATE), COUNT(*)
    FROM EMPLOYEE
    WHERE JOB_CODE != 'J1'
    GROUP BY EXTRACT(YEAR FROM HIRE_DATE);
--[EMPLOYEE] ���̺��� EMP_NO�� 8��° �ڸ��� 1, 3 �̸� '��', 2, 4 �̸� '��'�� ����� ��ȸ�ϰ�,
-- ������ �޿��� ���(����ó��), �޿��� �հ�, �ο����� ��ȸ�� �� �ο����� ���������� ���� �Ͻÿ�
    SELECT DECODE(SUBSTR(EMP_NO,8,1),'1','��','2','��') AS ����
    ,COUNT(*), SUM(SALARY), AVG(SALARY)
    FROM EMPLOYEE
    --WHERE DECODE(SUBSTR(EMP_NO,8,1),'1','��','2','��')='��'
   -- WHERE ;
    GROUP BY DECODE(SUBSTR(EMP_NO,8,1),'1','��','2','��');
    
    
-- GROUP BY ������ �ټ��� �÷��� ���� �� ����    
SELECT DEPT_CODE, JOB_CODE, COUNT(*)
FROM EMPLOYEE
GROUP BY DEPT_CODE, JOB_CODE;

-- �μ��� �޿� ����� 300�鸸�� �̻��� �μ����� �μ��ڵ�, �޿������ ��ȸ
SELECT DEPT_CODE, FLOOR(AVG(SALARY))
FROM EMPLOYEE
--WHERE AVG(SALARY)>=3000000
GROUP BY DEPT_CODE
HAVING AVG(SALARY)>=3000000;

-- HAVING�� : �׷��Լ��� ���͸� �� �� �ְ� �ϴ°�
--�׷��Լ��� ������ ROW�� ���͸��Ҷ� WHERE�� ������� ���ϰ�, HAVING���� ����ؾ� �Ѵ�.

--�μ��� �ο��� 3���� ���� �μ��� �ο����� ����ϼ���.
SELECT DEPT_CODE, COUNT(*)
FROM EMPLOYEE
GROUP BY DEPT_CODE
HAVING COUNT(*) >= 3
ORDER BY 2 DESC;

-- ROLLUP, CUBE�� ���� �˾ƺ���.
-- �׷��Լ��� ����ϸ� �� �׷캰 �հ� �� ���,
-- �׷캰 �հ�Ӹ� �ƴ϶� �Ѱ���� ���� ���� ���

SELECT NVL(DEPT_CODE,'�Ѱ�'), SUM(SALARY)
FROM EMPLOYEE
WHERE DEPT_CODE IS NOT NULL
--GROUP BY DEPT_CODE;
--GROUP BY ROLLUP(DEPT_CODE);
GROUP BY CUBE(DEPT_CODE);

-- ��å�� �ο����� ���ο����� ���Ͻÿ� �ο����� 4���̻��� �μ���..
SELECT JOB_CODE, COUNT(*)
FROM EMPLOYEE
GROUP BY ROLLUP(JOB_CODE)
HAVING COUNT(*)>=4;



-- ROLLUP, CUBE�� �Ѱ��̻��� �÷��� ����.
SELECT DEPT_CODE, JOB_CODE, SUM(SALARY)
FROM EMPLOYEE
WHERE DEPT_CODE IS NOT NULL
GROUP BY ROLLUP(DEPT_CODE, JOB_CODE);

-- CUBE 
SELECT DEPT_CODE, JOB_CODE, SUM(SALARY)
FROM EMPLOYEE
WHERE DEPT_CODE IS NOT NULL
GROUP BY CUBE(DEPT_CODE, JOB_CODE)
ORDER BY 1;

-- GROUPING() : ����(���)�Ȱ��� ROLLUP, CUBE�� �Ȱ����� Ȯ���ϴ� �Լ�
-- ROLLUP/CUBE�� ����� �÷��̸� 1��ȯ �ƴϸ� 0
SELECT DEPT_CODE, COUNT(*), GROUPING(DEPT_CODE)
FROM EMPLOYEE
WHERE DEPT_CODE IS NOT NULL
GROUP BY ROLLUP(DEPT_CODE);

--CUBE �ΰ� �÷����� GROUPING() �̿��غ���
SELECT DEPT_CODE, JOB_CODE, COUNT(*),
            CASE 
                WHEN GROUPING(DEPT_CODE)=0 AND GROUPING(JOB_CODE)=1 THEN '�μ����հ�'
                WHEN GROUPING(DEPT_CODE)=1 AND GROUPING(JOB_CODE)=0 THEN '��å���հ�'
                WHEN GROUPING(DEPT_CODE)=1 AND GROUPING(JOB_CODE)=1 THEN '���հ�'
                ELSE '�׷캰�հ�' 
            END AS ����
FROM EMPLOYEE
WHERE DEPT_CODE IS NOT NULL
GROUP BY CUBE(DEPT_CODE, JOB_CODE)
ORDER BY 1;

-- ���տ�����
-- �������� SELECT���� ���(RESULTSET)�� ��ġ�� ����
-- ����
-- 1. RESULTSET�� �÷��� ������ ���ƾ���. 
-- 2. RESULTSET�� �÷��� Ÿ�Ե� ���ƾ���. * �����ʹ� ������ �ʿ�� ����.
--    -> �÷���, �÷�Ÿ���� ������ �� ó�� RESULTSET�� �������� �Ѵ�.
-- 3. ���ų� ���÷��̸� ���ͷ��� ǥ�ð���


-- UNION : �ΰ��̻��� SELECT��(RESULTSET)�� �������̴�.
-- �ߺ����� �Ѱ��� ǥ����.

SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE='D5'
UNION
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY>3000000
UNION
SELECT DEPT_ID, DEPT_TITLE, LOCATION_ID, 0
FROM DEPARTMENT
MINUS
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE;



--UNION ALL : ������.
-- �ߺ����� ��� ǥ����.
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE='D5'
UNION ALL
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY>3000000;


-- MINUS :  ������ ù��° SELECT��(RESULTSET) �ι�° SELECT��(RESULTSET)�� ���� ��
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE='D5'
MINUS
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY>3000000;


--INTERSECT : ������ �ߺ����� ���
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE='D5'
INTERSECT
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY>3000000;


--���κ� �޿�, �μ��� �հ�, �μ��� ���
SELECT '����' AS DIV, NVL(DEPT_CODE,'����'), SALARY
FROM EMPLOYEE
UNION
SELECT '�μ�', NVL(DEPT_CODE,'����'), SUM(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_CODE
UNION
SELECT '�μ����',NVL(DEPT_CODE,'����'), FLOOR(AVG(SALARY))
FROM EMPLOYEE
GROUP BY DEPT_CODE;


--GROUPING SETS :  GROUP BY�� ���Ե� ������ ������ �����.

SELECT DEPT_CODE, MANAGER_ID, COUNT(*)
FROM EMPLOYEE
GROUP BY DEPT_CODE, MANAGER_ID;

SELECT DEPT_CODE, JOB_CODE, MANAGER_ID, COUNT(*)
FROM EMPLOYEE
GROUP BY DEPT_CODE, JOB_CODE, MANAGER_ID;

SELECT JOB_CODE, MANAGER_ID, COUNT(*)
 FROM EMPLOYEE
 GROUP BY JOB_CODE, MANAGER_ID;


SELECT DEPT_CODE, JOB_CODE, MANAGER_ID, COUNT(*)
FROM EMPLOYEE
WHERE DEPT_CODE IS NOT NULL 
            AND MANAGER_ID IS NOT NULL
GROUP BY GROUPING SETS(
            (DEPT_CODE, JOB_CODE, MANAGER_ID),
            (DEPT_CODE,MANAGER_ID),
            (JOB_CODE,MANAGER_ID)
        );

-- JOIN ������!
-- �������� �μ����� �������
SELECT EMP_NAME, DEPT_CODE
FROM EMPLOYEE
WHERE EMP_NAME='������';
SELECT *
FROM DEPARTMENT
WHERE DEPT_ID='D9';

--�ΰ��� ���̺��� ��ĥ�� JOIN�� �����.
-- ����Ŭ ����
SELECT EMP_NAME, DEPT_TITLE
FROM EMPLOYEE, DEPARTMENT
WHERE DEPT_CODE=DEPT_ID AND EMP_NAME='������';

-- ANSI����
SELECT EMP_NAME, DEPT_TITLE
FROM EMPLOYEE JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID
WHERE EMP_NAME='������';


--������ �Ҷ� �����̵Ǵ� �÷����� �����ϴٸ�
SELECT * FROM EMPLOYEE;--JOB_CODE
SELECT * FROM JOB;-- JOB_CODE

SELECT JOB_CODE
FROM EMPLOYEE E JOIN JOB J
        --ON EMPLOYEE.JOB_CODE=JOB.JOB_CODE;
--            ON E.JOB_CODE=J.JOB_CODE;
-- USING�� �̿��ؼ� ó���� �� ����.
           USING(JOB_CODE);

--������� �������� ����ϼ���. LOCATION, NATIONAL ���̺�
SELECT * FROM LOCATION;
SELECT * FROM NATIONAL;

SELECT LOCAL_NAME AS ������, NATIONAL_NAME ������
FROM LOCATION JOIN NATIONAL USING(NATIONAL_CODE);
--�μ���� �������� ����ϼ���. DEPARTMENT, LOCATION ���̺� �̿�.
SELECT * FROM DEPARTMENT;
SELECT * FROM LOCATION;

SELECT DEPT_TITLE, LOCAL_NAME
FROM DEPARTMENT JOIN LOCATION ON LOCATION_ID=LOCAL_CODE;


--INNER JOIN, OUTER JOIN
--�⺻����  JOIN�� ����ϸ� INNER JOIN��.
SELECT * FROM EMPLOYEE;
SELECT * FROM DEPARTMENT;
SELECT *
FROM EMPLOYEE  JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID;
SELECT *
FROM DEPARTMENT JOIN EMPLOYEE ON DEPT_CODE=DEPT_ID
ORDER BY 1;


-- OUTER JOIN
-- LEFT : FROM ���̺� ��������  FROM ���̺�A JOIN ���̺�B
-- RIGHT : JOIN ���̺� ��������  FROM ���̺�A JOIN ���̺�B

SELECT *
--FROM EMPLOYEE LEFT OUTER JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID;
--FROM EMPLOYEE LEFT JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID;
--����Ŭ�� LEFT ����
FROM EMPLOYEE , DEPARTMENT
WHERE DEPT_CODE=DEPT_ID(+);

SELECT DEPT_TITLE
--FROM EMPLOYEE RIGHT OUTER JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID;
--FROM EMPLOYEE RIGHT JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID
FROM EMPLOYEE, DEPARTMENT
WHERE DEPT_ID=DEPT_CODE(+)
GROUP BY DEPT_TITLE;
--WHERE DEPT_TITLE LIKE '�ؿ�%';


--CROSS JOIN -> ��üROW �� ��Ī���Ѽ� ���̺��� ����
SELECT EMP_ID, DEPT_CODE, EMP_NAME, DEPT_TITLE
FROM EMPLOYEE CROSS JOIN DEPARTMENT
ORDER BY 1;


-- SELF JOIN : ���� ���� ���� ������ �ִ� ���� �ٸ� �÷��� �־���Ѵ�.
SELECT EMP_ID, MANAGER_ID
FROM EMPLOYEE;

--�Ŵ����� �ִ� ����� �̸���, �Ŵ��� �̸��� ��ȸ�ϱ�.

-- ��������� ������ �ִ� ���̺� -> EMPLOYEE;
-- �Ŵ����� ��� -> EMPLOYEE;

SELECT E.EMP_NAME AS �����, M.EMP_NAME AS �Ŵ�����
FROM EMPLOYEE E 
        JOIN EMPLOYEE M ON  E.MANAGER_ID=M.EMP_ID;
        
-- �Ŵ����� �ִ� ����� �Ŵ����� EMP_ID, �̸����
-- ���� ����� EMP_ID 000, �̸� ���� ���
SELECT E.EMP_NAME, NVL(M.EMP_ID,'000'),NVL(M.EMP_NAME,'����')
FROM EMPLOYEE E 
            LEFT JOIN EMPLOYEE M ON E.MANAGER_ID=M.EMP_ID; 

-- ����JOIN  �ΰ� �̻��� ���̺��� �����ϴ� ��
-- �����, �μ���, �ٹ��ϰ� �ִ� �������� ��ȸ����
SELECT DEPT_TITLE, E.*,LOCATION.*
FROM EMPLOYEE E 
            LEFT JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID
            LEFT JOIN LOCATION ON LOCAL_CODE=LOCATION_ID
            JOIN JOB J ON(J.JOB_CODE=E.JOB_CODE);
   
            
-- ������ �븮�̸鼭, ASIA ������ �ٹ��ϴ� ���� ��ȸ
-- ���, �̸� ,���޸�, �μ���, �ٹ�������, �޿�
-- �޿��� �̻ڰ� ��� ��ȭǥ��, ','
SELECT EMP_ID AS ���, EMP_NAME AS �̸�, JOB_NAME AS ���޸�, DEPT_TITLE AS �μ���, 
        LOCAL_NAME AS �ٹ�������, TO_CHAR(SALARY,'L999,999,999') AS �޿�
FROM EMPLOYEE E
            JOIN DEPARTMENT D ON DEPT_CODE=DEPT_ID
            JOIN JOB J ON J.JOB_CODE=E.JOB_CODE
            JOIN LOCATION L ON LOCATION_ID=LOCAL_CODE
WHERE JOB_NAME='�븮' AND LOCAL_NAME LIKE '%ASIA%';
-- EQUI JOIN

-- NON_EQUI JOIN : ������ �÷��� ������ �񱳸� �ϴ°��� �ƴ϶� �����÷��� ���ϴ°�
SELECT * FROM EMPLOYEE;
SELECT * FROM SAL_GRADE;

SELECT *
FROM EMPLOYEE E 
        JOIN SAL_GRADE ON (E.SALARY BETWEEN SAL_GRADE.MIN_SAL AND SAL_GRADE.MAX_SAL);


-- �������� : �ϳ��� SELECT��(MAIN����)�ȿ� �ٸ� SELECT��(��������)�� �ִ� ��
-- ���������� ���������� ��������.
-- ���������� �ݵ�� ()�� ���������. -> 
-- ���������� �������� �����ʿ� ��ġ�ؾ���.
-- ���������� ORDER BY ���� ������ �ȵ�.


--�������� �Ŵ�������� �̸��� ��ȸ�ϼ���
SELECT E.EMP_ID, E.EMP_NAME, E.MANAGER_ID, M.EMP_NAME
FROM EMPLOYEE E
            JOIN EMPLOYEE M ON E.MANAGER_ID=M.EMP_ID
WHERE E.EMP_NAME='������';


--�������� ����
SELECT EMP_NAME
FROM EMPLOYEE
WHERE EMP_ID=(SELECT MANAGER_ID FROM EMPLOYEE WHERE EMP_NAME='������');


-- ��ü����� ��ձ޿����� ���� �޴� ����� �̸�, �μ��ڵ�, ���� ��ȸ�ϱ�
SELECT AVG(SALARY) FROM EMPLOYEE;
SELECT EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY>(SELECT AVG(SALARY) FROM EMPLOYEE);





SELECT * FROM DBA_USERS;
--��й�ȣ�� �������ָ��.
ALTER USER TEST IDENTIFIED BY TEST;


-- ������ �������� : ���������� RESULTSET�� �Ѱ� ROW �Ѱ� COLUMN�� ��

SELECT EMP_NAME
FROM EMPLOYEE
WHERE EMP_ID=(SELECT MANAGER_ID FROM EMPLOYEE WHERE EMP_NAME='������');

SELECT EMP_NAME, SALARY
FROM EMPLOYEE
WHERE SALARY>=(SELECT AVG(SALARY) FROM EMPLOYEE);

--��ü ����� �ּұ޿��� �ް� �ִ� ����� �̸�, �μ��ڵ�, ��å�ڵ� ������ ��ȸ�ϱ�
SELECT MIN(SALARY) FROM EMPLOYEE;
SELECT EMP_NAME, DEPT_CODE,JOB_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY = (SELECT MIN(SALARY) FROM EMPLOYEE);

-- �ִ�޿��� �ް� �ִ� ����� �����ض� ���� �޿��� �޴� ��� ��ȸ�ϱ�
-- �����, �μ��ڵ�, ��å�ڵ�, �޿�
SELECT EMP_NAME, DEPT_CODE, JOB_CODE, SALARY
FROM EMPLOYEE 
WHERE SALARY=(SELECT MAX(SALARY) FROM EMPLOYEE) 
            OR (SALARY=(SELECT SALARY FROM EMPLOYEE WHERE EMP_NAME='������')
            AND EMP_NAME != '������');

-- ������ �������� : ���������� ���(RESULTSET) �Ѱ��÷� �ټ�ROW�϶�
SELECT DEPT_CODE FROM EMPLOYEE WHERE EMP_NAME IN ('������','������');

SELECT EMP_NAME, DEPT_CODE
FROM EMPLOYEE 
--WHERE DEPT_CODE = (SELECT DEPT_CODE FROM EMPLOYEE WHERE EMP_NAME IN('������','������')); X
--WHERE DEPT_CODE IN (SELECT DEPT_CODE FROM EMPLOYEE WHERE EMP_NAME IN('������','������'));
--WHERE  DEPT_CODE IN('D9','D5');
--����
WHERE DEPT_CODE NOT IN (SELECT DEPT_CODE FROM EMPLOYEE WHERE EMP_NAME IN('������','������'));

-- ��å�� ��ǥ, �λ����� ������ ����� �����, �μ���, ��å�� ����ϱ�
-- SELECT * FROM EMPLOYEE WHERE JOB_CODE NOT IN ('J1','J2');
SELECT EMP_NAME,DEPT_TITLE,JOB_NAME
FROM EMPLOYEE 
            JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID
            JOIN JOB USING(JOB_CODE)
WHERE JOB_CODE NOT IN (SELECT JOB_CODE 
                                                FROM EMPLOYEE 
                                                JOIN JOB USING(JOB_CODE) 
                                                WHERE JOB_NAME IN('��ǥ','�λ���'));

--������ ��ǥ, �λ����� �ƴ� ASIA1���� �ٹ��ϴ� ��� ��ȸ�ϱ�
SELECT * 
FROM EMPLOYEE
WHERE JOB_CODE NOT IN (SELECT JOB_CODE 
                                                FROM JOB 
                                                WHERE JOB_NAME IN('��ǥ','�λ���'))
--            AND DEPT_CODE IN (SELECT DEPT_ID 
--                                                FROM DEPARTMENT
--                                                JOIN LOCATION ON LOCATION_ID=LOCAL_CODE
--                                                WHERE LOCAL_NAME='ASIA1');
            AND DEPT_CODE IN (SELECT DEPT_ID 
                                                FROM DEPARTMENT
                                                WHERE LOCATION_ID IN (SELECT LOCAL_CODE 
                                                                                            FROM LOCATION 
                                                                                            WHERE LOCAL_NAME='ASIA1'));

-- ������ ���������� ��������� ���� ������� OR�� ��� ó���Ѵ�.

-- ��Һ��ϱ�
-- ANY / ALL ���߰��� ���� ��Һ񱳸� �� �� �ִ� �����
-- ANY : RESULTSET���� ���°��� OR�����ؼ� ��Һ񱳸� ��.
-- X > ANY(�����༭������)  : ANY�� �ִ� � ������ x�� ũ�⸸ �ϸ� ��, -> �ּҰ����� ũ�� ��.

--D5, D6�μ� ����� �����޿��� �޴� ������� ���� �޿��� �޴� ����� �̸� ���� �μ��ڵ带 ��ȸ
SELECT SALARY FROM EMPLOYEE WHERE DEPT_CODE IN ('D6','D5') ORDER BY SALARY;

SELECT EMP_NAME, SALARY, DEPT_CODE
FROM EMPLOYEE
WHERE SALARY > ANY(SELECT SALARY FROM EMPLOYEE WHERE DEPT_CODE IN ('D6','D5'));

-- ��å�� J3, J5�� ����� �� �ּұ޿����� ���� �޴� ��� ��ȸ
-- ��ü�÷�
SELECT *
FROM EMPLOYEE
WHERE SALARY > ANY(SELECT SALARY FROM EMPLOYEE WHERE JOB_CODE IN ('J3','J5'));

-- X < ANY(��������) : ANY�� �ִ� ������� X�� �۱⸸�ϸ� �� -> �ִ밪���� ���� ��.
SELECT SALARY FROM EMPLOYEE WHERE JOB_CODE IN('J3','J5');

SELECT *
FROM EMPLOYEE
WHERE SALARY < ANY(SELECT SALARY FROM EMPLOYEE WHERE JOB_CODE IN('J3','J5'))
ORDER BY SALARY DESC;


-- ALL() : ��� ������ ũ��, �۴� -> AND
-- X>ALL() : ALL�� ��簪 ���� ū X�� �� -> ALL�� �ִ� ������ ū�͸� ��.
-- X<ALL() : ALL�� ��簪 ���� ���� X�� �� -> ALL�� �ּҰ����� �����͸� ��.

-- �μ��� D2,D5�� ����� �� �ִ�޿��� �޴� ������� �޿��� ���� �޴� ���
SELECT *
FROM EMPLOYEE
--WHERE SALARY > ALL(SELECT SALARY FROM EMPLOYEE WHERE DEPT_CODE IN ('D2','D5'));
WHERE SALARY > (SELECT MAX(SALARY) FROM EMPLOYEE WHERE DEPT_CODE='D2' OR  DEPT_CODE='D5');

--���߿� �������� : ���� �ټ�, ���� �Ѱ��� ��������.
--������ ������� ���� �μ�, ���� ���޿� �ش��ϴ� ��� ��ȸ
SELECT DEPT_CODE, JOB_CODE 
FROM EMPLOYEE 
WHERE ENT_YN='Y';

SELECT *
FROM EMPLOYEE
--WHERE DEPT_CODE=(SELECT DEPT_CODE FROM EMPLOYEE WHERE ENT_YN='Y')
--AND JOB_CODE=(SELECT JOB_CODE FROM EMPLOYEE WHERE ENT_YN='Y');--, JOB_CODE
WHERE (DEPT_CODE, JOB_CODE) 
            IN (SELECT DEPT_CODE, JOB_CODE FROM EMPLOYEE WHERE ENT_YN='Y');

--����������̸鼭 �޿��� 200�鸸���� ����� �̸�, �μ�,�ڵ� �޿� ��ȸ�ϱ�.
SELECT * FROM EMPLOYEE JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID 
WHERE SALARY=2000000 AND DEPT_TITLE='���������';
SELECT *
FROM EMPLOYEE
WHERE (DEPT_CODE, SALARY) IN (SELECT DEPT_CODE, SALARY FROM EMPLOYEE JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID 
                                                                WHERE SALARY=2000000 AND DEPT_TITLE='���������');

-- ������, ���߿� �������� : ���� �ټ�, �൵ �ټ�
-- �μ��� �ּұ޿� ���ϱ�
SELECT DEPT_CODE, MIN(SALARY)
FROM EMPLOYEE 
GROUP BY DEPT_CODE;

SELECT *
FROM EMPLOYEE
WHERE (DEPT_CODE,SALARY) IN (SELECT DEPT_CODE, MIN(SALARY)
                                                            FROM EMPLOYEE
                                                            GROUP BY DEPT_CODE);

--�μ��� �ִ�޿��� �޴� ����Ǵ� �ּұ޿��� �޴� ����� ��ȸ�ϱ�
-- �����, �μ���, �޿� ���
-- * NULL�� ���� �� �ְ�
SELECT DEPT_CODE, MAX(SALARY) FROM EMPLOYEE GROUP BY DEPT_CODE;
SELECT DEPT_CODE ,MIN(SALARY) FROM EMPLOYEE GROUP BY DEPT_CODE;
SELECT EMP_NAME, NVL(DEPT_TITLE,'����'), SALARY
FROM EMPLOYEE
   LEFT JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID
WHERE (NVL(DEPT_CODE,1), SALARY) IN (SELECT NVL(DEPT_CODE,1),MAX(SALARY) 
                                                            FROM EMPLOYEE GROUP BY DEPT_CODE)
             OR (NVL(DEPT_CODE,'����'),SALARY) IN (SELECT NVL(DEPT_CODE,'����'),MIN(SALARY)
                                                                FROM EMPLOYEE GROUP BY DEPT_CODE);

SELECT DEPT_CODE, COUNT(NULL) 
FROM EMPLOYEE
GROUP BY DEPT_CODE;


-- �����������(��ȣ����)
--���������� ���� �������� �ְ� ���������� ������ ���� �װ���� �ٽ� ���������� ��ȯ�ؼ� �����ϴ� ����(������ ���߷�����)
--> ���������� WHERE���� MAIN������ ���� ������ ��

--> ���������� �ִ� ��(�÷���)�� ����������(WHERE) ������ ���� �������
--> ������������� ���������� ������ �Ұ����� ��������

-- EXISTS : ���������� ����� ������ -> ROW�� ������ TRUE / ROW�� 0���� FALSE

SELECT * FROM EMPLOYEE
WHERE EXISTS (SELECT 1 FROM EMPLOYEE WHERE EMP_ID='200');

SELECT * FROM EMPLOYEE E
WHERE EXISTS(SELECT EMP_NAME FROM EMPLOYEE WHERE MANAGER_ID=E.EMP_ID);

-- ������������� DEPT_CODE�� �ִ� ����� ����ϱ�
-- IS NOT NULL /NULL �Ǵ� JOIN������� �ʱ�
-- �̸�. DEPT_CODE
SELECT EMP_NAME,DEPT_CODE
FROM EMPLOYEE E
WHERE EXISTS(SELECT DEPT_CODE FROM DEPARTMENT WHERE DEPT_ID=E.DEPT_CODE);

-- �޿��� ���帹�� �޴� ����� ������������� ���غ���.
-- �����, �޿�
SELECT EMP_NAME, SALARY
FROM EMPLOYEE E
WHERE NOT EXISTS(SELECT '����' FROM EMPLOYEE WHERE SALARY>E.SALARY);


--������ J1,J2,J3�� �ƴ� ��� �߿��� �ڽ��� �μ��� ��ձ޿����� ���� �޿��� �޴� ���
SELECT *
FROM EMPLOYEE E
WHERE JOB_CODE NOT IN('J1','J2','J3')
            AND SALARY>(SELECT AVG(SALARY) FROM EMPLOYEE WHERE DEPT_CODE=E.DEPT_CODE);


-- ��Į�� �������� : ������������ε�,, RESULTSET ������ �������� ��
-- �÷��ۼ��ϴ� ���� ��밡��, WHERE ���� ��밡��
-- ��� ����� �Ŵ����� �̸� ��ȸ -> �����ȣ, �����, �����ڹ�ȣ, �����ڸ�
SELECT EMP_ID, EMP_NAME, MANAGER_ID,
                NVL((SELECT EMP_NAME FROM EMPLOYEE WHERE EMP_ID=E.MANAGER_ID),'����')
FROM EMPLOYEE E;

--�����, �μ��ڵ�, �μ��� ����ӱ�(�ڱⰡ ���� �μ�)�� ��ȸ�ض�
SELECT EMP_NAME, DEPT_CODE,
            TO_CHAR(FLOOR((SELECT AVG(SALARY) 
                            FROM EMPLOYEE WHERE DEPT_CODE=E.DEPT_CODE)),'L999,999,999') AS �μ����
FROM EMPLOYEE E; 

-- �ڱⰡ ���� �μ��� ��ձ޿����� �� ������ ���� �޴� ����� ���ϼ���;
-- �̸�, �μ���, ����
SELECT EMP_NAME, DEPT_TITLE, SALARY
FROM EMPLOYEE E
        JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID 
WHERE SALARY>(SELECT AVG(SALARY) FROM EMPLOYEE WHERE DEPT_CODE=E.DEPT_CODE);



-- �ζ��� �� : FROM���� ���������� �ۼ��Ͽ� ���������� ����� ���̺�� ���� ��
-- ���� ���������̺� �ִ� ���� �ƴ� ������ ���̺��� ���̶�� ���� ��.
-- �ζ��� ��(INLINE VIEW) : 1���� ����� �� �ִ� ���̺�� ���̴� ���� ������
-- ������ ��(STORED VIEW) : ���̺�� ���̴� ������������ �����ϰ� �̸��� �ο��ؼ� ��ȣ�� �����ϰ��ϴ� �� -> VIEW

-- ������� ���, �����, �μ��ڵ�, ���� ����ϱ�
SELECT EMP_ID, EMP_NAME, DEPT_CODE,
            DECODE(SUBSTR(EMP_NO,8,1),'1','��','2','��') AS ����
FROM EMPLOYEE
WHERE DECODE(SUBSTR(EMP_NO,8,1),'1','��','2','��')='��';            

-- INLINE VIEW�� ó���ϸ� ��Ī�� �÷����� �̿��ؼ� ó���� �� �ִ�.
SELECT ����
FROM
            (SELECT EMP_ID, EMP_NAME, DEPT_CODE,
                            DECODE(SUBSTR(EMP_NO,8,1),'1','��','2','��') AS ����
            FROM EMPLOYEE)
WHERE ���� ='��';

SELECT *
FROM (
            SELECT EMP_NAME, DEPT_TITLE, JOB_NAME, SALARY, 
            FLOOR((SELECT AVG(SALARY) FROM EMPLOYEE WHERE E.JOB_CODE=JOB_CODE)) AS JOBAVG
            FROM EMPLOYEE E
                JOIN DEPARTMENT D ON E.DEPT_CODE=DEPT_ID
                JOIN JOB J ON E.JOB_CODE=J.JOB_CODE
            WHERE DEPT_CODE IN ('D5','D6')
            ORDER BY 1
            );
--WHERE JOBAVG >=3000000;
--            AND JOB_CODE IN ('J2','J5');        

SELECT EMP_ID, EMP_NAME
FROM EMPLOYEE
WHERE SALARY>3000000;


SELECT *
FROM
    (
        SELECT '�Ϲ�' AS DIV, GE_NO AS NO, GE_ID AS ID, GE_PW AS PW
        FROM GE
        UNION
        SELECT '�����', BU_NO, BU_ID, BU_PW
        FROM BU
        UNION
        SELECT '������',MA_NO,MA_ID,MA_PW
        FROM MA
    )
where id='admin' and pw='1234';

--TOP-N �м� : ������ �ο��ϴ� �� ��) �޿��� ���� �޴� TOP 3 / �޿��� ���� �޴� 3~6 ���
-- �޿��� ���� �޴� ��� 1~3�� ���� ��ȸ�ϱ�
SELECT EMP_NAME, SALARY 
FROM EMPLOYEE 
--WHERE --??? ����???
ORDER BY SALARY DESC;

-- 2���� ���
--1. ROWNUM �÷��� �̿��ϴ� ��� -> ����Ŭ�� �ڵ��� �������ִ� �÷� ��� SELECT�� ����� ���ԵǾ�����
--2. ����Ŭ �����Լ��̿��ϱ�(RANK())

SELECT ROWNUM, EMP_NAME, SALARY
FROM EMPLOYEE
--WHERE DEPT_CODE='D5';
WHERE ROWNUM <= 3
ORDER BY SALARY DESC;


--���ĵ� ROW�� �������� ROWNUM�� �ο��� �ɷ���....�Ф�
SELECT ROWNUM, E.*
FROM (
        SELECT EMP_NAME, SALARY
        FROM EMPLOYEE
        ORDER BY SALARY DESC
        ) E
WHERE ROWNUM <=3;


-- �޿��� ���� �޴� ��� 5�� 10����� ����ϱ�
SELECT *
FROM(
        SELECT ROWNUM AS RNUM, E.*
        FROM (
                SELECT EMP_NAME, SALARY
                FROM EMPLOYEE
                ORDER BY SALARY DESC
                ) E
        )
WHERE RNUM BETWEEN 5 AND 10; 

-- ROWNUM�� ������ �񱳸� �Ҷ��� ������ 1���� ������ �ؾ� ��.

-- �Խ��� �����Ҷ� -> PAGINGó���Ҷ� ����ϴ� SQL��!

--D5�μ��� ������ ���� �޴� ��� 3�� ��ȸ�ϱ�
-- �̸�, �μ���, �޿�, ����(���ʽ� ����)
SELECT * 
FROM(
    SELECT ROWNUM AS RNUM, E.*
    FROM    (
        SELECT EMP_NAME, DEPT_CODE, DEPT_TITLE, SALARY, (SALARY+(SALARY*NVL(BONUS,0)))*12 AS ����
        FROM EMPLOYEE JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID 
        WHERE DEPT_CODE='D5'
        --ORDER BY ����;
        ORDER BY 4 DESC
        ) E
    )
WHERE RNUM BETWEEN 1 AND 3;--DEPT_CODE='D5';-- 



-- �Լ��� �̿��ϱ�
-- RANK() OVER(���ı���) : �� ROW�� ������ �ο��ϴ� �Լ�
SELECT EMP_NAME, SALARY,
            RANK() OVER(ORDER BY SALARY DESC) AS ����
FROM EMPLOYEE;
--WHERE RANK() OVER(ORDER BY SALARY DESC) BETWEEN 1 AND 3;
SELECT *
FROM(
        SELECT EMP_NAME, SALARY,
                    RANK() OVER(ORDER BY SALARY DESC) AS ����
        FROM EMPLOYEE
        )
WHERE ���� BETWEEN 1 AND 3;

-- DENSE_RANK() OVER(���ı���)  :  �ߺ����� ������ ��ȣ�� 
SELECT RANK() OVER(ORDER BY SALARY) AS ����,
            EMP_NAME, SALARY,
            DENSE_RANK() OVER(ORDER BY SALARY) AS DENSE����
FROM EMPLOYEE;

-- ������ ���� : 
-- �� ROW�� ������ �� �ִ� COLUMN�� �־����.
-- ���, ���� ����� �� �̿��ϴ� ������.
SELECT EMP_ID, EMP_NAME, MANAGER_ID
FROM EMPLOYEE;

SELECT LEVEL, EMP_ID, EMP_NAME, MANAGER_ID
FROM EMPLOYEE
START WITH EMP_ID=200 -- ROOT�� �ֻ��� ROW 1��
CONNECT BY PRIOR EMP_ID=MANAGER_ID;

SELECT LEVEL||' '||LPAD(' ',(LEVEL-1)*5,' ')||EMP_NAME
                ||NVL2(MANAGER_ID,'('||MANAGER_ID||')','') AS ������
FROM EMPLOYEE
    --START WITH EMP_ID=200
    START WITH MANAGER_ID IS NULL
    CONNECT BY PRIOR EMP_ID=MANAGER_ID;
    
---- DQL ��! ------


-- ����Ŭ�� ���������� �˾ƺ���.
-- ������ : CHAR, VARCAHR2 -> ���ڿ��� �����Ҷ��� VARCHAR2�� ����ض�
-- CHAR, VARCHAR2���̴� ����, ����
-- CHAR : ������ ���ڿ� Ÿ������ ���̸�ŭ ������ Ȯ���Ͽ� ����Ѵ�.
-- VARCHAR2 :  ������ ���ڿ� Ÿ������ ���̸�ŭ ������ Ȯ������ �ʰ�, ���Ե� �����͸�ŭ ������ Ȯ��.

CREATE TABLE TBL_STR(
    A CHAR(6),
    B VARCHAR2(6)
);
SELECT * FROM TBL_STR;
INSERT INTO TBL_STR VALUES('ABC','ABC');
INSERT INTO TBL_STR VALUES('��','��');

SELECT LENGTHB(A), LENGTHB(B) FROM TBL_STR;

-- ������ :  NUMBER
-- ����, �Ǽ� ��� ����
-- NUMBER([PRECISION,SCALE]) * [] �κ��� �����ص� ��.
-- PRECISION : ǥ���Ҽ� �ִ� ��ü�ڸ���(����)(1~38)
-- SCALE : �Ҽ������� �ڸ���(-84~127)
CREATE TABLE TBL_NUM(
    A NUMBER,
    B NUMBER(5),
    C NUMBER(5,1),
    D NUMBER(5,-2)
);

SELECT * FROM TBL_NUM;
INSERT INTO TBL_NUM VALUES(1234.567,1234.567,1234.567,1234.567);
INSERT INTO TBL_NUM VALUES(1234.567,1234.567,1234.567,1254.567);
INSERT INTO TBL_NUM VALUES(1234.567,12340.467,1234.427,1254.567);


-- ��¥�� : DATE
CREATE TABLE TBL_DATE(
    BIRTHDAY DATE,
    DAY TIMESTAMP
);

INSERT INTO TBL_DATE VALUES(SYSDATE,SYSTIMESTAMP);
SELECT * FROM TBL_DATE;

INSERT INTO TBL_DATE VALUES('1920/08/15','21/11/15 12:11:00');



--�⺻ ���̺� �����ϱ�
--CREATE TABLE ���̺��( �÷��� �ڷ���, �÷��� �ڷ���,.......);
CREATE TABLE MEMBER (
    MEMBER_ID VARCHAR2(20),
    MEMBER_PWD VARCHAR2(20),
    MEMBER_NAME VARCHAR2(20)
);

-- ���̺� �÷��� COMMENTS �����ϱ�
-- COMMENT ON COLUMN ���̺�.�÷��� IS COMMENT����
COMMENT ON COLUMN MEMBER.MEMBER_ID IS 'ȸ�����̵�';
COMMENT ON COLUMN MEMBER.MEMBER_PWD IS 'ȸ�� ��й�ȣ';


SELECT * FROM USER_COL_COMMENTS
WHERE TABLE_NAME='MEMBER';

-- ������ ���̺� COMMENT�����ϱ�
SELECT * FROM USER_TAB_COMMENTS;
COMMENT ON TABLE MEMBER IS 'ȸ����������';

--���̺� �����
DROP TABLE TBL_STR;

-- ���̺�  �����͸� �����Ҷ� ����(����)�δ� ����� ���� �˾ƺ���
-- ��������

-- NOT NULL(C) : ������ �÷��� NULL ���� ������� �ʴ°� -> ����÷��� DEFAULT�� NULL�� ����ϰ� �Ǿ�����.
-- UNIQUE(U) : ������ �÷��� ���ԵǴ� ���� �ߺ����� �ʰ� �ϴ°� -> ��� ROW�� �ߺ����� ����
-- PRIMARY KEY(P) : �����͸� ������ �� �ִ� �÷��� �����ϴ� ������ �� �÷��� ������ Ư�� ROW(DATA)�� ã�� �� �ִ�.
--                           �Ѱ� ���̺� �ΰ��̻��� PK�� ������ �� ����. -> PK�� ���̺�� �Ѱ� ����
-- FOREIGN KEY(R) : ������ �÷��� ���� �ٸ� ���̺� �÷��� �ִ� ���� �����ϰ� �ϴ� ��. �ٸ� ���̺��� �÷��� ���� �ߺ��� �������.
-- CHECK(C) : ������ �÷��� ������ ���� ������ �� �ְ� �ϴ� �� ->Ư����, ������ ����

-- ���̺� ������ �������� Ȯ���ϱ�.
SELECT *
FROM USER_CONSTRAINTS;
SELECT * FROM USER_CONS_COLUMNS;

--���̺� ���� ���������� �˻��Ҷ��� �ΰ����̺��� �����ؼ� ���
SELECT CONSTRAINT_NAME, USER_CONSTRAINTS.TABLE_NAME, COLUMN_NAME, CONSTRAINT_TYPE
FROM USER_CONSTRAINTS JOIN USER_CONS_COLUMNS USING(CONSTRAINT_NAME)
WHERE USER_CONSTRAINTS.TABLE_NAME='EMPLOYEE';

--�������� �����غ���!
-- NOT NULL�������� �����ϱ�
INSERT INTO MEMBER VALUES(NULL,NULL,NULL);
SELECT * FROM MEMBER;
CREATE TABLE CONS_NN(
    USER_NO NUMBER,
    USER_NAME VARCHAR2(20),
    EROLL_DATE DATE
);

DROP TABLE CONS_NN;

-- ���������� �����ϴ� ������� �ΰ��� ����� ����
-- 1. �÷� �������� ���� -> �÷��� ������ ������ ���������� ����
-- 2. ���̺� �������� ���� -> �÷������� �� �ϰ� �������� ���������� ����

-- NOT NULL���������� �÷����������� ������ ������.
CREATE TABLE CONS_NN(
    USER_NO NUMBER NOT NULL,
    USER_NAME VARCHAR2(20) NOT NULL,
    EROLL_DATE DATE,
    NOT NULL(EROLL_DATE) --�ȵ�!
);

INSERT INTO CONS_NN VALUES(NULL,NULL,NULL);
INSERT INTO CONS_NN VALUES(1,'�����Ʊñ�',NULL);
INSERT INTO CONS_NN VALUES(1,NULL,NULL);

SELECT * FROM CONS_NN;

-- UNIQUE : �÷��� �ߺ����� �������� �ʰ� �ϴ� ����
CREATE TABLE TBL_USER(
    USER_NO NUMBER,
    USER_ID VARCHAR2(20),
    USER_PWD VARCHAR2(20),
    USER_NAME VARCHAR2(20),
    EMAIL VARCHAR2(20)
);
SELECT * FROM TBL_USER;
INSERT INTO TBL_USER VALUES(1, 'COMIC','12344','�谡��','GA@GA.COM');

--UNIQUE �������� �����ϱ�
CREATE TABLE TBL_USER_UQ(
    USER_NO NUMBER,
    USER_ID VARCHAR2(20) UNIQUE,
    USER_PWD VARCHAR2(20),
    USER_NAME VARCHAR2(20),
    EMAIL VARCHAR2(20) UNIQUE
);

SELECT * FROM TBL_USER_UQ;
INSERT INTO TBL_USER_UQ VALUES(1,'COMIC','1234','�谡��','GA@GA.COM');
INSERT INTO TBL_USER_UQ VALUES(1,'COMIC1','1234','�谡��','GA@GA.COM');
INSERT INTO TBL_USER_UQ VALUES(1,'COMIC1','1234','�谡��','GA1@GA1.COM');

-- NULL���� ��� ó���ɱ�?
INSERT INTO TBL_USER_UQ VALUES(2,NULL,'1234','�谡��','GA2@GA2.COM');
INSERT INTO TBL_USER_UQ VALUES(2,NULL,'1234','�谡��','GA3@GA3.COM');
SELECT * FROM TBL_USER_UQ;

-- ����Ŭ���� UNIQUE���������� NULL�� ó������ ����. -> ���ȸ��� ���� ó�� ������ �ٸ�.

-- ���̺������� UNIQUE�������� �����ϱ�
CREATE TABLE TBL_USER_UQ2(
    USER_NO NUMBER,
    USER_ID VARCHAR2(20),
    USER_PWD VARCHAR2(20),
    USER_NAME VARCHAR2(20),
    EMAIL VARCHAR2(20),
    UNIQUE(USER_ID)
    --UNIQUE(EMAIL)
);

SELECT * FROM TBL_USER_UQ2;
INSERT INTO TBL_USER_UQ2 VALUES(1,'USER1','USER1','������','U@U.COM');


-- UNIQUE���������� �Ѱ��̻��� �÷��� �����ϱ�
CREATE TABLE TBL_USER_UQ3(
    USER_NO NUMBER,
    USER_ID VARCHAR2(20),
    USER_PWD VARCHAR2(20),
    USER_NAME VARCHAR2(20),
    EMAIL VARCHAR2(20),
    UNIQUE(USER_ID, EMAIL)
);

SELECT * FROM TBL_USER_UQ3;
INSERT INTO TBL_USER_UQ3 VALUES(1,'USER11','USER11','������','U@U.COM');
INSERT INTO TBL_USER_UQ3 VALUES(1,'USER11','USER11','������','U1@U1.COM');
INSERT INTO TBL_USER_UQ3 VALUES(1,'USER12','USER11','������','U1@U1.COM');
INSERT INTO TBL_USER_UQ3 VALUES(1,'USER12','USER22','������','U@U.COM');
INSERT INTO TBL_USER_UQ3 VALUES(1,'USER11','USER22','������','U@U.COM');

-- ���������� ���÷��� �ΰ� �̻��� ������ �� ����.
CREATE TABLE TBL_USER_CONS(
    USER_NO NUMBER,
    USER_ID VARCHAR2(20) NOT NULL UNIQUE,
    USER_PWD VARCHAR2(20),
    USER_NAME VARCHAR2(20),
    EMAIL VARCHAR2(20),
    UNIQUE(USER_ID, EMAIL)
);

INSERT INTO TBL_USER_CONS VALUES(1,'USER1','USER1','������','U1@U1.COM');
INSERT INTO TBL_USER_CONS VALUES(1,NULL,'USER1','������','U1@U1.COM');
INSERT INTO TBL_USER_CONS VALUES(1,'USER1','USER1','������','U1@U1.COM');

SELECT * FROM TBL_USER_CONS;

-- PRIMARY KEY : 
-- �ߺ����� ����, NULL���� ���� �÷��� ������ -> �����ڰ�. ����
-- �Ѱ����̺�� �Ѱ� PK�� ������ ������.
-- ���̺���, �÷��������� ������ ������
-- �ڵ����� NOT NULL��������, UNIQUE���������� ������.

CREATE TABLE TBL_USER_PK(
    USER_NO NUMBER PRIMARY KEY,
    USER_ID VARCHAR2(20) UNIQUE,
    USER_PWD VARCHAR2(20) NOT NULL
);

DROP TABLE TBL_USER_PK;

CREATE TABLE TBL_USER_PK(
    USER_NO NUMBER,
    USER_ID VARCHAR2(20) UNIQUE,
    USER_PWD VARCHAR2(20) NOT NULL,
    PRIMARY KEY(USER_NO)--,
    --PRIMARY KEY(USER_ID)
);

SELECT * FROM TBL_USER_PK;
INSERT INTO TBL_USER_PK VALUES(1,'USER11','USER11');
INSERT INTO TBL_USER_PK VALUES(NULL,'USER11','USER11');
INSERT INTO TBL_USER_PK VALUES(1,'USER22','USER11');

-- PK �Ѱ� �÷����� �����Ѱ�???
-- �ΰ��̻� �÷����� ����� ������ -> ����Ű
-- ��ٱ���, 
-- ��ǰ, ��¥, ����, ���̵�, �ֹ���ȣ
CREATE TABLE TBL_ORDER(
    PRODUCT_NO NUMBER,
    USER_ID VARCHAR2(20),
    ORDER_DATE DATE,
    COUNT NUMBER,
    ORDER_NO NUMBER,
    PRIMARY KEY(PRODUCT_NO, USER_ID,ORDER_DATE)
);

INSERT INTO TBL_ORDER VALUES(1,'ADMIN','21/03/10',10,1);
INSERT INTO TBL_ORDER VALUES(2, NULL,'21/03/11',10,1);--NO
INSERT INTO TBL_ORDER VALUES(2, 'ADMIN','21/03/11',10,1);
INSERT INTO TBL_ORDER VALUES(2, 'USER1','21/03/10',10,1);
INSERT INTO TBL_ORDER VALUES(2, 'USER1','21/03/10',10,1);
INSERT INTO TBL_ORDER VALUES(2, 'USER1','21/03/10',20,1);
SELECT * FROM TBL_ORDER;

--�ܷ�Ű(FOREIGN KEY) : �ܺ����̺� �÷��� �ִ� ���� �����ؼ� �����÷��� ���� �����ϰ� �ϴ� ��.
-- ī�װ�, �μ���, �а���
-- �θ�, �ڽ� ���谡 ����.


--�Խ���
CREATE TABLE BOARD(
    BOARD_NO NUMBER,
    BOARD_TITLE VARCHAR2(20) NOT NULL,
    BOARD_CONTENT VARCHAR2(2000),
    BOARD_WRITER VARCHAR2(20) REFERENCES MEMBER(USER_ID),
    BOARD_DATE DATE
);
DROP TABLE MEMBER;
CREATE TABLE MEMBER (
    USER_ID VARCHAR2(20) NOT NULL UNIQUE,
    USER_PWD VARCHAR2(20)
);
INSERT INTO MEMBER VALUES('USER01','USER01');
INSERT INTO MEMBER VALUES('USER02','USER01');
SELECT * FROM MEMBER;
INSERT INTO BOARD VALUES(1,'�̰�(�ù�)',NULL,'USER01',SYSDATE);

INSERT INTO BOARD VALUES(2,'�̰�(�ù�)',NULL,'USER02',SYSDATE);

SELECT * FROM BOARD;


-- 
CREATE TABLE SHOP_BUY(
    BUY_NO NUMBER PRIMARY KEY,
    USER_ID VARCHAR2(20) NOT NULL,
    PRODUCT_NAME VARCHAR2(50),
    REG_DATE DATE,
    FOREIGN KEY(USER_ID) REFERENCES MEMBER2(USER_ID)
);

SELECT * FROM SHOP_BUY;
INSERT INTO SHOP_BUY VALUES(2,'USER55','������',SYSDATE);

-- FOREIGN KEY���������� �����Ҷ��� ����
-- �����Ǵ� �÷����� UNIQUE���������� ������ �Ǿ��־����.

CREATE TABLE MEMBER2(
    USER_ID VARCHAR2(20) UNIQUE,
    USER_PWD VARCHAR2(20)
);
DROP TABLE MEMBER2;
DROP TABLE SHOP_BUY;


-- �Ժη� �����͸� �������� ���ϰ� ����� ���� -> ������ ���� ������ ����.
SELECT * FROM BOARD;
--�����ǰ� �ִ� ���� ���� �غ���.
SELECT * FROM MEMBER;

DELETE FROM MEMBER WHERE USER_ID='USER01';
DELETE FROM BOARD WHERE BOARD_WRITER='USER01';

DROP TABLE MEMBER;

-- DATA �������迡 ������ ������ ����. -> �ɼ����� ������ �����ϰ� ���� �� ����.
-- FOREIGN KEY ���� ������ �����Ҷ� �ɼ��� �����ϸ��.
-- ON DELETE SET NULL / ON DELETE CASCADE
CREATE TABLE SHOP_BUY(
    BUY_NO NUMBER PRIMARY KEY,
    USER_ID VARCHAR2(20),
    PRODUCT_NAME VARCHAR2(50),
    REG_DATE DATE,
    FOREIGN KEY(USER_ID) REFERENCES MEMBER2(USER_ID) ON DELETE CASCADE
    --ON DELETE SET NULL
);
DROP TABLE SHOP_BUY;

INSERT INTO MEMBER2 VALUES('USER01','USER01');
INSERT INTO MEMBER2 VALUES('USER02','USER02');
INSERT INTO SHOP_BUY VALUES(1,'USER01','����罺�Թ���',SYSDATE);
SELECT * FROM SHOP_BUY;
SELECT * FROM MEMBER2;
DELETE FROM MEMBER2 WHERE USER_ID='USER01';

-- CHECK��������. ���� ������ ���� ������ �� �ְ� �ϴ°�
-- ��ġ�ϴ� ��, ����
CREATE TABLE USER_CHECK(
        USER_NO NUMBER,
        USER_NAME VARCHAR2(20),
        GENDER VARCHAR2(10) CHECK(GENDER IN('��','��')),
        AGE NUMBER,
        CHECK(AGE BETWEEN 17 AND 19 AND USER_NO>10)
);

DROP TABLE USER_CHECK;

INSERT INTO USER_CHECK VALUES(1,'������','M',19);
INSERT INTO USER_CHECK VALUES(11,'������','��',19);
INSERT INTO USER_CHECK VALUES(1,'������','��',17);
INSERT INTO USER_CHECK VALUES(1,'������','����',19);
INSERT INTO USER_CHECK VALUES(1,'������','��',19);
SELECT * FROM USER_CHECK;


-- ���������� �����Ҷ� �������Ǹ� �ο��ϱ�

SELECT * 
FROM USER_CONS_COLUMNS;

CREATE TABLE CONS_NAME(
    USER_ID VARCHAR2(20) CONSTRAINT  CONS_NAME_PK PRIMARY KEY,
    USER_NAME VARCHAR2(20),
    CONSTRAINT USER_NAME_UQ UNIQUE(USER_NAME)
);

SELECT * 
FROM USER_CONS_COLUMNS
WHERE TABLE_NAME='CONS_NAME';

--TEST_MEMBER ���̺�
--MEMBER_CODE(NUMBER) - �⺻Ű						-- ȸ�������ڵ� 
--MEMBER_ID (varchar2(20) ) - �ߺ�����					-- ȸ�� ���̵�
--MEMBER_PWD (char(20)) - NULL �� ������					-- ȸ�� ��й�ȣ
--MEMBER_NAME(nchar(10)) 							-- ȸ�� �̸�
--MEMBER_ADDR (char(50)) - NULL�� ������					-- ȸ�� ������
--GENDER (varchar2(5)) - '��' Ȥ�� '��'�θ� �Է� ����				-- ����
--PHONE(varchar2(20)) - NULL �� ������ 					-- ȸ�� ����ó

--���������� �̿��ؼ� ���̺� �����
--�ۼ����
--CREATE TABLE ���̺��([�÷���,�÷���....])
--AS ��������
--���̺� ����,,
CREATE TABLE EMP_COPY
AS SELECT * FROM EMPLOYEE;
SELECT * FROM EMP_COPY;
DROP TABLE EMP_COPY;

--����� �����͸� ���� ���̺� �������Ϸ���
CREATE TABLE EMP_COPY
AS SELECT EMP_NAME,DEPT_CODE,JOB_CODE,SALARY
FROM EMPLOYEE WHERE 1=2;
SELECT * FROM EMP_COPY;

--INSERT�� Ȱ���ϱ�
--Ư�����̺� �Ѱ� ROW�� �߰��ϴ� ����
--�ѹ��� �Ѱ������͸� ������ ������
--1.������ �÷����� �����͸� �߰��ϴ� ���-> �����ȵ� �÷��� ����? NULL
--INSERT INTO ���̺��(�����÷�1,�����÷�2,�����÷�3,,,,)VALUES(��1,��2,��3,,,,);
--2.��ü �÷��� �����͸� �߰��ϴ� ���->���̺� �ִ� ��ü�÷��� ���� ���ۼ��ؾ���
--INSERT INTO ���̺�� VALUES(�÷�1,�÷�2��,�ö�3��,,,,);

--DERARTMENT�� ���߰��ϱ�
SELECT *FROM DEPARTMENT;
--INSERT INTO DEPARTMENT(DEPT_ID,DEPT_TITLE)
INSERT INTO DEPARTMENT(DEPT_ID,LOCATION_ID)
VALUES('A1','L3');

--EMPLOYEE���̺� �ڽ��� ������ �Է��ϱ�
--��ü �÷��� ���� �Է�
--�ʼ� �÷��� ���� �Է�)NOT NULL
SELECT * FROM EMPLOYEE;
INSERT INTO EMPLOYEE VALUES('223','��ȿ��','950303-111111','DLGYGUD@NAVER.COM','01065231715'
,'D3','J3','S1',7000000,0.2,'203',SYSDATE,NULL,'N');
INSERT INTO EMPLOYEE(EMP_ID,EMP_NAME,EMP_NO,JOB_CODE,SAL_LEVEL)
VALUES('223','��ȿ��','950303-111111','J3','S1');

--INSERT���� ���������� �̿��غ���
CREATE TABLE INSERT_TSER
AS SELECT EMP_ID,EMP_NAME,DEPT_TITLE
FROM EMPLOYEE JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID
WHERE 1=2;
SELECT * FROM INSERT_TSER;
INSERT INTO INSERT_TSER VALUES(1,'������','������');
--���������� �̿��ؼ� ������ �ִ� �����͸� �����ؼ� �־��
INSERT INTO INSERT_TSER(SELECT EMP_ID,EMP_NAME,DEPT_TITLE
                        FROM EMPLOYEE JOIN DEPARTMENT ON DEPT_ID=DEPT_CODE
                        WHERE DEPT_CODE='D5');
--INSERT ALL: �ΰ��̻��� ���̺� �Ѱ��� SELECT���� ����� ���� ���� ������ ���  
CREATE TABLE EMP_HIRE_DATE
AS SELECT EMP_ID,EMP_NAME,HIRE_DATE
FROM EMPLOYEE WHERE 1=0;
CREATE TABLE EMP_MANAGE
AS SELECT EMP_ID,EMP_NAME,MANAGER_ID
FROM EMPLOYEE WHERE 1=0;

INSERT ALL
INTO EMP_HIRE_DATE VALUES(EMP_ID,EMP_NAME,HIRE_DATE)
INTO EMP_MANAGE VALUES(EMP_ID,EMP_NAME,MANAGER_ID)
SELECT EMP_ID,EMP_NAME,HIRE_DATE,MANAGER_ID
FROM EMPLOYEE;

--INSERT ALL�� ���ǿ� ���� �и��ؼ� �����ϱ�
CREATE TABLE EMP_OLD
AS SELECT EMP_ID,EMP_NAME,SALARY,HIRE_DATE
FROM EMPLOYEE WHERE 1=0;

CREATE TABLE EMP_NEW
AS SELECT EMP_ID,EMP_NAME,SALARY,HIRE_DATE
FROM EMPLOYEE WHERE 1=0;

SELECT *FROM EMP_OLD;
SELECT * FROM EMP_NEW;

INSERT ALL
WHEN '00/01/01'>HIRE_DATE THEN INTO EMP_OLD VALUES(EMP_ID,EMP_NAME,SALARY,HIRE_DATE)
WHEN '00/01/01'<=HIRE_DATE THEN INTO EMP_NEW VALUES(EMP_ID,EMP_NAME,SALARY,HIRE_DATE)
SELECT EMP_ID,EMP_NAME,SALARY,HIRE_DATE
FROM EMPLOYEE;

--UPDATE��:�Ѱ� �Ǵ� ���̻��� ROW�� ���� �����ϴ� ��¾�
--UPDATE ���̺�� SET �������÷�=�����Ұ�,������ �÷�=������ ��,,,,, [WHERE ���ǽ�] *WHERE�� ����������!
CREATE TABLE DEPT_COPY
AS SELECT * FROM DEPARTMENT;
SELECT * FROM DEPT_COPY;

UPDATE DEPT_COPY SET DEPT_TITLE='�ڹٰ��ߺ�'WHERE DEPT_ID='A1';
--���࿡ UPDATE������ WHERE���� ���� �ʴ� �ٸ�??->�ݵ�� WHERE�� ���
UPDATE DEPT_COPY SET DEPT_TITLE='�ȳ� ������!';
ROLLBACK;

--UPDATE������ �������� ����ϱ�
--WHERE���� ���,�����ϴ� ������ ���
DROP TABLE EMP_COPY;
CREATE TABLE EMP_COPY
AS SELECT * FROM EMPLOYEE;
--�޿��� 200���� �̸��� ����� ���ʽ��� 0.4�����ϱ�
UPDATE EMP_COPY SET BONUS=0.4 WHERE SALARY<2000000;
SELECT * FROM EMP_COPY WHERE SALARY<2000000;

--������ ������ �ɺ����� ���ް� �����ϰ� �����ϱ�
UPDATE EMP_COPY SET SALARY=(SELECT SALARY FROM EMP_COPY WHERE EMP_NAME='�ɺ���')
WHERE EMP_NAME='����';
SELECT * FROM EMP_COPY;

--������ ���ް� ���ʽ��� �������� ���ް� ���ʽ��� ���� �����ϱ�
UPDATE EMP_COPY 
--SET 
--SALARY=(SELECT SALARY FROM EMP_COPY WHERE EMP_NAME='������'),
--BONUS=(SELECT BONUS FROM EMP_COPY WHERE EMP_NAME='������') 
SET(SALARY,BONUS)=(SELECT SALARY,BONUS FROM EMP_COPY WHERE EMP_NAME='������')
WHERE EMP_NAME='����';

--�ӽ�ȯ ����� ������ ����, �μ��� �ؿܿ��� 3�η� �����ϴ� ������ �ۼ�
UPDATE EMP_COPY 
--SET JOB_CODE=(SELECT JOB_CODE FROM JOB WHERE JOB_NAEM='����'),
--DEPT_CODE=(SELECT DEPT_CODE FROM DEPARTMENT WHERE DEPT_TITLE='�ؿܿ���3��')
SET (JOB_CODE,DEPT_CODE)=(SELECT JOB_CODE,DEPT_ID FROM JOB CROSS JOIN DEPARTMENT
                            WHERE JOB_NAME='����' AND DEPT_TITLE='�ؿܿ���3��')
WHERE EMP_NAME='�ӽ�ȯ';
ROLLBACK;

--DELETE: ���ǿ� �´� ROW�� �����ϴ� ��¾�\
--DELETE FROM ���̺� [WHERE ���ǽ�] *WHERE�� �����ϸ� ��ü�� ����°�
SELECT *FROM EMP_COPY;
DELETE FROM EMP_COPY WHERE EMP_NAME='��ȿ��';

--���ʽ��� ���� �ʴ� ����� ����
DELETE FROM EMP_COPY WHERE BONUS IS NULL;

--DELETE���� ������ ����: �ڽ��� �����ϰ� �ִ� �ڽ� ���̺��� �ִ� ��� ���� �Ұ���(�ܷ�Ű)

--��ü ROW�� �����ϴ°�:TRUNCATE->1, DELETE���� ����,,,2.ROLLBACK �Ҽ� ���� 
DELETE FROM EMP_COPY;
SELECT *FROM EMP_COPY;
ROLLBACK;
TRUNCATE TABLE EMP_COPY;

--���̺� �����ϱ� MERGE
CREATE TABLE TBL_MERGE01(
ID VARCHAR2(20),
NAME VARCHAR2(20)
);
CREATE TABLE TBL_MERGE02(
ID VARCHAR2(20),
NAME VARCHAR2(20)
);

INSERT INTO TBL_MERGE01 VALUES('USER01','������');
INSERT INTO TBL_MERGE01 VALUES('USER02','������');
INSERT INTO TBL_MERGE02 VALUES('USER03','�谡��');
INSERT INTO TBL_MERGE02 VALUES('USER02','�ڿ���');

--MERGE INTO �����̵Ǵ� ���̺��
--USING ��ĥ ���̺�� ON(���Ͽ��θ� �Ǵ��ϴ� �����÷�)
--WHEN MATCHED THEN DML����
--WHEN NOTMATCHED THEN DML����
MERGE INTO TBL_MERGE01
USING TBL_MERGE02 ON(TBL_MERGE01.ID=TBL_MERGE02.ID)
WHEN MATCHED THEN
UPDATE SET TBL_MERGE01.NAME=TBL_MERGE02.NAME
WHEN NOT MATCHED THEN
INSERT VALUES(TBL_MERGE02.ID,TBL_MERGE02.NAME);
SELECT * FROM TBL_MERGE01;

--ALTER :���̺�� ����Ŭ���� �����ϴ� OBJECT�� �����ҋ����
--�÷� �߰�,�÷� ����,�÷��� ����,�ڷ�������,����Ʈ�� ����
--���������߰� ,����,�̸��� ����

CREATE TABLE TBL_USER_ALTER(
    USER_NO NUMBER PRIMARY KEY,
    USER_ID VARCHAR2(20),
    USER_PWD VARCHAR2(20)
);
SELECT * FROM TBL_USER_ALTER;

--�÷��߰��ϱ�
ALTER TABLE TBL_USER_ALTER ADD(USER_NAME VARCHAR2(20));
DESC TBL_USER_ALTER;

INSERT INTO TBL_USER_ALTER VALUES(1,'ADMIN','1234','������');
INSERT INTO TBL_USER_ALTER VALUES(2,'USER01','USER01','������');
--���̺� �����Ͱ� �ִ� ���¿��� ���ο� �÷��� �߰��Ѵٸ�?
ALTER TABLE TBL_USER_ALTER ADD(ADDRESS VARCHAR2(100));
--�÷��� �߰��ҋ� �������ǵ� �߰��Ҽ� ������??
ALTER TABLE TBL_USER_ALTER ADD(GENDER VARCHAR2(10) CHECK(GENDER IN('��','��')));
INSERT INTO TBL_USER_ALTER VALUES(3,'USER2','USER2','������','���','��');

--�����Ͱ� �ִ� ���̺� �÷��� �߰��ҋ� ��������,NOT NULL������� ������ ����
ALTER TABLE TBL_USER_ALTER ADD(EMAIL VARCHAR2(50) DEFAULT 'NONE' NOT NULL );
INSERT INTO TBL_USER_ALTER VALUES(4,'USER3','USER3','������','����','��','AD@AD.CPM');

--�������� �߰��ϱ�
--ALTER TABLE ���̺�� ADD �������Ǹ�(�÷�)->SYS00123�������Ǹ��� �������� ����!
--ALTER TABLE ���̺�� ADD CONSTRAINT �������Ǹ� ��������(�÷���)
SELECT * FROM TBL_USER_ALTER;
ALTER TABLE TBL_USER_ALTER ADD CONSTRAINT TBL_USER_ID_UQ UNIQUE(USER_ID);
--NOT NULL->�ȵ˴ϴ�. ��?? �߰��� �ƴ϶� ����!   �⺻������ ���������� �������� ������ YES NULL�Ǿ�����

--�÷�,�������� �����ϱ�
--ALTER TABLE ���̺�� MODIFY �÷��� �ڷ���
--ALTER TABLE ���̺�� MODIFY �÷��� CONSTRAINT �������Ǹ� ��������
DESC TBL_USER_ALTER;
ALTER TABLE TBL_USER_ALTER MODIFY EMAIL VARCHAR2(50);
ALTER TABLE TBL_USER_ALTER MODIFY USER_ID VARCHAR2(5);

--�������� �����ϱ�
ALTER TABLE TBL_USER_ALTER MODIFY USER_ID CONSTRAINT NN_USER_ID NOT NULL;

--�÷� �����ϱ�
--ALTER TABLE ���̺�� DROP COLUMN �÷���
ALTER TABLE TBL_USER_ALTER DROP COLUMN EMAIL;
SELECT * FROM TBL_USER_ALTER;
--�������ǻ���
--ALTER TABLE ���̺�� DROP CONSTRAINT �������Ǹ�
ALTER TABLE TBL_USER_ALTER DROP CONSTRAINT NN_USER_ID;
DESC TBL_USER_ALTER;

--�÷��� �����ϱ�
--ALTER TABLE ���̺�� RENAME COLUMN �������÷��� TO ���泻��
ALTER TABLE TBL_USER_ALTER RENAME COLUMN USER_ID TO ID;
--�������Ǹ� �����ϱ�
ALTER TABLE TBL_USER_ALTER RENAME CONSTRAINT SYS_C007170 TO USER_NO_PK;

--���̺� �����ϱ�: DROP TABLE ���̺��
DROP TABLE TBL_USER_ALTER;
SELECT *FROM TBL_USER_ALTER;
--���̺� ������ ������ ���� -> �������迡 ������ �ִٸ� �Ժη� ����� ����,
CREATE TABLE REF_TEST(
 EMP_ID VARCHAR2(20)REFERENCES MEMBER(USER_ID),
 EMP_NAME VARCHAR2(20)
 );

--DCL: DATA�� ���� ���ٱ��� ����, ������ ȸ���ϴ� ���/Ʈ����� ó��
--���Ѻο�/ȸ��: GRANT.REVOKE
--GRANT ���Ѹ�||ROLE��,���Ѹ�,���Ѹ�,,,, TO ����ڸ�
--�������� ����(Ư��������� Ư�� ���̺�)�� ���� ���Ѻο� �ҋ�
--GRANT ���Ѹ� ON ���̺� TO ����ڸ� / �ٸ������ ������ ���̺��� ������ �����ϰ� ����� ����,
CREATE USER QWER IDENTIFIED BY QWER;
GRANT CREATE SESSION TO QWER;
GRANT CREATE TABLE TO QWER;
ALTER USER QWER DEFAULT TABLESPACE USERS;
ALTER USER QWER QUOTA UNLIMITED ON USERS;

--����ڿ��� �ο��� ������ Ȯ���ϱ�
SELECT * FROM DBA_SYS_PRIVS--�Ժ����� ��ȸ
WHERE GRANTEE='QWER';
SELECT * FROM DBA_ROLE_PRIVS
WHERE GRANTEE='KH';

--USER���� �˻�
SELECT * FROM USER_ROLE_PRIVS
WHERE USERNAME='KH';

--ROLE�� �ο��� ���� Ȯ���ϱ�
SELECT * FROM DBA_SYS_PRIVS
WHERE GRANTEE='RESOURCE';

CREATE ROLE MYROLE;
GRANT CREATE TABLE,CREATE SESSION TO MYROLE;

--QWER������ ������ �ο��ؼ� KH���� ���̺� �����ϰ� �غ���
SELECT * FROM EMPLOYEE;
SELECT * FROM KH.EMPLOYEE;

GRANT SELECT ON KH.EMPLOYEE TO QWER;
SELECT * FROM KH.EMPLOYEE;
INSERT INTO KH.EMPLOYEE(EMP_ID,EMP_NAME,EMP_NO,JOB_CODE,SAL_LEVEL) 
VALUES('778','������','770808-188888','J5','S5');
GRANT INSERT ON KH.EMPLOYEE TO QWER;

--�ѹ��� ���� ���� �ο��ϱ�
GRANT SELECT,INSERT,UPDATE ON KH.DEPARTMENT TO QWER;

--�ο��� ���� ȸ���ϱ�
REVOKE SELECT ON KH.EMPLOYEE FROM QWER;

--Ʈ�����: �۾�����
--Ʈ�������  INSERT, UPDATE,DELETE�� �ش�->���̺��� ROW�� ����������
SELECT * FROM KH.TBL_USER;
GRANT SELECT ON KH.TBL_USER TO QWER;
INSERT INTO TBL_USER VALUES(2,'CO','123','������','JI@HIHI.COM');
INSERT INTO TBL_USER VALUES(3,'CO','123','������','JI@HIHI.COM');
INSERT INTO TBL_USER VALUES(4,'CO','123','������','JI@HIHI.COM');
ROLLBACK;
COMMIT;

--VIEW:������ ���̺�, SELECT���� �̿��ؼ� �������̺��� �����͸� �����ͼ� ���
--VIEW�� �ϳ��� OBJECT�̱⋚���� DDL�� ����,����,����
--CREATE VIEW VIEW�̸� AS SELECT�� �ۼ�
CREATE VIEW V_EMPALL
AS SELECT *
    FROM EMPLOYEE
    JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID
    JOIN JOB USING(JOB_CODE);
    
--VIEW�� ���� ���������� �־����
GRANT CREATE VIEW TO KH;

SELECT EMP_NAME,DEPT_TITLE,JOB_NAME,SALARY
FROM V_EMPALL;

UPDATE EMPLOYEE SET DEPT_CODE='D1' WHERE EMP_NAME='������';

SELECT * FROM USER_VIEWS;

CREATE VIEW V_EMP_AVG
AS SELECT DEPT_CODE,FLOOR(AVG(SALARY))AS ���
    FROM EMPLOYEE
    GROUP BY DEPT_CODE
    UNION
    SELECT JOB_CODE,FLOOR(AVG(SALARY)) AS ���
    FROM EMPLOYEE
    GROUP BY JOB_CODE
    UNION
    SELECT '�����',FLOOR(AVG(SALARY))AS ���
    FROM EMPLOYEE;

SELECT * FROM V_EMP_AVG;

--VIEW �����ϱ�
--DROP VIEW VIEW ��Ī
DROP VIEW V_EMPALL;
SELECT * FROM V_EMPALL;

--VIEW�� Ư¡
--1.�����÷��� VIEW�� �̿��Ҽ��ִ�.���꿡 ���� ���� �÷�,�� ������ ��Ī�� �ο��ؾ��Ѵ�
CREATE VIEW V_EMPSAL
AS SELECT EMP_ID,EMP_NAME,(SALARY+SALARY*NVL(BONUS,0))*12 ����
    FROM EMPLOYEE;
--VIEW���̺� ���Ѽ����ؼ� �̿��Ҽ��ְ� �Ҽ��ִ�.
SELECT * FROM KH.V_EMP_AVG;
GRANT SELECT ON KH.V_EMP_AVG TO QWER;
--VIEW�� ������ �ο����� ����ڴ� �������̺� ��ȸ�� �����ұ�?
SELECT * FROM KH.EMPLOYEE;

--VIEW�� �����͸� ����,����,���� �Ҽ�������?DML�����Ѱ�?
--���������� ����,�����÷��� �ƿ��Ұ���
--�信 ���� �������ص� �����÷��� ������

--VIEW���� DML�� �Ұ����� ���
--1.�信�� �����ϰ� ���� ���� �÷��� ����������
SELECT * FROM V_EMPSAL;
UPDATE V_EMPSAL SET EMAIL='KKK@KKK.COM' WHERE EMP_NAME='������';
--2.�信 ���Ե��� ���� ���̽����̺����÷� �߿��� NOT NULL���������� �����Ȱ��
CREATE VIEW V_EMP
AS SELECT EMP_ID,EMP_NO,EMP_NAME,EMAIL,PHONE,JOB_CODE,SAL_LEVEL
    FROM EMPLOYEE;
    
SELECT * FROM V_EMP;
INSERT INTO V_EMP VALUES('666','660616-126666','����','66@66.COM','010','J2','S4');
--3 ����������� ����� �÷� �׷��Լ�,GROUP BY�� ����� VIEW ,DISTINCT ���Ե� VIWE
--�������̺��� ���εǾ��ִ� VIEW ���������� ���ԵǴ� ��쵵 ����

--VIEW�ɼ�
--OR REPLACE: �̹� ���̸��� VIEW�� ������ ������Ű�� ��ɾ�
SELECT * FROM USER_VIEWS;
CREATE OR REPLACE VIEW V_EMP
AS SELECT *FROM EMPLOYEE JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID;

--FORCE/NOFORCE : �������̺��� ��� VIEW�� �����Ҽ� �ְ����ִ� �ɼ�
CREATE FORCE VIEW V_TEMP
AS SELECT * FROM TT;
SELECT * FROM V_TEMP;
CREATE TABLE TT{
    IDX NUMBER,
    NAME VARCHAR2(20)
);

--WITH CHECK OPTION: SELECT���� WHERE�� ����� �÷��� �������ϰ��ϴ� �ɼ�
CREATE OR REPLACE VIEW V_EMP_SAL
AS SELECT EMP_NAME,DEPT_CODE,SALARY,SALARY*12 AS ����
    --FROM EMPLOYEE WHERE DEPT_CODE='D5';
    FROM EMPLOYEE WHERE DEPT_CODE='D5' WITH CHECK OPTION;

SELECT * FROM V_EMP_SAL;
UPDATE V_EMP_SAL SET DEPT_CODE='D6' WHERE EMP_NAME='���ȥ';
ROLLBACK;

--WITH READ ONLY: VIEW ���̺��� �������� ���ϰ� �ϴ� �ɼ�
CREATE OR REPLACE VIEW V_READ
AS SELECT EMP_NAME,DEPT_CODE,JOB_CODE,SALARY
FROM EMPLOYEE WHERE DEPT_CODE='D5' WITH READ ONLY;

UPDATE V_READ SET SALARY=1000;

--SEQUENCE
--�ڵ���ȣ �ο���
--CREATE SEQUENCE ��������[�ɼ�]
--�������۵� �����->������.NEXTVAL,  ������.CURRVAL
--�⺻ ������ �����ϱ�
CREATE SEQUENCE SEQ_BASIC;
SELECT SEQ_BASIC.NEXTVAL FROM DUAL;
SELECT SEQ_BASIC.CURRVAL FROM DUAL;

CREATE SEQUENCE SEQ_OPTION
START WITH 100
INCREMENT BY 1;
SELECT SEQ_OPTION.NEXTVAL FROM DUAL;

CREATE SEQUENCE SEQ_OPTION2
START WITH 60
INCREMENT BY 6
MAXVALUE 90
MINVALUE 0
CYCLE
NOCACHE;
SELECT SEQ_OPTION2.NEXTVAL FROM DUAL;

--������ Ȱ���ϱ�
--PK������ �����ϱ�
CREATE TABLE BOARD_SEQ(
    BOARD_NO NUMBER PRIMARY KEY,
    BOARD_TITLE VARCHAR2(200) NOT NULL,
    BOARD_CONTENT VARCHAR2(800),
    BOARD_WIRTER VARCHAR2(20)REFERENCES EMPLOYEE(EMP_ID),
    BOARD_DATE DATE
);    
CREATE SEQUENCE SEQ_BOARD;
INSERT INTO BOARD_SEQ VALUES(SEQ_BOARD.NEXTVAL,'����1','����1','200',SYSDATE);
SELECT * FROM BOARD_SEQ;

--���������� ��ȸ�ϱ�
SELECT * FROM USER_SEQUENCES;

--������ �̿� �ٸ�Ȱ���ϱ�
SELECT 'B_'||SEQ_BOARD.NEXTVAL FROM DUAL;
--������ �����ϱ�
ALTER SEQUENCE SEQ_BOARD
INCREMENT BY 10;

--������ �����
DROP SEQUENCE SEQ_BOARD;

--NEXTVAL,CURRVAL
CREATE SEQUENCE SEQ_TEST;
SELECT SEQ_TEST.CURRVAL FROM DUAL;

--�������� ����Ҽ� ���� ����
--VIEW�������� ���Ұ�
--DISTINCT�� �����ϰ� �ִ±���
--GROUP BY, HAVING,ORDER BY ���Ե� ����
--SELECT,DELETE,UPDATE ��������
--CREATE TABLE,ALTER TABLE���� DEFAULT ������.

--INDEX: �������� DBMS��������� ���� ����
SELECT * FROM USER_INDEXES;
SELECT * FROM USER_IND_COLUMNS;

SELECT * FROM EMPLOYEE JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID WHERE EMP_NAME='���߱�';
CREATE INDEX IND_EMPLOYEE ON EMPLOYEE(EMP_NAME);
DROP INDEX IND_EMPLOYEE;

--�����÷��� �ε��� �ο��ϱ�
CREATE INDEX IND_EMPLOYEE_COM ON EMPLOYEE(EMP_NAME,DEPT_CODE);

ALTER INDEX IND_EMPLOYEE_COM REBUILD;

--PL/SQL: 
--����
--�͸���-> �̸��� ��� ��ȣ���� �Ұ����� PL/SQL����
--���ν��� �Լ�->�̸��� �־ ��ȣ���� ������ PL/SQL����

--����(�͸���)
--DECLARE
--   ��������
--BEGIN
--   ���,�ݺ���,�Լ���
--EXCEPTION  ����ó����
--END;
--/
SET SERVEROUTPUT ON; 

BEGIN
    DBMS_OUTPUT.PUT_LINE('���� ù PL/SQL');
END;
/
--�⺻ �͸���
DECLARE 
    V_ID VARCHAR2(20);
BEGIN
    SELECT EMP_ID
    INTO V_ID
    FROM EMPLOYEE
    WHERE EMP_NAME='������';
    
    DBMS_OUTPUT.PUT_LINE(V_ID);
END;
/
--���� �̿��ϱ�
--���� : ������ �ڷ���(����)[:= ��]
--������ ���ֱ�    ������:= ��
DECLARE 
    V_EMPNO NUMBER;
    V_EMPNAME VARCHAR2(20);
    TEST_NUM NUMBER:= 10+20;
BEGIN
    V_EMPNO:= 300;
    V_EMPNAME:= '�踻��';
    DBMS_OUTPUT.PUT_LINE(V_EMPNO);
    DBMS_OUTPUT.PUT_LINE(V_EMPNAME);
    DBMS_OUTPUT.PUT_LINE(TEST_NUM);
END;
/
--������ �ڷ��� �˾ƺ���
--�ڷ����� �⺻�ڷ���(ORACLE�ڷ���),�����ڷ������� ����
--�⺻�ڷ���: NUMBER,VARCHAR2(20),DATE,BOOLEAN,BINARY_INTEGER
--�����ڷ���: ���ڵ� ,Ŀ��, �÷���

--����������
--%TYPE: �������̺� �ִ� �ڷ����� �����ؼ� ������ ����ϴ°�
DECLARE
    V_EMP_ID EMPLOYEE.EMP_ID%TYPE;
    V_SALARY EMPLOYEE.SALARY%TYPE;
BEGIN
    SELECT EMP_ID,SALARY
    INTO V_EMP_ID,V_SALARY
    FROM EMPLOYEE
    WHERE EMP_ID='&�����';
    DBMS_OUTPUT.PUT_LINE(V_EMP_ID||V_SALARY);
END;
/

--���ڵ�: Ŭ����
DECLARE
    TYPE MY_RECORD IS RECORD(
        V_ID EMPLOYEE.EMP_ID%TYPE,
        V_NAME EMPLOYEE.EMP_NAME%TYPE,
        V_DEPTTITLE DEPARTMENT.DEPT_TITLE%TYPE
    );
    MY_VAR MY_RECORD;
BEGIN
    SELECT EMP_ID,EMP_NAME,DEPT_TITLE
    INTO MY_VAR
    FROM EMPLOYEE
    JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID
    WHERE EMP_ID='&�����ȣ';
    
    DBMS_OUTPUT.PUT_LINE(MY_VAR.V_ID||''||MY_VAR.V_NAME||''||MY_VAR.V_DEPTTITLE);
END;
/
--TABLEŸ�� �����ϱ�: �ڹ��� �迭
DECLARE
    TYPE EMP_ID_TABLE_TYPE IS TABLE OF EMPLOYEE.EMP_ID%TYPE
    INDEX BY BINARY_INTEGER;
    
    V_EMPID EMP_ID_TABLE_TYPE;--��������
    I BINARY_INTEGER:=0;
    
BEGIN
    FOR K IN (SELECT EMP_ID FROM EMPLOYEE)LOOP
    I:=I+1;
    V_EMPID(I):=K.EMP_ID;
    END LOOP;
    
    FOR K IN 1..I LOOP
        DBMS_OUTPUT.PUT_LINE(V_EMPID(K));
    END LOOP;
END;
/
SET SERVEROUTPUT ON;

--PL/SQL�������� SELECT�� ó���ϱ�
--PL/SQL�������� SELECT���� ����ϴ°��� ��ȸ�� ����� ������ �����Ͽ� Ȱ���Ѵ�
--PL/SQL�������� SELECT���� ����������� �ݵ�� INTO�� ����ؾ���(������ �����ϴ°�)
DECLARE
    V_EMP_ID EMPLOYEE.EMP_ID%TYPE;
BEGIN
    SELECT EMP_ID
    INTO V_EMP_ID
    FROM EMPLOYEE
    WHERE EMP_NAME='&�̸�';
END;
/
CREATE TABLE INSERTEST(
    VAL VARCHAR2(500)
);
--PL/SQL�������� INSERT�� ó���ϱ�
BEGIN 
    INSERT INTO INSERTEST VALUES('�̰� PL/SQL������ �Է��ϱ�');
    COMMIT;
END;
/
SELECT * FROM INSERTEST;

--�����ȣ�� �Է¹޾Ƽ� ���� ����� �����ȣ,�̸�,�μ��ڵ�,�μ����� ����ϵ����Ͻÿ�
--�� �÷��� ���� �����ϱ�
DECLARE 
    V_EMP_ID EMPLOYEE.EMP_ID%TYPE;
    V_EMP_NAME EMPLOYEE.EMP_NAME%TYPE;
    V_DEPT_CODE EMPLOYEE.DEPT_CODE%TYPE;
    V_DEPT_TITLE DEPARTMENT.DEPT_TITLE%TYPE;
BEGIN
    SELECT EMP_ID,EMP_NAME,DEPT_CODE,DEPT_TITLE
    INTO V_EMP_ID,V_EMP_NAME,V_DEPT_CODE,V_DEPT_TITLE
    FROM EMPLOYEE JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID
    WHERE EMP_ID='&�����ȣ';
    DBMS_OUTPUT.PUT_LINE(V_EMP_ID||' '||V_EMP_NAME||' '||V_DEPT_CODE||' '||V_DEPT_TITLE);
END;
/
--2
DECLARE
    TYPE MY_RECORD IS RECORD(
    V_EMP_ID EMPLOYEE.EMP_ID%TYPE,
    V_EMP_NAME EMPLOYEE.EMP_NAME%TYPE,
    V_EMP_NO EMPLOYEE.EMP_NO%TYPE,
    V_SALARY EMPLOYEE.SALARY%TYPE
);
MY_VAR MY_RECORD;
BEGIN
    SELECT EMP_ID,EMP_NAME,EMP_NO,SALARY
    INTO MY_VAR
    FROM EMPLOYEE
    WHERE EMP_ID='&�����ȣ';
    
    DBMS_OUTPUT.PUT_LINE(MY_VAR.V_EMP_ID||' '||MY_VAR.V_EMP_NAME||' '||MY_VAR.V_EMP_NO||' '||MY_VAR.V_SALARY);
END;
/
--3
DECLARE
    ID EMPLOYEE.EMP_ID%TYPE;
BEGIN
    SELECT MAX(EMP_ID)
    INTO ID
    FROM EMPLOYEE WHERE EMP_ID LIKE'2%';
    
    INSERT INTO EMPLOYEE(EMP_ID,EMP_NAME,EMP_NO,PHONE,JOB_CODE,SAL_LEVEL)
        VALUES(ID+1,'&�̸�','&�ֹι�ȣ','&��ȭ��ȣ','&���ڵ�','&�޿��ڵ�');
END;
/

--���ǹ� Ȱ���ϱ�
--IF ���ǹ� 
--    THEN ������ ����
--END IF;

--����� �Է¹޾� �̸��� ��ȸ�ϰ� ���̸��� �������̸� ����ǥ��! ����ϱ�
DECLARE 
    V_EMP_NAME EMPLOYEE.EMP_NAME%TYPE;
BEGIN
    SELECT EMP_NAME
    INTO V_EMP_NAME
    FROM EMPLOYEE
    WHERE EMP_ID='&���';
    
    IF V_EMP_NAME='������'
        THEN DBMS_OUTPUT.PUT_LINE('����ǥ��');
    END IF;
END;
/
--IF THEN ELSE END IF;
--��ȸ�� ����� �������̸� �� ��ǥ�� �ƴϸ� �� ����̴�!.
DECLARE 
    V_EMP_NAME EMPLOYEE.EMP_NAME%TYPE;
BEGIN
    SELECT EMP_NAME
    INTO V_EMP_NAME
    FROM EMPLOYEE
    WHERE EMP_ID='&���';
    
    IF V_EMP_NAME='������'
        THEN DBMS_OUTPUT.PUT_LINE('����ǥ��');
        ELSE DBMS_OUTPUT.PUT_LINE('������̴�');
    END IF;
END;
/

--IF THEN ~ ELSIF THEN ~ ELSE ~ END IF;
--��å�ڵ尡 J1�̸� ��ǥ�� J2�� �ӿ��̴� �׿ܸ� ����̴�
DECLARE
    V_JOB_CODE EMPLOYEE.JOB_CODE%TYPE;
BEGIN
    SELECT JOB_CODE
    INTO V_JOB_CODE
    FROM EMPLOYEE
    WHERE EMP_ID='&�����ȣ';
    
    IF V_JOB_CODE='J1' THEN DBMS_OUTPUT.PUT_LINE('�� ��ǥ��');
    ELSIF V_JOB_CODE='J2' THEN DBMS_OUTPUT.PUT_LINE('�ӿ��̴�');
    ELSE DBMS_OUTPUT.PUT_LINE('����̴�');
    END IF;
END;
/
--CASE ��
DECLARE
    INPUTVALUE NUMBER;
BEGIN
    INPUTVALUE:='&���Է�';
    CASE INPUTVALUE
        WHEN 1 THEN DBMS_OUTPUT.PUT_LINE(INPUTVALUE||'���Է��� 1�� ù����');
        WHEN 2 THEN DBMS_OUTPUT.PUT_LINE(INPUTVALUE||'���Է��� 2�� �ι���');
        WHEN 3 THEN DBMS_OUTPUT.PUT_LINE(INPUTVALUE||'���Է��� 3�� ������');
        ELSE DBMS_OUTPUT.PUT_LINE(INPUTVALUE||'�� �����');
    END CASE;
END;
/

--CASE������ ������ 400�̻��̸� ��׿���,200�̻��̸� ����,�����ϸ� ������ ���
--CASE���� �߻����ϸ� �䳪��
DECLARE 
    V_SALARY EMPLOYEE.SALARY%TYPE;
   
BEGIN
    SELECT SALARY
    INTO V_SALARY
    FROM EMPLOYEE
    WHERE EMP_ID='&�����ȣ';
    
    
    CASE 
        WHEN V_SALARY>=4000000 THEN DBMS_OUTPUT.PUT_LINE('��׿���');
        WHEN V_SALARY>=2000000 THEN DBMS_OUTPUT.PUT_LINE('����');
        ELSE DBMS_OUTPUT.PUT_LINE('������,,'):
        END CASE;
END;
/

--�ݺ���
--�⺻�ݺ���(LOOP)
--LOOP~ �����ѱ��� END LOOP-> ���ѷ���
--�����ұ����� ���������� ����� ���->EXIT 

--1~10���� ���
DECLARE 
    I NUMBER:=1;
BEGIN
    LOOP
        DBMS_OUTPUT.PUT_LINE(I);
        I:=I+1;
--        IF I>10 THEN EXIT;
--        END IF;
        EXIT WHEN I>10;
        
    END LOOP;
END;
/

--WHILE
--WHILE ���ǽ� LOOP
--  ���౸��
--END LOOP;

--FOR�� Ȱ���ϱ�
--FOR���� EACH���� ���
--FOR ���� IN ����||SELECT�� LOOP
-- ���౸��
--END LOOP;

--����: ���ۼ���..������->FOR���� ������ ������ ���ڰ� ���Ե�
--SELECT��->SELECT ����  ROW�� ������ �����

BEGIN
    FOR I IN 20..30 LOOP
        DBMS_OUTPUT.PUT_LINE(I);
    END LOOP;
END;
/
--�Ųٷ� ����ϱ�
BEGIN
    FOR I IN REVERSE 1..10 LOOP
        DBMS_OUTPUT.PUT_LINE(I);
    END LOOP;
END;
/
--EMPLOYEE���ִ� 10�� ROW����ϱ�
--EMP_ID,EMP_NAME,SALARY ������ 200����209����
DECLARE
    E EMPLOYEE%ROWTYPE;
    V_EMP_ID EMPLOYEE.EMP_ID%TYPE;
BEGIN
    V_EMP_ID:=200;
    FOR K IN 1..10 LOOP
    SELECT *
    INTO E
    FROM EMPLOYEE
    WHERE EMP_ID=V_EMP_ID;
    V_EMP_ID:=V_EMP_ID+1;
    DBMS_OUTPUT.PUT_LINE(E.EMP_ID||E.EMP_NAME||E.SALARY);
    END LOOP;
    
    FOR K IN(SELECT* FROM EMPLOYEE) LOOP
    DBMS_OUTPUT.PUT_LINE(K.EMP_ID||K.EMP_NAME||K.SALARY);
    EXIT WHEN K.EMP_ID='209';
    END LOOP;
END;
/

--Ÿ�Կ� 
--%ROWTYPE: %TYPE�Ѱ��÷�->DATA 1�� ROW ,�� ��� ���̺��� Ÿ���� ������

--PL/SQL ������������������������������������������������������������������������������

--�����ؼ� ����ϰ� ���� �屸 ����!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
--PROCEDURE/FUNCTION ��ü
--PROCEDURE����ϱ�
CREATE TABLE PRO_TEST
AS SELECT * FROM EMPLOYEE;

SELECT * FROM PRO_TEST;
--���̺��� �����ϴ� ���ν��������
CREATE OR REPLACE PROCEDURE DEL_DATA
IS
--�������� ����
BEGIN
    DELETE FROM PRO_TEST
    COMMIT;
END;
/
--���ν��� ȣ��
EXEC DEL_DATA;
SELECT * FROM PRO_TSET;
--��ϵ� ���ν��� ��ȸ�ϱ�
SELECT * FROM USER_PROCEDURES;

--�Ű����� �ִ� ���ν��� �����ϱ�
--IN: ���ν�������� �ʿ��� ���� �޴� ���� 
--OUT: ���ν����� ������ ����� �ǵ����ִ� ����
CREATE OR REPLACE PROCEDURE PRO_SELECT_EMP(V_EMP IN EMPLOYEE.EMP_ID%TYPE,
                                        V_EMP_NAME OUT EMPLOYEE.EMP_NAME%TYPE,
                                        V_SALARY OUT EMPLOYEE.SALARY%TYPE,
                                        V_BONUS OUT EMPLOYEE.BONUS%TYPE)
IS 
BEGIN
    SELECT EMP_NAME,SALARY,BONUS
    INTO V_EMP_NAME,V_SALARY,V_BONUS
    FROM EMPLOYEE
    WHERE EMP_ID=V_EMP;
END;
/
--OUT �Ű������� �ִ� ���ν����� ����� ������ ���ε� ������Ѵ�.
--��������
VAR EMP_NAME VARCHAR2(20);
VAR SALARY NUMBER;
VAR BONUS NUMBER;

PRINT EMP_NAME;
PRINT SALARY;
PRINT BONUS;

--�Ű����� �ִ� ���ν��� ȣ���ϱ�
EXEC PRO_SELECT_EMP('&���',:EMP_NAME,:SALARY,:BONUS);
PRINT EMP_NAME;
PRINT SALARY;
PRINT BONUS;

--FUNCTION
--FUNCTION�� ���ν����� ���������� ���ϰ��� ���´�;
CREATE OR REPLACE FUNCTION MYFUNC(STR VARCHAR2)
RETURN VARCHAR2
IS
    RESULT VARCHAR2(10000);
BEGIN
    RESULT:='^.~'||STR||'~,^';
    RETURN RESULT;
END;
/
SELECT MYFUNC('������')FROM DUAL;

--EMP_ID�� ���޹޾Ƽ� ������ ������ִ� �Լ�
CREATE OR REPLACE FUNCTION CALC_SALARY(V_EMP_ID EMPLOYEE.EMP_ID%TYPE)
RETURN NUMBER
IS 
    E EMPLOYEE%ROWTYPE;
    RESULT NUMBER;
BEGIN
    SELECT *
    INTO E
    FROM EMPLOYEE
    WHERE EMP_ID=V_EMP_ID;
    RESULT:=(E.SALARY+E.SALARY*NVL(E.BONUS,0))*12;
    RETURN RESULT;
END;
/
SELECT CALC_SALARY(200)FROM DUAL;
SELECT EMP_ID,EMP_NAME,CALC_SALARY(EMP_ID) 
FROM EMPLOYEE;

--Ʈ���� �̿��ϱ�!!
--Ư�����̺� DML������ ����� ��(��,��) Ư���� ������ ����ǵ����ϴ� ��
--CREATE OR REPLACE TRIGGER Ʈ���Ÿ�Ī
--�������(AFTER/BEFORE)DML����(UPDATE,INSERT,DELETE)
--FOR EACH ROW
--IS BEGIN~~PL/SQL���� �ۼ�
CREATE OR REPLACE TRIGGER TRG_01
AFTER INSERT
ON EMPLOYEE
FOR EACH ROW
BEGIN
    DBMS_OUTPUT.PUT_LINE('���Ի���� �Ի��Ͽ����ϴ�');
END;
/
INSERT INTO EMPLOYEE VALUES (908, '�漺��', '690512-1151432','gil_sj@kh.or.kr', 
                    '01035464455', 'D5', 'J3', 'S5', 3000000, 0.1, 200, SYSDATE, NULL,
                DEFAULT);

--�����Ͱ� ���۵� ��/��
--����,�����ڷ�
--      :NEW.�÷���(���ο)/:OLE.�÷���(������)
--UPDATE        0                  0  
--INSERT        0                  X
--DELETE        X                  0
CREATE OR REPLACE TRIGGER TRG_02
AFTER UPDATE
ON EMPLOYEE
FOR EACH ROW
BEGIN
    DBMS_OUTPUT.PUT_LINE(:OLD.EMP_NAME);
    DBMS_OUTPUT.PUT_LINE(:OLD.SALARY);
    DBMS_OUTPUT.PUT_LINE(:NEW.EMP_NAME);
    DBMS_OUTPUT.PUT_LINE(:NEW.SALARY);
END;
/
UPDATE EMPLOYEE SET EMP_NAME='�谡��',SALARY=500 WHERE EMP_ID='778';
ROLLBACK;
SELECT* FROM EMPLOYEE;

--������� ���̺� Ʈ���� �����ϱ�
CREATE TABLE PRODUCT(
    PCODE NUMBER PRIMARY KEY,
    PNAME VARCHAR2(30),
    BRAND VARCHAR2(30),
    PRICE NUMBER,
    STOCK NUMBER DEFAULT 0
);
--��ǰ�� ����� �����ϴ� ���̺�
CREATE TABLE PRODUCT_IO(
    IOCODE NUMBER PRIMARY KEY,
    PCODE NUMBER CONSTRAINT FK_PRO_NAME REFERENCES PRODUCT(PCODE),
    PDATE DATE,
    AMOUNT NUMBER,
    STATUS VARCHAR2(10) CHECK(STATUS IN('�԰�','���'))
);
CREATE SEQUENCE SEQ_PRO;
CREATE SEQUENCE SEQ_IO;

INSERT INTO PRODUCT VALUES(SEQ_PRO.NEXTVAL,'��ȣ�ʸ�','�Ƹ�����',500000,DEFAULT);
INSERT INTO PRODUCT VALUES(SEQ_PRO.NEXTVAL,'����������','�Ｚ',2300000,DEFAULT);
INSERT INTO PRODUCT VALUES(SEQ_PRO.NEXTVAL,'Ŀ��','������ǰ',12000,DEFAULT);
INSERT INTO PRODUCT VALUES(SEQ_PRO.NEXTVAL,'�ݶ�̱�','�ҷ���ǰ',1000,DEFAULT);

SELECT * FROM PRODUCT;
--��������̺� �԰�, ��� ������ TRIGGER�� �̿��ؼ� PRODUCT���̺��� �����غ���
CREATE OR REPLACE TRIGGER TRG_IO
AFTER INSERT
ON PRODUCT_IO
FOR EACH ROW
BEGIN
    IF:NEW.STATUS='�԰�'THEN
        UPDATE PRODUCT SET STOCK=STOCK+:NEW.AMOUNT WHERE PCODE=:NEW.PCODE;
    ELSIF :NEW.STATUS='���'THEN
         UPDATE PRODUCT SET STOCK=STOCK-:NEW.AMOUNT WHERE PCODE=:NEW.PCODE;
    END IF;
END;
/
INSERT INTO PRODUCT_IO VALUES(SEQ_IO.NEXTVAL,1,SYSDATE,100,'�԰�');
INSERT INTO PRODUCT_IO VALUES(SEQ_IO.NEXTVAL,2,SYSDATE,5,'�԰�');
INSERT INTO PRODUCT_IO VALUES(SEQ_IO.NEXTVAL,1,SYSDATE,10,'���');
SELECT * FROM PRODUCT;
SELECT * FROM PRODUCT_IO;


    

CREATE USER STUDENT IDENTIFIED BY STUDENT;
GRANT CONNECT TO STUDENT;
GRANT RESOURCE TO STUDENT;











