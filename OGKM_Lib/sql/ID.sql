
SELECT id, name, singer, category, products.unitPrice, description,
			shelfDate, discount,auditionUrl,
            product_merch.product_id,product_merch.typecolorname,iconUrl,
            COUNT(size) as size_count,COUNT(size)>0 as has_size, 
            MIN(product_merch_sizes.unitprice) as min_price,
            MAX(product_merch_sizes.unitprice) as max_price,
			products.stock,if(COUNT(size)>0,sum(product_merch_sizes.stock),product_merch.stock)  AS surrounding_stock,
			products.photoUrl,product_merch.colorphotourl AS surrounding_photoUrl
			 FROM ogk.products LEFT JOIN ogk.product_merch ON products.id=product_merch.product_id
			LEFT JOIN ogk.product_merch_sizes ON products.id=product_merch_sizes.product_id
            AND(product_merch.typecolorname=product_merch_sizes.typecolorname
            OR (product_merch.typecolorname is null AND product_merch_sizes.typecolorname=''))
			WHERE id='24'
            GROUP BY id, product_merch.typecolorname;