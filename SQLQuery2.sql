--declare @firstName varchar(255) = 'Sal'
--declare @lastName varchar(255) = 'Goodluck'
--declare @incarcerationDate datetime = getdate()
--declare @id int = 102


--insert into Clinker (ID, IncarcerationDate, FirstName) -- adding data to these 3 columns
--values (@id, @incarcerationDate, @firstName, @lastName) -- these are the values that will go in the specified columns above. Order matters as the position correlates to the insert statement above

--insert into Interest([name], [Description])
--values ('Knitting', 'a cool hobby for people on death row') -- can't set values of id because ID is set as an Identity and it automatically sets for you in the way we wrote it

select FirstName + ' ' + isnull(LastName, '') as FullName, FirstName, LastName -- can use * to get all data if don't want to specify columns. Use 'as' keyword to label data called alisaing. isNull means if value is null, then will return value after comma; otherwise return name
from Clinker
where id >= 100 -- where used to filter. Similar to LINQ. Filter data to smaller subset


select *
from clinker
where LastName is null -- will give lastnames that is null, cannot use '=' for equality


--select *
--from Interest

alter table Clinker add InterestId int -- change Clinker table and add column InterestId
alter table Clinker
add foreign key (InterestId) references Interest(ID) -- tells sql that InterestId from Clinker table references to column ID in Interest table. Created relationship between 2 tables


-- take data from one table and join with data on another table
select *
from Clinker
	join Interest
		on Clinker.InterestId = Interest.ID