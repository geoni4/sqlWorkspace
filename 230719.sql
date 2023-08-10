-- 36> 부서별로 부서이름, 부서위치, 사원 수 및 평균 급여를 출력하라.
-- 그리고 각각의 column명을 부서명, 위치 사원의 수, 평균 급여로 표시하라

select emp.deptno as 부서번호, dept.dname as 부서이름, loc as 부서위치, count(dept.dname) as "사원의 수", avg(sal) as 평균급여
from emp, dept where emp.deptno = dept.deptno group by emp.deptno, dept.dname, dept.loc;


select * from emp, dept where emp.deptno = dept.deptno;


-- 37> SMITH와 동일한 부서에 속한 모든 사원의 이름 및 입사일을 출력하라.
-- 단 SMITH는 제외하고 출력하시오
select ename, hiredate from emp where ename not like 'SMITH' and deptno in (select deptno from emp where ename = 'SMITH');


-- 38> 자신의 급여가 평균 급여보다 많은 모든 사원의 사원 번호, 이름, 급여를
-- 표시하는 쿼리문을 작성하고 급여를 기준으로 결과를 내림차순으로 정렬하라

select empno, ename, sal from emp where sal > (select avg(sal) from emp) order by sal desc;
select empno, ename, sal, salary.avg as "평균" from emp, (select avg(sal) as avg from emp) salary where sal > salary.avg order by sal desc;

-- 39> 이름에 T가 들어가는 사원이 속한 부서에서 근무하는 모든 사원의
-- 사원번호 및 이름을 출력하라.

select empno, ename, deptno from emp where deptno in (select deptno from emp where ename like '%T%');



