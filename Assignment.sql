create database edyodadb;
use edyodadb;

--- table1: SalesPeople
create table SalesPeople(
Snum int not null,
Sname varchar(255) not null,
City varchar(255) not null,
Comm decimal(3,2),
primary key(Snum),
unique(Sname)
);

insert into SalesPeople values(1001,'Peel','London',.12);
insert into SalesPeople values
(1002,'Serres','Sanjose',.13),
(1004,'Motika','London',.11),
(1007,'Rifkin','Barcelona',.15),
(1003,'Axelrod','Newyork',.10);


-- table2: Customers
create table Customers(
Cnum int not null,
Cname varchar(255) not null,
City varchar(255) not null,
Snum int not null,
primary key(Cnum),
foreign key(Snum) references SalesPeople(Snum)
);

insert into Customers values
(2001,'Hoffman','London',1001),
(2002,'Giovanni','Rome',1003),
(2003,'Liu','Sanjose',1002),
(2004,'Grass','Berlin',1002),
(2006,'Clemens','London',1001),
(2008,'Cisneros','Sanjose',1007),
(2007,'Pereira','Rome',1004);


-- table3: Orders
create table Orders(
Onum int not null,
Amt decimal(10,2) not null,
Odate date not null,
Cnum int not null,
Snum int not null,
primary key(Onum),
foreign key(Cnum) references Customers(Cnum),
foreign key(Snum) references SalesPeople(Snum)
);

insert into Orders values
(3001,18.69,'1990-10-03',2008,1007),
(3003,767.19,'1990-10-03',2001,1001),
(3002,1900.10,'1990-10-03',2007,1004),
(3005,5160.45,'1990-10-03',2003,1002),
(3006,1098.16,'1990-10-03',2008,1007),
(3009,1713.23,'1990-10-04',2002,1003),
(3007,75.75,'1990-10-04',2004,1002),
(3008,4273.00,'1990-10-05',2006,1001),
(3010,1309.95,'1990-10-06',2004,1002),
(3011,9891.88,'1990-10-06',2006,1001);

-- Count the number of Salesperson whose name begin with ‘a’/’A’.
select count(Sname) as Count from SalesPeople where Sname like 'A%' or Sname like 'a%';

-- Display all the Salesperson whose all orders worth is more than Rs. 2000
select s.Sname, sum(o.Amt) from SalesPeople as s JOIN Orders as o on s.Snum=o.Snum group by s.Sname having sum(o.Amt)>2000;

-- Count the number of Salesperson belonging to Newyork.
select count(Sname) as SalesPerson_from_Newyork from SalesPeople where City='Newyork';
 
-- Display the number of Salespeople belonging to London and belonging to Paris.
select count(*) as SalesPerson_from_London from SalesPeople where City='London';
select count(*) as SalesPerson_from_Paris from SalesPeople where City='Paris';
-- for London or Paris
select count(*) as SalesPerson from SalesPeople where City='London' or City='Paris';

-- Display the number of orders taken by each Salesperson and their date of orders. 
select s.Sname as SalesPerson, o.Onum as OrderNumber, o.Odate as OrderDate from SalesPeople as s join Orders as o on s.Snum=o.Snum;
