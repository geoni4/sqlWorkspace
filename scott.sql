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

-- �̸�(ENAME)�� SMITH�� ����� ���(empno), �̸�(ename), �޿�(sal)�� ����ϴ� ������
select empno, ename, sal from emp where ename = 'SMITH';

select * from emp where job = 'PRESIDENT';

-- 1982�� 1�� 1�� ���Ŀ� �Ի��� ����� ����ϴ� ������
select * from emp where hiredate >= '1982-01-01';

-- deptno 10�� �μ�, job�� manager�� ���, sal�� 800�̻�
select * from emp where deptno = 10 and job = 'MANAGER' and sal>=800;

select * from emp where deptno= 10 or job='MANAGER';

select * from emp where deptno not in(10);


-- �޿��� 2000�̻� 3000������ ����� �˻��ϴ� ������
select * from emp where sal between 2000 and 3000;

-- �޿��� 2000�̸� �̰ų� 3000�ʰ��� ����� �˻��ϴ� ������
select * from emp where sal not between 2000 and 3000;


-- 1982�⿡ �Ի��� ����� ����ϴ� ������
select * from emp where hiredate between '1982/01/01' and '1982/12/31';

-- Ŀ�̼�(COMM)�� 300 Ȥ�� 500 Ȥ�� 1400 �� ��� �˻�
select * from emp where comm in(300, 500, 1400);

-- Ŀ�̼�(COMM)�� 300 Ȥ�� 500 Ȥ�� 1400�� �ƴ� ��� �˻�
select * from emp where comm not in(300, 500, 1400);
