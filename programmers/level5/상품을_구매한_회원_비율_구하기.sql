/* 
USER_INFO 테이블과 ONLINE_SALE 테이블에서 2021년에 가입한 전체 회원들 중 
상품을 구매한 회원수와 상품을 구매한 회원의 비율(=2021년에 가입한 회원 중 상품을 구매한 회원수 / 2021년에 가입한 전체 회원 수)을 
년, 월 별로 출력하는 SQL문을 작성해주세요. 

상품을 구매한 회원의 비율은 소수점 두번째자리에서 반올림하고, 
전체 결과는 년을 기준으로 오름차순 정렬해주시고 년이 같다면 월을 기준으로 오름차순 정렬해주세요.
*/

with joined as ( select USER_ID
                      ,JOINED
                from USER_INFO
                where YEAR(JOINED) = '2021'
                
                #2021년에 가입한 회원수만 구하기(분모값)
               ), pur as
               (
                select o.USER_ID
                      ,o.SALES_DATE
                from USER_INFO u  
                inner join ONLINE_SALE o on o.USER_ID = u.USER_ID
                where YEAR(u.JOINED) = '2021'
                
                #2021년에 가입한 회원들 수 중, 구입한 회원수만 구하기(분자값)
                )
               
               select YEAR(p.SALES_DATE) as 'YEAR'
                     ,MONTH(p.SALES_DATE) as 'MONTH'
                     ,count(distinct p.USER_ID) as 'PURCHASED_USERS'
                     ,round(count(distinct p.USER_ID)/(SELECT COUNT(*) FROM joined),1) as 'PUCHASED_RATIO'
               from pur p 
               group by 1,2
               order by 1,2

