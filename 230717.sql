-- paging

----------------------------------------------------2023-07-17---------------------------------------
-- rownum = 오라클에 페이징은 기본적으로 rownum
-- select 해온 데이터 - 일련 번호 붙이기 = 1번 부터 붙이기
select rownum, emp.* from emp where rownum <= 10;

--먼저 오라클 쿼리의 순서를 읽혀야 한다

--1. FROM/WHERE 절이 먼저 처리됩니다.
--2. ROWNUM이 할당되고 FROM/WHERE 절에서 전달되는 각각의 출력 로우에 대해 증가(increment) 됩니다.
--3. SELECT가 적용됩니다.
--4. GROUP BY 조건이 적용됩니다.
--5. HAVING이 적용됩니다.
--6. ORDER BY 조건이 적용됩니다.

select rownum, emp.* 
from emp 
where rownum between 5 and 10;

select * 
from (select rownum as rn, emp.* from emp)
where rn between 5 and 10;

select * from (select rownum rn, emp.* from emp where rownum <= 10) a where a.rn>5;



-- 27> 모든 사원의 이름,직업,부서이름,급여 및 등급을 출력하라.



-- 28> Smith보다 늦게 입사한 사원의 이름 및 입사일을 출력하라.
select ename, hiredate from emp where hiredate > (select hiredate from emp where ename like 'SMITH');


-- 29> 자신의 관리자보다 먼저 입사한 모든 사원의 이름, 입사일,
-- 관리자의 이름, 관리자의 입사일을 출력하되 각각 column명을
-- Employee, EmpHiredate, Manager, MgrHiredate로 표시하여 출력하라.

select e1.ename Employee, e1.hiredate EmpHiredate, e2.ename Manage, e2.hiredate MgrHiredate
from emp e1, emp e2 where e1.mgr = e2.empno and e1.hiredate < e2.hiredate ;
