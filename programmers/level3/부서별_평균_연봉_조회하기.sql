/*
HR_DEPARTMENT와 HR_EMPLOYEES 테이블을 이용해 부서별 평균 연봉을 조회하려 합니다. 
부서별로 부서 ID, 영문 부서명, 평균 연봉을 조회하는 SQL문을 작성해주세요.

평균연봉은 소수점 첫째 자리에서 반올림하고 컬럼명은 AVG_SAL로 해주세요.
결과는 부서별 평균 연봉을 기준으로 내림차순 정렬해주세요.
*/

with gijun as (
select DEPT_ID
      ,DEPT_NAME_EN
from HR_DEPARTMENT
    )
    select e.DEPT_ID
    ,DEPT_NAME_EN
    ,round(avg(SAL)) as AVG_SAL
    from HR_EMPLOYEES e 
    inner join gijun g on g.DEPT_ID = e.DEPT_ID
    group by 1
    order by AVG_SAL desc

