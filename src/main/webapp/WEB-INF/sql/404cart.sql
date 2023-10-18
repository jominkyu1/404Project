select * from user_cart right join users on users.user_id = 1;

select * from (
                  select rowNum, item_qna_id, answered, answered_text, contents, regdate, item_id, user_id
                  from ITEM_QNA
              )
where rowNum between 1 and 15 order by rowNum desc;


select rowNum, item_qna_id, answered, answered_text, contents, regdate, item_id, user_id
from ITEM_QNA;