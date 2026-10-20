/*
USER_INFO 테이블과 ONLINE_SALE 테이블에서 년, 월, 성별 별로 상품을 구매한 회원수를 집계하는 SQL문을 작성해주세요. 
결과는 년, 월, 성별을 기준으로 오름차순 정렬해주세요. 이때, 성별 정보가 없는 경우 결과에서 제외해주세요.
*/


with base as (
select u.USER_ID
    ,u.GENDER
    ,o.sales_date
from USER_INFO u
inner join ONLINE_SALE o on o.USER_ID = u.USER_ID
    )
    select year(b.sales_date) as 'YEAR'
    ,month(b.sales_date) as 'MONTH'
    ,b.gender 
    ,count(distinct b.user_id) as 'USERS'
    from base b
    where b.gender is not null 
    group by 1,2,3
    order by 1,2,3

## 또 다른 풀이

SELECT   YEAR(B.SALES_DATE) YEAR
        ,MONTH(B.SALES_DATE) MONTH
        ,A.GENDER
        ,COunT(B.USER_ID)
FROM USER_INFO A
JOIN ONLINE_SALE B
ON A.USER_ID = B.USER_ID
WHERE A.GENDER IS NOT NULL
GROUP BY YEAR(B.SALES_DATE), MONTH(B.SALES_DATE) ,A.GENDER
order by YEAR(B.SALES_DATE), MONTH(B.SALES_DATE),A.GENDER
