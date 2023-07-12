select * from customer;

select * from product;

select * from cart_product;

insert into product(name)values(
	'hat'
),('sweatshirt');

select *
from product 
left join cart_product
on product.product_id = cart_product.product_id;

select product.product_id, name, cart_id
from product
left join cart_product
on product.product_id = cart_product.product_id;

select product.product_id, name, cart_id
from product
right join cart_product
on product.product_id = cart_product.product_id;

select *
from product 
inner join cart_product
on product.product_id = cart_product.product_id;

insert into customer(email,password)values('bob','123');

-- All customers who bought a pillow
select customer.name, cart.cart_id , product.product_id
from customer
join cart 
on customer.customer_id = cart.customer_id
join cart_product 
on cart.cart_id = cart_product.cart_id
join product 
on cart_product.product_id = product.product_id
where product.name = 'pillow';
--where product.product_id = 1;

