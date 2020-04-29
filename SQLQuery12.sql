--temporary tables to store information if you see yourself writing the same queries over and over again
--need pound sign before name to signify temporary table
--if opened a new query, cannot access temp table because only lives in the tab it is on
--permanent tables can be accessed in other tabs
create table #tempTable (Name varchar(255), Birthday datetime)
create table permanentTable (Name varchar(255), Birthday datetime)

select Track.TrackId, sum(Quantity) as TimesPurchased --take top 5 results
into #trackSales --making temp table by putting results into temp table
from Track
	join InvoiceLine
		on Track.TrackId = InvoiceLine.TrackId
group by Track.TrackId
order by 2 desc --order by 2nd column

select * from #trackSales