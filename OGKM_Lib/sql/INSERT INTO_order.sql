INSERT INTO orders 
(id, member_id, created_date, create_time, 
recipient_name, recipient_email, recipient_phone, 
shipping_addres, payment_type, payment_fee,
 delivery_type, delivery_fee,  status)
 VALUES(?,?,?,?,?,?,?,?,?,?,?,?,0);
 
 
 INSERT INTO order_items
 (order_id, product_id, typecolorname, size, price, quantity)
 VALUES(?,?,?,?,?,?)