-- author : Imam 25072020
-- 3a -	Find list of users that subscription is still active as of today
-- output Name, Email, Phone, Gender, SchoolYear, District, Diamond, SubscriptionEndDate

select a.UniqueId, a.name, b.Email, b.Phone, 
a.Gender, a.SchoolYear, a.District, c.CurrentDiamond as Diamond, 
DATE_FORMAT(c.SubscriptionEndDate, '%m-%d-%Y') as SubscriptionEndDate
from user_profile a
inner join user_data b on a.UniqueId = b.UniqueId
inner join user_status c on a.UniqueId = c.UniqueId
where SubscriptionEndDate >= DATE(NOW())
GROUP BY UniqueId
