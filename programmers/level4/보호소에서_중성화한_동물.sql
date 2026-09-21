#보호소에서 중성화 수술을 거친 동물 정보를 알아보려 합니다. 
#보호소에 들어올 당시에는 중성화되지 않았지만, 
#보호소를 나갈 당시에는 중성화된 동물의 아이디와 생물 종, 
#이름을 조회하는 아이디 순으로 조회하는 SQL 문을 작성해주세요.

with out_list as (
select i.ANIMAL_ID
    ,i.ANIMAL_TYPE
    ,i.NAME
    ,i.SEX_UPON_INTAKE
    ,o.SEX_UPON_OUTCOME
from ANIMAL_INS i
inner join ANIMAL_OUTS o on i.ANIMAL_ID = o.ANIMAL_ID
where case when i.SEX_UPON_INTAKE != o.SEX_UPON_OUTCOME then 1 else 0 end = 1
#조인 한 후에 SEX_UPON_INTAKE와 SEX_UPON_OUTCOME 것이 다른 것을 추리기
    )
    select a.ANIMAL_ID
          ,a.ANIMAL_TYPE
          ,a.NAME
    from out_list a


#다른풀이 추가(26/9/21)

select i.ANIMAL_ID
      ,i.ANIMAL_TYPE
      ,i.NAME
from ANIMAL_INS i 
inner join ANIMAL_OUTS o on o.ANIMAL_ID = i.ANIMAL_ID
where case when i.SEX_UPON_INTAKE != o.SEX_UPON_OUTCOME then 1 end = 1
order by 1

