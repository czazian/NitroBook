-- Reset the auto increment field
--DBCC CHECKIDENT('<tablename>', RESEED, <startvalue>)

DBCC CHECKIDENT('Order', RESEED, 0)
DBCC CHECKIDENT('Payment', RESEED, 0)