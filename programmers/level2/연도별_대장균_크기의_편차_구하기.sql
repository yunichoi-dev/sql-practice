/*
분화된 연도(YEAR), 분화된 연도별 대장균 크기의 편차(YEAR_DEV), 대장균 개체의 ID(ID) 를 출력하는 SQL 문을 작성해주세요. 
분화된 연도별 대장균 크기의 편차는 분화된 연도별 가장 큰 대장균의 크기 - 각 대장균의 크기로 구하며 
결과는 연도에 대해 오름차순으로 정렬하고 같은 연도에 대해서는 대장균 크기의 편차에 대해 오름차순으로 정렬해주세요.
*/

with gijun as (
                select YEAR(DIFFERENTIATION_DATE) as 'YEAR'
                      ,max(SIZE_OF_COLONY) 'gijun'
                from ECOLI_DATA 
                group by 1
              )
              select g.YEAR
                    ,g.gijun - SIZE_OF_COLONY as 'YEAR_DEV'
                    ,e.ID
              from ECOLI_DATA e
              inner join gijun g on g.YEAR =  YEAR(e.DIFFERENTIATION_DATE)
              order by g.YEAR , YEAR_DEV

