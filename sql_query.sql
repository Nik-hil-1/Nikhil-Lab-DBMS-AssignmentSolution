-- Display the number of the customer group by their genders who have placed any order of amount greater than or equal to Rs.3000.-- 
select cus_gender, count(cus_gender) from customer c inner join orders o on c.cus_id = o.cus_id where o.ord_amount >= 3000 group by cus_gender;

-- Display all the orders along with the product name ordered by a customer having Customer_Id=2.-- 
select orders.*, product.pro_name from orders, productdetails, product where orders.cus_id=2 and orders.prod_id = productdetails.prod_id and productdetails.pro_id = product.pro_id;

-- Display the Supplier details who can supply more than one product.-- 
select * from supplier where supp_id in (select supp_id from productdetails group by supp_id having count(prod_id)>1);

-- Find the category of the product whose order amount is minimum. -- 
select category.* from orders inner join productdetails on orders.prod_id=productdetails.prod_id inner join product on product.pro_id=productdetails.pro_id inner join category on category.cat_id=product.cat_id where orders.ord_amount=(select min(ord_amount) from orders);

-- Display the Id and Name of the Product ordered after “2021-10-05”.-- 
select product.pro_id, product.pro_name from orders inner join productdetails on orders.prod_id=productdetails.prod_id inner join product on productdetails.pro_id=product.pro_id where orders.ord_date>'2021-10-05' order by pro_id;

-- Print the top 3 supplier name and id and their rating on the basis of their rating along with the customer name who has given the rating.-- 
select customer.cus_name, supplier.supp_name, rating.rat_ratstars, rating.cus_id, rating.supp_id from rating, supplier, customer where rating.cus_id=customer.cus_id and rating.supp_id=supplier.supp_id order by rat_ratstars desc limit 3;

-- Display customer name and gender whose names start or end with character 'A'.-- 
select cus_name, cus_gender from customer where cus_name like 'a%' or cus_name like'%a';

-- Display the total order amount of the male customers.-- 
select sum(ord_amount) as Total from orders where cus_id in(select customer.cus_id from customer where customer.cus_gender='m');

-- Display all the Customers left outer join with  the orders.-- 
select * from customer c left outer join orders o on c.cus_id = o.cus_id;

-- Create a stored procedure to display the Rating for a Supplier if any along with the Verdict on that rating if any like if rating >4 then “Genuine Supplier” if rating >2 “Average Supplier” else “Supplier should not be considered”.-- 
call ratingverdict();
