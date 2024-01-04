use SQL_ASSIGNMENT_3

SELECT * FROM Jomato


--1. Create a stored procedure to display the restaurant name, type and cuisine where the table booking is not zero.
	
	create procedure more_than_zero
	as begin
	select restaurantname from Jomato where tablebooking > 0
	end


	execute more_than_zero

--2. Create a transaction and update the cuisine type ‘Cafe’ to ‘Cafeteria’. Check the result and rollback it.
	
	begin transaction
	update jomato set CuisinesType = 'Cafeteria' where CuisinesType = 'Cafe'

	select * from Jomato 

	rollback


--3. Generate a row number column and find the top 5 areas with the highest rating of restaurants.

	select distinct top 5 row_number() over(order by rating desc) as 'Row Number' , area , Rating from jomato


--4. Use the while loop to display the 1 to 50.
	
	declare @counter int
	set @counter = 1

	while @counter <= 50
	begin
		print @counter
		set @counter = @counter + 1
	end
  

	



--5. Write a query to Create a Top rating view to store the generated top 5 highest rating of restaurants.
	
	
	create view [TOP RATING] as
	select top 5 * from jomato 
	order by Rating desc

	selecT * FROM [TOP RATING]


--6. Write a trigger that sends an email notification to the restaurant owner whenever a new record is inserted.		CREATE TRIGGER TRG_NEW_INSERTED 
	ON JOMATO 
	AFTER INSERT  
	AS  
	EXEC msdb.dbo.sp_send_dbmail
		@profile_name = 'OWNER',  
		@recipients = 'OWNER@GMAIL.com',  
		@body = 'NEW RECORD INSERTED',  
		@subject = 'REMINDER';