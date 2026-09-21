/*
보호소에서는 몇 시에 입양이 가장 활발하게 일어나는지 알아보려 합니다. 
0시부터 23시까지, 각 시간대별로 입양이 몇 건이나 발생했는지 조회하는 SQL문을 작성해주세요. 
이때 결과는 시간대 순으로 정렬해야 합니다.
*/

with gijun as (
                select 0 as 'HOUR'
                union all
                select 1
                union all
                select 2
                union all
                select 3
                union all
                select 4
                union all
                select 5
                union all
                select 6
                union all
                select 7
                union all
                select 8
                union all
                select 9
                union all
                select 10
                union all
                select 11
                union all
                select 12
                union all
                select 13
                union all
                select 14
                union all
                select 15
                union all
                select 16
                union all
                select 17
                union all
                select 18
                union all
                select 19
                union all
                select 20
                union all
                select 21
                union all
                select 22
                union all
                select 23   
)
, gijun2 as
(
select hour(DATETIME) as 'HOUR'
,count(*) as 'COUNT'
from ANIMAL_OUTS
group by 1
)
select g.HOUR
      ,case when g2.COUNT is null then 0 else g2.COUNT end 'COUNT'
from gijun g 
left join gijun2 g2 on g2.HOUR = g.HOUR
