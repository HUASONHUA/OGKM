CREATE DEFINER = CURRENT_USER TRIGGER `order_status_log` AFTER UPDATE ON `orders` FOR EACH ROW
BEGIN
IF (old.status != new.status) THEN
            INSERT INTO order_status_log(order_id, old_status, new_status, 
            old_payment_note, new_payment_note, old_delivery_note, new_delivery_note) 
		VALUES (new.id, old.status, new.status, old.payment_note,new.payment_note,
			old.delivery_note, new.delivery_note);        
    END IF;    
END
