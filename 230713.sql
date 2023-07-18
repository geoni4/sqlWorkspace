-- emp06테이블 생성, 기본키 제약 조건, 외래키 제약 조건(constraint)
create table emp06(
    empno number(4) constraint emp06_empno_pk primary key,
    ename varchar(10) constraint emp06_ename_nn not null,
    job varchar(9),
    deptno number(2) constraint emp06_deptno_fk references dept(deptno)
);


create table student(
    id number(4) primary key,
    score number(3) not null,
    constraint score_check check (score>=0)
);


insert into student values(1, 100);

select * from student;


-- 시퀀스
create sequence emp_seq start with 1 increment by 1 maxvalue 10000;


drop table emp01;

create table emp01(
    empno number(4) primary key,
    ename varchar(10),
    hiredate date
);


insert into emp01 values (emp_seq.nextVal, '홍길동', sysdate);
insert into emp01 values (emp_seq.nextVal, '홍길동', sysdate);
insert into emp01 values (emp_seq.nextVal, '홍길동', sysdate);
insert into emp01 values (emp_seq.nextVal, '홍길동', sysdate);
insert into emp01 values (emp_seq.nextVal, '홍길동', sysdate);
insert into emp01 values (emp_seq.nextVal, '홍길동', sysdate);
insert into emp01 values (emp_seq.nextVal, '홍길동', sysdate);
insert into emp01 values (emp_seq.nextVal, '홍길동', sysdate);
insert into emp01 values (emp_seq.nextVal, '홍길동', sysdate);
insert into emp01 values (emp_seq.nextVal, '홍길동', sysdate);

select * from emp01;


select emp_seq.currval from dual;
select emp_seq.nextval from dual;
alter sequence emp_seq increment by 2;




-- sql
-- 8> 10번 및 30번 부서에 속하는 모든 사원의 이름과 부서 번호를 출력하되, 이름을 알파벳 순으로
select ename, deptno from emp where deptno in (10, 30) order by ename;


-- 9> 10번 및 30번 부서에 속하는 모든 사원 중 급여가 1500을 넘는 사원의
-- 이름 및 급여를 출력하라.
-- (단 컬럼명을 각각 employee 및 Monthly Salary로 지정하시오)

select ename employee , sal "Monthly Salary" from emp where deptno in(10, 30) and sal > 1500;
select * from emp;

-- 10> 관리자 없는 모든 사원의 이름 및 직위를 출력하라.
select ename, job from emp where mgr is null;

-- 11> 커미션을 받는 모든 사원의 이름, 급여 및 커미션을 출력하되, 급여를 기준으로
-- 내림차순으로 정렬하여 출력하라.

select ename, sal, comm from emp where comm is not null and comm != 0 order by sal;

-- 12> 이름의 세 번재 문자가 A인 모든 사원의 이름을 출력하라.
select * from emp;
select ename from emp where ename like '__A%';

-- 13> 이름에 L이 두번 들어가며 부서 30에 속해있는 사원의 이름을 출력하라.
select ename from emp where ename like '%L%L%' and deptno = 30;

-- 14> 직업이 clerk 또는 analyst 이면서 급여가 1000, 3000, 5000이 아닌
-- 모든 사원의 이름, 직업 및 급여를 출력하라.
select ename, job, sal from emp where job in('CLERK','ANALYST') and sal not in(1000,3000,5000);

-- 15> 사원번호, 이름, 급여 그리고 15%인상된 급여를 정수로 표시하되 column명을
-- new salary로 지정해 출력

select deptno, ename, round(sal*1.15) as "New Salary" from emp ; 

-- 16> 15번 문제와 동일한 데이터에서 급여 인상분(새 급여에서 이전 급여를 뺀 값을 추가해서)
-- 출력하라 (column명은 increase로 하라).

select deptno, ename, round(sal*1.15) as "New salary", round(sal*0.15) as "Increase" from emp;

-- 18> 모든 사원의 이름(첫 글자는 대문자로, 나머지 글자는 소문자로 표시) 및 이름 길이를
-- 표시하는 쿼리를 작성하고 column 별칭은 적당히 넣어서 출력하라.

select initcap(ename) as ename, length(ename) as "Name Length" from emp;

-- 19> 사원의 이름과 커미션을 출력하되, 커미션이 책정되지 않은
-- 사원의 커미션은 ''no commission'으로 출력하라.
select ename, nvl(to_char(comm),'no commission') as comm from emp;

-- 20> 모든 사원의 이름, 부서번호, 부서이륾을 표시하는 쿼리문을 작성
select ename, deptno, decode(deptno, 10, 'ACCOUNTING', 20,'RESEARCH',30,'SALES',40,'OPERATIONS') as dname from emp;
select * from dept;


-- 21> 30번 부서에 속한 사원의 이름과 부서번호 그리고 부서이름을 출력하라.
select emp.ename, dept.dname from emp, dept where emp.deptno = dept.deptno order by emp.empno;


-- 22> 30번 부서에 속한 사원들의 모든 직업과 부서위치를 출력하라.
-- (단, 직업 목록이 중복되지 않게 하라.)

select distinct(job), emp.deptno from emp where emp.deptno = 30;

drop table Board;

    create table Board(
      bno Number,
      btitle varchar2(500) not null,
      bcontent varchar2(1000),
      bwriter varchar2(100) not null,
      createddate date default sysdate,
      updateddate date default sysdate
    );

select * from Board;

desc Board;

create sequence board_pk increment by 1 start with 1;

select * from  DBA_CONSTRAINTS;
ALTER TABLE board ADD CONSTRAINT board_pk PRIMARY KEY(bno);

select board_pk.nextval from dual;


SELECT * FROM USER_SEQUENCES;