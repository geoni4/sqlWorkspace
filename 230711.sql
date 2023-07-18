
-- �μ��� �ִ񰪰� �ּڰ��� ���ϵ�, �ִ� �޿��� 2900�̻��� �μ��� ����ϴ� ������
select deptno, max(sal), min(sal) from emp group by deptno having max(sal)>=2900;


-- ��� ������ ����� ��, �� ����� �Ҽӵ� �μ��� �������� ����ϱ� ���� �� ���� ���̺��� �����ϴ� ������
select * from emp, dept where emp.deptno = dept.deptno;

-- �̸��� SMITH�� ����� �μ����� ����غ��� ������
select emp.ename, dept.dname from emp, dept where ename = 'SMITH' and emp.deptno = dept.deptno;


select * from emp;
select * from salgrade;


select emp.deptno, ename, grade from emp, salgrade, dept where emp.sal between losal and hisal and emp.deptno = dept.deptno order by empno;

-- �ش� ����� �Ŵ����� �����ΰ�.
select e1.empno, e1.ename, e2.ename from emp e1, emp e2 where e1.mgr = e2.empno order by e1.empno;


------------- ANCI ���� join
-- emp�� dept ���̺��� deptno column����
select * from emp, dept where emp.deptno = dept.deptno;

-- emp�� dept ���̺��� inner join, ������ ������ �ִٸ� ���� �������� join
select * from emp inner join dept on emp.deptno = dept.deptno;


---------------- outer join
-- left outer join
select * from dept left outer join emp on emp.deptno=dept.deptno;
select * from emp left outer join dept on emp.deptno=dept.deptno;


-- ����Ŭ���� outer join
-- select * from dept left outer join emp on emp.deptno = dept.deptno;
select * from dept, emp where emp.deptno(+) = dept.deptno;


--------------------- union
-- union all �ߺ��� �� ���
select job, deptno from emp where sal >= 3000
union all
select job, deptno from emp where deptno = 10;

select deptno from emp union all select deptno from dept;

select sal from emp;
select deptno from emp;
select a.job, b.deptno
from (select job, emp.deptno from emp left outer join dept on emp.sal >= 3000) a, (select deptno from dept where deptno = 10) b ;

------ sub query
-- �ϳ��� select ���� ���֤� ���Ե� �� �ϳ��� select ������ �ִ� �������̴�.
-- �� �������� �����ʿ� ����ؾ��ϰ�, �ݵ�� ��ȣ �ȿ� �־�� �Ѵ�.
select deptno from emp where ename ='SMITH';
select dname from dept where deptno = 20;

select dname from emp, dept where emp.deptno = dept.deptno and emp.ename = 'SMITH';

select dname from dept where deptno = (select deptno from emp where ename = 'SMITH');

-- ������� ��� �޿����� �� ���� �޿��� �޴� ����� �˻��ϴ� ������
select * from emp where sal >= (select avg(sal) from emp;

select ename, sal from emp where sal >= (select sal from emp where ename = 'SMITH');

desc emp;

-- �̸��� SMITH�� ����� �μ����� ����� ���� ������
select ename, dname from emp, dept where emp.deptno = dept.deptno and emp.ename = 'SMITH';

select * from salgrade;

-- �� ����� �޿��� �� ������� ���캸�� ������
select ename, grade from emp, salgrade where emp.sal between losal and hisal order by empno;

-- EMP���̺��� EMPLOYEE�� MANAGER�� ��Ī�� ������ �� Ư�� ����� �Ŵ����� �������� �˾Ƴ��� ������
select employee.empno, employee.ename, employee.mgr as mgrno, manager.ename as manager from emp employee, emp manager where employee.mgr = manager.empno order by employee.empno;