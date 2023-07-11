-- �̸��� F�� �����ϴ� ����� ã�� ������
-- ���ϵ� ī�� %
-- �˻��ϰ��� �ϴ� ���� ��Ȯ�� �� ��� ���ϵ� ī��� �Բ� ����� �� �ִ�.

select * from emp where ename like 'F%';

-- ��ġ ������� �̸� �߿� A�� ���� ����� ã�� ������

select * from emp where ename like '%A%';

-- �̸��� N���� ������ ���
select * from emp where ename like '%N';

-- _ �� ���ڿ� ���ؼ��� ���ϵ� ī��
select * from emp where ename like '_A%';

-- �̸��� ����° ���ڰ� A�� ����� ã�� ������
select * from emp where ename like '__A%';

-- �̸��� A�� �������� �ʴ� ����� �˻�
select * from emp where ename not like '%A%';

-- null�� �� �̾ƹ�� ���
-- is null, is not null
select * from emp where comm is null;
select * from emp where comm is not null;

-- order by�� ����, �������� ���� ����
select * from emp order by sal asc;

-- ���� �ֱٿ� �Ի��� ������� ����ϴ� ������
select * from emp order by hiredate desc;

-- �̸��� ���� ������
select * from emp order by ename asc;

-- ������ 3000 �̻��� ����� �̸� ������ ���

select * from emp where sal >= 3000 order by ename;

-- distinct
-- distinct ���� �����ϸ� �ߺ��� ���ŵǾ� ��µȴ�.
-- ������� �ҼӵǾ� �ִ� �μ��� ��ȣ�� ����ϴ� ������
select distinct deptno from emp order by deptno asc;

-- column�� ���� ����
-- ��Ī�� alias
select sal * 12 as year_sal from emp;

-- ������� ������ ����Ͻÿ�

-- || ������
-- �÷� �� ���ڿ� �߰�
select ename || ' is a ' || job "�������� ��" from emp;

-- ���̺� ������ Ÿ�� Ȯ��
desc dept;



-- dual�� ��� ������ ����� �� �ٷ� ��� ���ؼ� ����Ŭ���� �����ϴ� ���̺�
-- 24 * 26
select 24 * 26 from dual;
select sysdate from dual;

-- ����Ŭ���� �����ϴ� ���� �Լ���(������, ������, ��¥��);
select abs(-10) from dual;

-- Ư�� �ڸ������� �ݿø�(�⺻�� �Ҽ��� 1�ڸ����� �ݿø�)
select 34.5678, round(34.5678) from dual;

-- ������ ������ �� �� �������� ���
select mod(27, 2), mod(27, 5), mod(27, 7) from dual;

-- ���� ó�� �Լ�
select 'oracle', upper('oracle') from dual; 
select 'ORACLE', lower('ORACLE') from dual; 


-- emp���� ename�� �ҹ��ڷ� �̾Ƴ��ÿ�.
select lower(ename) from emp;

-- 
select initcap(ename) from emp;

-- ù ���ڸ� �빮�ڷ� ��ȯ
select initcap(lower(ename)) from emp;

-- substr(1, 2) ���� ��ġ���� ���� ������ŭ�� ���ڸ� �����Ѵ�.
select substr(ename, 2, 2) from emp;

select ename, '19' || substr(hiredate,1, 2) as "�⵵", substr(hiredate, 4, 2) as "��" from emp;

-- 9���� �Ի��� ��� �̾Ƴ���
select * from emp where substr(hiredate, 4, 2) = '09';

-- trim
select ltrim('                  oracle         ') from dual;
select rtrim('            oracle               ') from dual;
select trim('           oracle               ') from dual;

-- sysdate
select sysdate from dual;
select sysdate - 1 from dual;
select round(MONTHS_BETWEEN(SYSDATE, hiredate)) as "�ٹ����� ��" from emp;

-- �Ի� ��¥���� 4���� �߰�
select ADD_MONTHS(hiredate, 4) from emp;


-- ������ �������� ���� ����� ���� �������� �������� �˾ƺ��� ������
select sysdate, next_day(sysdate, '�ݿ���') from dual;

-- �Ի��� ���� ������ ���� ���ϴ� ������
select hiredate, last_day(hiredate) from emp;

select hiredate, last_day('1980-02-01') from emp;

-- ���� ��¥�� ���������� ��ȯ�Ͽ� ����ϴ� ������
select sysdate, to_char(sysdate, 'yyyy-mm-dd') from dual;

-- ������� �Ի����� ����ϵ�, ���ϱ��� �Բ� ����ϴ� ������
select sysdate, to_char(hiredate, 'yyyy::mm::dd day') as �Ի��� from emp;

select to_char(hiredate, 'yyyy-mm-dd day') as "�Ի���" from emp;
-- ���� ��¥�� �ð��� ����ϴ� ������
select sysdate, to_char(sysdate, 'yyyy-mm-dd day hh24:mi:ss') as "���� ��¥ �ð�" from dual;

-- ���� ���� ���� ��¥�� ��� �Ͻÿ�.
select sysdate -1 as ����, sysdate as ����, sysdate +1 as ���� from dual;

-- ������� �ҼӵǾ� �ִ� �μ��� ��ȣ�� ����ϴ� ������
select distinct deptno from emp order by deptno;

-- ������ 3000 �̻��� ����� �̸� ������ ����ϴ� ������
select * from emp where sal >= 3000 order by ename; 


-- Ŀ�̼�(COMM)�� ���� ���ϴ� ����� �˻��ϴ� ������
select * from emp where comm is null;

-- �̸��� A�� �������� �ʴ� ����� �˻��ϴ� ������
select ename from emp where ename not like '%A%';

-- �� ������ ��ȭ ��ȣ�� �տ� ���̰� õ �������� comma�� �ٿ��� ����ϴ� ������(��: \1, 230, 00)
select ename, sal, to_char(sal, 'L999,999') from emp;

-- to_date ���ڸ� -> date Ÿ������ ��ȯ
-- �������� ��¥������ ��ȯ�ϴ� �Լ��̴�.
-- 1981�� 2�� 20�Ͽ� �Ի��� ����� �˻��ϴ� ������

select ename, hiredate from emp where hiredate = '19810220';
select ename, hiredate from emp where hiredate = to_date(19810220, 'yyyymmdd');

-- ���� ��ĥ�� �������� ���� ��¥���� 2016/01/01�� �� ����� ���
select sysdate - to_date('2023/01/01', 'YYYY/MM/DD') from dual;


-- �տ��� ��, �ڿ��� formatting
select to_number('20,000', '99,999') - to_number('10,000', '99,999') from dual;

-- nvl �� �ٸ� ������ ��ȯ
-- ���� ����� �ϴ� ������
select ename, sal * 12 + nvl(comm, 0) as year_sal from emp;  
select ename, sal * 12 + nvl(comm, 0) as year_sal, nvl(comm,0) from emp;  


-- ������ ���� decode �Լ�
select deptno, dcoode(deptno, 10, 'A', 20, 'B', 30, 'C') from emp order by deptno;
select ename, deptno, decode(deptno, 10, 'ACCOUNTING', 20, 'RESEARCH', 30, 'SALES', 40, 'OPERATIONS')
    as ename from emp order by deptno;


-- case �Լ�
select ename, deptno,
    case when deptno = 10 then 'ACCOUNTING'
         when deptno = 20 then 'RESEARCH'
         when deptno = 30 then 'SALES'
         when deptno = 40 then 'OPERATIONS'
    end  as ename
from emp;

-- sal 2500�̻� ��, 2500 �̸� �÷��� ���
select sal, 
    case when sal >= 2500 then '��'
         when sal < 2500 then '��'
    end as ��� 
from emp;

-- ����� �޿��� ����ϵ� ������ �Լ� round�� õ���� ���ϸ� �ݿø� �ϴ� ������
select deptno, sal, round(sal, -3) from emp;

-- �׷� �Լ��� �̿��ؼ� ������ �� �޿��� ���ϴ� ������
select * from emp;
select sum(sal) from emp;

-- �Լ� = ������ �Լ��� �׷� �Լ�
-- ������ �Լ��� �� �࿡ ���� �Լ�
-- �׷� �Լ��� ��ü�� ���� ����
select *, sum(sal) from emp; 
-- �׷� �Լ��� ������� �ϳ��ε�, �׷� �Լ��� �������� ���� �ܼ� column�� row������ 14���̱� ������
-- ����Ǵ� row�� ���� �޶� ���� ��ġ��ų �� ����.

-- �޿� ���
select round(avg(sal), 0) from emp;

-- ���� ���� �޿��� ���� ���� �޿���
select max(sal), min(sal) from emp;


-- �� ��� ��
select count(*) from emp;

-- �ߺ� ���� �ݿ� ��� ������ ����
select count(distinct job) from emp;

-- group by ��
select deptno, count(deptno) from emp group by deptno;


-- �Ҽ� �μ��� ��� �޿��� ���ϴ� ������
select deptno, avg(sal) from emp group by deptno;

-- group by
-- 1. column�� group by �� column ���� �� �� �ִ�.
-- 2. �׷� �Լ��� �� �� �ִ�. ���� �Լ��� �� �� ����.

-- �Ҽ� �μ��� �ִ� �޿��� �ּ� �޿��� ���ϴ� ������
select deptno , max(sal), min(sal) from emp group by deptno;

-- �μ��� ��� ��
select deptno, count(*), count(deptno) from emp group by deptno;


select deptno, avg(sal) from emp group by deptno having avg(sal) >= 2000;

