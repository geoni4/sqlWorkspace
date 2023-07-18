-- 30> 모든 사원의 급여 최고액, 최저액, 총액 및 평균액을 출력하되
-- 각 column명을 Maximum, Minimum, Sum, Average로 지정하여 출력하라.
select max(sal) MAXIMUM, min(sal) MINIMUM, sum(sal) SUM, avg(sal) AVERAGE from emp;


-- 31> 각 직업별로 급여 최저액, 최고액, 총액 및 평균액을 출력하라.
select min(sal), max(sal), sum(sal), avg(sal) from emp group by job;


-- 32> 직업이 동일한 사람 수를 직업과 같이 출력하라.
select count(*) people, job from emp group by job;


-- 33> 관리자의 수를 출력하되, 관리자 번호가 중복되지 않게 하라. 그리고,
-- column명을 Number of Manager로 지정해 출력하라.
select count(distinct(mgr)) as "Number of Manager" from emp;


-- 34> 최고 급여와 최저 급여의 차액
select max(sal) - min(sal) from emp;


-- 35> 관리자 번호 및 해당 관리자에 속한 사원들의 최저 급여를 출력하라.
-- 단, 관리자가 없는 사원 및 최저 급여가 1000 미만인 그룹은 제외시키고 급여를 기준으로
-- 출력 결과를 내림차순으로 정렬하라.


select mgr, min(sal) from emp where mgr is not null group by mgr having min(sal) >= 1000 order by min(sal) desc;



