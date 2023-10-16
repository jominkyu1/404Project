select * from users;

select *
from orders;

select *
from item;

select *
from item_qna;

select * from item_qna where answered = 1;

select *
from user_cart;

select users_seq.nextval from dual;

select *
from user_cart_items;

--장바구니 아이템 제거
delete from user_cart_items where cart_id = 유저카트번호 and item_id = 삭제할아이템번호;



select c.quantity as order_quantity,
       image_path,
       name,
       price
from user_cart_items c join item i on c.item_id = i.item_id
where cart_id = (select cart_id from user_cart where user_id = 1);


select quantity, item_id from user_cart_items
                         where cart_id = (select cart_id from user_cart where user_id = 1);


delete from user_cart_items where cart_item_id = 7;
delete from user_cart_items where cart_id =3;
commit;

select *
from user_cart
         join users on user_cart.user_id = users.user_id;

select *
from item
where item_id = (select item_id
                 from user_cart_items
                 where cart_id = (select cart_id
                                  from user_cart
                                           join users on users.user_id = user_cart.user_id));

select * from user_cart right join users on users.user_id = 1;


select sum(user_cart_items.QUANTITY * ITEM.PRICE) from user_cart_items join ITEM on user_cart_items.ITEM_ID = ITEM.ITEM_ID where user_cart_items.cart_id=2;