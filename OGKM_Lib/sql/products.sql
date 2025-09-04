SELECT id, name, singer, category, unitPrice, photoUrl, description, shelfDate, discount, stock, Sales FROM products;

SELECT id, name, singer, category, unitPrice, photoUrl, description, shelfDate, discount, stock, Sales FROM ogk.products
WHERE category <>'merch' ORDER BY shelfDate DESC;
SELECT id, name, singer, category, unitPrice, photoUrl, description, shelfDate, discount, stock, Sales FROM products
WHERE category <>'merch' ;

SELECT id, name, singer, category, unitPrice, photoUrl, description, shelfDate, discount, stock, Sales FROM products
WHERE category ='merch';

SELECT  id, name, singer, category, unitPrice, photoUrl, description, shelfDate, discount, stock, Sales FROM products
WHERE name LIKE '%Monster%';

SELECT  id, name, singer, category, unitPrice, photoUrl, description, shelfDate, discount, stock, Sales FROM products  
WHERE name LIKE'' OR singer LIKE '%YOASOBI%' AND category <>'merch'  ;

SELECT  id, name, singer, category, unitPrice, photoUrl, description, shelfDate, discount, stock, Sales FROM ogk.products  
WHERE name LIKE'三原色' AND singer LIKE '%YOASOBI%' AND category <>'merch'  ;

SELECT  id, name, singer, category, unitPrice, photoUrl, description, shelfDate, discproduct_surroundingount, stock, Sales FROM products 
WHERE category LIKE '%JPOP%' ;

SELECT  id, name, singer, category, unitPrice, photoUrl, description, shelfDate, discount, stock, Sales FROM products  
ORDER BY shelfDate DESC LIMIT 2;

SELECT id, name, singer, category, unitPrice, photoUrl, description, shelfDate, discount, stock, Sales FROM products  
WHERE unitPrice BETWEEN 0 AND 100;

SELECT id, name, singer, category, photoUrl, shelfDate FROM products  
WHERE id AND category <>'merch'ORDER BY shelfDate DESC limit 20 ;;

SELECT id, name, singer, category, photoUrl, shelfDate FROM products
WHERE ((id='1' AND singer LIKE '%ADO%') AND  category <>'merch') AND id<>'1' Order by shelfDate desc limit 2 ;

SELECT id, name, singer, category, photoUrl, shelfDate FROM products
WHERE  singer LIKE '%ADO%' AND  category <>'merch' AND id<>'1' Order by shelfDate desc limit 3 ;


SELECT products.id,orders.id, member_id, category,name,photoUrl,musicUrl, order_items.order_id,
group_concat(distinct products.id)
FROM products JOIN order_items ON order_items.product_id=products.id
JOIN orders ON orders.id=order_items.order_id
Where (member_id='A123456789')AND products.category<>'merch'
GROUP BY products.id Order by order_items.order_id desc;


SELECT id, name, singer, category, Sales ,curdate() - INTERVAL 14 day FROM products
WHERE category <>'merch' order by Sales Desc limit 10 ;

SELECT id, name, singer, sum(Sales),curdate() - INTERVAL 14 day FROM products
WHERE category <>'merch' order by Sales Desc limit 10 ;

SELECT id, name, singer,SUM(Sales) as singerSales,curdate() - INTERVAL 14 day
 FROM products WHERE category <>'merch'GROUP BY singer order by singerSales Desc limit 10;

SELECT distinct id, count(id) as totalp,
FLOOR((count(id)/10)) as pages, 
MOD(count(id),10) as lastpage FROM products

WHERE category <>'merch' AND id<13 GROUP BY id  order by id desc limit 10;
