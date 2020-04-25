select Name as artistName --* gives all the columns from the data. Can rename column using 'as' keyword called aliasing
from Artist --set of data talking about
--where Name in (
--'AC/DC',
--'Marcos Valle',
--'Os Mutantes',
--'Olodum'
--)
--and ArtistId > 100 --chaining two things to filter
-- where ArtistId in (1,24,57,112) --'in' operator gives back all the things that matches parentheses
-- where Name like '%m%' --looks for Name that contains the letter m no matter the position with % symbol on either side
-- where Name like '%m' --looks for a string that ends with m and starts with %m, which symbolizes any number of characters before it
-- where Name like 'A%' --looks for a string that starts with A and % symbolizes any number of characters after it
-- where ArtistId >= 100 --filter where ArtistId greater than or equal to 100


-- combine album and artist id based on relationship of artist id on artist table and artist id from album table
-- inner join
-- artists that have matching albums
select Artist.Name as ArtistName, Album.Title as AlbumName
from Artist
	join Album --implicitly inner join
		on Artist.ArtistId = Album.ArtistId

-- left outer join
-- all artists and any matching album
select Artist.Name as ArtistName, Album.Title as AlbumName
from Artist
	left join Album 
		on Artist.ArtistId = Album.ArtistId

-- right outer join
-- all albums and any matching artist
select Artist.Name as ArtistName, Album.Title as AlbumName
from Artist
	right join Album 
		on Artist.ArtistId = Album.ArtistId
where Album.Title is null -- will give all artists that have null as album title


-- all albums with an artist that starts with 'a'
select Album.* --give all columns from album table
from Album
	join Artist
		on Album.ArtistId = Artist.ArtistId
where Artist.Name like 'A%'
--union all --combines 2 result sets. Both results need to have same columns. Automatically remove duplicates, but if want to see duplicates need keyword 'all'
--except -- give everything that isn't the same. Only those from the first set that don't appear in the second set
-- all albums that have tracks thats start with 'b'
-- distinct only gives unique results and not duplicate
select distinct Album.*
from Album
	join Track
		on Track.AlbumId = Album.AlbumId
where Track.Name like 'b%'
order by Album.Title desc -- orders by ascending as default. Need 'desc' keyword for descending


select ArtistId, count(*) as AlbumCount -- counts results and collapsed to just one thing
from Album 
where ArtistId in (select ArtistId from Artist where Name like 'a%') -- sub query 
group by ArtistId -- add grouping for particular things



select artist.ArtistId, Artist.Name, count(*) --to select, have to be in aggregate function or in group by column
from Album
	join Artist
		on Album.ArtistId = Artist.ArtistId
where Artist.Name like 'A%'
group by artist.ArtistId, Artist.Name



select invoiceid, sum(unitprice * quantity)
from InvoiceLine
group by InvoiceId