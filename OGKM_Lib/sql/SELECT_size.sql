SELECT product_merch_sizes.product_id,product_merch_sizes.typecolorname ,
size, ordinal, product_merch_sizes.stock,
products.discount,product_merch_sizes.unitprice* (100-products.discount)/100 as price
FROM product_merch_sizes JOIN products ON products.id=product_merch_sizes.product_id
WHERE product_id = '24' AND typecolorname='';

SELECT product_merch_sizes.product_id,product_merch_sizes.typecolorname ,
size, ordinal, product_merch_sizes.stock,
products.discount,product_merch_sizes.unitprice* (100-products.discount)/100 as price
FROM product_merch_sizes JOIN products ON id=product_id
WHERE product_id = '11' AND typecolorname='黑'
ORDER BY ordinal; 

SELECT products.id,category, IFNULL(IFNULL(product_merch.typecolorname,product_merch_sizes.typecolorname), '') as the_typecolor_name,
    IFNULL(size, '') as size_name,	
    IFNULL(IFNULL(product_merch_sizes.stock,product_merch.stock),products.stock) as real_time_stock
	FROM products LEFT JOIN product_merch ON products.id=product_merch.product_id
	LEFT JOIN product_merch_sizes ON products.id=product_merch_sizes.product_id
    AND (product_merch.typecolorname=product_merch_sizes.typecolorname
    OR product_merch.typecolorname IS null AND product_merch_sizes.typecolorname="")
    WHERE products.id='2' HAVING the_typecolor_name='' AND size_name='';