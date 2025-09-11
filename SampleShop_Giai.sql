/*1. Hiển thị mã hàng, tên hàng, đơn vị tính, giá và tên nhà cung cấp của các mặt hàng có
giá nhỏ hơn hoặc bằng 20 hoặc lớn hơn 40.*/

select p.ProductId, p.ProductName, p.Unit, p.Price, s.SupplierName
from Products as p inner join Suppliers as s on p.SupplierId = s.SupplierId
where Price<=20 or Price>40

/*2. Nhà cung cấp có tên là Tokyo Traders có nhu cầu tặng quà cho những khách hàng đã
từng mua hàng của họ. Hãy giúp họ có được thông tin của những khách hàng này!*/

select distinct c.CustomerId, c.CustomerName, c.ContactName, c.Address, c.City, s.SupplierName
from Suppliers as s inner join Products as p on p.SupplierId = s.SupplierId
	inner join OrderDetails as od on p.ProductId = od.ProductId
	inner join Orders as o on od.OrderId = o.OrderId
	inner join Customers as c on o.CustomerId = c.CustomerId
where s.SupplierName = 'Tokyo Traders' and p.ProductId in (select ProductId from OrderDetails)

/*3. Hãy cho biết mã hàng, tên hàng, giá và tên loại hàng của những mặt hàng có giá từ 20
đến 40.*/
select ProductId, ProductName, Price, c.CategoryName
from Products as p inner join Categories as c on p.CategoryId = c.CategoryId
where p.Price>=20 and p.Price<=40

/* 4. Cho biết mã hàng, tên hàng, đơn vị tính và giá của những mặt hàng được cung cấp bởi các nhà cung cấp ở USA, Germany, France và Italy. */
select ProductId, ProductName, Unit, Price
from Products as p inner join Suppliers as s on p.SupplierId = s.SupplierId
where s.Country in ('USA', 'Germany', 'France', 'Italy')


/* 5. Hiển thị mã hàng, tên hàng, đơn vị tính và giá của những mặt hàng được cung cấp bởi các nhà cung cấp có số điện thoại (Phone) thỏa một trong các điều kiện sau:
   - Số điện thoại bắt đầu bởi (100).
   - Số điện thoại bắt đầu bởi (03) và kết thúc bởi 1, 2 hoặc 5.
   - Số điện thoại bắt đầu bởi 0, 1, 2 hoặc 3.
   - Số điện thoại bắt đầu có dạng (xy), trong đó x là 0, 1, 2 hoặc 3 và y là một số bất kỳ.
*/
select ProductId, ProductName, Unit, Price, Phone
from Products as p inner join Suppliers as s on p.SupplierId = s.SupplierId  
where s.Phone like '(100)%'

select ProductId, ProductName, Unit, Price, Phone
from Products as p inner join Suppliers as s on p.SupplierId = s.SupplierId  
where s.Phone like '(03)%' and Right(s.Phone, 1) in ('1','2','5')

select ProductId, ProductName, Unit, Price, Phone
from Products as p inner join Suppliers as s on p.SupplierId = s.SupplierId  
where Left(s.Phone, 1) in ('0','1','2','3')

select ProductId, ProductName, Unit, Price, Phone
from Products as p inner join Suppliers as s on p.SupplierId = s.SupplierId  
where s.Phone like '(__)%' and substring(s.Phone,2,1) in ('0','1','2','3')

/* 6. Hiển thị mã hàng, tên hàng và đơn vị tính của những mặt hàng được bán trong tháng 7 năm 2017. */
select p.ProductId, ProductName, Unit, OrderDate
from Products as p inner join OrderDetails as od on p.ProductId = od.ProductId
inner join Orders as o on od.OrderId = o.OrderId
where month(OrderDate) = 7 and year(OrderDate) = 2017

/* 7. Giả sử các đơn hàng của khách hàng ở Mỹ sẽ giao hàng sau 5 ngày đặt hàng, ở
Canada giao hàng sau 7 ngày, còn khách hàng ở các quốc gia khác thì giao hàng sau
10 ngày.
*/

/* 8. Cho biết mã đơn hàng, ngày đặt hàng, ngày giao hàng, tên và địa chỉ của khách hàng của các đơn hàng được đặt trong tháng 7 năm 2017. */
select p.ProductId, OrderDate,
case
when c.Country = 'USA' then Dateadd(day, 5, OrderDate)
when c.Country = 'Canada' then Dateadd(day, 7, OrderDate)
else Dateadd(day, 2, OrderDate)
end as 'DeliveryDate',c.ContactName, c.Address
from Products as p inner join OrderDetails as od on p.ProductId = od.ProductId
inner join Orders as o on od.OrderId = o.OrderId
inner join Customers as c on o.CustomerId = c.CustomerId
where month(OrderDate) = 7 and year(OrderDate) = 2017  

/* 9. Thống kê xem mỗi một loại hàng có bao nhiêu mặt hàng. */

select c.CategoryId, c.CategoryName, count(p.ProductId) as 'Quantity'
from Categories as c left join Products as p on c.CategoryId = p.CategoryId
group by c.CategoryId, c.CategoryName

/* 10. Thống kê xem mỗi khách hàng đã đặt bao nhiêu đơn đặt hàng. */

select c.CustomerId, c.CustomerName, count(o.CustomerId) as 'QuantityOrder'
from Customers as c left join Orders as o on c.CustomerId = o.CustomerId
group by c.CustomerId, c.ContactName

/* 11. Thống kê số lượng đơn hàng mà mỗi shipper đã vận chuyển. */

select e.EmployeeId, e.LastName+' '+E.FirstName, count(o.EmployeeId) as 'Quantity'
from Employees as e left join Orders as o on e.EmployeeId = o.EmployeeId
group by e.EmployeeId, e.LastName+' '+E.FirstName


/* 12. Thống kê số lượng nhà cung cấp theo từng quốc gia. */

select s.Country, count(s.SupplierId) as 'Quantity'
from Suppliers as s
group by s.Country

/* 13. Thống kê số lượng khách hàng theo từng quốc gia. */

select c.Country, count(c.CustomerId) as 'Quantity'
from Customers as c
group by c.Country

/* 14. Thống kê tổng số lượng đơn hàng theo từng quốc gia của khách hàng. */

select c.Country, count(o.CustomerId)
from Customers as c left join Orders as o on c.CustomerId = o.CustomerId
group by c.Country

/* 15. Thống kê số lượng đơn hàng trong quý 4 năm 2017 của từng nhân viên. */

select e.EmployeeId, e.FirstName+' '+e.LastName, count(o.EmployeeId)
from Employees as e left join Orders as o on e.EmployeeId = o.EmployeeId
where month(o.OrderDate) in (10,11,12) and year(o.OrderDate) = 2017
group by  e.EmployeeId, e.FirstName+' '+e.LastName

/* 16. Trong khoảng thời gian từ tháng 6 đến tháng 12 năm 2017, mỗi shipper đã vận chuyển bao nhiêu đơn hàng. */
select s.ShipperId, s.ShipperName, count(o.ShipperId) as 'Quantity'
from Shippers as s left join Orders as o on s.ShipperId = o.ShipperId
where month(o.OrderDate)>=6 and month(o.OrderDate)<=12 and year(o.OrderDate) = 2017
group by s.ShipperId, s.ShipperName

/* 17. Thống kê số lượng đơn hàng trong năm 2017 của các khách hàng ở USA, UK, Germany và France. */

select c.Country, count(o.CustomerId) as 'Quantity'
from Customers as c left join Orders as o on c.CustomerId = o.CustomerId
where year(o.OrderDate) = 2017 and c.Country in ('USA','UK','Germany','France')
group by c.Country

/* 18. Hiển thị thông tin đơn hàng năm 2017, bao gồm: mã đơn hàng, ngày đặt hàng, thông tin nhân viên lập đơn, thông tin khách hàng, shipper và tổng số tiền (Quantity * SalePrice). */

select o.OrderId, o.OrderDate, e.EmployeeId, e.FirstName+' '+e.LastName, c.CustomerId, c.ContactName, s.ShipperId, s.ShipperName, od.Quantity*od.SalePrice as 'Total'
from Orders as o inner join Employees as e on o.EmployeeId = e.EmployeeId
	inner join Customers as c on o.CustomerId = c.CustomerId
	inner join Shippers as s on o.ShipperId = s.ShipperId
	inner join OrderDetails as od on o.OrderId = od.OrderId 

/* 19. Thống kê tổng số lượng bán và tổng doanh thu của mỗi mặt hàng trong năm 2017. */

select p.ProductId, p.ProductName, count(od.ProductId) as 'Quantity', sum(od.Quantity*od.SalePrice) as 'TotalRevenue'
from Products as p left join OrderDetails as od on p.ProductId = od.ProductId
	inner join Orders as o on od.OrderId = o.OrderId
where year(o.OrderDate) = 2017

/* 20. Thống kê số lượng nhà cung cấp và số lượng khách hàng theo từng quốc gia. */

select Country, sum(s_cnt), sum(c_cnt)
from 
	( select Country, count(SupplierId) as s_cnt, 0 as c_cnt
		from Suppliers
		group by Country
		union all
	  select Country, 0 as s_cnt, count(CustomerId) as c_cnt
		from Customers
		group by Country
	) as SC
group by Country

/* 21. Cho biết mã, ngày đặt hàng và thông tin khách hàng của các đơn hàng có tổng trị giá lớn hơn 1000$. */

select o.OrderId, o.OrderDate, c.CustomerId, c.ContactName, od.Quantity*od.SalePrice 
from Customers as c inner join Orders as o on c.CustomerId = o.CustomerId
	inner join OrderDetails as od on o.OrderId = od.OrderId
where od.Quantity*od.SalePrice>1000


/* 22. Những nhân viên nào có số lượng đơn hàng lập trong tháng 8 năm 2017 lớn hơn 5. */

select e.EmployeeId, e.FirstName+' '+e.LastName, count(o.EmployeeId)
from Employees as e inner join Orders as o on e.EmployeeId = o.EmployeeId
where month(o.OrderDate) = 8 and year(o.OrderDate) = 2017
group by e.EmployeeId, e.FirstName+' '+e.LastName
having count(o.EmployeeId)>5

/* 23. Cho biết mã đơn hàng, ngày đặt hàng, thông tin khách hàng, shipper, trị giá đơn hàng và mức phí vận chuyển (theo quốc gia của khách hàng):
      - USA & Canada: 3%
      - Argentina, Brazil, Mexico, Venezuela: 5%
      - Khác: 7%
*/

select o.OrderId, o.OrderDate, c.CustomerId, c.CustomerName, s.ShipperId, s.ShipperName, od.Quantity*od.SalePrice as 'TotalPrice',
	case 
		when c.Country in ('USA','Canada') then 0.03*Quantity*od.SalePrice
		when c.Country in ('Argentina','Brazil', 'Mexico', 'Venezuela') then 0.05*od.Quantity*od.SalePrice
		else 0.07*od.Quantity*od.SalePrice 
	end as 'S_fee'
from Orders as o inner join Shippers as s on o.ShipperId = s.ShipperId
	inner join Customers as c on c.CustomerId = o.CustomerId
	inner join OrderDetails as od on o.OrderId = od.OrderId 

/* 24. Thống kê tổng số tiền vận chuyển mà công ty phải trả cho mỗi shipper. */

select s.ShipperId, s.ShipperName,
	sum(case 
		when c.Country in ('USA','Canada') then 0.03*Quantity*od.SalePrice
		when c.Country in ('Argentina','Brazil', 'Mexico', 'Venezuela') then 0.05*od.Quantity*od.SalePrice
		else 0.07*od.Quantity*od.SalePrice 
	end) as 'Total_fee'
from Orders as o right join Shippers as s on o.ShipperId = s.ShipperId
	inner join Customers as c on c.CustomerId = o.CustomerId
	inner join OrderDetails as od on o.OrderId = od.OrderId 
group by  s.ShipperId, s.ShipperName

/* 25. Cho biết mã, tên, địa chỉ và số lượng mặt hàng của nhà cung cấp cung cấp nhiều mặt hàng nhất. */
select s.SupplierId, s.SupplierName, s.Address, count(p.SupplierId)
from Suppliers as s inner join Products as p on s.SupplierId = p.SupplierId
group by s.SupplierId, s.SupplierName, s.Address
having count(p.SupplierId) >= all (select count(p1.SupplierId) 
									from Suppliers as s1 inner join Products as p1 on s1.SupplierId = p1.SupplierId 
									group by s1.SupplierId)


/* 26. Trong năm 2017, những mặt hàng nào có tổng doanh thu cao nhất? Doanh thu là bao nhiêu? */

select p.ProductId,p.ProductName, sum(od.Quantity*od.SalePrice)
from Products as p inner join OrderDetails as od on p.ProductId = od.ProductId
	inner join Orders as o on od.OrderId = o.OrderId
where year(o.OrderDate) = 2017
group by p.ProductId,p.ProductName
having sum(od.Quantity*od.SalePrice) >= all(select sum(od1.Quantity*od1.SalePrice)
											from Products as p1 inner join OrderDetails as od1 on p1.ProductId = od1.ProductId 
											inner join Orders as o1 on od1.OrderId = o1.OrderId
											where year(o1.OrderDate) = 2017
											group by p1.ProductId)

/* 27. Trong năm 2018, những nhân viên nào đem lại doanh thu cao nhất cho công ty? Doanh thu là bao nhiêu? */
select e.EmployeeId, e.FirstName+' '+e.LastName as 'FullName', sum(od.Quantity*od.SalePrice)
from Employees as e inner join Orders as o on o.EmployeeId = e.EmployeeId 
	inner join OrderDetails as od on o.OrderId = od.OrderId 
where year(o.OrderDate) = 2018
group by e.EmployeeId, e.FirstName+' '+e.LastName
having sum(od.Quantity*od.SalePrice) >= all(select sum(od1.Quantity*od1.SalePrice)
											from Employees as e1 inner join Orders as o1 on o1.EmployeeId = e1.EmployeeId 
												inner join OrderDetails as od1 on o1.OrderId = od1.OrderId 
											where year(o1.OrderDate) = 2018
											group by e1.EmployeeId)


/* 28. Bảng thống kê doanh thu của mỗi mặt hàng trong năm 2017, kết quả gồm các cột: ProductId, Name, Jan, Feb, ..., Dec */

select p.ProductId, p.ProductName, 
	sum(case when month(o.OrderDate) = 1 then od.Quantity*od.SalePrice
		 else 0
	end) as 'Jan', 
	sum(case when month(o.OrderDate) = 2 then od.Quantity*od.SalePrice
		 else 0
	end) as 'Feb',
	sum(case when month(o.OrderDate) = 3 then od.Quantity*od.SalePrice
		 else 0
	end) as 'Mar',
	sum(case when month(o.OrderDate) = 4 then od.Quantity*od.SalePrice
		 else 0
	end) as 'Apr',
	sum(case when month(o.OrderDate) = 5 then od.Quantity*od.SalePrice
		 else 0
	end) as 'May',
	sum(case when month(o.OrderDate) = 6 then od.Quantity*od.SalePrice
		 else 0
	end) as 'Jun',
	sum(case when month(o.OrderDate) = 7 then od.Quantity*od.SalePrice
		 else 0
	end) as 'Jul',
	sum(case when month(o.OrderDate) = 8 then od.Quantity*od.SalePrice
		 else 0
	end) as 'Aug',
	sum(case when month(o.OrderDate) = 9 then od.Quantity*od.SalePrice
		 else 0
	end) as 'Sep',
	sum(case when month(o.OrderDate) = 10 then od.Quantity*od.SalePrice
		 else 0
	end) as 'Oct',
	sum(case when month(o.OrderDate) = 11 then od.Quantity*od.SalePrice
		 else 0
	end) as 'Nov',
	sum(case when month(o.OrderDate) = 12 then od.Quantity*od.SalePrice
		 else 0
	end) as 'Dec'  
from Products as p inner join OrderDetails as od on p.ProductId = od.ProductId
	inner join Orders as o on od.OrderId = o.OrderId 
where year(o.OrderDate) = 2017
group by p.ProductId, p.ProductName

/* 29. Với mỗi đơn hàng, hiển thị: mã đơn hàng, ngày đặt hàng, thông tin khách hàng, tổng trị giá đơn hàng, tổng tiền đã thanh toán và số tiền còn nợ. */

select o.OrderId, o.OrderDate, c.CustomerId, c.CustomerName, od.Quantity*od.SalePrice, sum(i.PaymentAmount) as 'TotalPA',  od.Quantity*od.SalePrice-sum(i.PaymentAmount) as 'Unpaid'
from OrderDetails as od inner join Orders as o on od.OrderId = o.OrderId 
	inner join Customers as c on o.CustomerId = c.CustomerId
	left join Invoices as i on o.OrderId = i.OrderId
group by  o.OrderId, o.OrderDate, c.CustomerId, c.CustomerName, od.Quantity*od.SalePrice

/* 30. Thống kê doanh thu mỗi tháng trong năm 2018 và mức biến động so với tháng trước (tăng/giảm). */

select distinct month(o.OrderDate) as 'Month',  sum(od.Quantity*od.SalePrice) as 'Revenue', 
	case 
		when month(o.OrderDate) = 1 then NULL
		else sum(
from Orders as o inner join OrderDetails as od on o.OrderId = od.OrderId
where year(o.OrderDate) = 2018
group by month(o.OrderDate)
