-- Google Docs Example

select * from emp;


-- 23> 커미션이 책정되어 있는 모든 사원의 이름, 부서이름 및 위치를 출력하라.
select ename, dname, loc, comm from emp, dept where comm is not null and emp.deptno = dept.deptno;
select ename from emp where comm is not null;

-- 24. Dallas에서 근무하는 모든 사원의 이름, 직업, 부서번호 및 부서이름을 출력하라.
select * from emp, dept where emp.deptno = dept.deptno and loc like 'DALLAS';

-- 25. 사원이름 및 사원번호, 해당 관리자이름 및 관리자 번호를 출력하되, 각 컬럼명을 employee,emp#,manager,mgr#으로 표시하여 출력하라.
select e2.ename employee, e1.empno emp#, e1.ename manager, e1.mgr mgr# from emp e1, emp e2 where e2.mgr = e1.empno;

select * from emp;


-- 26. 모든 사원의 이름,직업,부서이름,급여 및 등급을 출력하라
select emp.ename, emp.job, dept.dname, emp.sal, salgrade.grade from emp, salgrade, dept
    where emp.deptno = dept.deptno and emp.sal between salgrade.losal and salgrade.hisal order by emp.empno;

select * from salgrade;


CREATE TABLE users (
	email	varchar2(100)		NOT NULL,
	id	number		NOT NULL
);



CREATE TABLE image (
	id	number		NOT NULL,
	path"	varchar2(200)		NOT NULL,

);

ALTER TABLE "image" ADD CONSTRAINT "PK_IMAGE" PRIMARY KEY (
	"id"
);



