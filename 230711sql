
-- 부서의 최댓값과 최솟값을 구하되, 최대 급여가 2900이상인 부서만 출력하는 쿼리문
select deptno, max(sal), min(sal) from emp group by deptno having max(sal)>=2900;


-- 사원 정보를 출력할 때, 각 사원이 소속된 부서의 상세정보를 출력하기 위해 두 개의 테이블을 조인하는 쿼리문
select * from emp, dept where emp.deptno = dept.deptno;

-- 이름이 SMITH인 사람의 부서명을 출력해보는 쿼리문
select emp.ename, dept.dname from emp, dept where ename = 'SMITH' and emp.deptno = dept.deptno;


select * from emp;
select * from salgrade;


select emp.deptno, ename, grade from emp, salgrade, dept where emp.sal between losal and hisal and emp.deptno = dept.deptno order by empno;

-- 해당 사원의 매니저는 누구인가.
select e1.empno, e1.ename, e2.ename from emp e1, emp e2 where e1.mgr = e2.empno order by e1.empno;


------------- ANCI 문법 join
-- emp와 dept 테이블을 deptno column으로
select * from emp, dept where emp.deptno = dept.deptno;

-- emp와 dept 테이블을 inner join, 같은게 여러개 있다면 여러 조합으로 join
select * from emp inner join dept on emp.deptno = dept.deptno;


---------------- outer join
-- left outer join
select * from dept left outer join emp on emp.deptno=dept.deptno;
select * from emp left outer join dept on emp.deptno=dept.deptno;


-- 오라클에서 outer join
-- select * from dept left outer join emp on emp.deptno = dept.deptno;
select * from dept, emp where emp.deptno(+) = dept.deptno;


--------------------- union
-- union all 중복도 또 출력
select job, deptno from emp where sal >= 3000
union all
select job, deptno from emp where deptno = 10;

select deptno from emp union all select deptno from dept;

select sal from emp;
select deptno from emp;
select a.job, b.deptno
from (select job, emp.deptno from emp left outer join dept on emp.sal >= 3000) a, (select deptno from dept where deptno = 10) b ;

------ sub query
-- 하나의 select 문장 내애ㅔ 포함된 또 하나의 select 문장이 있는 쿼리문이다.
-- 비교 연산자의 오른쪽에 기술해야하고, 반드시 괄호 안에 넣어야 한다.
select deptno from emp where ename ='SMITH';
select dname from dept where deptno = 20;

select dname from emp, dept where emp.deptno = dept.deptno and emp.ename = 'SMITH';

select dname from dept where deptno = (select deptno from emp where ename = 'SMITH');

-- 사원들의 평균 급여보다 더 많은 급여를 받는 사원을 검색하는 쿼리문
select * from emp where sal >= (select avg(sal) from emp;

select ename, sal from emp where sal >= (select sal from emp where ename = 'SMITH');

desc emp;

-- 이름이 SMITH인 사람의 부서명을 출력해 보는 쿼리문
select ename, dname from emp, dept where emp.deptno = dept.deptno and emp.ename = 'SMITH';

select * from salgrade;

-- 각 사원의 급여가 몇 등급인지 살펴보는 쿼리문
select ename, grade from emp, salgrade where emp.sal between losal and hisal order by empno;

-- EMP테이블을 EMPLOYEE와 MANAGER로 별칭을 지정한 후 특정 사원의 매니저가 누구인지 알아내는 쿼리문
select employee.empno, employee.ename, employee.mgr as mgrno, manager.ename as manager from emp employee, emp manager where employee.mgr = manager.empno order by employee.empno;