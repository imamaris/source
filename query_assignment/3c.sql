-- author : Imam 25072020
-- SchoolYear, TotalRevenue
-- Find total revenue for subscription packages based on their class

SELECT (CASE
WHEN SchoolYear in('XI IPA', 'XI IPS','XIIPA','XI SMK') then 'XI'
WHEN SchoolYear in('X IPA', 'X IPS','X SMK') then 'X' 
WHEN SchoolYear in('XII','XII IPA', 'XII IPS','XII SMK') then 'XII' 
end)SchoolYear, sum(TotalPrice) TotalRevenue
from user_profile a
inner join transaction b on b.UniqueUserId = a.UniqueId
inner join packages c on c.PackageId = b.UniquePackageId
where TransactionPlaceStatus !='pending' and SchoolYear not in ('Default', 'GAP YEAR','GURU SD','I')
GROUP BY (CASE
WHEN SchoolYear in('XI IPA', 'XI IPS','XIIPA','XI SMK') then 'XI'
WHEN SchoolYear in('X IPA', 'X IPS','X SMK') then 'X' 
WHEN SchoolYear in('XII','XII IPA', 'XII IPS','XII SMK') then 'XII' 
end)


/* 
Another query with output get majors class

select b.SchoolYear, Sum(TotalPrice) as TotalRevenue
from transaction a
inner join user_profile b on b.UniqueId = a.UniqueUserId
inner join user_data c on c.UniqueId = a.UniqueUserId
inner join packages d on d.PackageId = a.UniquePackageId
where TransactionPlaceStatus !='pending' and (SchoolYear like '%X%') 
and CompletedOrderTransactionDate IS NOT NULL
group by SchoolYear 

Output :
SchoolYear	Total Revenue
X IPA	19305000
XI IPA	4155000
XI SMK	260000
XII IPA	2010000
XII IPS	940000
XIIPA	1300000
*/
