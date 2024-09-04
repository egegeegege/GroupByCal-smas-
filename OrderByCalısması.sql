use Northwind
/*
Michael Suyama adlı çalışanın götürdüğü tüm 
Siparişlerin Şirket adı 
Çalışan Adı Ürün posta kodu ve 
Ürünün adresi olarak listeleyin
*/

select e.FirstName AS 'Kuruye Adı',e.LastName AS 'Kuruye Soyadı',c.CompanyName AS 'Sipariş veren şirketin adı',
o.ShipPostalCode AS 'Ürün posta kodu',o.ShipAddress AS 'Ürünün adresi'from Orders o 
join Employees e on o.EmployeeID = e.EmployeeID
join Customers c on o.CustomerID = c.CustomerID
where e.FirstName ='Michael' and e.LastName ='Suyama'

select ShipName as'ships'from Orders 
GROUP BY ShipName 

-- categorysi baverages olan ürünlerin fiyatlarını büyükten küçüğe doðru sıralayıp getirin.
select * from Products 
where CategoryID in (select CategoryID from Categories where CategoryName = 'Beverages')
order by UnitPrice desc

-- sipariþ detaylarında Quantity si 30 dan büyük olan sipariþlerin Unit pricelarını 
-- küçükten büyüge doðru sıralayıp getirin.

select * from [Order Details] where Quantity > 30
order by UnitPrice

select EmployeeID,count(OrderID) as 'Çalışan bazında toplam sipariş' 
from Orders group by EmployeeID

select OrderID, sum(UnitPrice*Quantity) from [Order Details] group by OrderID 

--ID si 1 olan Kategoriden toplam stoda kaç adet ürün bulunmaktadır
	select CategoryID,sum(UnitsInStock) AS 'Stokta toplam ürün sayısı'
	from Products group by CategoryID

-- Çalışan bazında toplam sipariş
	select EmployeeID,COUNT(OrderID) AS 'Çalışan bazında toplam sipariş'
	from Orders group by EmployeeID 

	-- Hangi kategoride toplam nekadarlık ürün var
	select CategoryID,sum(UnitPrice) from Products group by CategoryID