create schema e_commerce;
use e_commerce;

create table Supplier(SUPP_ID int auto_increment primary key, SUPP_NAME varchar(50), SUPP_CITY varchar(50), SUPP_PHONE bigint);
create table Customer(CUS_ID int auto_increment primary key, CUS_NAME varchar(250), CUS_PHONE bigint, CUS_CITY varchar(50), CUS_GENDER varchar(1));
create table Category(CAT_ID  int primary key, CAT_NAME varchar(250));
create table Product(PRO_ID int primary key, PRO_NAME varchar(50), PRO_DESC varchar(50), CAT_ID int, foreign key(CAT_ID) references Category(CAT_ID));
create table ProductDetails(PROD_ID int primary key, PRO_ID int, SUPP_ID int, PRICE int, foreign key(PRO_ID) references Product(PRO_ID), foreign key(SUPP_ID) references Supplier(SUPP_ID));
create table Orders(ORD_ID int primary key, ORD_AMOUNT int, ORD_DATE date, CUS_ID int, PROD_ID int, foreign key(CUS_ID) references Customer(CUS_ID), foreign key(PROD_ID) references ProductDetails(PROD_ID));
create table Rating(RAT_ID int primary key, CUS_ID int, SUPP_ID int, RAT_RATSTARS int, foreign key(CUS_ID) references Customer(CUS_ID), foreign key(SUPP_ID) references Supplier(SUPP_ID));
