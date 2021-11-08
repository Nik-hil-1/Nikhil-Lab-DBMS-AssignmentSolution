CREATE DEFINER=`root`@`localhost` PROCEDURE `RatingVerdict`()
BEGIN
select r.supp_id, r.rat_ratstars, s.supp_name,
case
when r.rat_ratstars>4 then 'Genuine Supplier'
when r.rat_ratstars>2 then 'Average Supplier'
else 'Supplier should not be considered'
end as Verdict from rating r inner join supplier s on r.supp_id=s.supp_id order by s.supp_id;
END