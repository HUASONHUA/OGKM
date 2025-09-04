/*三個客戶同時下單
	買的剛好是同一個產品(id=1),(id=11, the_color_name='紫'), 
		(id=13, the_color_name='白', size_name='S'), (id=14, the_color_name='', size_name='L')*/    
SELECT * FROM ogk.product_real_time_stock
	WHERE id IN (25, 11,10, 1, 14); 

UPDATE products SET Sales=Sales+1 WHERE category <>'merch' AND id = 1;
UPDATE products SET stock=stock-1 WHERE category ='merch' AND stock>=stock AND id = 1;

UPDATE product_merch SET stock=stock-3 WHERE stock>=stock  AND product_id = 11 AND typecolorname='Ayase布偶' ;


UPDATE product_surrounding_sizes SET stock=stock-1 WHERE stock>=stock  AND product_id = 11  AND typecolorname='黑' AND size='L' ;


UPDATE product_surrounding_sizes SET stock=stock-1 WHERE  stock>=stock   AND product_id = 24 AND typecolorname='' AND size='S' ;