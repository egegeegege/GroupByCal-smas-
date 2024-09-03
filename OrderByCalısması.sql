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

-- GROUP BY
-- Aggregate functionlar dışında select yapılan sütun yada sütunlar var ise burada gelecek 
-- satırlardan birden fazla olacağından dolayı tekrarlı sütunu gruplamamız gerekir.
select EmployeeID,count(OrderID) as 'Çalışan bazında toplam sipariş' 
from Orders group by EmployeeID

-- Hangi kategoride kaç adet ürün vardır.

select CategoryID, count(ProductID) from Products group by CategoryID

-- her personelin almış olduğu siparişlerin toplam kargo maliyeti
select EmployeeID, sum(Freight) from Orders group by EmployeeID
order by sum(Freight)

select EmployeeID, sum(Freight) from Orders group by EmployeeID
order by 1

select EmployeeID, sum(Freight) from Orders group by EmployeeID
order by 2

select EmployeeID, sum(Freight) as 'Kargo Maliyeti' from Orders group by EmployeeID
order by 'Kargo Maliyeti'

-- her bir siparişin maliyetini OrderID ye göre gruplayın.
select OrderID, sum(UnitPrice*Quantity) from [Order Details] group by OrderID

-- her bir siparite kaç kalem sipariş verilmiştir OrderID ye göre gruplayın.
select OrderID, count(OrderID) from [Order Details] group by OrderID
order by 2
-- sağlaması
select * from [Order Details] where OrderID in (11077)

-- Çalışanların kaç adet sipariş aldıklarını bulunuz fakat bunlardan 100 üstü sipariş alanları listeyiniz.

select EmployeeID,count(OrderID) from Orders group by EmployeeID
where count(OrderID) > 100 -- Hata verir.

-- NOT: eğer bir sorguda aggregate function ile ilgili bir koşul durumu var ise bu durumda
-- where kullanılamaz !! bunun yerine having keywordü kullanılır.
select EmployeeID,count(OrderID) from Orders group by EmployeeID
having count(OrderID) > 100 

-- sipariş detaylarında tüm siparişlerin toplam UnitPrice ı 100 den büyük ise göster.
select sum(UnitPrice) from [Order Details] having sum(UnitPrice) >100






-- Ödev 

-- Kategori bazında her kategoride olan ürünlerin stoklarını yazınız.
SELECT CategoryID, SUM([Order Details].Quantity) FROM Products, [Order Details] WHERE Products.ProductID = [Order Details].ProductID GROUP BY Products.CategoryID;
select * from [Order Details]

-- ürün bazında tekrarlanan sipariş sayısının ortalamasını bulunuz.
select ProductID, sum(UnitPrice*Quantity) from [Order Details] group by ProductID
SELECT ProductID, COUNT(*) AS SiparişSayısı FROM [Order Details] GROUP BY ProductID;


-- ürün bazında quantity olarak en fazla sipariş verilen ürünün adını bulunuz.
select * from Products 
where ProductID in (select top(1) ProductID from [Order Details] order by Quantity desc)