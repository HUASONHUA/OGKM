/*CROSS JOIN*/
SELECT id, name, singer, category, unitPrice, photoUrl, description, 
shelfDate, discount, products.stock, Sales,product_surrounding.* 
FROM products JOIN product_surrounding 
WHERE id=8 ;

/*INNER JOIN*/
SELECT id, name, singer, category, unitPrice, photoUrl, description, 
shelfDate, discount, products.stock, Sales,product_surrounding.* 
FROM products JOIN product_surrounding ON id=product_id
WHERE id=8 ;

/*LEFT OUTER JOIN, 這是檢視產品明細*/
SELECT id, name, singer, category, unitPrice, photoUrl, description, 
shelfDate, discount, products.stock, Sales,product_surrounding.* 
FROM products LEFT JOIN product_surrounding ON id=product_id
WHERE id=8 ;

/*檢視訂單明細*/
SELECT orders.id, member_id, created_date, created_time, 
recipient_name, recipient_email, recipient_phone, shipping_addres,
payment_type, payment_fee, payment_note, 
delivery_type,delivery_fee, delivery_note, status,
order_id,order_items.product_id,
category,products.photoUrl,products.name AS product_name,
order_items.typecolorname,product_surrounding.typecolorname AS p_typecolorname,
product_surrounding.colorphotourl,size,price,quantity
FROM orders JOIN order_items ON orders.id=order_items.order_id
JOIN products ON order_items.product_id=products.id
LEFT JOIN product_surrounding ON order_items.product_id=product_surrounding.product_id
AND order_items.typecolorname=product_surrounding.typecolorname
Where member_id='A173619629' AND orders.id='10';

/**/
SELECT products.id, product_surrounding.product_id,
name,product_surrounding.typecolorname,
products.unitPrice, product_surrounding_sizes.unitprice*(100-discount)/100 as size_unitprice,
description, shelfDate,discount, category,
products.photoUrl,colorphotourl,iconUrl,
products.stock,product_surrounding.stock AS surrounding_stock,product_surrounding_sizes.size AS size_stock,
product_surrounding.colorphotourl ,products.photoUrl AS surrounding_photoUrl
FROM products LEFT JOIN product_surrounding ON products.id=product_surrounding.product_id
  LEFT JOIN product_surrounding_sizes ON  products.id=product_surrounding_sizes.product_id
   AND product_surrounding.typecolorname=product_surrounding_sizes.typecolorname
WHERE id='24' 
GROUP BY ordinal;
/**/




/*LEFT OUTER JOIN, 這是檢視產品明細 AS*/
SELECT id, name, singer, category, unitPrice, photoUrl, description, 
shelfDate, discount,  Sales,product_id,typecolorname,iconUrl,
products.stock,product_surrounding.stock AS surrounding_stock,
product_surrounding.colorphotourl ,products.photoUrl AS surrounding_photoUrl
FROM products LEFT JOIN product_surrounding ON id=product_id
WHERE id=10 ;


/*RIGHT OUTER JOIN*/
SELECT id, name, singer, category, unitPrice, photoUrl, description, 
shelfDate, discount, products.stock, Sales,product_surrounding.* 
FROM products RIGHT JOIN product_surrounding ON id=product_id
WHERE id=8 ;

SELECT id, name, singer, category, unitPrice, photoUrl, description, 
shelfDate, discount, products.stock, Sales,product_surrounding.* 
FROM product_surrounding  RIGHT JOIN  products ON id=product_id is null
WHERE id ;

/*FULL JOIN  MYSQL不支援FULL JOIN
SELECT id, name, singer, category, unitPrice, photoUrl, description, 
shelfDate, discount, products.stock, Sales,product_surrounding.* 
FROM products FULL JOIN product_surrounding ON id=product_id
WHERE id=8 ;stock
*/


SELECT * 
FROM products JOIN product_surrounding ;