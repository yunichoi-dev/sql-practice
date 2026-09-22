/*
데이터 분석 팀에서는 우유(Milk)와 요거트(Yogurt)를 동시에 구입한 장바구니가 있는지 알아보려 합니다. 
우유와 요거트를 동시에 구입한 장바구니의 아이디를 조회하는 SQL 문을 작성해주세요. 
이때 결과는 장바구니의 아이디 순으로 나와야 합니다.
*/

with gijun as (
select CART_ID, NAME
from CART_PRODUCTS
where NAME in ('Milk','Yogurt')
group by 1
having count(distinct NAME) = 2
    )select CART_ID
    from gijun
    group by 1


/*
WHERE name IN ('Milk', 'Yogurt')
HAVING COUNT(*) >= 2 이렇게 설정할 시 

요거트없이 
MILK
MILK
로 들어간 CART_ID 도 포함되어버리므로, 종류가 다른 두가지가 = 2 인것을 추린다
*/
