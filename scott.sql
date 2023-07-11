select empno, ename from emp;

select * from dept;


select * from salgrade;


select ename from emp;

delete from emp where empno = 7788;

select * from emp where sal=5000;

select * from emp where ename = 'SMITH';

select * from emp where deptno=20;

select * from emp where sal <= 3000;
select * from emp where sal != 3000;
select * from emp where sal  <> 3000;

-- 이름(ENAME)이 SMITH인 사람의 사번(empno), 이름(ename), 급여(sal)를 출력하는 쿼리문
select empno, ename, sal from emp where ename = 'SMITH';

select * from emp where job = 'PRESIDENT';

-- 1982년 1월 1일 이후에 입사한 사원을 출력하는 쿼리문
select * from emp where hiredate >= '1982-01-01';

-- deptno 10번 부서, job이 manager인 사원, sal이 800이상
select * from emp where deptno = 10 and job = 'MANAGER' and sal>=800;

select * from emp where deptno= 10 or job='MANAGER';

select * from emp where deptno not in(10);


-- 급여가 2000이상 3000이하의 사원을 검색하는 쿼리문
select * from emp where sal between 2000 and 3000;

-- 급여가 2000미만 이거나 3000초과의 사원을 검색하는 쿼리문
select * from emp where sal not between 2000 and 3000;


-- 1982년에 입사한 사원을 출력하는 쿼리문
select * from emp where hiredate between '1982/01/01' and '1982/12/31';

-- 커미션(COMM)이 300 혹은 500 혹은 1400 인 사원 검색
select * from emp where comm in(300, 500, 1400);

-- 커미션(COMM)이 300 혹은 500 혹은 1400이 아닌 사원 검색
select * from emp where comm not in(300, 500, 1400);
