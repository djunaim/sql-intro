-- when making variable, need 'declare', @ symbol in front of variable name, and type of variable
--declare @firstName char(50) = 'Mo'

-- varchar is variable of characters. Can be up to 50 characters inside of it. Not wasting storage if have extra characters leftover. 
-- Can hold up to 8000 or if put 'max' as parameter, it's 2 gb of text
--declare @firstName varchar(50) = 'Mo'
---- nvarchar will store emojis and utf-8. Max of 4000 characters b/c symbols use more memory and will use 2 spaces instead of 1
---- nvarchar(max) is still 2gb of text
--declare @lastName nvarchar(50) = 'Mo'
---- similar to console.writeline
--print @firstName
---- sets results and build up data sets
--select @firstName

--declare @myAge int = 29
--declare @isCool bit = 1
---- can hold letters and numbers
--declare @uniqueID uniqueidentifier = newid()
---- can specify how much precision in parameter
--declare @bankBalance decimal = 1.00
--declare @birthDate datetime = '1990-2-24'

--print getDate() --gets current date

create table Clinker (
	ID int not null,
	[Name] varchar(255) not null,
	IncarcerationDate datetime not null
)

truncate table Clinker

alter table Clinker add 
	LastName nvarchar(255) null, 
	FirstName nvarchar(255) not null

alter table Clinker drop column [Name]

-- identity allows id to be created automatically. It will start at 1 and increments by 1
create table Interest (
	ID int primary key identity(1,1) not null,
	[Name] nvarchar(255) not null,
	[Description] nvarchar(255) null
)
