create database ExerciseeDB
on primary (name='Exercise_Db', Filename='D:\mphasis Simplilearn\Phase2\Day4\Exercise_Db.mdf')
log on (name='Exercise_Db_log',filename='D:\mphasis Simplilearn\Phase2\Day4\Exercise_Db_log.ldf')
COLLATE SQL_Latin1_General_CP1_CI_AS

use ExerciseeDB
create table Product
(PId int identity(1000,1)primary key,
Pname nvarchar (50) not null,
PPrice float,
PTax as PPrice * 0.10 persisted,
PCompany nvarchar(50) check(PCompany='Samsung' or PCompany='Apple' or PCompany='Redmi' or PCompany='Htc'),
Pty int default 1 check(pty>=1))
insert into Product values ('Tv',20000,'Samsung',2)
insert into Product values ('Mobile',20000,'Apple',3)
insert into Product values ('Bluetooh',200,'Redmi',DEFAULT)
insert into Product values ('Speaker',2000,'Samsung',4)
insert into Product values ('MobilePhone',2000,'Htc',5)

select * from Product
alter proc usp_Productsassesment
as
select PId,Pname,PPrice+PTax as 'Total price including tax',PTax,PCompany,Pty from Product 

exec usp_Productsassesment 