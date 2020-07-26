-- author : Imam 25072020
-- UniqueUserId, Email, FirstPurchaseDate, FirstPurchasedPackageName
-- Find first purchase data of each user
select a.UniqueUserId, b.Email, min(CompletedOrderTransactionDate) FirstPurchaseDate, c.PackageName as FirstPurchasedPackageName
from transaction a
INNER JOIN user_data b on a.UniqueUserId = b.UniqueId
INNER JOIN packages c on a.UniquePackageId = c.PackageId
where CompletedOrderTransactionDate IS NOT NULL 
group by UniqueUserId

/*
INNER JOIN (SELECT UniqueUserId, min(CompletedOrderTransactionDate) FirstPurchaseDate from transaction group by UniqueUserId) b
on a.UniqueUserId = b.UniqueUserId and a.CompletedOrderTransactionDate = b.FirstPurchaseDate*/