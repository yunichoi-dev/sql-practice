/*
각 분기(QUARTER)별 분화된 대장균의 개체의 총 수(ECOLI_COUNT)를 출력하는 SQL 문을 작성해주세요. 
이때 각 분기에는 'Q' 를 붙이고 분기에 대해 오름차순으로 정렬해주세요. 대장균 개체가 분화되지 않은 분기는 없습니다.
*/


select case when month(DIFFERENTIATION_DATE) between 1  and 3  then '1Q'
            when month(DIFFERENTIATION_DATE) between 4  and 6  then '2Q'
            when month(DIFFERENTIATION_DATE) between 7  and 9  then '3Q'
            when month(DIFFERENTIATION_DATE) between 10 and 12 then '4Q' end as 'QUARTER'
       ,count(*) as 'ECOLI_COUNT'     
from ECOLI_DATA
group by 1
order by case when month(DIFFERENTIATION_DATE) between 1  and 3  then 1
              when month(DIFFERENTIATION_DATE) between 4  and 6  then 2
              when month(DIFFERENTIATION_DATE) between 7  and 9  then 3
              when month(DIFFERENTIATION_DATE) between 10 and 12 then 4 end

