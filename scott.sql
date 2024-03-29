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

SELECT USERNAME, ACCOUNT_STATUS, LOCK_DATE, EXPIRY_DATE FROM DBA_USERS;
update dba_users set expiry_date = null where username = 'JAVA';



alter user java identified by oracle;

create table dept03 as select * from dept where 1 =0;

select * from dept03;

select * from emp;
desc emp;


-- update 명령문
drop table emp01;
create table emp01 as select * from emp;
select * from emp01;

update emp01 set deptno = 30;
select * from emp01;
rollback;

-- 사원의 급여를 10% 인상시키는 update문을 만드는 쿼리문
update emp01 set sal = 1.1*sal;


select * from emp where deptno = any(select deptno from emp where sal >=3000);

update emp01 set hiredate = sysdate;


-- 부서 번호가 10번인 사원의 부서 번호를 40번으로 수정
update emp01 set deptno = 40 where deptno = 10;

-- 부서 번호가 30번인 사원들의 급여 중 가장 낮은 값(800)보다 높은 급여를 받는 사원의 이름, 급여를 출력하는 쿼리문
select ename, sal, deptno from emp where sal > any( select sal from emp) and deptno = 30;
select ename, sal, deptno from emp where sal > (select min(sal) from emp) and deptno = 30;


-- job이 manager이면 급여를 10%인상하는 쿼리문
update emp01 set sal = 1.1*sal where job = 'MANAGER';
select * from emp01;
rollback;


-- 1982년에 입사한 사원의 입사일을 오늘로 수정하는 쿼리문
update emp01 set hiredate = sysdate where substr(hiredate, 1,2) >= 82;
select * from emp01;


-- 30번 소속 사원들 중에서 급여를 가장 많이 받는 사원보다 더 많은 급여를 받는 사람의 이름과 급여를 출력하는 쿼리문
select ename, sal, deptno from emp where sal > (select max(sal) from emp where deptno =  30);
select ename, sal, deptno from emp where sal > all (select sal  from emp where deptno =  30);

-- SMITH 사원의 부서 번호는 20번으로, job column 값은 manager로 한번에 수정하는 쿼리문
update emp01 set deptno = 20, job = 'MANAGER' where ename = 'SMITH';

-- SMITH 사원의 입사 날짜는 오늘로, 급여는 50으로, 커미션은 4000으로 수정하는 쿼리문
update emp01 set hiredate = sysdate, sal = 50, comm = 4000 where ename = 'SMITH';
select * from emp01;

-- 20번 부서의 지역명을 40번 부서의 지역명으로 변경하기 위해서 서브 쿼리문을 사용한 쿼리문

drop table dept01;
create table dept01 as select * from dept;
select * from dept01;

update dept01 set loc = (select loc from dept where deptno = 40) where deptno = 20;


-- delete 명령문
-- dept01 부서 테이블의 모든 데이터를 삭제하는 쿼리문
delete from dept01;

-- 30번 부서를 삭제한 후 부서 테이블을 확인하는 쿼리문
delete from dept01 where deptno = 30;
select * from dept01;

-- 서브 쿼리문으로 부서명이 SALES인 부서의 번호를 알아낸 뒤 SALES 부서 소속의 사원을삭제
delete from emp01 where deptno = (select deptno from dept01 where dname = 'SALES');

drop table emp01;
create table emp01 as select * from emp;
select * from emp01;

-- 트랜잭션(transaction) 관리
-- 일련의 작업 단위
-- 완전히 처리 되거나 All-Or-Nothing

delete from dept01;

rollback;

-- commit을 수행하여 영구저장 했으므로 rollback을 하더라도 특정 row를 삭제하기 이전의 상태로 되돌릴 수 없다.
-- rollback의 기준은 commit 까지

-- 자동 commit
-- ddl은 auto commit 된다
-- create, alter, drop, rename, truncate


drop table emp02;


-- 1. not null
create table emp02(
    empno number(4) not null,
    ename varchar2(10) not null,
    job varchar2(9),
    deptno number(2)
);

desc emp02;

insert Into emp02 values(1, '홍길동', 'SALESMAN', 20);

-- 2. unique

drop table emp03;
create table emp03(
    empno number(4) primary key,
    enaame varchar2(10) not null,
    job varchar2(9),
    deptno number(2)
);

insert into emp03 values(1, '홍길동', null, null);
insert into emp03 values(2, '홍길동', null, null);
insert into emp03 values(null, '홍길손', null, null);
select * from emp03;

-- 3. primary key - not null + unique   

DROP TABLE EMP05;

CREATE TABLE EMP05(
    EMPNO NUMBER(4) CONSTRAINT EMP05_EMPNO_PK PRIMARY KEY,
    ENAMR VARCHAR2(10) CONSTRAINT EMP05_ENAME_NN NOT NULL,
    JOB VARCHAR(9),
    DEPTNO NUMBER(2)
);
