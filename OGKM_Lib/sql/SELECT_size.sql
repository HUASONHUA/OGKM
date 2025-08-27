SELECT product_surrounding_sizes.product_id,product_surrounding_sizes.typecolorname , 
size, ordinal, product_surrounding_sizes.stock, 
products.discount,product_surrounding_sizes.unitprice* (100-products.discount)/100 as price
FROM product_surrounding_sizes JOIN products ON products.id=product_surrounding_sizes.product_id
WHERE product_id = '24' AND typecolorname='';

SELECT product_surrounding_sizes.product_id,product_surrounding_sizes.typecolorname , 
size, ordinal, product_surrounding_sizes.stock, 
products.discount,product_surrounding_sizes.unitprice* (100-products.discount)/100 as price
FROM product_surrounding_sizes JOIN products ON id=product_id
WHERE product_id = '11' AND typecolorname='黑'
ORDER BY ordinal; 

SELECT products.id,category, IFNULL(IFNULL(product_surrounding.typecolorname,product_surrounding_sizes.typecolorname), '') as the_typecolor_name,
    IFNULL(size, '') as size_name,	
    IFNULL(IFNULL(product_surrounding_sizes.stock,product_surrounding.stock),products.stock) as real_time_stock
	FROM products LEFT JOIN product_surrounding ON products.id=product_surrounding.product_id
	LEFT JOIN product_surrounding_sizes ON products.id=product_surrounding_sizes.product_id 
    AND (product_surrounding.typecolorname=product_surrounding_sizes.typecolorname
    OR product_surrounding.typecolorname IS null AND product_surrounding_sizes.typecolorname="")
    WHERE products.id='2' HAVING the_typecolor_name='' AND size_name='';