SELECT * FROM DBA_USERS; -- 현재 데이터베이스에 등록된 계정들 조회하는 명령어

-- 기본적인 명령어를 실행하려면 명령어 작성LINE에 커서를 놓고 CTRL+ENTER;
SELECT * FROM TAB; --현재 계정에 등록되어있는 테이블을 조회하는 명령어

--위에서 이용한 DBA_USERS, TAB, ROLE_SYS_PRIVS 테이블은 오라클이 이용자에게 DB에 대한 정보를
-- 제공하기 위해 만들어 놓은 가상의 테이블 -> DATA DICTIONARY

-- 오라클의 기본적으로 DB를 관리하는 계정을 자동을 부여를 함.
-- SYSTEM : 일반관리자 계정 -> 데이터베이스를 생성/삭제 할 권한은 없음, 사용자계정을 등록, 권한부여 등 역할
-- SYS : 수퍼관리자 계정 -> 데이터베이스를 생성하고, 삭제 할 권한이 있고, 사용자계정을 등록, 권한부여 역할도 함.
-- SYS AS SYSDBA

-- 기본적으로 DB를 이용하는 사용자 계정을 등록하고 이용해보자
-- 사용자 계정은 SYSTEM/SYS AS SYSDBA계정이 등록을 함
-- 오라클 DB를 이용하려면 반드시 계정이 있어야 함.
-- 계정을 생성하는 명령어
-- CREATE USER 계정명 IDENTIFIED BY 비밀번호
-- 계정명은 대소문자 구분하지 않고, 비밀번호는 대소문자 구분을 함.

CREATE USER KH IDENTIFIED BY KH;
SELECT * FROM DBA_USERS;
-- 권한부여하기
-- GRANT 권한||롤(ROLE) [,권한 || ROLE] TO 계정명;
--CONNECT(ROLE) : 계정이 DB에 접속(연결)할 수 있는 권한 부여
GRANT CONNECT TO KH;--접속할 수 있는 권한을 부여

--접속한 KH계정으로 조회해보기
SELECT * FROM TAB;-- 계정이 가지고 있는 테이블 조회

CREATE TABLE TEST1(
    NAME VARCHAR2(20)
);

--DROP TABLE TEST1;
--테이블(저장공간:데이터를 저장할 수있는)을 생성할 수 있는 권한이 부여되야함.
-- RESOURCE (ROLE)를 부여 : 테이블을 생성하고 이용할 수 있는 권한이 있는 ROLE;
GRANT RESOURCE TO KH;


-- TEST/TEST계정을 생성하고 권한부여하고  이용할 수 있게 만들자.
CREATE USER TEST IDENTIFIED BY TEST;
GRANT CONNECT, RESOURCE TO TEST;

--DATA DICTIONARY
SELECT * FROM DICT;-- 관리자계정, 사용자계정이 이용

--KH에서 활용할 디비내용 확인
SELECT * FROM EMPLOYEE;-- 테이블의 데이터를 조회
DESC EMPLOYEE;
SELECT * FROM DEPARTMENT;
SELECT * FROM JOB;
SELECT * FROM LOCATION;
SELECT * FROM NATIONAL;
SELECT * FROM SAL_GRADE;

--기본 SELECT문 활용하기
-- SELECT 출력을 원하는 컬럼명 [, 컬럼명....]
-- FROM 테이블;

SELECT EMP_ID, EMP_NAME, EMP_NO, EMAIL, PHONE, TEST1
FROM EMPLOYEE;

-- EMPLOYEE 테이블의 전체 컬럼을 조회하기
DESC EMPLOYEE;

SELECT EMP_ID, EMP_NAME,EMP_NO, EMAIL, PHONE,DEPT_CODE,.....
FROM EMPLOYEE;

-- 테이블에 있는 전체 컬럼을 불러올때는 와일드카드(*) 
SELECT *
FROM EMPLOYEE;

-- RESULT SET에서 ROW(DATA) 필터링(원하는 조건에 맞는 데이터만) 가져오려면 WHERE 
--WHERE절
-- SELECT 컬럼명,컬럼명, 컬럼명./...
-- FROM 테이블명
-- [WHERE 조건식(==, !=, >, < )]
SELECT *
FROM EMPLOYEE
WHERE SALARY>=3000000;

-- DB에서는 거의 모든것들 SELECT문안에서 이루어짐 -> 함수실행, 산술연산..
-- SELECT문에서 산술연산하기 -> +, -, *, /
-- 컬럼명이 들어가는 곳에서 산술연산을 할 수 있따.
SELECT 10+20,2/5, 20*40, 10-50
FROM DUAL; -- ORACLE이 제공하는 테스트용 테이블

-- 산술연산은 리터럴만 가능한게 아니다. 컬럼명을 가지고 처리가 가능함.
-- 산술연산시에는 자료형이 NUMBER타입이어야 한다.
-- 문자열 : VARCHAR2 CHAR
-- 숫자 : NUMBER
-- 날짜 : DATE

SELECT SALARY 
FROM EMPLOYEE;
DESC EMPLOYEE;

-- 컬럼, 리터럴 산술연산하기
SELECT SALARY, SALARY+200000
FROM EMPLOYEE;

-- 컬럼, 컬럼을 산술연산하기
SELECT SALARY, BONUS, SALARY*BONUS
FROM EMPLOYEE;

-- NULL값은 연산처리가 되지 않는다!

-- EMPLOYEE테이블에서 각 사원의 연봉을 조회하자
-- EMP_NAME, EMP_NO, DEPT_CODE, SALARY, 연봉
SELECT EMP_NAME, EMP_NO, DEPT_CODE SALARY,
                SALARY * 12
FROM EMPLOYEE;

-- 보너스를 추가한 금액으로 계산해보자.(월급+보너스금액)*12
SELECT EMP_NAME, EMP_NO, DEPT_CODE, SALARY,
                (SALARY+(SALARY*BONUS))*12
FROM EMPLOYEE;           

--오라클에서 ' ' 문자열 리터럴 표시
SELECT '20'+30, '이십'+'삼십' --이십30
FROM DUAL;


-- RESTULSET 컬럼명을 변경하기 -> 컬럼에 별칭부여
-- 컬럼명 AS 변경할 컬럼이름 ||  컬럼명 변경할 컬럼명

SELECT EMP_NAME AS 사원명, PHONE AS 전화번호, EMAIL 이메일, SALARY*12 연봉
FROM EMPLOYEE;

-- 별칭부여시에 띄어쓰기, 특수기호를 사용할 수 있나? 있다! " "
SELECT EMP_NAME AS "사 원 명", SALARY AS "월급(원)", SALARY*12
FROM EMPLOYEE;

-- SELECT문에 컬럼명 쓰는곳에 리터럴을 작성하면? 
SELECT EMP_NAME, '님', 100
FROM EMPLOYEE;


-- 컬럼에 있는 중복값을 제거하고 출력하는 예약어 : DISTINCT
SELECT DISTINCT DEPT_CODE
FROM EMPLOYEE;

-- DISTINCT예약어는 SELECT문에 한개만 사용이 가능함.
-- SELECT DISTINCT DEPT_CODE, DISTINCT JOB_CODE
SELECT DISTINCT DEPT_CODE, JOB_CODE
FROM EMPLOYEE;

-- 연결연산자 : 자바에서 문자열연결한것 + -> || 
-- 컬럼과 컬럼 또는 컬럼과 리터럴을 연결
SELECT '유병승'||'하하하하'||'금요일'
FROM DUAL;

SELECT EMP_NAME||'님',SALARY||'원'
FROM EMPLOYEE;


-- 비교, 논리연산
-- 동등비교연산 : =
-- EMPLOYEE 테이블에서 사원명이 송종기인 사원의 전체컬럼 조회하자.
SELECT *
FROM EMPLOYEE
WHERE EMP_NAME='송종기';

-- EMPLOYEE 테이블에서 DEPT_CODE D5인 사원의 전체 컬럼 조회하자.
SELECT * 
FROM EMPLOYEE
WHERE DEPT_CODE='D5';

-- 200백만원 이상 월급을 받는 사원 조회하기
SELECT * 
FROM EMPLOYEE
WHERE SALARY>2000000;

-- JOB_CODE J5아닌 사원을 조회하기
SELECT *
FROM EMPLOYEE
--WHERE JOB_CODE !='J5';
--WHERE JOB_CODE <>'J5';
WHERE JOB_CODE ^= 'J5';

-- 논리연산 연결하기 : AND, OR, NOT
-- EMPLOYEE테이블에서 DEPT_CODE D5이면서 SALARY가 300백만원 이상인 사원.
SELECT * 
FROM EMPLOYEE
WHERE DEPT_CODE='D5' AND SALARY>=3000000;

-- EMPLOYEE 테이블에서 DEPT_CODE가 D5이거나 D6인 사원의 이름, 급여 부서코드를 조회하자
SELECT EMP_NAME, SALARY, DEPT_CODE
FROM EMPLOYEE
WHERE DEPT_CODE='D5' OR DEPT_CODE='D6';

-- NOT 
-- 부서코드가 D5가 아닌 사원을 조회하세요
SELECT *
FROM EMPLOYEE
WHERE NOT DEPT_CODE='D5';

-- EMPLOYEE 테이블에서 급여를 300만원이상 에서 500만원이하 사이받는 사원의 이름, 급여 부서코드를 조회하기
SELECT EMP_NAME, SALARY DEPT_CODE
FROM EMPLOYEE
--WHERE SALARY >=3000000 AND SALARY <= 5000000;
WHERE NOT (SALARY >=3000000 AND SALARY <= 5000000);


-- ORALCE에서 제공하는 비교연산자
-- BETWEEN AND -> 특정범위를 조회할때 사용하는 연산자
-- 컬럼명 BETWEEN 값 AND 값 == 값<=컬럼명 AND 값>=컬럼명

SELECT EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
--WHERE SALARY BETWEEN 3000000 AND 5000000;
WHERE SALARY NOT BETWEEN 3000000 AND 5000000;

-- 범위를 비교하거나 대소비교를 할때 날짜 값도 가능한가???
DESC EMPLOYEE;

-- 고용일이 00/01/01이전에 입사한 사원의 이름, 부서, 고용일 구하자
SELECT EMP_NAME, DEPT_CODE, HIRE_DATE
FROM EMPLOYEE
WHERE HIRE_DATE < '00/01/01';

-- 고용일이 90/01/01 부터 01/01/01까지 입사한 사원의 이름, 부서, 고용일 조회하기
SELECT EMP_NAME, DEPT_CODE, HIRE_DATE
FROM EMPLOYEE
WHERE HIRE_DATE BETWEEN '90/01/01' AND '01/01/01';


-- LIKE : 특정 패턴의 문자값을 조회하는 기능 ' '
-- 와일드카드를 사용해서 조회 %, _ 기호
-- % : 0개 이상의 임의의 문자 표시
    -- LIKE '%안녕' -> 안녕(0), 하안녕(0) 아막미ㅏ어리쟈덜날안녕(0) 아가나라자안 녕(x) -> 안녕으로 끝나는 문자열
    -- LIKE '홍%' -> 홍으로 시작하는 문자열 모두!
    -- LIKE '%병%' -> 병을 포함하고 있는 문자열
    
-- _ : 1개의 임의의 문자 표시
    -- LIKE '_안녕' -> 안녕(x) 하안녕(0) 1안녕(0) -> 안녕으로 끝나는 3글자
    -- LIKE '___' -> 3글자 문자열
    -- LIKE '_종_' -> 
    
-- 두개를 종합할 수 있음
    -- LIKE '%안녕_' -> 안녕으로 끝나고 한글자 더 있는 문자열
    -- LIKE '_종_%' -> 3글자 이상 두번째문자가 종 인 문자열
    -- LIKE '_종%' -> 
    
-- SELECT ASDLKASJDF FROM 테이블명 WHERE 컬럼명 LIKE '패턴';

-- 전씨 성을 가진 사원을 조회하기 사원명, 부서코드, 급여
SELECT EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
--WHERE EMP_NAME LIKE '전_%';
WHERE EMP_NAME LIKE '전__';


-- 사원이름 전체에 이가 포함된 사원을 조회 전체컬럼
SELECT *
FROM EMPLOYEE
WHERE EMP_NAME LIKE '%이%';

-- EMAIL 중 _앞이 3자리인 직원을 조회한다면?
SELECT EMP_NAME, EMAIL
FROM EMPLOYEE
--WHERE EMAIL LIKE '___^_%' ESCAPE '^';
WHERE EMAIL LIKE '___\_%' ESCAPE '\';
--ESCAPE문으로 등록을 해서 사용해야함.

--이씨가 아닌 사원의 전체 컬럼을 조회해보자.
SELECT * 
FROM EMPLOYEE
WHERE EMP_NAME NOT LIKE '이_%';

SELECT * FROM EMPLOYEE;


-- NULL을 찾아보자.
--보너스를 받지 않는 사원을 구해보자.
SELECT *
FROM EMPLOYEE
--WHERE BONUS = NULL;
WHERE BONUS = (null);
-- NULL값은 아무의미없는 공값으로 연산처리가 되지않음!
-- IS NULL : 컬럼에 있는 NULL값을 조회하는 연산자
-- IS NOT NULL : 컬럼에 NULL이 아닌값을 조회 연산자

SELECT *
FROM EMPLOYEE
WHERE BONUS IS NULL;

--보너스를 받는 사람 조회하기
SELECT * 
FROM EMPLOYEE
WHERE BONUS IS NOT NULL;

-- 부서가 지정이 안된 사원의 이름, 이메일 전화번호를 조회하세요
SELECT EMP_NAME, EMAIL, PHONE
FROM EMPLOYEE
WHERE DEPT_CODE IS NULL;

-- IN / NOT IN : 동등비교 다중 동등비교 
-- DEPT_CODE D5 이거나 D6인 사원을 조회
SELECT EMP_NAME, DEPT_CODE
FROM EMPLOYEE
--WHERE DEPT_CODE='D5' OR DEPT_CODE='D6';
--WHERE DEPT_CODE IN('D5','D6'); -- 서브쿼리 배우고 다중행서브쿼리를 비교할때 사용
WHERE DEPT_CODE NOT IN('D5','D6');


-- 사원중 직책코드가 J7 또는 J2이고, 급여가 200백만원인 사원의 이름, 급여, 부서코드를 조회
SELECT EMP_NAME, SALARY, JOB_CODE
FROM EMPLOYEE
WHERE (JOB_CODE='J7' OR JOB_CODE='J2') AND SALARY>2000000;


SELECT * FROM EMPLOYEE;

-- 데이터의 순서정렬하기.
-- ORDER BY : 오름, 내림차순정렬, ->  컬럼을 기준으로 정렬
-- 숫자 : 작은 -> 큰수 : ASC 오름차순 / 큰수 -> 작은수 DESC  내림차순
-- 문자열 : 사전순 앞 -> 뒤 ASC / 사전순 뒤 -> 앞 DESC 
-- 날짜 : 빠른순 -> 늦은날짜 ASC / 늦은날짜 -> 빠른날짜 DESC
-- ORDER BY 컬럼명 정렬기준(ASC/DESC)
-- SELECT 컬럼명, 컬럼명, 컬럼명.....
-- FROM 테이블명
-- [WHERE]
-- [ORDER BY 컬럼명 정렬기준]
-- ORDER BY 구문은 SELECT문의 맨 마지막에 작성한다.
SELECT * 
FROM EMPLOYEE
--ORDER BY EMP_NAME ASC;
--ORDER BY SALARY DESC;
--ORDER BY EMAIL;-- DEFAULT값이 ASC 생략하면 오름차순 정렬을 한다.
--한개이상의 컬럼도 작성이 가능함.
ORDER BY DEPT_CODE , EMP_NAME DESC;
--NULL의 정렬 : ASC -> 맨아래, DESC -> 맨 위
SELECT DEPT_CODE, EMP_NAME
FROM EMPLOYEE
--ORDER BY DEPT_CODE NULLS FIRST;
ORDER BY DEPT_CODE DESC NULLS LAST;

--DEPT_CODE D5인 사원을 월급을 받이 많는 사원순으로 전체 컬럼 조회하기
SELECT *
FROM EMPLOYEE
WHERE DEPT_CODE='D5'
ORDER BY SALARY DESC;

-- ORDER BY 절에서 컬럼에 대한 인덱스를 기준으로 정렬할 수 있다.
-- 오라클의 인덱스는 1부터 시작.
SELECT EMP_NAME, DEPT_CODE, SALARY, EMAIL
FROM EMPLOYEE
ORDER BY 1;

SELECT EMP_NAME, (SALARY+(SALARY*BONUS))*12
FROM EMPLOYEE
ORDER BY 2 DESC NULLS LAST;

-- ORDER BY 절에서는 컬럼에 부여한 별칭을 이용할 수 있다.
SELECT EMP_NAME, (SALARY +(SALARY*BONUS))*12 AS 연봉
FROM EMPLOYEE
WHERE (SALARY +(SALARY*BONUS))*12 >=40000000
ORDER BY 연봉 DESC;

SELECT * FROM EMPLOYEE;

-- 오라클이 제공하는 함수에 대해 알아보자
-- 문자열처리함수
-- 1. LENGTH : 문자열의 길이를 나타내는 함수
-- LENGTH(문자열||컬럼명) 숫자를 반환
SELECT LENGTH('벌써3월') 
FROM DUAL;
SELECT LENGTH(EMAIL)
FROM EMPLOYEE;
--EMAIL의 길이가 16이상인 사원의 전체 컬럼 조회하기
SELECT *
FROM EMPLOYEE
WHERE LENGTH(EMAIL)>=16;

--LENGTHB(문자열||컬럼명) : 문자열 BYTE크기
--한글은 3BYTE로 처리함. EXPRESS버전에서....
SELECT LENGTHB('가나다'),  LENGTH('가나다'),LENGTHB('ABC')
FROM DUAL;
SELECT LENGTHB(EMP_NAME), LENGTHB(EMAIL)
FROM EMPLOYEE;

-- INSTR : 찾는문자를 문자열||컬럼에서  지정한 위치부터 지정한 회수번째에 나타난 문자열 인덱스 반환.
-- INSTR(대상문자열||컬럼, 찾을 문자[,시작위치, 횟수]) == INDEXOF와 비슷
SELECT INSTR('KH정보교육원KH','KH') FROM DUAL;--시작위치, 횟수 생략  DEFAULT=1;
SELECT INSTR('KH정보교육원 KH RCLASS 화이팅','KH',4) 
FROM DUAL;
SELECT INSTR('KH정보교육원 KH RCLASS 화이팅 KH는 강남','KH',1,3)
FROM DUAL;-- 횟수는 중복값이 나왔을때 유효함.

--시작위치는 음수(-)가 나올 수 있음. == LASTINTDEXOF
SELECT INSTR('KH정보교육원 KH RCLASS 화이팅 KH는 강남','KH',-7,4)
FROM DUAL;

--EMAIL에서 @의 위치를 찾아보자.
-- EMAIL에서 두번째 . 의 위치를 찾아보자.
SELECT INSTR(EMAIL,'@'), INSTR(EMAIL,'.',1,2)
FROM EMPLOYEE;


--LPAD / RPAD
--특정 길이의 여백이 생기면 그 공간을 특정문자로 채우는 함수
--LPAD/RPAD(대상문자열, 지정길이[,특정문자])
SELECT '안녕', LPAD('안녕',10) FROM DUAL;--특정문자를 지정하지 않으면 띄어쓰기가 됨.
SELECT '안녕',LPAD('안녕',10,'#') FROM DUAL;
SELECT '안녕',RPAD('안녕',10,'#') FROM DUAL;
SELECT EMAIL, RPAD(EMAIL,16,'*') FROM EMPLOYEE;


-- LTRIM/RTRIM
--왼쪽, 오른쪽의 공백, 특정 기호를 제거하는것
--LTRIM/RTRIM(대상문자||컬럼[,문자])
SELECT '     연휴뒤수업 쉽지않죠?', LTRIM('     연휴뒤수업 쉽지않죠?')
FROM DUAL;
SELECT '가가가가가가가가 피로야!', LTRIM('가가가가가가가가가 피로야!','가')
FROM DUAL;
SELECT '가나다가가가나나나다다다가다다가이렇게쓴거는?가다나가다나',
            LTRIM('가나다가가가나나나다다다가다다가이렇게쓴거는?가나다가다나','가나다'),
            RTRIM('가나다가가가나나나다다다가다다가이렇게쓴거는?가나다가다나','가나다')
FROM DUAL;

-- 가다나다나가나가가가나나 이거에서 가나다지우세요 가나다가나가나가가가다다다
SELECT RTRIM(LTRIM('가다나다나가나가가가나나 이거에서 가나다지우세요 가나다가나가나가가가다다다','가나다'),'가나다')
FROM DUAL;

-- TRIM : 양쪽에 있는 띄어쓰기,특정문자 제거
-- 옵션에 따라 왼쪽, 오른쪽에 특정문자,공백을 제거할 수도 있음.
-- 한개문자만 가능함.
--TRIM(문자||컬럼)
--TRIM('특정문자' FROM 문자열||컬럼명) 
-- TRIM( LEADING '특정문자' FROM 문자열||컬럼명) --왼쪽
-- TRIM( TRAILING '특정문자' FROM 문자열||컬럼명) -- 오른쪽
-- TRIM( BOTH '특정문자' FROM 문자열||컬럼명) -- 양쪽
SELECT '    유병승   ', TRIM('   유병승   ') FROM DUAL;

SELECT 'ㅋㅋㅋㅋ유병승ㅋㅋㅋㅋ', TRIM('ㅋ' FROM 'ㅋㅋㅋㅋ유병승ㅋㅋㅋㅋ') 
FROM DUAL;

SELECT 'ㅋㅋㅋㅋ유병승ㅋㅋㅋㅋ', TRIM(LEADING 'ㅋ' FROM 'ㅋㅋㅋㅋ유병승ㅋㅋㅋㅋ') 
FROM DUAL;

SELECT 'ㅋㅋㅋㅋ유병승ㅋㅋㅋㅋ', TRIM(TRAILING 'ㅋ' FROM 'ㅋㅋㅋㅋ유병승ㅋㅋㅋㅋ') 
FROM DUAL;

SELECT 'ㅋㅋㅋㅋ유병승ㅋㅋㅋㅋ', TRIM(BOTH 'ㅋ' FROM 'ㅋㅋㅋㅋ유병승ㅋㅋㅋㅋ') 
FROM DUAL;

--한개 특정문자만 제거가 가능
SELECT 'ㅋㅋㅋㅋ유병승ㅋㅋㅋㅋ', TRIM( 'ㅋ1' FROM 'ㅋㅋㅋㅋ유병승ㅋㅋㅋㅋ') 
FROM DUAL;


-- SUBSTR : 원하는 위치의 문자를 잘라내는 기능
-- SUBSTR('문자열',시작인덱스[,길이])
SELECT SUBSTR('HELLO FUNCTION',6) FROM DUAL;
SELECT SUBSTR('HELLO FUNCTION',7,2) FROM DUAL;
--시작위치에 음수를 넣으면 뒤에서부터 시작
SELECT SUBSTR('HELLO FUNCTION',-8,3) FROM DUAL;

SELECT SUBSTR('HELLO FUNCTION',INSTR('HELLO FUNCTION','F'),3) FROM DUAL;

-- EMPLOYEE테이블에서 사원의 성만 출력하기.
SELECT SUBSTR(EMP_NAME,1,1) FROM EMPLOYEE;

--EMPLOYEE테이블에서 남자사원만 출력하기.
SELECT * 
FROM EMPLOYEE
WHERE SUBSTR(EMP_NO,8,1)='2';

-- LOWER/UPPER/INITCAP
SELECT LOWER('Welcome to My world') FROM DUAL;
SELECT UPPER('Welcome to My world') FROM DUAL;
SELECT INITCAP('Welcome to My world') FROM DUAL;

-- CONCAT : 문자열 연결, 합치기 == ||
SELECT CONCAT('벌써... ','저녁시간') 
FROM DUAL;
SELECT CONCAT(EMP_NAME, SALARY)
FROM EMPLOYEE;

--REPLACE : 컬럼||문자열의 일정부분을 변경하는 함수
--REPLACE(문자||컬럼, 대상문자, 변경할 문자)
SELECT REPLACE('I LOVE YOU','LOVE','HATE') FROM DUAL;

SELECT REPLACE(EMAIL,'kh.or.kr','rclass.com') 
FROM EMPLOYEE;

SELECT * FROM EMPLOYEE;


--REVERSE : 순서변경
SELECT REVERSE('I LOVE YOU') FROM DUAL;
SELECT REVERSE(REVERSE('I LOVE YOU')) FROM DUAL;
SELECT REVERSE('이제 곧 저녁시간') FROM DUAL;
SELECT REVERSE(REVERSE('이제 곧 저녁시간')) FROM DUAL;


-- TRANSLATE : 특정문자를 지정한 문자로 자동으로 변경해서 출력해주는 기능
SELECT TRANSLATE('010-3644-6259','0123456789','영일이삼사오육칠팔구')
FROM DUAL;


-- EMPLOYEE테이블에서 사원번호, 사원명, 주민번호, 연봉을 조회
-- 주민번호는 생년월일 만 출력하고 나머지는 *로 표시

SELECT EMP_ID, EMP_NAME, SUBSTR(EMP_NO,1,6)||'*******' AS 주민번호
FROM EMPLOYEE;

-- 다음문자열에서 앞뒤 모든 숫자를 제거하세요.
-- '982341678934509hello89798739273402'
SELECT RTRIM(LTRIM('982341678934509hello89798739273402','1234567890'),'1234567890')
FROM DUAL;


--숫자처리함수
--ABS : 음수값이 없음
SELECT ABS(10),ABS(-10) FROM DUAL;

-- MOD : 나머지연산 == %
--MOD(숫자, 나눌수) : 나머지값이 반환
SELECT MOD(10,3) FROM DUAL;
SELECT MOD(10,2) FROM DUAL;
SELECT MOD(10,4) FROM DUAL;


--실수처리함수
--ROUND : 반올림하는 함수
--ROUND(실수, 소수점자리수) : 실수의 소수점 자리수에서 반올림함
SELECT ROUND(126.4565,3) FROM DUAL;
SELECT ROUND(126.34,1) FROM DUAL;
SELECT ROUND(126.456,-2) FROM DUAL;
SELECT ROUND(126.456,-1) FROM DUAL;

--FLOOR : 소수점 자리 버림
SELECT FLOOR(126.456) FROM DUAL;
SELECT FLOOR(126.656) FROM DUAL;

--TRUC :  원하는 위치의 소수점 자리 버림
SELECT TRUNC(126.456,2) FROM DUAL;
SELECT TRUNC(126.456,1) FROM DUAL;
SELECT TRUNC(126.456,-1) FROM DUAL;

-- CEIL : 무조건 올림.
SELECT CEIL(126.456) FROM DUAL;


SELECT (SALARY+(SALARY*BONUS))*12 FROM EMPLOYEE;

SELECT FLOOR(SYSDATE-HIRE_DATE) FROM EMPLOYEE;


-- 날짜처리 함수
-- 날짜끼리 산술연산 -> 숫자(일자)
-- 날짜하고 숫자를 산술연산 -> 날짜(숫자만큼 일자를 계산)

-- 현재날짜 구하기 -> SYSDATE
SELECT SYSDATE FROM DUAL;
-- 현재날짜 시분초 밀리세컨초까지 -> SYSTIMESTAMP
SELECT SYSTIMESTAMP FROM DUAL;

SELECT SYSDATE, TO_CHAR(SYSDATE,'HH:MI:SS')
FROM DUAL;


--어제 오늘 내일 출력하기
SELECT SYSDATE-1 AS 어제, SYSDATE AS 오늘, SYSDATE+1 AS 내일
FROM DUAL;

-- 개월수를 계산하려면
-- ADD_MONTHS : 개월수를 더해주는 함수
SELECT SYSDATE, ADD_MONTHS(SYSDATE, 2) FROM DUAL;
-- 사원의 입사한 후 한달뒤를 조회하기 사원명 고용일
SELECT EMP_NAME, ADD_MONTHS(HIRE_DATE,1) FROM EMPLOYEE;

-- 날짜의 개월차이를 구하려면
-- MONTHS_BETWEEN : 두개의 날짜를 받아서 두날짜의 개월수차이를 계산해주는 함수
SELECT MONTHS_BETWEEN(SYSDATE, ADD_MONTHS(SYSDATE,10))
FROM DUAL;

--EMPLOYEE테이블에서 사원의 근무개월수를 구하시오 사원명, 부서코드, 급여 근무개월수
SELECT EMP_NAME, DEPT_CODE, SALARY, FLOOR(MONTHS_BETWEEN(SYSDATE,HIRE_DATE)/12)
FROM EMPLOYEE;


-- NEXT_DAY : 가장 가까운 다음 요일 날짜를 구해주는 함수
SELECT NEXT_DAY(SYSDATE, '월') FROM DUAL;
SELECT NEXT_DAY(SYSDATE, '금요일') FROM DUAL;

SELECT NEXT_DAY(SYSDATE,'MON') FROM DUAL;
SELECT NEXT_DAY(SYSDATE,'FRI') FROM DUAL;

SELECT * FROM V$NLS_PARAMETERS;

ALTER SESSION SET NLS_LANGUAGE=KOREAN;

-- LAST_DAY : 그달의 마지막 날 출력
SELECT LAST_DAY(SYSDATE) FROM DUAL;


-- EXTRACT : 년, 월, 일, 시, 분, 초 를 따로 숫자형으로 받을 수 있는 함수
-- EXTRACT(YEAR FROM 날짜) : 년이 숫자로 반환
-- EXTRACT(MONTH FROM 날짜) : 월이 숫자로 반환
-- EXTRACT(DAY FROM 날짜) : 일이 숫자로 반환
SELECT EXTRACT(YEAR FROM SYSDATE)+20 FROM DUAL;
SELECT EXTRACT(MONTH FROM SYSDATE)+5 FROM DUAL;
SELECT  EXTRACT(DAY FROM SYSDATE)+50 FROM DUAL;

-- 시분초
SELECT EXTRACT(HOUR FROM CAST(SYSDATE AS TIMESTAMP)) FROM DUAL;
SELECT EXTRACT(MINUTE FROM CAST(SYSDATE AS TIMESTAMP)) FROM DUAL;
SELECT EXTRACT(SECOND FROM CAST(SYSDATE AS TIMESTAMP)) FROM DUAL;


-- 형변환 함수
-- 오라클에서 형변환 자동으로 해주는 경우가 있음.
-- '00/01/01'
-- TO_CHAR : 숫자||날짜를 문자로 변경해주는 함수
-- TO_CHAR(날짜[, FORMAT]) : 날짜를 문자로 변경
-- TO_CHAR(숫자[, FORMAT]) : 숫자를 문자로 변경

YYYY : 년도 4자리
YY : 년도 2자리
MONTH : 월 LOCALE맞춰 FULL
MM : 월을 숫자로
DD : 날짜 표현
D : 요일을 숫자로 표현
DAY : 요일 표현
DY : 요일 앞글자만
HH : 시간
MI : 분
SS : 초

SELECT SYSDATE, TO_CHAR(SYSDATE,'YY-MM-DD DAY HH:MI:SS') 
FROM DUAL;

--사원테이블에서 사원명, 고용일(1990/2/20(화)) 출력하기
SELECT TO_CHAR(HIRE_DATE,'YYYY/MM/DD (DY)') FROM EMPLOYEE;

-- 숫자를 문자로 변경하기
-- 1,000,000 / \1,000,000
-- 9 : 해당 자리수에 숫자가 있으면 표시, 없으면 표시 하지 않음
-- 0 : 해당 자리수에 숫자가 있으면 표기, 없으면 0으로 표시 

SELECT TO_CHAR(1000000,'999,999,999')
FROM DUAL;
SELECT TO_CHAR(1000000,'000,000,000')
FROM DUAL;

--혼합으로 사용이 가능
SELECT TO_CHAR(1000000,'999,999,999.00')
FROM DUAL;

--돈 화폐기호를 표시
SELECT TO_CHAR(1000000,'L999,999,999')
FROM DUAL;


-- TO_DATE : 숫자, 문자열 날짜형식으로 변경하는 함수
--TO_DATE('문자열','YYYMMDD') FROM DUAL;
SELECT TO_DATE('19960930','YYYYMMDD') FROM DUAL;
SELECT  TO_DATE('980124','YYMMDD') FROM DUAL;

SELECT TO_DATE(19960925,'YYYYMMDD') FROM DUAL;
SELECT  TO_DATE(010224,'YYMMDD') FROM DUAL;
--숫자형태에서 날짜로 형별환시 숫자 맨앞에 0을 사용하면안됨.
--'99/10/22'
SELECT  TO_CHAR(TO_DATE('19960925 10:35:22','YYYYMMDD HH:MI:SS'),'YYYY-MM-DD HH:MI:SS') FROM DUAL;



--TO_NUMBER : 숫자형태로 변경하는 함수 문자열만 가능

SELECT TO_NUMBER('1,000,000','999,999,999') FROM DUAL;--계산할려고.
SELECT TO_NUMBER('1,000,000원','999,999,999') FROM DUAL;

-- 오늘부로 우영씨가 군대에 또 끌려갑니다..
-- 복무기간은 1년 6개월이라고 하면 제대날짜를 구하고
-- 제대까지 먹는 짬밥의 수를 구하세요 1일 3끼 기준
SELECT SYSDATE AS "우영씨 잘가", ADD_MONTHS(SYSDATE,18) AS "우영씨 고생했어"
            ,TO_CHAR((ADD_MONTHS(SYSDATE,18)-SYSDATE)*3,'999,999,999') AS 짬밥
FROM DUAL;


-- NULL처리 함수
-- NVL() : DATA값이 NULL일 대체하는 값을 지정
SELECT BONUS, NVL(BONUS,0) FROM EMPLOYEE;
SELECT (SALARY+SALARY*NVL(BONUS,0))*12 연봉 FROM EMPLOYEE;
SELECT EMP_NAME, NVL(DEPT_CODE,'인턴') FROM EMPLOYEE;

--NVL2 : 
SELECT BONUS, NVL2(BONUS,'있다','없다') 
FROM EMPLOYEE;

--SELECT문에 조건에 따라 분기해보자 
--DECODE함수 이용하기
--자바의 SWITCH비슷함.
--DECODE(기준값,조건1,결과1,조건2,결과2,.... 결과(DEFAULT))
--성별 컬럼을 생성할 수 있음
SELECT EMP_NAME, EMP_NO,
            DECODE(SUBSTR(EMP_NO,8,1),'1','남자','여자')
FROM EMPLOYEE;       

--CASE문 : 조건에 의해 분기 처리되는 함수
-- CASE 
--    WHEN 조건 THEN 실행구문
--    WHEN 조건 THEN 실행구문
--    ELSE
-- END;
SELECT EMP_NAME, EMP_NO,
            CASE
                WHEN SUBSTR(EMP_NO,8,1)='1' THEN '남자'
                WHEN SUBSTR(EMP_NO,8,1)='2' THEN '여자'
            END AS 성별
FROM EMPLOYEE;

SELECT EMP_NAME, EMP_NO,
        CASE SUBSTR(EMP_NO,8,1)
            WHEN '1' THEN '남자'
            ELSE '여자'
        END AS 성별
FROM EMPLOYEE;

/* 나이 :  현재년도-태어난 년도 +1
-------------------------------------------------------------------------
사원번호    사원명       주민번호        성별   현재나이
-------------------------------------------------------------------------
200	       선동일	  621235-1*******	   남	    57
201	       송종기	  631156-1*******	   남	    56
202	       노옹철	  861015-1*******	   남	    33
                        .
                        .
                        .
-------------------------------------------------------------------------
*/
SELECT EMP_ID AS 사원번호,
                EMP_NAME AS 사원명,
                CONCAT(SUBSTR(EMP_NO,1,8),'*******') AS 주민번호,
                CASE WHEN SUBSTR(EMP_NO,8,1) ='1' THEN '남' ELSE '여' END AS 성별,
                EXTRACT(YEAR FROM SYSDATE)
                -EXTRACT(YEAR FROM TO_DATE(SUBSTR(EMP_NO,1,2),'YY'))+1 AS "현재나이(YY)",
                EXTRACT(YEAR FROM SYSDATE)
                -EXTRACT(YEAR FROM TO_DATE(SUBSTR(EMP_NO,1,2),'RR'))+1 AS "현재나이(RR)",
                TO_NUMBER(EXTRACT(YEAR FROM SYSDATE))
                -(TO_NUMBER(SUBSTR(EMP_NO,1,2))
                    +CASE WHEN SUBSTR(EMP_NO,8,1) IN('1','2') THEN 1900 ELSE 2000 END)+1 AS 현재나이
FROM EMPLOYEE;

--년도를 두자리로 가져올때 YY, RR방식
--YY 방식 -> 2020 -- 20 1998 -- 98 -> 무조건 현재세기를 기준으로 가져옴,
-- 20 -> 2020 / 98 -> 2098 / 01 -> 2001 / 88 -> 2088
--RR 방식 
insert into KH.EMPLOYEE (EMP_ID,EMP_NAME,EMP_NO,EMAIL,PHONE,DEPT_CODE,JOB_CODE,SAL_LEVEL,SALARY,BONUS,MANAGER_ID,HIRE_DATE,ENT_DATE,ENT_YN) 
values ('250','고두밋','470808-2123341','go_dm@kh.or.kr',null,'D2','J2','S5',4480000,null,null,to_date('94/01/20','RR/MM/DD'),null,'N');

-- 그룹함수 
-- 결과가 한개 ROW로 출력됨.
-- SUM
SELECT SUM(SALARY)
FROM EMPLOYEE
WHERE DEPT_CODE='D6';

-- 여자사원의 급여의 총합을 조회하기
SELECT SUM(SALARY)
FROM EMPLOYEE
WHERE SUBSTR(EMP_NO,8,1)='2';

-- 전체 사원 연봉 총합을 구하세요 보너스 포함 없으면 0으로 계산.
SELECT SUM((SALARY+SALARY*NVL(BONUS,0))*12)
FROM EMPLOYEE;

--AVG : 그룹의 평균을 구하는 함수
SELECT TO_CHAR(FLOOR(AVG(SALARY)), 'L999,999,999') AS 평균급여
FROM EMPLOYEE;

-- COUNT : 그룹의 ROW수를 구하는 함수
-- 전체 사원수를 구하세요
SELECT COUNT(*) 
FROM EMPLOYEE;

-- 급여를 300만원 이상받는 사원의 수
SELECT COUNT(*) 
FROM EMPLOYEE 
WHERE SALARY>=3000000;
-- COUNT(*||컬럼명)
 SELECT COUNT(*), COUNT(BONUS), COUNT(DEPT_CODE)
 FROM EMPLOYEE;
 
SELECT COUNT(*)
FROM EMPLOYEE
WHERE BONUS IS NOT NULL;

--그룹함수는 한번에 출력이 가능
SELECT DEPT_CODE,COUNT(*), SUM(SALARY), AVG(SALARY)
FROM EMPLOYEE;

-- MAX/MIN
-- 사원중 급여을 제일 높은 사람의 급여, 제일 낮은 사람의 급여 조회
SELECT  MAX(SALARY), MIN(SALARY)
FROM EMPLOYEE;

SELECT MAX(HIRE_DATE), MIN(HIRE_DATE)
FROM EMPLOYEE;

-- GROUP BY 절
-- 특정 컬럼을 기준으로 그룹을 묶어주는 절
-- 부서별 급여합계를 조회
SELECT DEPT_CODE, SUM(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_CODE;

-- 부서별 사원수를 조회하세요
SELECT DEPT_CODE, COUNT(*)
FROM EMPLOYEE
GROUP BY DEPT_CODE;

-- 직급별 급여합계, 평균, 인원수를 조회하기
SELECT JOB_CODE, SUM(SALARY), FLOOR(AVG(SALARY)), COUNT(*) AS 인원수
FROM EMPLOYEE
GROUP BY JOB_CODE
ORDER BY AVG(SALARY) DESC;

SELECT JOB_CODE, SALARY
FROM EMPLOYEE ORDER BY JOB_CODE;

--EMPLOYEE 테이블에서 직급이 J1을 제외하고, 직급별 사원수 및 평균급여를 출력하세요.
    SELECT JOB_CODE, COUNT(*), AVG(SALARY)
    FROM EMPLOYEE
    WHERE JOB_CODE<>'J1'
    GROUP BY JOB_CODE;

--EMPLOYEE테이블에서 직급이 J1을 제외하고,  입사년도별 인원수를 조회해서, 입사년 기준으로 오름차순 정렬하세요.
    SELECT EXTRACT(YEAR FROM HIRE_DATE), COUNT(*)
    FROM EMPLOYEE
    WHERE JOB_CODE != 'J1'
    GROUP BY EXTRACT(YEAR FROM HIRE_DATE);
--[EMPLOYEE] 테이블에서 EMP_NO의 8번째 자리가 1, 3 이면 '남', 2, 4 이면 '여'로 결과를 조회하고,
-- 성별별 급여의 평균(정수처리), 급여의 합계, 인원수를 조회한 뒤 인원수로 내림차순을 정렬 하시오
    SELECT DECODE(SUBSTR(EMP_NO,8,1),'1','남','2','여') AS 성별
    ,COUNT(*), SUM(SALARY), AVG(SALARY)
    FROM EMPLOYEE
    --WHERE DECODE(SUBSTR(EMP_NO,8,1),'1','남','2','여')='여'
   -- WHERE ;
    GROUP BY DECODE(SUBSTR(EMP_NO,8,1),'1','남','2','여');
    
    
-- GROUP BY 절에는 다수의 컬럼을 넣을 수 있음    
SELECT DEPT_CODE, JOB_CODE, COUNT(*)
FROM EMPLOYEE
GROUP BY DEPT_CODE, JOB_CODE;

-- 부서별 급여 평균이 300백만원 이상인 부서들의 부서코드, 급여평균을 조회
SELECT DEPT_CODE, FLOOR(AVG(SALARY))
FROM EMPLOYEE
--WHERE AVG(SALARY)>=3000000
GROUP BY DEPT_CODE
HAVING AVG(SALARY)>=3000000;

-- HAVING절 : 그룹함수로 필터링 할 수 있게 하는것
--그룹함수를 가지고 ROW를 필터링할때 WHERE절 사용하지 못하고, HAVING절을 사용해야 한다.

--부서별 인원이 3명보다 많은 부서와 인원수를 출력하세요.
SELECT DEPT_CODE, COUNT(*)
FROM EMPLOYEE
GROUP BY DEPT_CODE
HAVING COUNT(*) >= 3
ORDER BY 2 DESC;

-- ROLLUP, CUBE에 대해 알아보자.
-- 그룹함수를 사용하면 각 그룹별 합계 ㅡ 평균,
-- 그룹별 합계뿐만 아니라 총계까지 까지 같이 출력

SELECT NVL(DEPT_CODE,'총계'), SUM(SALARY)
FROM EMPLOYEE
WHERE DEPT_CODE IS NOT NULL
--GROUP BY DEPT_CODE;
--GROUP BY ROLLUP(DEPT_CODE);
GROUP BY CUBE(DEPT_CODE);

-- 직책별 인원수와 총인원수를 구하시오 인원수가 4명이상인 부서만..
SELECT JOB_CODE, COUNT(*)
FROM EMPLOYEE
GROUP BY ROLLUP(JOB_CODE)
HAVING COUNT(*)>=4;



-- ROLLUP, CUBE도 한개이상의 컬럼을 설정.
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

-- GROUPING() : 집계(계산)된것이 ROLLUP, CUBE로 된것인지 확인하는 함수
-- ROLLUP/CUBE로 집계된 컬럼이면 1반환 아니면 0
SELECT DEPT_CODE, COUNT(*), GROUPING(DEPT_CODE)
FROM EMPLOYEE
WHERE DEPT_CODE IS NOT NULL
GROUP BY ROLLUP(DEPT_CODE);

--CUBE 두개 컬럼에서 GROUPING() 이용해보기
SELECT DEPT_CODE, JOB_CODE, COUNT(*),
            CASE 
                WHEN GROUPING(DEPT_CODE)=0 AND GROUPING(JOB_CODE)=1 THEN '부서별합계'
                WHEN GROUPING(DEPT_CODE)=1 AND GROUPING(JOB_CODE)=0 THEN '직책별합계'
                WHEN GROUPING(DEPT_CODE)=1 AND GROUPING(JOB_CODE)=1 THEN '총합계'
                ELSE '그룹별합계' 
            END AS 구분
FROM EMPLOYEE
WHERE DEPT_CODE IS NOT NULL
GROUP BY CUBE(DEPT_CODE, JOB_CODE)
ORDER BY 1;

-- 집합연산자
-- 여려개의 SELECT문의 결과(RESULTSET)를 합치는 구문
-- 조건
-- 1. RESULTSET의 컬럼의 갯수가 같아야함. 
-- 2. RESULTSET의 컬럼의 타입도 같아야함. * 데이터는 동일할 필요는 없음.
--    -> 컬럼수, 컬럼타입의 기준은 맨 처음 RESULTSET을 기준으로 한다.
-- 3. 없거나 빈컬럼이면 리터럴로 표시가능


-- UNION : 두개이상의 SELECT문(RESULTSET)의 합집합이다.
-- 중복값을 한개만 표시함.

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



--UNION ALL : 합집합.
-- 중복값을 모두 표시함.
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE='D5'
UNION ALL
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY>3000000;


-- MINUS :  차집합 첫번째 SELECT문(RESULTSET) 두번째 SELECT문(RESULTSET)을 빼는 것
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE='D5'
MINUS
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY>3000000;


--INTERSECT : 교집합 중복값만 출력
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE='D5'
INTERSECT
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY>3000000;


--개인별 급여, 부서별 합계, 부서별 평균
SELECT '개인' AS DIV, NVL(DEPT_CODE,'인턴'), SALARY
FROM EMPLOYEE
UNION
SELECT '부서', NVL(DEPT_CODE,'인턴'), SUM(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_CODE
UNION
SELECT '부서평균',NVL(DEPT_CODE,'인턴'), FLOOR(AVG(SALARY))
FROM EMPLOYEE
GROUP BY DEPT_CODE;


--GROUPING SETS :  GROUP BY가 포함된 구문을 묶을때 사용함.

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

-- JOIN 맛보기!
-- 송종기의 부서명을 출력하자
SELECT EMP_NAME, DEPT_CODE
FROM EMPLOYEE
WHERE EMP_NAME='송종기';
SELECT *
FROM DEPARTMENT
WHERE DEPT_ID='D9';

--두개의 테이블을 합칠때 JOIN을 사용함.
-- 오라클 조인
SELECT EMP_NAME, DEPT_TITLE
FROM EMPLOYEE, DEPARTMENT
WHERE DEPT_CODE=DEPT_ID AND EMP_NAME='송종기';

-- ANSI조인
SELECT EMP_NAME, DEPT_TITLE
FROM EMPLOYEE JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID
WHERE EMP_NAME='송종기';


--조인을 할때 기준이되는 컬럼명이 동일하다면
SELECT * FROM EMPLOYEE;--JOB_CODE
SELECT * FROM JOB;-- JOB_CODE

SELECT JOB_CODE
FROM EMPLOYEE E JOIN JOB J
        --ON EMPLOYEE.JOB_CODE=JOB.JOB_CODE;
--            ON E.JOB_CODE=J.JOB_CODE;
-- USING을 이용해서 처리할 수 있음.
           USING(JOB_CODE);

--지역명과 국가명을 출력하세요. LOCATION, NATIONAL 테이블
SELECT * FROM LOCATION;
SELECT * FROM NATIONAL;

SELECT LOCAL_NAME AS 지역명, NATIONAL_NAME 국가명
FROM LOCATION JOIN NATIONAL USING(NATIONAL_CODE);
--부서명과 지역명을 출력하세요. DEPARTMENT, LOCATION 테이블 이용.
SELECT * FROM DEPARTMENT;
SELECT * FROM LOCATION;

SELECT DEPT_TITLE, LOCAL_NAME
FROM DEPARTMENT JOIN LOCATION ON LOCATION_ID=LOCAL_CODE;


--INNER JOIN, OUTER JOIN
--기본으로  JOIN을 사용하면 INNER JOIN임.
SELECT * FROM EMPLOYEE;
SELECT * FROM DEPARTMENT;
SELECT *
FROM EMPLOYEE  JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID;
SELECT *
FROM DEPARTMENT JOIN EMPLOYEE ON DEPT_CODE=DEPT_ID
ORDER BY 1;


-- OUTER JOIN
-- LEFT : FROM 테이블 기준으로  FROM 테이블A JOIN 테이블B
-- RIGHT : JOIN 테이블 기준으로  FROM 테이블A JOIN 테이블B

SELECT *
--FROM EMPLOYEE LEFT OUTER JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID;
--FROM EMPLOYEE LEFT JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID;
--오라클식 LEFT 조인
FROM EMPLOYEE , DEPARTMENT
WHERE DEPT_CODE=DEPT_ID(+);

SELECT DEPT_TITLE
--FROM EMPLOYEE RIGHT OUTER JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID;
--FROM EMPLOYEE RIGHT JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID
FROM EMPLOYEE, DEPARTMENT
WHERE DEPT_ID=DEPT_CODE(+)
GROUP BY DEPT_TITLE;
--WHERE DEPT_TITLE LIKE '해외%';


--CROSS JOIN -> 전체ROW 다 매칭시켜서 테이블을 구성
SELECT EMP_ID, DEPT_CODE, EMP_NAME, DEPT_TITLE
FROM EMPLOYEE CROSS JOIN DEPARTMENT
ORDER BY 1;


-- SELF JOIN : 서로 같은 값을 가지고 있는 서로 다른 컬럼이 있어야한다.
SELECT EMP_ID, MANAGER_ID
FROM EMPLOYEE;

--매니저가 있는 사원의 이름과, 매니저 이름을 조회하기.

-- 사원정보를 가지고 있는 테이블 -> EMPLOYEE;
-- 매니저도 사원 -> EMPLOYEE;

SELECT E.EMP_NAME AS 사원명, M.EMP_NAME AS 매니저명
FROM EMPLOYEE E 
        JOIN EMPLOYEE M ON  E.MANAGER_ID=M.EMP_ID;
        
-- 매니저가 있는 사원은 매니저의 EMP_ID, 이름출력
-- 없는 사원은 EMP_ID 000, 이름 없음 출력
SELECT E.EMP_NAME, NVL(M.EMP_ID,'000'),NVL(M.EMP_NAME,'없음')
FROM EMPLOYEE E 
            LEFT JOIN EMPLOYEE M ON E.MANAGER_ID=M.EMP_ID; 

-- 다중JOIN  두개 이상의 테이블을 조인하는 것
-- 사원명, 부서명, 근무하고 있는 지역명을 조회하자
SELECT DEPT_TITLE, E.*,LOCATION.*
FROM EMPLOYEE E 
            LEFT JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID
            LEFT JOIN LOCATION ON LOCAL_CODE=LOCATION_ID
            JOIN JOB J ON(J.JOB_CODE=E.JOB_CODE);
   
            
-- 직급이 대리이면서, ASIA 지역에 근무하는 직원 조회
-- 사번, 이름 ,직급명, 부서명, 근무지역명, 급여
-- 급여는 이쁘게 출력 원화표시, ','
SELECT EMP_ID AS 사번, EMP_NAME AS 이름, JOB_NAME AS 직급명, DEPT_TITLE AS 부서명, 
        LOCAL_NAME AS 근무지역명, TO_CHAR(SALARY,'L999,999,999') AS 급여
FROM EMPLOYEE E
            JOIN DEPARTMENT D ON DEPT_CODE=DEPT_ID
            JOIN JOB J ON J.JOB_CODE=E.JOB_CODE
            JOIN LOCATION L ON LOCATION_ID=LOCAL_CODE
WHERE JOB_NAME='대리' AND LOCAL_NAME LIKE '%ASIA%';
-- EQUI JOIN

-- NON_EQUI JOIN : 동등한 컬럼을 가지고 비교를 하는것이 아니라 범위컬럼을 비교하는것
SELECT * FROM EMPLOYEE;
SELECT * FROM SAL_GRADE;

SELECT *
FROM EMPLOYEE E 
        JOIN SAL_GRADE ON (E.SALARY BETWEEN SAL_GRADE.MIN_SAL AND SAL_GRADE.MAX_SAL);


-- 서브쿼리 : 하나의 SELECT문(MAIN쿼리)안에 다른 SELECT문(서브쿼리)이 있는 것
-- 서브쿼리는 메인쿼리에 종속적임.
-- 서브쿼리는 반드시 ()로 묶어줘야함. -> 
-- 서브쿼리는 연산자의 오른쪽에 위치해야함.
-- 서브쿼리는 ORDER BY 문법 지원이 안됨.


--전지연의 매니저사원의 이름을 조회하세요
SELECT E.EMP_ID, E.EMP_NAME, E.MANAGER_ID, M.EMP_NAME
FROM EMPLOYEE E
            JOIN EMPLOYEE M ON E.MANAGER_ID=M.EMP_ID
WHERE E.EMP_NAME='전지연';


--서브쿼로 변경
SELECT EMP_NAME
FROM EMPLOYEE
WHERE EMP_ID=(SELECT MANAGER_ID FROM EMPLOYEE WHERE EMP_NAME='전지연');


-- 전체사원의 평균급여보다 많이 받는 사원의 이름, 부서코드, 월급 조회하기
SELECT AVG(SALARY) FROM EMPLOYEE;
SELECT EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY>(SELECT AVG(SALARY) FROM EMPLOYEE);





SELECT * FROM DBA_USERS;
--비밀번호를 변경해주면됨.
ALTER USER TEST IDENTIFIED BY TEST;


-- 단일행 서브쿼리 : 서브쿼리가 RESULTSET이 한개 ROW 한개 COLUMN인 것

SELECT EMP_NAME
FROM EMPLOYEE
WHERE EMP_ID=(SELECT MANAGER_ID FROM EMPLOYEE WHERE EMP_NAME='전지연');

SELECT EMP_NAME, SALARY
FROM EMPLOYEE
WHERE SALARY>=(SELECT AVG(SALARY) FROM EMPLOYEE);

--전체 사원중 최소급여를 받고 있는 사원의 이름, 부서코드, 직책코드 월급을 조회하기
SELECT MIN(SALARY) FROM EMPLOYEE;
SELECT EMP_NAME, DEPT_CODE,JOB_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY = (SELECT MIN(SALARY) FROM EMPLOYEE);

-- 최대급여를 받고 있는 사원과 윤은해랑 같은 급여를 받는 사원 조회하기
-- 사원명, 부서코드, 직책코드, 급여
SELECT EMP_NAME, DEPT_CODE, JOB_CODE, SALARY
FROM EMPLOYEE 
WHERE SALARY=(SELECT MAX(SALARY) FROM EMPLOYEE) 
            OR (SALARY=(SELECT SALARY FROM EMPLOYEE WHERE EMP_NAME='윤은해')
            AND EMP_NAME != '윤은해');

-- 다중행 서브쿼리 : 서브쿼리의 결과(RESULTSET) 한개컬럼 다수ROW일때
SELECT DEPT_CODE FROM EMPLOYEE WHERE EMP_NAME IN ('송종기','윤은해');

SELECT EMP_NAME, DEPT_CODE
FROM EMPLOYEE 
--WHERE DEPT_CODE = (SELECT DEPT_CODE FROM EMPLOYEE WHERE EMP_NAME IN('송종기','윤은해')); X
--WHERE DEPT_CODE IN (SELECT DEPT_CODE FROM EMPLOYEE WHERE EMP_NAME IN('송종기','윤은해'));
--WHERE  DEPT_CODE IN('D9','D5');
--부정
WHERE DEPT_CODE NOT IN (SELECT DEPT_CODE FROM EMPLOYEE WHERE EMP_NAME IN('송종기','윤은해'));

-- 직책이 대표, 부사장을 제외한 사원의 사원명, 부서명, 직책명 출력하기
-- SELECT * FROM EMPLOYEE WHERE JOB_CODE NOT IN ('J1','J2');
SELECT EMP_NAME,DEPT_TITLE,JOB_NAME
FROM EMPLOYEE 
            JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID
            JOIN JOB USING(JOB_CODE)
WHERE JOB_CODE NOT IN (SELECT JOB_CODE 
                                                FROM EMPLOYEE 
                                                JOIN JOB USING(JOB_CODE) 
                                                WHERE JOB_NAME IN('대표','부사장'));

--직급이 대표, 부사장이 아닌 ASIA1에서 근무하는 사원 조회하기
SELECT * 
FROM EMPLOYEE
WHERE JOB_CODE NOT IN (SELECT JOB_CODE 
                                                FROM JOB 
                                                WHERE JOB_NAME IN('대표','부사장'))
--            AND DEPT_CODE IN (SELECT DEPT_ID 
--                                                FROM DEPARTMENT
--                                                JOIN LOCATION ON LOCATION_ID=LOCAL_CODE
--                                                WHERE LOCAL_NAME='ASIA1');
            AND DEPT_CODE IN (SELECT DEPT_ID 
                                                FROM DEPARTMENT
                                                WHERE LOCATION_ID IN (SELECT LOCAL_CODE 
                                                                                            FROM LOCATION 
                                                                                            WHERE LOCAL_NAME='ASIA1'));

-- 다중행 서브쿼리를 동등비교했을 때는 결과값을 OR로 묶어서 처리한다.

-- 대소비교하기
-- ANY / ALL 다중값에 대해 대소비교를 할 수 있는 예약어
-- ANY : RESULTSET으로 나온값을 OR연결해서 대소비교를 함.
-- X > ANY(다중행서브쿼리)  : ANY에 있는 어떤 값보다 x가 크기만 하면 참, -> 최소값보다 크면 참.

--D5, D6부서 사원의 최저급여를 받는 사원보다 많은 급여를 받는 사원의 이름 월급 부서코드를 조회
SELECT SALARY FROM EMPLOYEE WHERE DEPT_CODE IN ('D6','D5') ORDER BY SALARY;

SELECT EMP_NAME, SALARY, DEPT_CODE
FROM EMPLOYEE
WHERE SALARY > ANY(SELECT SALARY FROM EMPLOYEE WHERE DEPT_CODE IN ('D6','D5'));

-- 직책이 J3, J5인 사원들 중 최소급여보다 많이 받는 사원 조회
-- 전체컬럼
SELECT *
FROM EMPLOYEE
WHERE SALARY > ANY(SELECT SALARY FROM EMPLOYEE WHERE JOB_CODE IN ('J3','J5'));

-- X < ANY(서브쿼리) : ANY에 있는 어떤값보다 X가 작기만하면 참 -> 최대값보다 작은 참.
SELECT SALARY FROM EMPLOYEE WHERE JOB_CODE IN('J3','J5');

SELECT *
FROM EMPLOYEE
WHERE SALARY < ANY(SELECT SALARY FROM EMPLOYEE WHERE JOB_CODE IN('J3','J5'))
ORDER BY SALARY DESC;


-- ALL() : 모든 값보다 크다, 작다 -> AND
-- X>ALL() : ALL의 모든값 보다 큰 X가 참 -> ALL의 최대 값보다 큰것만 참.
-- X<ALL() : ALL의 모든값 보다 작은 X가 참 -> ALL의 최소값보다 작은것만 참.

-- 부서가 D2,D5인 사원들 중 최대급여를 받는 사원보다 급여를 많이 받는 사원
SELECT *
FROM EMPLOYEE
--WHERE SALARY > ALL(SELECT SALARY FROM EMPLOYEE WHERE DEPT_CODE IN ('D2','D5'));
WHERE SALARY > (SELECT MAX(SALARY) FROM EMPLOYEE WHERE DEPT_CODE='D2' OR  DEPT_CODE='D5');

--다중열 서브쿼리 : 열은 다수, 행은 한개인 서브쿼리.
--퇴직한 여사원의 같은 부서, 같은 직급에 해당하는 사원 조회
SELECT DEPT_CODE, JOB_CODE 
FROM EMPLOYEE 
WHERE ENT_YN='Y';

SELECT *
FROM EMPLOYEE
--WHERE DEPT_CODE=(SELECT DEPT_CODE FROM EMPLOYEE WHERE ENT_YN='Y')
--AND JOB_CODE=(SELECT JOB_CODE FROM EMPLOYEE WHERE ENT_YN='Y');--, JOB_CODE
WHERE (DEPT_CODE, JOB_CODE) 
            IN (SELECT DEPT_CODE, JOB_CODE FROM EMPLOYEE WHERE ENT_YN='Y');

--기술지원부이면서 급여가 200백만원인 사원의 이름, 부서,코드 급여 조회하기.
SELECT * FROM EMPLOYEE JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID 
WHERE SALARY=2000000 AND DEPT_TITLE='기술지원부';
SELECT *
FROM EMPLOYEE
WHERE (DEPT_CODE, SALARY) IN (SELECT DEPT_CODE, SALARY FROM EMPLOYEE JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID 
                                                                WHERE SALARY=2000000 AND DEPT_TITLE='기술지원부');

-- 다중행, 다중열 서브쿼리 : 열도 다수, 행도 다수
-- 부서별 최소급여 구하기
SELECT DEPT_CODE, MIN(SALARY)
FROM EMPLOYEE 
GROUP BY DEPT_CODE;

SELECT *
FROM EMPLOYEE
WHERE (DEPT_CODE,SALARY) IN (SELECT DEPT_CODE, MIN(SALARY)
                                                            FROM EMPLOYEE
                                                            GROUP BY DEPT_CODE);

--부서별 최대급여을 받는 사원또는 최소급여를 받는 사원을 조회하기
-- 사원명, 부서명, 급여 출력
-- * NULL도 나올 수 있게
SELECT DEPT_CODE, MAX(SALARY) FROM EMPLOYEE GROUP BY DEPT_CODE;
SELECT DEPT_CODE ,MIN(SALARY) FROM EMPLOYEE GROUP BY DEPT_CODE;
SELECT EMP_NAME, NVL(DEPT_TITLE,'인턴'), SALARY
FROM EMPLOYEE
   LEFT JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID
WHERE (NVL(DEPT_CODE,1), SALARY) IN (SELECT NVL(DEPT_CODE,1),MAX(SALARY) 
                                                            FROM EMPLOYEE GROUP BY DEPT_CODE)
             OR (NVL(DEPT_CODE,'지훈'),SALARY) IN (SELECT NVL(DEPT_CODE,'지훈'),MIN(SALARY)
                                                                FROM EMPLOYEE GROUP BY DEPT_CODE);

SELECT DEPT_CODE, COUNT(NULL) 
FROM EMPLOYEE
GROUP BY DEPT_CODE;


-- 상관서브쿼리(상호연관)
--메인쿼리의 값을 서쿼리에 주고 서브쿼리를 수행한 다음 그결과를 다시 메인쿼리로 반환해서 수행하는 쿼리(일종의 이중루프문)
--> 서브쿼리의 WHERE절에 MAIN쿼리의 값을 가져와 비교

--> 메인쿼리에 있는 것(컬럼값)을 서브쿼리에(WHERE) 가져다 쓰면 상관쿼리
--> 상관서브쿼리는 독립적으로 실행이 불가능한 서브쿼리

-- EXISTS : 서브쿼리의 결과가 있으면 -> ROW가 있으면 TRUE / ROW가 0개면 FALSE

SELECT * FROM EMPLOYEE
WHERE EXISTS (SELECT 1 FROM EMPLOYEE WHERE EMP_ID='200');

SELECT * FROM EMPLOYEE E
WHERE EXISTS(SELECT EMP_NAME FROM EMPLOYEE WHERE MANAGER_ID=E.EMP_ID);

-- 상관서브쿼리로 DEPT_CODE가 있는 사원만 출력하기
-- IS NOT NULL /NULL 또는 JOIN사용하지 않기
-- 이름. DEPT_CODE
SELECT EMP_NAME,DEPT_CODE
FROM EMPLOYEE E
WHERE EXISTS(SELECT DEPT_CODE FROM DEPARTMENT WHERE DEPT_ID=E.DEPT_CODE);

-- 급여를 가장많이 받는 사원을 상관서브쿼리로 구해보자.
-- 사원명, 급여
SELECT EMP_NAME, SALARY
FROM EMPLOYEE E
WHERE NOT EXISTS(SELECT '쵝오' FROM EMPLOYEE WHERE SALARY>E.SALARY);


--직급이 J1,J2,J3가 아닌 사원 중에서 자신의 부서별 평균급여보다 많은 급여를 받는 사원
SELECT *
FROM EMPLOYEE E
WHERE JOB_CODE NOT IN('J1','J2','J3')
            AND SALARY>(SELECT AVG(SALARY) FROM EMPLOYEE WHERE DEPT_CODE=E.DEPT_CODE);


-- 스칼라 서브쿼리 : 상관서브쿼리인데,, RESULTSET 무조건 단일행인 것
-- 컬럼작성하는 곳에 사용가능, WHERE 절에 사용가능
-- 모든 사원의 매니저의 이름 조회 -> 사원번호, 사원명, 관리자번호, 관리자명
SELECT EMP_ID, EMP_NAME, MANAGER_ID,
                NVL((SELECT EMP_NAME FROM EMPLOYEE WHERE EMP_ID=E.MANAGER_ID),'없음')
FROM EMPLOYEE E;

--사원명, 부서코드, 부서별 평균임금(자기가 속한 부서)을 조회해라
SELECT EMP_NAME, DEPT_CODE,
            TO_CHAR(FLOOR((SELECT AVG(SALARY) 
                            FROM EMPLOYEE WHERE DEPT_CODE=E.DEPT_CODE)),'L999,999,999') AS 부서평균
FROM EMPLOYEE E; 

-- 자기가 속한 부서의 평균급여보다 더 월급을 많이 받는 사원을 구하세요;
-- 이름, 부서명, 월급
SELECT EMP_NAME, DEPT_TITLE, SALARY
FROM EMPLOYEE E
        JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID 
WHERE SALARY>(SELECT AVG(SALARY) FROM EMPLOYEE WHERE DEPT_CODE=E.DEPT_CODE);



-- 인라인 뷰 : FROM절에 서브쿼리를 작성하여 서브쿼리의 결과를 테이블로 보는 것
-- 실제 물리적테이블에 있는 값이 아닌 가상의 테이블의 값이라고 보면 됨.
-- 인라인 뷰(INLINE VIEW) : 1번만 사용할 수 있는 테이블로 쓰이는 서브 쿼리문
-- 스토어드 뷰(STORED VIEW) : 테이블로 쓰이는 서브쿼리문을 저장하고 이름을 부여해서 재호출 가능하게하는 것 -> VIEW

-- 여사원의 사번, 사원명, 부서코드, 성별 출력하기
SELECT EMP_ID, EMP_NAME, DEPT_CODE,
            DECODE(SUBSTR(EMP_NO,8,1),'1','남','2','여') AS 성별
FROM EMPLOYEE
WHERE DECODE(SUBSTR(EMP_NO,8,1),'1','남','2','여')='여';            

-- INLINE VIEW로 처리하면 별칭을 컬럼으로 이용해서 처리할 수 있다.
SELECT 성별
FROM
            (SELECT EMP_ID, EMP_NAME, DEPT_CODE,
                            DECODE(SUBSTR(EMP_NO,8,1),'1','남','2','여') AS 성별
            FROM EMPLOYEE)
WHERE 성별 ='여';

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
        SELECT '일반' AS DIV, GE_NO AS NO, GE_ID AS ID, GE_PW AS PW
        FROM GE
        UNION
        SELECT '사업자', BU_NO, BU_ID, BU_PW
        FROM BU
        UNION
        SELECT '관리자',MA_NO,MA_ID,MA_PW
        FROM MA
    )
where id='admin' and pw='1234';

--TOP-N 분석 : 순위를 부여하는 것 예) 급여를 많이 받는 TOP 3 / 급여를 많이 받는 3~6 사원
-- 급여를 많이 받는 사원 1~3위 까지 조회하기
SELECT EMP_NAME, SALARY 
FROM EMPLOYEE 
--WHERE --??? 기준???
ORDER BY SALARY DESC;

-- 2가지 방법
--1. ROWNUM 컬럼을 이용하는 방법 -> 오라클이 자동을 생성해주는 컬럼 모든 SELECT문 결과에 포함되어있음
--2. 오라클 제공함수이용하기(RANK())

SELECT ROWNUM, EMP_NAME, SALARY
FROM EMPLOYEE
--WHERE DEPT_CODE='D5';
WHERE ROWNUM <= 3
ORDER BY SALARY DESC;


--정렬된 ROW를 기준으로 ROWNUM이 부여가 될려면....ㅠㅠ
SELECT ROWNUM, E.*
FROM (
        SELECT EMP_NAME, SALARY
        FROM EMPLOYEE
        ORDER BY SALARY DESC
        ) E
WHERE ROWNUM <=3;


-- 급여를 많이 받는 사원 5등 10등까지 출력하기
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

-- ROWNUM을 가지고 비교를 할때는 무조건 1부터 시작을 해야 함.

-- 게시판 구성할때 -> PAGING처리할때 사용하는 SQL문!

--D5부서의 연봉을 많이 받는 사람 3명 조회하기
-- 이름, 부서명, 급여, 연봉(보너스 포함)
SELECT * 
FROM(
    SELECT ROWNUM AS RNUM, E.*
    FROM    (
        SELECT EMP_NAME, DEPT_CODE, DEPT_TITLE, SALARY, (SALARY+(SALARY*NVL(BONUS,0)))*12 AS 연봉
        FROM EMPLOYEE JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID 
        WHERE DEPT_CODE='D5'
        --ORDER BY 연봉;
        ORDER BY 4 DESC
        ) E
    )
WHERE RNUM BETWEEN 1 AND 3;--DEPT_CODE='D5';-- 



-- 함수를 이용하기
-- RANK() OVER(정렬기준) : 각 ROW에 순서를 부여하는 함수
SELECT EMP_NAME, SALARY,
            RANK() OVER(ORDER BY SALARY DESC) AS 순위
FROM EMPLOYEE;
--WHERE RANK() OVER(ORDER BY SALARY DESC) BETWEEN 1 AND 3;
SELECT *
FROM(
        SELECT EMP_NAME, SALARY,
                    RANK() OVER(ORDER BY SALARY DESC) AS 순위
        FROM EMPLOYEE
        )
WHERE 순위 BETWEEN 1 AND 3;

-- DENSE_RANK() OVER(정렬기준)  :  중복값이 있을때 번호를 
SELECT RANK() OVER(ORDER BY SALARY) AS 순위,
            EMP_NAME, SALARY,
            DENSE_RANK() OVER(ORDER BY SALARY) AS DENSE순위
FROM EMPLOYEE;

-- 계층형 쿼리 : 
-- 각 ROW별 연결할 수 있는 COLUMN이 있어야함.
-- 댓글, 대댓글 사용할 때 이용하는 쿼리문.
SELECT EMP_ID, EMP_NAME, MANAGER_ID
FROM EMPLOYEE;

SELECT LEVEL, EMP_ID, EMP_NAME, MANAGER_ID
FROM EMPLOYEE
START WITH EMP_ID=200 -- ROOT행 최상위 ROW 1번
CONNECT BY PRIOR EMP_ID=MANAGER_ID;

SELECT LEVEL||' '||LPAD(' ',(LEVEL-1)*5,' ')||EMP_NAME
                ||NVL2(MANAGER_ID,'('||MANAGER_ID||')','') AS 조직도
FROM EMPLOYEE
    --START WITH EMP_ID=200
    START WITH MANAGER_ID IS NULL
    CONNECT BY PRIOR EMP_ID=MANAGER_ID;
    
---- DQL 끝! ------


-- 오라클의 데이터형을 알아보자.
-- 문자형 : CHAR, VARCAHR2 -> 문자열을 저장할때는 VARCHAR2를 사용해라
-- CHAR, VARCHAR2차이는 고정, 가변
-- CHAR : 고정형 문자열 타입으로 길이만큼 공간을 확보하여 사용한다.
-- VARCHAR2 :  가변형 문자열 타입으로 길이만큼 공간을 확보하지 않고, 대입된 데이터만큼 공간을 확보.

CREATE TABLE TBL_STR(
    A CHAR(6),
    B VARCHAR2(6)
);
SELECT * FROM TBL_STR;
INSERT INTO TBL_STR VALUES('ABC','ABC');
INSERT INTO TBL_STR VALUES('가','가');

SELECT LENGTHB(A), LENGTHB(B) FROM TBL_STR;

-- 숫자형 :  NUMBER
-- 정수, 실수 모두 저장
-- NUMBER([PRECISION,SCALE]) * [] 부분은 생략해도 됨.
-- PRECISION : 표현할수 있는 전체자리수(정수)(1~38)
-- SCALE : 소수점이하 자리수(-84~127)
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


-- 날짜형 : DATE
CREATE TABLE TBL_DATE(
    BIRTHDAY DATE,
    DAY TIMESTAMP
);

INSERT INTO TBL_DATE VALUES(SYSDATE,SYSTIMESTAMP);
SELECT * FROM TBL_DATE;

INSERT INTO TBL_DATE VALUES('1920/08/15','21/11/15 12:11:00');



--기본 테이블 생성하기
--CREATE TABLE 테이블명( 컬럼명 자료형, 컬럼명 자료형,.......);
CREATE TABLE MEMBER (
    MEMBER_ID VARCHAR2(20),
    MEMBER_PWD VARCHAR2(20),
    MEMBER_NAME VARCHAR2(20)
);

-- 테이블 컬럼에 COMMENTS 설정하기
-- COMMENT ON COLUMN 테이블.컬럼명 IS COMMENT내용
COMMENT ON COLUMN MEMBER.MEMBER_ID IS '회원아이디';
COMMENT ON COLUMN MEMBER.MEMBER_PWD IS '회원 비밀번호';


SELECT * FROM USER_COL_COMMENTS
WHERE TABLE_NAME='MEMBER';

-- 생성된 테이블에 COMMENT설정하기
SELECT * FROM USER_TAB_COMMENTS;
COMMENT ON TABLE MEMBER IS '회원정보관리';

--테이블 지우기
DROP TABLE TBL_STR;

-- 테이블에  데이터를 저장할때 제한(제약)두는 방법에 대해 알아보자
-- 제약조건

-- NOT NULL(C) : 설정한 컬럼에 NULL 값을 허용하지 않는것 -> 모든컬럼은 DEFAULT로 NULL을 허용하게 되어있음.
-- UNIQUE(U) : 설정한 컬럼에 대입되는 값이 중복되지 않게 하는것 -> 모든 ROW에 중복값이 없음
-- PRIMARY KEY(P) : 데이터를 구분할 수 있는 컬럼에 설정하는 것으로 이 컬럼을 가지고 특정 ROW(DATA)를 찾을 수 있다.
--                           한개 테이블에 두개이상의 PK를 설정할 수 없다. -> PK는 테이블당 한개 설정
-- FOREIGN KEY(R) : 설정한 컬럼의 값은 다른 테이블 컬럼에 있는 값만 저장하게 하는 것. 다른 테이블의 컬럼의 값을 중복이 없어야함.
-- CHECK(C) : 설정한 컬럼에 지정한 값만 저장할 수 있게 하는 것 ->특정값, 범위를 설정

-- 테이블에 설정되 제약조건 확인하기.
SELECT *
FROM USER_CONSTRAINTS;
SELECT * FROM USER_CONS_COLUMNS;

--테이블에 대한 제약조건을 검색할때는 두개테이블을 조인해서 사용
SELECT CONSTRAINT_NAME, USER_CONSTRAINTS.TABLE_NAME, COLUMN_NAME, CONSTRAINT_TYPE
FROM USER_CONSTRAINTS JOIN USER_CONS_COLUMNS USING(CONSTRAINT_NAME)
WHERE USER_CONSTRAINTS.TABLE_NAME='EMPLOYEE';

--제약조건 설정해보자!
-- NOT NULL제약조건 설정하기
INSERT INTO MEMBER VALUES(NULL,NULL,NULL);
SELECT * FROM MEMBER;
CREATE TABLE CONS_NN(
    USER_NO NUMBER,
    USER_NAME VARCHAR2(20),
    EROLL_DATE DATE
);

DROP TABLE CONS_NN;

-- 제약조건을 설정하는 방법에는 두가지 방법이 있음
-- 1. 컬럼 레벨에서 설정 -> 컬럼을 선언한 곳에서 제약조건을 설정
-- 2. 테이블 레벨에서 설정 -> 컬럼설정을 다 하고 마지막에 제약조건을 설정

-- NOT NULL제약조건은 컬럼레벨에서만 설정이 가능함.
CREATE TABLE CONS_NN(
    USER_NO NUMBER NOT NULL,
    USER_NAME VARCHAR2(20) NOT NULL,
    EROLL_DATE DATE,
    NOT NULL(EROLL_DATE) --안됨!
);

INSERT INTO CONS_NN VALUES(NULL,NULL,NULL);
INSERT INTO CONS_NN VALUES(1,'유지훈궁금',NULL);
INSERT INTO CONS_NN VALUES(1,NULL,NULL);

SELECT * FROM CONS_NN;

-- UNIQUE : 컬럼에 중복값을 저장하지 않게 하는 설정
CREATE TABLE TBL_USER(
    USER_NO NUMBER,
    USER_ID VARCHAR2(20),
    USER_PWD VARCHAR2(20),
    USER_NAME VARCHAR2(20),
    EMAIL VARCHAR2(20)
);
SELECT * FROM TBL_USER;
INSERT INTO TBL_USER VALUES(1, 'COMIC','12344','김가현','GA@GA.COM');

--UNIQUE 제약조건 설정하기
CREATE TABLE TBL_USER_UQ(
    USER_NO NUMBER,
    USER_ID VARCHAR2(20) UNIQUE,
    USER_PWD VARCHAR2(20),
    USER_NAME VARCHAR2(20),
    EMAIL VARCHAR2(20) UNIQUE
);

SELECT * FROM TBL_USER_UQ;
INSERT INTO TBL_USER_UQ VALUES(1,'COMIC','1234','김가현','GA@GA.COM');
INSERT INTO TBL_USER_UQ VALUES(1,'COMIC1','1234','김가현','GA@GA.COM');
INSERT INTO TBL_USER_UQ VALUES(1,'COMIC1','1234','김가현','GA1@GA1.COM');

-- NULL값은 어떻게 처리될까?
INSERT INTO TBL_USER_UQ VALUES(2,NULL,'1234','김가현','GA2@GA2.COM');
INSERT INTO TBL_USER_UQ VALUES(2,NULL,'1234','김가현','GA3@GA3.COM');
SELECT * FROM TBL_USER_UQ;

-- 오라클에서 UNIQUE제약조건이 NULL값 처리하지 않음. -> 밴더회사들 마다 처리 기준이 다름.

-- 테이블레벨에서 UNIQUE제약조건 설정하기
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
INSERT INTO TBL_USER_UQ2 VALUES(1,'USER1','USER1','유저일','U@U.COM');


-- UNIQUE제약조건을 한개이상의 컬럼에 설정하기
CREATE TABLE TBL_USER_UQ3(
    USER_NO NUMBER,
    USER_ID VARCHAR2(20),
    USER_PWD VARCHAR2(20),
    USER_NAME VARCHAR2(20),
    EMAIL VARCHAR2(20),
    UNIQUE(USER_ID, EMAIL)
);

SELECT * FROM TBL_USER_UQ3;
INSERT INTO TBL_USER_UQ3 VALUES(1,'USER11','USER11','유저일','U@U.COM');
INSERT INTO TBL_USER_UQ3 VALUES(1,'USER11','USER11','유저일','U1@U1.COM');
INSERT INTO TBL_USER_UQ3 VALUES(1,'USER12','USER11','유저일','U1@U1.COM');
INSERT INTO TBL_USER_UQ3 VALUES(1,'USER12','USER22','유저이','U@U.COM');
INSERT INTO TBL_USER_UQ3 VALUES(1,'USER11','USER22','유저이','U@U.COM');

-- 제약조건은 한컬럼에 두개 이상을 설정할 수 있음.
CREATE TABLE TBL_USER_CONS(
    USER_NO NUMBER,
    USER_ID VARCHAR2(20) NOT NULL UNIQUE,
    USER_PWD VARCHAR2(20),
    USER_NAME VARCHAR2(20),
    EMAIL VARCHAR2(20),
    UNIQUE(USER_ID, EMAIL)
);

INSERT INTO TBL_USER_CONS VALUES(1,'USER1','USER1','유저일','U1@U1.COM');
INSERT INTO TBL_USER_CONS VALUES(1,NULL,'USER1','유저일','U1@U1.COM');
INSERT INTO TBL_USER_CONS VALUES(1,'USER1','USER1','유저일','U1@U1.COM');

SELECT * FROM TBL_USER_CONS;

-- PRIMARY KEY : 
-- 중복값이 없고, NULL값도 없는 컬럼에 설정함 -> 설계자가. 설정
-- 한개테이블당 한개 PK만 설정이 가능함.
-- 테이블레벨, 컬럼레벨에서 설정이 가능함
-- 자동으로 NOT NULL제약조건, UNIQUE제약조건이 설정됨.

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

-- PK 한개 컬럼에만 가능한가???
-- 두개이상 컬럼으로 사용이 가능함 -> 복합키
-- 장바구니, 
-- 상품, 날짜, 수량, 아이디, 주문번호
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

--외래키(FOREIGN KEY) : 외부테이블 컬럼에 있는 값을 참조해서 지정컬럼에 값을 대입하게 하는 것.
-- 카테고리, 부서명, 학과명
-- 부모, 자식 관계가 성립.


--게시판
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
INSERT INTO BOARD VALUES(1,'이거(냉무)',NULL,'USER01',SYSDATE);

INSERT INTO BOARD VALUES(2,'이거(냉무)',NULL,'USER02',SYSDATE);

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
INSERT INTO SHOP_BUY VALUES(2,'USER55','에어컨',SYSDATE);

-- FOREIGN KEY제약조건을 설정할때는 조건
-- 참조되는 컬럼에는 UNIQUE제약조건이 설정이 되어있어야함.

CREATE TABLE MEMBER2(
    USER_ID VARCHAR2(20) UNIQUE,
    USER_PWD VARCHAR2(20)
);
DROP TABLE MEMBER2;
DROP TABLE SHOP_BUY;


-- 함부로 데이터를 수정하지 못하게 만들어 버림 -> 참조되 값은 지우지 못함.
SELECT * FROM BOARD;
--참조되고 있는 값을 삭제 해보자.
SELECT * FROM MEMBER;

DELETE FROM MEMBER WHERE USER_ID='USER01';
DELETE FROM BOARD WHERE BOARD_WRITER='USER01';

DROP TABLE MEMBER;

-- DATA 참조관계에 있을때 지우지 못함. -> 옵션으로 삭제가 가능하게 만들 수 있음.
-- FOREIGN KEY 제약 조건을 설정할때 옵션을 설정하면됨.
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
INSERT INTO SHOP_BUY VALUES(1,'USER01','지장사스님바지',SYSDATE);
SELECT * FROM SHOP_BUY;
SELECT * FROM MEMBER2;
DELETE FROM MEMBER2 WHERE USER_ID='USER01';

-- CHECK제약조건. 내가 설정한 값만 저장할 수 있게 하는것
-- 일치하는 값, 범위
CREATE TABLE USER_CHECK(
        USER_NO NUMBER,
        USER_NAME VARCHAR2(20),
        GENDER VARCHAR2(10) CHECK(GENDER IN('남','여')),
        AGE NUMBER,
        CHECK(AGE BETWEEN 17 AND 19 AND USER_NO>10)
);

DROP TABLE USER_CHECK;

INSERT INTO USER_CHECK VALUES(1,'유병승','M',19);
INSERT INTO USER_CHECK VALUES(11,'유병승','남',19);
INSERT INTO USER_CHECK VALUES(1,'유지훈','남',17);
INSERT INTO USER_CHECK VALUES(1,'유병승','남자',19);
INSERT INTO USER_CHECK VALUES(1,'유병승','여',19);
SELECT * FROM USER_CHECK;


-- 제약조건을 설정할때 제약조건명 부여하기

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

--TEST_MEMBER 테이블
--MEMBER_CODE(NUMBER) - 기본키						-- 회원전용코드 
--MEMBER_ID (varchar2(20) ) - 중복금지					-- 회원 아이디
--MEMBER_PWD (char(20)) - NULL 값 허용금지					-- 회원 비밀번호
--MEMBER_NAME(nchar(10)) 							-- 회원 이름
--MEMBER_ADDR (char(50)) - NULL값 허용금지					-- 회원 거주지
--GENDER (varchar2(5)) - '남' 혹은 '여'로만 입력 가능				-- 성별
--PHONE(varchar2(20)) - NULL 값 허용금지 					-- 회원 연락처

--서브쿼리를 이용해서 테이블 만들기
--작성방법
--CREATE TABLE 테이블명([컬럼명,컬럼명....])
--AS 서브쿼리
--테이블 복사,,
CREATE TABLE EMP_COPY
AS SELECT * FROM EMPLOYEE;
SELECT * FROM EMP_COPY;
DROP TABLE EMP_COPY;

--복사시 데이터를 뼤고 테이블만 생성을하려면
CREATE TABLE EMP_COPY
AS SELECT EMP_NAME,DEPT_CODE,JOB_CODE,SALARY
FROM EMPLOYEE WHERE 1=2;
SELECT * FROM EMP_COPY;

--INSERT문 활용하기
--특정테이블에 한개 ROW를 추가하는 구문
--한번에 한개데이터만 삽입이 가능함
--1.지정한 컬럼에만 데이터를 추가하는 방법-> 지정안된 컬럼의 값은? NULL
--INSERT INTO 테이블명(지정컬럼1,지정컬럼2,지정컬럼3,,,,)VALUES(값1,겂2,값3,,,,);
--2.전체 컬럼에 데이터를 추가하는 방법->테이블에 있는 전체컬럼의 값을 다작성해야함
--INSERT INTO 테이블명 VALUES(컬럼1,컬럼2값,컬람3값,,,,);

--DERARTMENT에 값추가하기
SELECT *FROM DEPARTMENT;
--INSERT INTO DEPARTMENT(DEPT_ID,DEPT_TITLE)
INSERT INTO DEPARTMENT(DEPT_ID,LOCATION_ID)
VALUES('A1','L3');

--EMPLOYEE테이블에 자신의 정보를 입력하기
--전체 컬럼에 대해 입력
--필수 컬럼에 대해 입력)NOT NULL
SELECT * FROM EMPLOYEE;
INSERT INTO EMPLOYEE VALUES('223','이효형','950303-111111','DLGYGUD@NAVER.COM','01065231715'
,'D3','J3','S1',7000000,0.2,'203',SYSDATE,NULL,'N');
INSERT INTO EMPLOYEE(EMP_ID,EMP_NAME,EMP_NO,JOB_CODE,SAL_LEVEL)
VALUES('223','이효형','950303-111111','J3','S1');

--INSERT문에 서브쿼리를 이용해보자
CREATE TABLE INSERT_TSER
AS SELECT EMP_ID,EMP_NAME,DEPT_TITLE
FROM EMPLOYEE JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID
WHERE 1=2;
SELECT * FROM INSERT_TSER;
INSERT INTO INSERT_TSER VALUES(1,'유지훈','개발팀');
--서브쿼리를 이용해서 기존에 있는 데이터를 복사해서 넣어보자
INSERT INTO INSERT_TSER(SELECT EMP_ID,EMP_NAME,DEPT_TITLE
                        FROM EMPLOYEE JOIN DEPARTMENT ON DEPT_ID=DEPT_CODE
                        WHERE DEPT_CODE='D5');
--INSERT ALL: 두개이상의 테이블에 한개의 SELECT문의 결과를 각각 값을 넣을떄 사용  
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

--INSERT ALL을 조건에 따라 분리해서 삽입하기
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

--UPDATE문:한개 또는 그이상의 ROW의 값을 수정하는 명력어
--UPDATE 테이블명 SET 수정할컬럼=수정할값,수정할 컬럼=수정할 값,,,,, [WHERE 조건식] *WHERE은 생략하지마!
CREATE TABLE DEPT_COPY
AS SELECT * FROM DEPARTMENT;
SELECT * FROM DEPT_COPY;

UPDATE DEPT_COPY SET DEPT_TITLE='자바개발부'WHERE DEPT_ID='A1';
--만약에 UPDATE문에서 WHERE절을 쓰지 않는 다면??->반드시 WHERE절 사용
UPDATE DEPT_COPY SET DEPT_TITLE='안녕 내직장!';
ROLLBACK;

--UPDATE문에서 서브쿼리 사용하기
--WHERE에서 사용,수정하는 값으로 사용
DROP TABLE EMP_COPY;
CREATE TABLE EMP_COPY
AS SELECT * FROM EMPLOYEE;
--급여가 200만원 미만인 사원의 보너스를 0.4변경하기
UPDATE EMP_COPY SET BONUS=0.4 WHERE SALARY<2000000;
SELECT * FROM EMP_COPY WHERE SALARY<2000000;

--방명수의 월급을 심봉선의 월급과 동일하게 변경하기
UPDATE EMP_COPY SET SALARY=(SELECT SALARY FROM EMP_COPY WHERE EMP_NAME='심봉선')
WHERE EMP_NAME='방명수';
SELECT * FROM EMP_COPY;

--방명수의 월급과 보너스를 전지연의 월급과 보너스와 같이 변경하기
UPDATE EMP_COPY 
--SET 
--SALARY=(SELECT SALARY FROM EMP_COPY WHERE EMP_NAME='전지연'),
--BONUS=(SELECT BONUS FROM EMP_COPY WHERE EMP_NAME='전지연') 
SET(SALARY,BONUS)=(SELECT SALARY,BONUS FROM EMP_COPY WHERE EMP_NAME='전지연')
WHERE EMP_NAME='방명수';

--임시환 사원의 직급을 과장, 부서를 해외영업 3부로 변경하는 쿼리를 작성
UPDATE EMP_COPY 
--SET JOB_CODE=(SELECT JOB_CODE FROM JOB WHERE JOB_NAEM='과장'),
--DEPT_CODE=(SELECT DEPT_CODE FROM DEPARTMENT WHERE DEPT_TITLE='해외영업3부')
SET (JOB_CODE,DEPT_CODE)=(SELECT JOB_CODE,DEPT_ID FROM JOB CROSS JOIN DEPARTMENT
                            WHERE JOB_NAME='과장' AND DEPT_TITLE='해외영업3부')
WHERE EMP_NAME='임시환';
ROLLBACK;

--DELETE: 조건에 맞는 ROW를 삭제하는 명력어\
--DELETE FROM 테이블 [WHERE 조건식] *WHERE을 생략하면 전체를 지우는것
SELECT *FROM EMP_COPY;
DELETE FROM EMP_COPY WHERE EMP_NAME='이효형';

--보너스를 받지 않는 사원을 삭제
DELETE FROM EMP_COPY WHERE BONUS IS NULL;

--DELETE사용시 주의할 사항: 자신을 참조하고 있는 자식 테이블이 있는 경우 삭제 불가능(외래키)

--전체 ROW를 삭제하는것:TRUNCATE->1, DELETE보다 빠름,,,2.ROLLBACK 할수 없음 
DELETE FROM EMP_COPY;
SELECT *FROM EMP_COPY;
ROLLBACK;
TRUNCATE TABLE EMP_COPY;

--테이블 병합하기 MERGE
CREATE TABLE TBL_MERGE01(
ID VARCHAR2(20),
NAME VARCHAR2(20)
);
CREATE TABLE TBL_MERGE02(
ID VARCHAR2(20),
NAME VARCHAR2(20)
);

INSERT INTO TBL_MERGE01 VALUES('USER01','유지휸');
INSERT INTO TBL_MERGE01 VALUES('USER02','유병승');
INSERT INTO TBL_MERGE02 VALUES('USER03','김가현');
INSERT INTO TBL_MERGE02 VALUES('USER02','박원재');

--MERGE INTO 기준이되는 테이블명
--USING 합칠 테이블명 ON(동일여부를 판단하는 기준컬럼)
--WHEN MATCHED THEN DML구문
--WHEN NOTMATCHED THEN DML구문
MERGE INTO TBL_MERGE01
USING TBL_MERGE02 ON(TBL_MERGE01.ID=TBL_MERGE02.ID)
WHEN MATCHED THEN
UPDATE SET TBL_MERGE01.NAME=TBL_MERGE02.NAME
WHEN NOT MATCHED THEN
INSERT VALUES(TBL_MERGE02.ID,TBL_MERGE02.NAME);
SELECT * FROM TBL_MERGE01;

--ALTER :테이블등 오라클에서 제공하는 OBJECT를 수정할떄사용
--컬럼 추가,컬럼 삭제,컬럼명 변경,자료형변경,디폴트값 설정
--제약조건추가 ,삭제,이름을 변경

CREATE TABLE TBL_USER_ALTER(
    USER_NO NUMBER PRIMARY KEY,
    USER_ID VARCHAR2(20),
    USER_PWD VARCHAR2(20)
);
SELECT * FROM TBL_USER_ALTER;

--컬럼추가하기
ALTER TABLE TBL_USER_ALTER ADD(USER_NAME VARCHAR2(20));
DESC TBL_USER_ALTER;

INSERT INTO TBL_USER_ALTER VALUES(1,'ADMIN','1234','관리자');
INSERT INTO TBL_USER_ALTER VALUES(2,'USER01','USER01','유저일');
--테이블에 데이터가 있는 상태에서 새로운 컬럼을 추가한다면?
ALTER TABLE TBL_USER_ALTER ADD(ADDRESS VARCHAR2(100));
--컬럼을 추가할떄 제약조건도 추가할수 있을까??
ALTER TABLE TBL_USER_ALTER ADD(GENDER VARCHAR2(10) CHECK(GENDER IN('남','여')));
INSERT INTO TBL_USER_ALTER VALUES(3,'USER2','USER2','유저이','상봉','여');

--데이터가 있는 테이블에 컬럼을 추가할떄 주의할점,NOT NULL재약조건 설정시 주의
ALTER TABLE TBL_USER_ALTER ADD(EMAIL VARCHAR2(50) DEFAULT 'NONE' NOT NULL );
INSERT INTO TBL_USER_ALTER VALUES(4,'USER3','USER3','유저삼','은평구','남','AD@AD.CPM');

--제약조건 추가하기
--ALTER TABLE 테이블명 ADD 제약조건명(컬럼)->SYS00123제약조건명이 권장하지 않음!
--ALTER TABLE 테이블명 ADD CONSTRAINT 제약조건명 제약조건(컬럼명)
SELECT * FROM TBL_USER_ALTER;
ALTER TABLE TBL_USER_ALTER ADD CONSTRAINT TBL_USER_ID_UQ UNIQUE(USER_ID);
--NOT NULL->안됩니다. 왜?? 추가가 아니라 수정!   기본적으로 제약조건을 설정하지 않으면 YES NULL되어있음

--컬럼,제액조건 수정하기
--ALTER TABLE 테이블명 MODIFY 컬럼명 자료형
--ALTER TABLE 테이블명 MODIFY 컬럼명 CONSTRAINT 제약조건명 제약조건
DESC TBL_USER_ALTER;
ALTER TABLE TBL_USER_ALTER MODIFY EMAIL VARCHAR2(50);
ALTER TABLE TBL_USER_ALTER MODIFY USER_ID VARCHAR2(5);

--제약조건 수정하기
ALTER TABLE TBL_USER_ALTER MODIFY USER_ID CONSTRAINT NN_USER_ID NOT NULL;

--컬럼 삭제하기
--ALTER TABLE 테이블명 DROP COLUMN 컬러명
ALTER TABLE TBL_USER_ALTER DROP COLUMN EMAIL;
SELECT * FROM TBL_USER_ALTER;
--제약조건삭제
--ALTER TABLE 테이블명 DROP CONSTRAINT 제약조건명
ALTER TABLE TBL_USER_ALTER DROP CONSTRAINT NN_USER_ID;
DESC TBL_USER_ALTER;

--컬럼명 수정하기
--ALTER TABLE 테이블명 RENAME COLUMN 변경할컬럼명 TO 변경내용
ALTER TABLE TBL_USER_ALTER RENAME COLUMN USER_ID TO ID;
--제약조건명 수정하기
ALTER TABLE TBL_USER_ALTER RENAME CONSTRAINT SYS_C007170 TO USER_NO_PK;

--테이블 삭제하기: DROP TABLE 테이블명
DROP TABLE TBL_USER_ALTER;
SELECT *FROM TBL_USER_ALTER;
--테이블 삭제시 유의할 사항 -> 참조관계에 설정이 있다면 함부로 지울수 없다,
CREATE TABLE REF_TEST(
 EMP_ID VARCHAR2(20)REFERENCES MEMBER(USER_ID),
 EMP_NAME VARCHAR2(20)
 );

--DCL: DATA에 데한 접근권한 설정, 권한을 회수하는 기능/트랜잭션 처리
--권한부여/회수: GRANT.REVOKE
--GRANT 권한명||ROLE명,권한명,권한명,,,, TO 사용자명
--세부적인 내용(특정사용자의 특정 테이블)에 대해 권한부여 할떄
--GRANT 권한명 ON 테이블 TO 사용자명 / 다른사용자 소유의 테이블에도 접근이 가능하게 만들수 있음,
CREATE USER QWER IDENTIFIED BY QWER;
GRANT CREATE SESSION TO QWER;
GRANT CREATE TABLE TO QWER;
ALTER USER QWER DEFAULT TABLESPACE USERS;
ALTER USER QWER QUOTA UNLIMITED ON USERS;

--사용자에게 부여된 권한을 확인하기
SELECT * FROM DBA_SYS_PRIVS--게별권한 조회
WHERE GRANTEE='QWER';
SELECT * FROM DBA_ROLE_PRIVS
WHERE GRANTEE='KH';

--USER에서 검색
SELECT * FROM USER_ROLE_PRIVS
WHERE USERNAME='KH';

--ROLE에 부여된 권한 확인하기
SELECT * FROM DBA_SYS_PRIVS
WHERE GRANTEE='RESOURCE';

CREATE ROLE MYROLE;
GRANT CREATE TABLE,CREATE SESSION TO MYROLE;

--QWER계정에 권한을 부여해서 KH소유 테이블에 접근하게 해보자
SELECT * FROM EMPLOYEE;
SELECT * FROM KH.EMPLOYEE;

GRANT SELECT ON KH.EMPLOYEE TO QWER;
SELECT * FROM KH.EMPLOYEE;
INSERT INTO KH.EMPLOYEE(EMP_ID,EMP_NAME,EMP_NO,JOB_CODE,SAL_LEVEL) 
VALUES('778','유지휸','770808-188888','J5','S5');
GRANT INSERT ON KH.EMPLOYEE TO QWER;

--한번에 여러 권한 부여하기
GRANT SELECT,INSERT,UPDATE ON KH.DEPARTMENT TO QWER;

--부여된 권한 회수하기
REVOKE SELECT ON KH.EMPLOYEE FROM QWER;

--트랜잭션: 작업단위
--트랜잭션은  INSERT, UPDATE,DELETE에 해당->테이블의 ROW를 수정했을떄
SELECT * FROM KH.TBL_USER;
GRANT SELECT ON KH.TBL_USER TO QWER;
INSERT INTO TBL_USER VALUES(2,'CO','123','유지휸','JI@HIHI.COM');
INSERT INTO TBL_USER VALUES(3,'CO','123','유지휸','JI@HIHI.COM');
INSERT INTO TBL_USER VALUES(4,'CO','123','유지휸','JI@HIHI.COM');
ROLLBACK;
COMMIT;

--VIEW:가상의 테이블, SELECT문을 이용해서 실제테이블에서 데이터를 가져와서 사용
--VIEW도 하나의 OBJECT이기떄문에 DDL로 생성,삭제,수정
--CREATE VIEW VIEW이름 AS SELECT문 작성
CREATE VIEW V_EMPALL
AS SELECT *
    FROM EMPLOYEE
    JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID
    JOIN JOB USING(JOB_CODE);
    
--VIEW에 대한 생성권한이 있어야함
GRANT CREATE VIEW TO KH;

SELECT EMP_NAME,DEPT_TITLE,JOB_NAME,SALARY
FROM V_EMPALL;

UPDATE EMPLOYEE SET DEPT_CODE='D1' WHERE EMP_NAME='송종기';

SELECT * FROM USER_VIEWS;

CREATE VIEW V_EMP_AVG
AS SELECT DEPT_CODE,FLOOR(AVG(SALARY))AS 평균
    FROM EMPLOYEE
    GROUP BY DEPT_CODE
    UNION
    SELECT JOB_CODE,FLOOR(AVG(SALARY)) AS 평균
    FROM EMPLOYEE
    GROUP BY JOB_CODE
    UNION
    SELECT '총평균',FLOOR(AVG(SALARY))AS 평균
    FROM EMPLOYEE;

SELECT * FROM V_EMP_AVG;

--VIEW 삭제하기
--DROP VIEW VIEW 명칭
DROP VIEW V_EMPALL;
SELECT * FROM V_EMPALL;

--VIEW의 특징
--1.가상컬럼을 VIEW로 이용할수있다.연산에 의해 계산된 컬럼,단 무조건 별칭을 부여해야한다
CREATE VIEW V_EMPSAL
AS SELECT EMP_ID,EMP_NAME,(SALARY+SALARY*NVL(BONUS,0))*12 연봉
    FROM EMPLOYEE;
--VIEW테이블도 권한설정해서 이용할수있게 할수있다.
SELECT * FROM KH.V_EMP_AVG;
GRANT SELECT ON KH.V_EMP_AVG TO QWER;
--VIEW에 권한을 부여받은 사용자는 실제테이블 조회도 가능할까?
SELECT * FROM KH.EMPLOYEE;

--VIEW의 데이터를 수정,삽입,삭제 할수있을까?DML가능한가?
--제약조건이 있음,가상컬럼은 아예불가능
--뷰에 대한 수정을해도 실제컬럼이 수정됨

--VIEW에서 DML이 불가능한 경우
--1.뷰에서 정의하고 있지 않은 컬럼을 수정했을때
SELECT * FROM V_EMPSAL;
UPDATE V_EMPSAL SET EMAIL='KKK@KKK.COM' WHERE EMP_NAME='유지훈';
--2.뷰에 포함되지 않은 베이스테이블의컬럼 중에서 NOT NULL제약조건이 설정된경우
CREATE VIEW V_EMP
AS SELECT EMP_ID,EMP_NO,EMP_NAME,EMAIL,PHONE,JOB_CODE,SAL_LEVEL
    FROM EMPLOYEE;
    
SELECT * FROM V_EMP;
INSERT INTO V_EMP VALUES('666','660616-126666','육육','66@66.COM','010','J2','S4');
--3 산술연산으로 구상된 컬럼 그룹함수,GROUP BY를 사용한 VIEW ,DISTINCT 포함된 VIWE
--여러테이블이 조인되어있는 VIEW 예외적으로 삽입되는 경우도 있음

--VIEW옵션
--OR REPLACE: 이미 그이름의 VIEW가 있으면 덮어쓰기시키는 명령어
SELECT * FROM USER_VIEWS;
CREATE OR REPLACE VIEW V_EMP
AS SELECT *FROM EMPLOYEE JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID;

--FORCE/NOFORCE : 실제테이블이 없어도 VIEW를 생성할수 있게해주는 옵션
CREATE FORCE VIEW V_TEMP
AS SELECT * FROM TT;
SELECT * FROM V_TEMP;
CREATE TABLE TT{
    IDX NUMBER,
    NAME VARCHAR2(20)
);

--WITH CHECK OPTION: SELECT문에 WHERE에 사용한 컬럼은 수정못하게하는 옵션
CREATE OR REPLACE VIEW V_EMP_SAL
AS SELECT EMP_NAME,DEPT_CODE,SALARY,SALARY*12 AS 연봉
    --FROM EMPLOYEE WHERE DEPT_CODE='D5';
    FROM EMPLOYEE WHERE DEPT_CODE='D5' WITH CHECK OPTION;

SELECT * FROM V_EMP_SAL;
UPDATE V_EMP_SAL SET DEPT_CODE='D6' WHERE EMP_NAME='대북혼';
ROLLBACK;

--WITH READ ONLY: VIEW 테이블을 수정하지 못하게 하는 옵션
CREATE OR REPLACE VIEW V_READ
AS SELECT EMP_NAME,DEPT_CODE,JOB_CODE,SALARY
FROM EMPLOYEE WHERE DEPT_CODE='D5' WITH READ ONLY;

UPDATE V_READ SET SALARY=1000;

--SEQUENCE
--자동번호 부여기
--CREATE SEQUENCE 시퀀스명[옵션]
--시퀀스작동 예약어->시퀀스.NEXTVAL,  시퀸스.CURRVAL
--기본 시퀀스 생성하기
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

--시퀀스 활용하기
--PK값으로 설정하기
CREATE TABLE BOARD_SEQ(
    BOARD_NO NUMBER PRIMARY KEY,
    BOARD_TITLE VARCHAR2(200) NOT NULL,
    BOARD_CONTENT VARCHAR2(800),
    BOARD_WIRTER VARCHAR2(20)REFERENCES EMPLOYEE(EMP_ID),
    BOARD_DATE DATE
);    
CREATE SEQUENCE SEQ_BOARD;
INSERT INTO BOARD_SEQ VALUES(SEQ_BOARD.NEXTVAL,'제목1','내용1','200',SYSDATE);
SELECT * FROM BOARD_SEQ;

--시퀀스정보 조회하기
SELECT * FROM USER_SEQUENCES;

--시퀀스 이용 다른활용하기
SELECT 'B_'||SEQ_BOARD.NEXTVAL FROM DUAL;
--시퀀스 수정하기
ALTER SEQUENCE SEQ_BOARD
INCREMENT BY 10;

--시퀀스 지우기
DROP SEQUENCE SEQ_BOARD;

--NEXTVAL,CURRVAL
CREATE SEQUENCE SEQ_TEST;
SELECT SEQ_TEST.CURRVAL FROM DUAL;

--시퀀스를 사용할수 없는 구문
--VIEW구문에서 사용불가
--DISTINCT를 포함하고 있는구문
--GROUP BY, HAVING,ORDER BY 포함된 구문
--SELECT,DELETE,UPDATE 서브쿼리
--CREATE TABLE,ALTER TABLE에서 DEFAULT 사용못함.

--INDEX: 전제적인 DBMS성능향상을 위해 설정
SELECT * FROM USER_INDEXES;
SELECT * FROM USER_IND_COLUMNS;

SELECT * FROM EMPLOYEE JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID WHERE EMP_NAME='송중기';
CREATE INDEX IND_EMPLOYEE ON EMPLOYEE(EMP_NAME);
DROP INDEX IND_EMPLOYEE;

--여러컬럼에 인덱스 부여하기
CREATE INDEX IND_EMPLOYEE_COM ON EMPLOYEE(EMP_NAME,DEPT_CODE);

ALTER INDEX IND_EMPLOYEE_COM REBUILD;

--PL/SQL: 
--유형
--익명블록-> 이름이 없어서 재호출이 불가능한 PL/SQL구문
--프로시저 함수->이름이 있어서 재호출이 가능한 PL/SQL구문

--구조(익명블록)
--DECLARE
--   변수선언
--BEGIN
--   제어문,반복문,함수등
--EXCEPTION  예외처리부
--END;
--/
SET SERVEROUTPUT ON; 

BEGIN
    DBMS_OUTPUT.PUT_LINE('나의 첫 PL/SQL');
END;
/
--기본 익명블록
DECLARE 
    V_ID VARCHAR2(20);
BEGIN
    SELECT EMP_ID
    INTO V_ID
    FROM EMPLOYEE
    WHERE EMP_NAME='선동일';
    
    DBMS_OUTPUT.PUT_LINE(V_ID);
END;
/
--변수 이용하기
--선언 : 변수명 자료형(길이)[:= 값]
--변수에 값넣기    변수명:= 값
DECLARE 
    V_EMPNO NUMBER;
    V_EMPNAME VARCHAR2(20);
    TEST_NUM NUMBER:= 10+20;
BEGIN
    V_EMPNO:= 300;
    V_EMPNAME:= '김말똥';
    DBMS_OUTPUT.PUT_LINE(V_EMPNO);
    DBMS_OUTPUT.PUT_LINE(V_EMPNAME);
    DBMS_OUTPUT.PUT_LINE(TEST_NUM);
END;
/
--변수의 자료형 알아보기
--자료형은 기본자료형(ORACLE자료형),복합자료형으로 구분
--기본자료형: NUMBER,VARCHAR2(20),DATE,BOOLEAN,BINARY_INTEGER
--복합자료형: 레코드 ,커서, 컬렉션

--참조형변수
--%TYPE: 기존테이블에 있는 자료형을 참조해서 가져와 사용하는것
DECLARE
    V_EMP_ID EMPLOYEE.EMP_ID%TYPE;
    V_SALARY EMPLOYEE.SALARY%TYPE;
BEGIN
    SELECT EMP_ID,SALARY
    INTO V_EMP_ID,V_SALARY
    FROM EMPLOYEE
    WHERE EMP_ID='&사원명';
    DBMS_OUTPUT.PUT_LINE(V_EMP_ID||V_SALARY);
END;
/

--레코드: 클래스
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
    WHERE EMP_ID='&사원번호';
    
    DBMS_OUTPUT.PUT_LINE(MY_VAR.V_ID||''||MY_VAR.V_NAME||''||MY_VAR.V_DEPTTITLE);
END;
/
--TABLE타입 선언하기: 자바의 배열
DECLARE
    TYPE EMP_ID_TABLE_TYPE IS TABLE OF EMPLOYEE.EMP_ID%TYPE
    INDEX BY BINARY_INTEGER;
    
    V_EMPID EMP_ID_TABLE_TYPE;--변수선언
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

--PL/SQL구문에서 SELECT문 처리하기
--PL/SQL구문에서 SELECT문을 사용하는것은 조회한 결과를 변수에 저장하여 활용한다
--PL/SQL구문에서 SELECT문을 사용했을떄는 반드시 INTO를 사용해야함(변수에 대입하는것)
DECLARE
    V_EMP_ID EMPLOYEE.EMP_ID%TYPE;
BEGIN
    SELECT EMP_ID
    INTO V_EMP_ID
    FROM EMPLOYEE
    WHERE EMP_NAME='&이름';
END;
/
CREATE TABLE INSERTEST(
    VAL VARCHAR2(500)
);
--PL/SQL구문에서 INSERT문 처리하기
BEGIN 
    INSERT INTO INSERTEST VALUES('이거 PL/SQL문으로 입력하기');
    COMMIT;
END;
/
SELECT * FROM INSERTEST;

--사원번호를 입력받아서 받은 사원의 사원번호,이름,부서코드,부서명을 출력하도록하시오
--각 컬럼별 변수 생성하기
DECLARE 
    V_EMP_ID EMPLOYEE.EMP_ID%TYPE;
    V_EMP_NAME EMPLOYEE.EMP_NAME%TYPE;
    V_DEPT_CODE EMPLOYEE.DEPT_CODE%TYPE;
    V_DEPT_TITLE DEPARTMENT.DEPT_TITLE%TYPE;
BEGIN
    SELECT EMP_ID,EMP_NAME,DEPT_CODE,DEPT_TITLE
    INTO V_EMP_ID,V_EMP_NAME,V_DEPT_CODE,V_DEPT_TITLE
    FROM EMPLOYEE JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID
    WHERE EMP_ID='&사원번호';
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
    WHERE EMP_ID='&사원번호';
    
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
        VALUES(ID+1,'&이름','&주민번호','&전화번호','&잡코드','&급여코드');
END;
/

--조건문 활용하기
--IF 조건문 
--    THEN 실행할 구문
--END IF;

--사번을 입력받아 이름을 조회하고 그이름이 선동일이면 난대표다! 출력하기
DECLARE 
    V_EMP_NAME EMPLOYEE.EMP_NAME%TYPE;
BEGIN
    SELECT EMP_NAME
    INTO V_EMP_NAME
    FROM EMPLOYEE
    WHERE EMP_ID='&사번';
    
    IF V_EMP_NAME='선동일'
        THEN DBMS_OUTPUT.PUT_LINE('난대표다');
    END IF;
END;
/
--IF THEN ELSE END IF;
--조회된 사원이 선동일이면 난 대표다 아니면 난 사원이다!.
DECLARE 
    V_EMP_NAME EMPLOYEE.EMP_NAME%TYPE;
BEGIN
    SELECT EMP_NAME
    INTO V_EMP_NAME
    FROM EMPLOYEE
    WHERE EMP_ID='&사번';
    
    IF V_EMP_NAME='선동일'
        THEN DBMS_OUTPUT.PUT_LINE('난대표다');
        ELSE DBMS_OUTPUT.PUT_LINE('난사원이다');
    END IF;
END;
/

--IF THEN ~ ELSIF THEN ~ ELSE ~ END IF;
--직책코드가 J1이면 대표다 J2면 임원이다 그외면 사원이다
DECLARE
    V_JOB_CODE EMPLOYEE.JOB_CODE%TYPE;
BEGIN
    SELECT JOB_CODE
    INTO V_JOB_CODE
    FROM EMPLOYEE
    WHERE EMP_ID='&사원번호';
    
    IF V_JOB_CODE='J1' THEN DBMS_OUTPUT.PUT_LINE('난 대표다');
    ELSIF V_JOB_CODE='J2' THEN DBMS_OUTPUT.PUT_LINE('임원이다');
    ELSE DBMS_OUTPUT.PUT_LINE('사원이다');
    END IF;
END;
/
--CASE 문
DECLARE
    INPUTVALUE NUMBER;
BEGIN
    INPUTVALUE:='&수입력';
    CASE INPUTVALUE
        WHEN 1 THEN DBMS_OUTPUT.PUT_LINE(INPUTVALUE||'를입력함 1은 첫번쨰');
        WHEN 2 THEN DBMS_OUTPUT.PUT_LINE(INPUTVALUE||'를입력함 2은 두번쨰');
        WHEN 3 THEN DBMS_OUTPUT.PUT_LINE(INPUTVALUE||'를입력함 3은 세번쨰');
        ELSE DBMS_OUTPUT.PUT_LINE(INPUTVALUE||'는 없어요');
    END CASE;
END;
/

--CASE문으로 월급이 400이상이면 고액연봉,200이상이면 연봉,그이하면 슿프다 출력
--CASE문을 잘생각하면 답나옴
DECLARE 
    V_SALARY EMPLOYEE.SALARY%TYPE;
   
BEGIN
    SELECT SALARY
    INTO V_SALARY
    FROM EMPLOYEE
    WHERE EMP_ID='&사원번호';
    
    
    CASE 
        WHEN V_SALARY>=4000000 THEN DBMS_OUTPUT.PUT_LINE('고액연봉');
        WHEN V_SALARY>=2000000 THEN DBMS_OUTPUT.PUT_LINE('연봉');
        ELSE DBMS_OUTPUT.PUT_LINE('슬프네,,'):
        END CASE;
END;
/

--반복문
--기본반복문(LOOP)
--LOOP~ 실행한구문 END LOOP-> 무한루프
--실행할구문에 빠져나오는 예약어 사용->EXIT 

--1~10까지 출력
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
--WHILE 조건식 LOOP
--  실행구문
--END LOOP;

--FOR문 활용하기
--FOR문은 EACH문과 비슷
--FOR 변수 IN 범위||SELECT문 LOOP
-- 실행구문
--END LOOP;

--범위: 시작숫자..끝숫자->FOR문의 변수에 범위의 숫자가 대입됨
--SELECT문->SELECT 문의  ROW가 변수에 저장됨

BEGIN
    FOR I IN 20..30 LOOP
        DBMS_OUTPUT.PUT_LINE(I);
    END LOOP;
END;
/
--거꾸로 출력하기
BEGIN
    FOR I IN REVERSE 1..10 LOOP
        DBMS_OUTPUT.PUT_LINE(I);
    END LOOP;
END;
/
--EMPLOYEE에있는 10의 ROW출력하기
--EMP_ID,EMP_NAME,SALARY 시작은 200부터209까지
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

--타입에 
--%ROWTYPE: %TYPE한개컬럼->DATA 1개 ROW ,즉 모든 테이블의 타입을 가져옴

--PL/SQL 끝ㅌㅌㅌㅌㅌㅌㅌㅌㅌㅌㅌㅌㅌㅌㅌㅌㅌㅌㅌㅌㅌㅌㅌㅌㅌㅌㅌㅌㅌㅌㅌㅌㅌㅌㅌㅌㅌㅌ

--저장해서 사용하고 싶은 욕구 생김!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
--PROCEDURE/FUNCTION 객체
--PROCEDURE사용하기
CREATE TABLE PRO_TEST
AS SELECT * FROM EMPLOYEE;

SELECT * FROM PRO_TEST;
--테이블을 삭제하는 프로시저만들기
CREATE OR REPLACE PROCEDURE DEL_DATA
IS
--지역변수 선언
BEGIN
    DELETE FROM PRO_TEST
    COMMIT;
END;
/
--프로시저 호출
EXEC DEL_DATA;
SELECT * FROM PRO_TSET;
--등록된 프로시져 조회하기
SELECT * FROM USER_PROCEDURES;

--매개변수 있는 프로시저 생성하기
--IN: 프로시저실행시 필요한 값을 받는 변수 
--OUT: 프로시저가 실행한 결과를 되돌려주는 변수
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
--OUT 매개변수가 있는 프로시저는 선언된 변수를 바인딩 해줘야한다.
--변수선언
VAR EMP_NAME VARCHAR2(20);
VAR SALARY NUMBER;
VAR BONUS NUMBER;

PRINT EMP_NAME;
PRINT SALARY;
PRINT BONUS;

--매개변수 있는 프로시저 호출하기
EXEC PRO_SELECT_EMP('&사번',:EMP_NAME,:SALARY,:BONUS);
PRINT EMP_NAME;
PRINT SALARY;
PRINT BONUS;

--FUNCTION
--FUNCTION은 프로시저와 유사하지만 리턴값을 갖는다;
CREATE OR REPLACE FUNCTION MYFUNC(STR VARCHAR2)
RETURN VARCHAR2
IS
    RESULT VARCHAR2(10000);
BEGIN
    RESULT:='^.~'||STR||'~,^';
    RETURN RESULT;
END;
/
SELECT MYFUNC('유지훈')FROM DUAL;

--EMP_ID를 전달받아서 연봉을 계산해주는 함수
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

--트리거 이용하기!!
--특정테이블에 DML구문이 실행될 떄(전,후) 특정한 로직이 수행되도록하는 것
--CREATE OR REPLACE TRIGGER 트리거명칭
--실행시점(AFTER/BEFORE)DML구믄(UPDATE,INSERT,DELETE)
--FOR EACH ROW
--IS BEGIN~~PL/SQL구문 작성
CREATE OR REPLACE TRIGGER TRG_01
AFTER INSERT
ON EMPLOYEE
FOR EACH ROW
BEGIN
    DBMS_OUTPUT.PUT_LINE('신입사원이 입사하였습니다');
END;
/
INSERT INTO EMPLOYEE VALUES (908, '길성춘', '690512-1151432','gil_sj@kh.or.kr', 
                    '01035464455', 'D5', 'J3', 'S5', 3000000, 0.1, 200, SYSDATE, NULL,
                DEFAULT);

--데이터가 조작된 전/후
--이전,이후자료
--      :NEW.컬럼명(새로운값)/:OLE.컬럼명(이전값)
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
UPDATE EMPLOYEE SET EMP_NAME='김가현',SALARY=500 WHERE EMP_ID='778';
ROLLBACK;
SELECT* FROM EMPLOYEE;

--제고관리 테이블에 트리거 적용하기
CREATE TABLE PRODUCT(
    PCODE NUMBER PRIMARY KEY,
    PNAME VARCHAR2(30),
    BRAND VARCHAR2(30),
    PRICE NUMBER,
    STOCK NUMBER DEFAULT 0
);
--상품의 입출고를 관리하는 테이블
CREATE TABLE PRODUCT_IO(
    IOCODE NUMBER PRIMARY KEY,
    PCODE NUMBER CONSTRAINT FK_PRO_NAME REFERENCES PRODUCT(PCODE),
    PDATE DATE,
    AMOUNT NUMBER,
    STATUS VARCHAR2(10) CHECK(STATUS IN('입고','출고'))
);
CREATE SEQUENCE SEQ_PRO;
CREATE SEQUENCE SEQ_IO;

INSERT INTO PRODUCT VALUES(SEQ_PRO.NEXTVAL,'보호필름','아르마니',500000,DEFAULT);
INSERT INTO PRODUCT VALUES(SEQ_PRO.NEXTVAL,'갤럭시폴드','삼성',2300000,DEFAULT);
INSERT INTO PRODUCT VALUES(SEQ_PRO.NEXTVAL,'커피','동서식품',12000,DEFAULT);
INSERT INTO PRODUCT VALUES(SEQ_PRO.NEXTVAL,'콜라뽑기','불량식품',1000,DEFAULT);

SELECT * FROM PRODUCT;
--입출고테이블에 입고, 출고가 됐을떄 TRIGGER를 이용해서 PRODUCT테이블을 수정해보자
CREATE OR REPLACE TRIGGER TRG_IO
AFTER INSERT
ON PRODUCT_IO
FOR EACH ROW
BEGIN
    IF:NEW.STATUS='입고'THEN
        UPDATE PRODUCT SET STOCK=STOCK+:NEW.AMOUNT WHERE PCODE=:NEW.PCODE;
    ELSIF :NEW.STATUS='출고'THEN
         UPDATE PRODUCT SET STOCK=STOCK-:NEW.AMOUNT WHERE PCODE=:NEW.PCODE;
    END IF;
END;
/
INSERT INTO PRODUCT_IO VALUES(SEQ_IO.NEXTVAL,1,SYSDATE,100,'입고');
INSERT INTO PRODUCT_IO VALUES(SEQ_IO.NEXTVAL,2,SYSDATE,5,'입고');
INSERT INTO PRODUCT_IO VALUES(SEQ_IO.NEXTVAL,1,SYSDATE,10,'출고');
SELECT * FROM PRODUCT;
SELECT * FROM PRODUCT_IO;


    

CREATE USER STUDENT IDENTIFIED BY STUDENT;
GRANT CONNECT TO STUDENT;
GRANT RESOURCE TO STUDENT;











