/*
MEMBER_PROFILE와 REST_REVIEW 테이블에서 리뷰를 가장 많이 작성한 회원의 리뷰들을 조회하는 SQL문을 작성해주세요. 
회원 이름, 리뷰 텍스트, 리뷰 작성일이 출력되도록 작성해주시고, 
결과는 리뷰 작성일을 기준으로 오름차순, 리뷰 작성일이 같다면 리뷰 텍스트를 기준으로 오름차순 정렬해주세요.
*/


with cnt as (
select m.MEMBER_ID
,count(r.REVIEW_ID) as cnt1
from MEMBER_PROFILE m
left join REST_REVIEW r on r.MEMBER_ID = m.MEMBER_ID
group by 1
    )
    , max_id as (
    select *
    from cnt
    where cnt1 = (select max(cnt1) from cnt)
    )
    select p.MEMBER_NAME
    ,r.REVIEW_TEXT
    ,date_format(r.REVIEW_DATE, '%Y-%m-%d') as REVIEW_DATE
    from max_id i
    inner join MEMBER_PROFILE p on p.MEMBER_ID = i.MEMBER_ID
    inner join REST_REVIEW r on r.MEMBER_ID = i.MEMBER_ID
    order by r.REVIEW_DATE, r.REVIEW_TEXT
