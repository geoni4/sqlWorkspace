-- 다중행 서브 쿼리

-- 연봉 3000이상 받는 사원이 소속된 부서와 동일한 부서에서 근무하는 사원들의 정보를 출력하는 쿼리문

select ename, sal, deptno
from emp
where deptno in (select distinct deptno from emp where sal >=3000);

-- 부서 번호가 30번인 사원들의 급여 중 가장 낮은 값(950)보다 높은 급여를 받는 사원의 이름, 급여를 출력하는 쿼리문
select ename, sal, deptno from emp where sal > any(select sal from emp where deptno = 30);

-- Any 연습 - or 조건 만족하는 값이 있으면 리턴
select * from emp where sal = any(1000, 2000, 3000);
select * from emp where sal > any(1000, 2000, 3000);    -- > min(in(1000,2000,3000));
select * from emp where sal >= any(1000, 2000, 3000);   -- >=1000
select * from emp where sal < any(1000, 2000, 3000);    -- > max(in(1000,2000,3000));

-- 조건을 만족하는 값이 하나라도 있으면 결과를 리턴

-- 30번 소속 사원들 중에서 급여를 가장 많이 받는 사원보다 더 많은 급여를 받는 사람의 이름과 급여를 출력하는 쿼리문
select * from emp where sal > all (select sal from emp where deptno = 30);
select * from emp where sal > (select max(sal) from emp where deptno = 30);

-- All 연습 - and 모든 좆건을 충족해야 리턴
select * from emp where sal = all(1000, 2000, 3000);
select * from emp where sal > all(1000, 2000, 3000);    -- > min(in(1000,2000,3000));
select * from emp where sal >= all(1000, 2000, 3000);   -- >=1000
select * from emp where sal < all(1000, 2000, 3000);    -- > max(in(1000,2000,3000));

------- sql 50제
-- 1> 부서 테이블의 모든 데이터를 출력
select * from dept;

-- 2> emp 테이블에서 각 사원의 직업, 사원번호, 이름, 입사일을 출력하라.
select job, empno, ename, hiredate from emp;

-- 3> emp테이블에서 직업을 출력하되, 각 항목(row)가 중복되지 않게 출력하시오
select job from emp group by job;

-- 4> 급여가 2850 이상인 사원의 이름 및 급여를 출력하라.
select ename, sal from emp where sal >= 2850;

-- 5> 사원 번호가 7566인 사원의 이름 및 부서번호를 출력하라.
select ename, deptno from emp  where empno = 7566;


-- 6> 급여가 1500 이상 ~ 2850 이하의 범위에 속하지 않는 모든 사원의 이름 및 급여를 출력
select ename, sal from emp where sal not between 1500 and 2850;

-- 7> 1981년 2월 20일 ~ 1981년 5월 1일에 입사한 사원의 이름, 직업 및 입사일을 출력하라.
-- 입사일을 기준으로 해서 오름차순으로 정렬하라.
select ename, job, hiredate from emp where hiredate between '1981-02-20' and '1981-05-01' order by hiredate;


----------- DDL ---------------

create table EMP01(
    empno number(4),
    ename varchar2(20),
    sal number(7,2)
);

desc emp01;


create table emp02 as select * from emp;


select * from emp02;


create table emp03 as select empno, ename from emp;
select * from emp03;

-- 테이블 구조를 변경하는 alter table
-- 기존 테이블의 구조를 변경하기 위한 ddl 명령문인다.
-- 테이블에 대한 구조 변경은 column의 insert, update, delete 시 사용

alter table emp01 add(job varchar2(9));
desc emp01;

alter table emp01 modify (joobb varchar2(30));
alter table emp01 drop column job;

select * from emp01;

-- drop table
-- 기존 테이블의 존재를 제거한다.
-- 한번 제거한 데이터들은 다시 복구하기 어렵기 때문에 유의

drop table emp01;

-- 테이블 삭젲, 무결성 제약 조건
-- 테이블의 기본 키나 고유 키를 다른 테이블에서 참조할 경우 해당 테이블 제거 불가.



-- 테이블의 모든 row을 제거하는truncate table
-- drop table과의 차이점 : truncate는 내용만 제거하고 구조는 남는다.

truncate table emp02;
select * from emp02;

-- 테이블 명 변경
rename emp02 to test;
select * from emp02;

select * from test;
rename test to emp02;




desc user_tables;

select * from user_tables;

select table_name from user_tables;



select * from all_tables;



-- 테이블 내용 추가, 수정, 삭제 DML
-- CRUD 
-- dept 테이블을 dept02테이블로 구조만 복사
create table dept02 as select * from dept where 1<>1;

delete from dept02 where 1=1;
select * from dept02;

-- insert 예제
insert into dept02(deptno, dname, loc) values(10, 'ACCOUNT', 'NEW YORK'); 
commit;

select * from dept02;
rollback;




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


