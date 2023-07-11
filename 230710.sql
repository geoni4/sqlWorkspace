-- 이름이 F로 시작하는 사람을 찾는 쿼리문
-- 와일드 카드 %
-- 검색하고자 하는 값을 정확히 모를 경우 와일드 카드와 함께 사용할 수 있다.

select * from emp where ename like 'F%';

-- 위치 상관없이 이름 중에 A가 들어가는 사람을 찾는 쿼리문

select * from emp where ename like '%A%';

-- 이름이 N으로 끝나는 사람
select * from emp where ename like '%N';

-- _ 한 문자에 대해서만 와일드 카드
select * from emp where ename like '_A%';

-- 이름의 세번째 글자가 A인 사원을 찾는 쿼리문
select * from emp where ename like '__A%';

-- 이름에 A를 포함하지 않는 사람만 검색
select * from emp where ename not like '%A%';

-- null인 값 뽑아배는 방법
-- is null, is not null
select * from emp where comm is null;
select * from emp where comm is not null;

-- order by로 오름, 내림차순 정렬 가능
select * from emp order by sal asc;

-- 가장 최근에 입사한 사원부터 출력하는 쿼리문
select * from emp order by hiredate desc;

-- 이름을 사전 순으로
select * from emp order by ename asc;

-- 월급이 3000 이상인 사원을 이름 순으로 출력

select * from emp where sal >= 3000 order by ename;

-- distinct
-- distinct 명렁을 랏용하면 중복이 제거되어 출력된다.
-- 사원들이 소속되어 있는 부서의 번호를 출력하는 쿼리문
select distinct deptno from emp order by deptno asc;

-- column도 연산 가능
-- 별칭은 alias
select sal * 12 as year_sal from emp;

-- 사원들의 연봉을 출력하시오

-- || 수직바
-- 컬럼 내 문자열 추가
select ename || ' is a ' || job "연결정의 예" from emp;

-- 테이블 데이터 타입 확인
desc dept;



-- dual은 산술 연산의 결과를 한 줄로 얻기 위해서 오라클에서 제공하는 테이블
-- 24 * 26
select 24 * 26 from dual;
select sysdate from dual;

-- 오라클에서 제공하는 내장 함수들(숫자형, 문자형, 날짜형);
select abs(-10) from dual;

-- 특정 자리수에서 반올림(기본값 소수점 1자리에서 반올림)
select 34.5678, round(34.5678) from dual;

-- 나누기 연산을 한 후 나머지를 출력
select mod(27, 2), mod(27, 5), mod(27, 7) from dual;

-- 문자 처리 함수
select 'oracle', upper('oracle') from dual; 
select 'ORACLE', lower('ORACLE') from dual; 


-- emp에서 ename을 소문자로 뽑아내시오.
select lower(ename) from emp;

-- 
select initcap(ename) from emp;

-- 첫 글자만 대문자로 변환
select initcap(lower(ename)) from emp;

-- substr(1, 2) 시작 위치부터 선택 개수만큼의 문자를 추출한다.
select substr(ename, 2, 2) from emp;

select ename, '19' || substr(hiredate,1, 2) as "년도", substr(hiredate, 4, 2) as "달" from emp;

-- 9월에 입사한 사람 뽑아내기
select * from emp where substr(hiredate, 4, 2) = '09';

-- trim
select ltrim('                  oracle         ') from dual;
select rtrim('            oracle               ') from dual;
select trim('           oracle               ') from dual;

-- sysdate
select sysdate from dual;
select sysdate - 1 from dual;
select round(MONTHS_BETWEEN(SYSDATE, hiredate)) as "근무개월 수" from emp;

-- 입사 날짜에서 4개월 추가
select ADD_MONTHS(hiredate, 4) from emp;


-- 오늘을 기준으로 가장 가까운 다음 수요일은 언제인지 알아보는 쿼리문
select sysdate, next_day(sysdate, '금요일') from dual;

-- 입사한 달의 마지막 날을 구하는 쿼리문
select hiredate, last_day(hiredate) from emp;

select hiredate, last_day('1980-02-01') from emp;

-- 현재 날짜를 문자형으로 변환하여 출력하는 쿼리문
select sysdate, to_char(sysdate, 'yyyy-mm-dd') from dual;

-- 사원들의 입사일을 출력하되, 요일까지 함께 출력하는 쿼리문
select sysdate, to_char(hiredate, 'yyyy::mm::dd day') as 입사일 from emp;

select to_char(hiredate, 'yyyy-mm-dd day') as "입사일" from emp;
-- 현재 날짜와 시간을 출력하는 쿼리문
select sysdate, to_char(sysdate, 'yyyy-mm-dd day hh24:mi:ss') as "현재 날짜 시간" from dual;

-- 어제 오늘 내일 날짜를 출력 하시오.
select sysdate -1 as 어제, sysdate as 오늘, sysdate +1 as 내일 from dual;

-- 사원들이 소속되어 있는 부서의 번호를 출력하는 쿼리문
select distinct deptno from emp order by deptno;

-- 월급이 3000 이상인 사원을 이름 사전순 출력하는 쿼리문
select * from emp where sal >= 3000 order by ename; 


-- 커미션(COMM)을 받지 못하는 사원을 검색하는 쿼리문
select * from emp where comm is null;

-- 이름에 A를 포함하지 않는 사람만 검색하는 쿼리문
select ename from emp where ename not like '%A%';

-- 각 지역별 통화 기호를 앞에 붙이고 천 단위마다 comma를 붙여서 출력하는 쿼리문(예: \1, 230, 00)
select ename, sal, to_char(sal, 'L999,999') from emp;

-- to_date 문자를 -> date 타입으로 변환
-- 문자형을 날짜형으로 변환하는 함수이다.
-- 1981년 2월 20일에 입사한 사원을 검색하는 쿼리문

select ename, hiredate from emp where hiredate = '19810220';
select ename, hiredate from emp where hiredate = to_date(19810220, 'yyyymmdd');

-- 올해 며칠이 지났는지 현재 날짜에서 2016/01/01을 뺀 결과를 출력
select sysdate - to_date('2023/01/01', 'YYYY/MM/DD') from dual;


-- 앞에는 값, 뒤에는 formatting
select to_number('20,000', '99,999') - to_number('10,000', '99,999') from dual;

-- nvl 을 다른 값으로 변환
-- 연봉 계산을 하는 쿼리문
select ename, sal * 12 + nvl(comm, 0) as year_sal from emp;  
select ename, sal * 12 + nvl(comm, 0) as year_sal, nvl(comm,0) from emp;  


-- 선택을 위한 decode 함수
select deptno, dcoode(deptno, 10, 'A', 20, 'B', 30, 'C') from emp order by deptno;
select ename, deptno, decode(deptno, 10, 'ACCOUNTING', 20, 'RESEARCH', 30, 'SALES', 40, 'OPERATIONS')
    as ename from emp order by deptno;


-- case 함수
select ename, deptno,
    case when deptno = 10 then 'ACCOUNTING'
         when deptno = 20 then 'RESEARCH'
         when deptno = 30 then 'SALES'
         when deptno = 40 then 'OPERATIONS'
    end  as ename
from emp;

-- sal 2500이상 수, 2500 미만 컬럼명 등급
select sal, 
    case when sal >= 2500 then '수'
         when sal < 2500 then '가'
    end as 등급 
from emp;

-- 사원의 급여를 출력하되 단일행 함수 round로 천단위 이하를 반올림 하는 쿼리문
select deptno, sal, round(sal, -3) from emp;

-- 그룹 함수를 이용해서 사우너의 총 급여를 구하는 쿼리문
select * from emp;
select sum(sal) from emp;

-- 함수 = 단일행 함수와 그룹 함수
-- 단일행 함수는 각 행에 대해 함수
-- 그룹 함수는 전체에 대해 적용
select *, sum(sal) from emp; 
-- 그룹 함수의 결과값은 하나인데, 그룹 함수를 적용하지 않은 단순 column의 row개수는 14개이기 때문에
-- 산출되는 row의 수가 달라 둘을 매치시킬 수 없다.

-- 급여 평균
select round(avg(sal), 0) from emp;

-- 가장 높은 급여와 가장 낮은 급여를
select max(sal), min(sal) from emp;


-- 총 사원 수
select count(*) from emp;

-- 중복 제거 반영 담당 업무의 개수
select count(distinct job) from emp;

-- group by 절
select deptno, count(deptno) from emp group by deptno;


-- 소속 부서별 평균 급여를 구하는 쿼리문
select deptno, avg(sal) from emp group by deptno;

-- group by
-- 1. column은 group by 한 column 명이 올 수 있다.
-- 2. 그룹 함수가 올 수 있다. 단일 함수는 올 수 없다.

-- 소속 부서별 최대 급여와 최소 급여를 구하는 쿼리문
select deptno , max(sal), min(sal) from emp group by deptno;

-- 부서별 사원 수
select deptno, count(*), count(deptno) from emp group by deptno;


select deptno, avg(sal) from emp group by deptno having avg(sal) >= 2000;

