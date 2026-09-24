/*
FOOD_PRODUCT와 FOOD_ORDER 테이블에서 생산일자가 2022년 5월인 식품들의 식품 ID, 식품 이름, 총매출을 조회하는 SQL문을 작성해주세요. 
이때 결과는 총매출을 기준으로 내림차순 정렬해주시고 총매출이 같다면 식품 ID를 기준으로 오름차순 정렬해주세요.
*/

with prod_sum as (
select o.PRODUCT_ID
,sum(o.AMOUNT) as AMOUNT
from FOOD_ORDER o
where date_format(o.PRODUCE_DATE, '%Y-%m') = '2022-05'
group by 1
    )
    select p.PRODUCT_ID
    ,p.PRODUCT_NAME
    ,p.PRICE * s.AMOUNT as 'TOTAL_SALES'
    from FOOD_PRODUCT p
    inner join prod_sum s on s.PRODUCT_ID = p.PRODUCT_ID
    order by 3 desc, 1

