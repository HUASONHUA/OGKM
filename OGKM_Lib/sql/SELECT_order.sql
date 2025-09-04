SELECT id, created_date, created_time,payment_type,status
FROM orders ;


SELECT id, created_date, created_time,payment_type,status 
,price, quantity 
FROM orders left joIN  order_items on orders.id=order_items.order_id
Where member_id='A173619629';

SELECT id, member_id, created_date, created_time, 
recipient_name, recipient_email, recipient_phone, shipping_addres,
 payment_type, payment_fee, payment_note, 
 delivery_type,delivery_fee, delivery_note, status,
 sum(price*quantity)as total_amount
FROM ogk.orders left joIN ogk.order_items on id=order_id
Where member_id='A123456789' 
GROUP BY orders.id order by orders.id desc;


SELECT orders.id, member_id, created_date, created_time, 
recipient_name, recipient_email, recipient_phone, shipping_addres,
 payment_type, payment_fee, payment_note, 
 delivery_type,delivery_fee, delivery_note, status,
 category,name,photoUrl,stock
 /*,sum(price*quantity)*/
FROM orders  joIN order_items on orders.id=order_items.order_id
  joIN products on order_items.product_id=products.id
Where member_id='A173619629';


/*檢視訂單明細*/
SELECT orders.id, member_id, created_date, created_time, 
recipient_name, recipient_email, recipient_phone, shipping_addres,
payment_type, payment_fee, payment_note, 
delivery_type,delivery_fee, delivery_note, status,
order_id,order_items.product_id,
category,products.photoUrl,products.name AS product_name,
order_items.typecolorname,product_merch.typecolorname AS p_typecolorname,
product_merch.colorphotourl,size,price,quantity
FROM orders JOIN order_items ON orders.id=order_items.order_id
JOIN products ON order_items.product_id=products.id
LEFT JOIN product_merch ON order_items.product_id=product_merch.product_id
AND order_items.typecolorname=product_merch.typecolorname
Where member_id='A173619629' AND orders.id='10';

/**/
SELECT products.id, product_merch.product_id,
name,product_merch.typecolorname,
products.unitPrice, product_merch_sizes.unitprice*(100-discount)/100 as size_unitprice,
description, shelfDate,discount, category,
products.photoUrl,colorphotourl,iconUrl,
products.stock,product_merch.stock AS surrounding_stock,product_merch_sizes.size AS size_stock,
product_merch.colorphotourl ,products.photoUrl AS surrounding_photoUrl
FROM products LEFT JOIN product_merch ON products.id=product_merch.product_id
  LEFT JOIN product_merch_sizes ON  products.id=product_merch_sizes.product_id
   AND product_merch.typecolorname=product_merch_sizes.typecolorname
WHERE id='24' 
GROUP BY ordinal;
/**/

/*以購買*/
SELECT  products.id,orders.id, member_id, category,name,photoUrl
FROM orders JOIN order_items ON orders.id=order_items.order_id
JOIN products ON order_items.product_id=products.id
Where (member_id='F123326512')AND products.category<>'merch';


/*以購買*/
SELECT  products.id,orders.id, member_id, category,name,photoUrl,musicUrl,
count(distinct products.id)FROM ogk.products JOIN ogk.order_items ON ogk.order_items.product_id=ogk.products.id
JOIN ogk.orders ON ogk.orders.id=ogk.order_items.order_id
Where (member_id='F123326512')AND products.category<>'merch'
GROUP BY products.id;

/*以購買*/
SELECT products.id,orders.id, member_id, category,name,photoUrl,musicUrl,
group_concat(distinct products.id)
FROM products JOIN order_items ON order_items.product_id=products.id
JOIN orders ON orders.id=order_items.order_id
Where (member_id='A123456789')AND products.category<>'merch'
GROUP BY products.id;