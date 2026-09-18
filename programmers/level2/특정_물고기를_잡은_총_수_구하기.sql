/*
낚시앱에서 사용하는 FISH_INFO 테이블은 잡은 물고기들의 정보를 담고 있습니다. 
FISH_INFO 테이블의 구조는 다음과 같으며 ID, FISH_TYPE, LENGTH, TIME은 
각각 잡은 물고기의 ID, 물고기의 종류(숫자), 잡은 물고기의 길이(cm), 물고기를 잡은 날짜를 나타냅니다.
*/

select  count(b.FISH_NAME) as FISH_COUNT
from FISH_INFO a
inner join FISH_NAME_INFO b on b.FISH_TYPE = a.FISH_TYPE
where b.FISH_NAME in ('BASS','SNAPPER')

