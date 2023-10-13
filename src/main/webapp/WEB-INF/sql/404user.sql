select *
from users;

select *
from orders;

select *
from item;

select *
from item_qna;

select *
from user_cart;

select *
from user_cart_items;


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