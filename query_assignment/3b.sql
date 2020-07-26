-- author : Imam 25072020
-- UniqueTransactionId, UniqueUserId, Email, Name, PackageName, TotalPrice, CompletedOrderTransactionDate
-- -	Find list of users who bought subscription packages

select a.UniqueTransactionId, a.UniqueUserId, c.Email, b.Name, 
d.PackageName, d.TotalPrice,
IFNULL(a.CompletedOrderTransactionDate ,'Not Complete') as CompletedOrderTransactionDate
from transaction a
inner join user_profile b on b.UniqueId = a.UniqueUserId
inner join user_data c on c.UniqueId = a.UniqueUserId
inner join packages d on d.PackageId = a.UniquePackageId
where 
TransactionPlaceStatus != 'Pending'
-- and d.TotalPrice > 0;



