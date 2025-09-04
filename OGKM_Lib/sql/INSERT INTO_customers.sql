SELECT * FROM ogk.customers;

INSERT INTO customers
(id, name, email, password, birthday, gernder)
VALUES
('A123456789','花一豪','flowertest1@gmail.com',123456,'2000-11-11','M'),
('A123546789','花二豪','flowertest2@gmail.com','123456','1999/5/9','M'),
('A123546789','花三豪','flowertest3@gmail.com','123456','1999/5/9','M');
INSERT INTO customers 
(id, name, email, password, birthday, gernder,address,phone,subscribed,blood_type)
 VALUES ('A178946789', '花四豪','flowertest4@gmail.com','123456', '1999/5/9','M','台北市123路456號14F','0987654321',true,'A');
 /*給註冊功能*/
 INSERT INTO customers 
(id, name, email, password, birthday, gernder,address,phone,subscribed,blood_type)
 VALUES ('A178988789', '花五豪','flowertest4@gmail.com','123456', '1999/5/9','M','台北市123路456號14F','0987654321',false,'A');
 
 INSERT INTO customers 
 (id, name, email, password, birthday, gernder,subscribed)
 VALUES ('A175588789', '花六豪','flowertest6@gmail.com','123456', '1999/5/9','M',false);
