update [Customers] set Region='British Isles' where Country='UK';
update [Customers] set Region='British Isles' where Country='Ireland';
update [Customers] set Region='North America' where Country='USA';
update [Customers] set Region='North America' where Country='Canada';
update [Customers] set Region='Central America' where Country='Mexico';
update [Customers] set Region='South America' where Country='Argentina';
update [Customers] set Region='South America' where Country='Brazil';
update [Customers] set Region='South America' where Country='Venezuela';
update [Customers] set Region='Eastern Europe' where Country='Poland';
update [Customers] set Region='Northern Europe' where Country='Sweden';
update [Customers] set Region='Northern Europe' where Country='Denmark';
update [Customers] set Region='Southern Europe' where Country='Spain';
update [Customers] set Region='Southern Europe' where Country='Italy';
update [Customers] set Region='Southern Europe' where Country='Portugal';
update [Customers] set Region='Western Europe' where Country='Germany';
update [Customers] set Region='Western Europe' where Country='France';
update [Customers] set Region='Western Europe' where Country='Belgium';
update [Customers] set Region='Western Europe' where Country='Switzerland';
update [Customers] set Region='Western Europe' where Country='Austria';
update [Customers] set Region='Scandinavia' where Country='Norway';
update [Customers] set Region='Scandinavia' where Country='Finland';

update [Employees] set Region='British Isles' where Country='UK';
update [Employees] set Region='North America' where Country='USA';
update [Employees] set BirthDate = date(BirthDate,'+16 year');
update [Employees] set HireDate = date(HireDate,'+16 year');

update [Orders] set ShipRegion='British Isles' where ShipCountry='UK';
update [Orders] set ShipRegion='British Isles' where ShipCountry='Ireland';
update [Orders] set ShipRegion='North America' where ShipCountry='USA';
update [Orders] set ShipRegion='North America' where ShipCountry='Canada';
update [Orders] set ShipRegion='Central America' where ShipCountry='Mexico';
update [Orders] set ShipRegion='South America' where ShipCountry='Argentina';
update [Orders] set ShipRegion='South America' where ShipCountry='Brazil';
update [Orders] set ShipRegion='South America' where ShipCountry='Venezuela';
update [Orders] set ShipRegion='Eastern Europe' where ShipCountry='Poland';
update [Orders] set ShipRegion='Northern Europe' where ShipCountry='Sweden';
update [Orders] set ShipRegion='Northern Europe' where ShipCountry='Denmark';
update [Orders] set ShipRegion='Southern Europe' where ShipCountry='Spain';
update [Orders] set ShipRegion='Southern Europe' where ShipCountry='Italy';
update [Orders] set ShipRegion='Southern Europe' where ShipCountry='Portugal';
update [Orders] set ShipRegion='Western Europe' where ShipCountry='Germany';
update [Orders] set ShipRegion='Western Europe' where ShipCountry='France';
update [Orders] set ShipRegion='Western Europe' where ShipCountry='Belgium';
update [Orders] set ShipRegion='Western Europe' where ShipCountry='Switzerland';
update [Orders] set ShipRegion='Western Europe' where ShipCountry='Austria';
update [Orders] set ShipRegion='Scandinavia' where ShipCountry='Norway';
update [Orders] set ShipRegion='Scandinavia' where ShipCountry='Finland';

update [Orders] set OrderDate = date(OrderDate,'+16 year');
update [Orders] set RequiredDate = date(RequiredDate,'+16 year');
update [Orders] set ShippedDate = date(ShippedDate,'+16 year');

update [Suppliers] set Region='British Isles' where Country='UK';
update [Suppliers] set Region='British Isles' where Country='Ireland';
update [Suppliers] set Region='North America' where Country='USA';
update [Suppliers] set Region='North America' where Country='Canada';
update [Suppliers] set Region='Central America' where Country='Mexico';
update [Suppliers] set Region='South America' where Country='Argentina';
update [Suppliers] set Region='South America' where Country='Brazil';
update [Suppliers] set Region='South America' where Country='Venezuela';
update [Suppliers] set Region='Eastern Europe' where Country='Poland';
update [Suppliers] set Region='Northern Europe' where Country='Sweden';
update [Suppliers] set Region='Northern Europe' where Country='Denmark';
update [Suppliers] set Region='Southern Europe' where Country='Spain';
update [Suppliers] set Region='Southern Europe' where Country='Italy';
update [Suppliers] set Region='Southern Europe' where Country='Portugal';
update [Suppliers] set Region='Western Europe' where Country='Germany';
update [Suppliers] set Region='Western Europe' where Country='France';
update [Suppliers] set Region='Western Europe' where Country='Belgium';
update [Suppliers] set Region='Western Europe' where Country='Switzerland';
update [Suppliers] set Region='Western Europe' where Country='Austria';
update [Suppliers] set Region='Scandinavia' where Country='Norway';
update [Suppliers] set Region='Scandinavia' where Country='Finland';
update [Suppliers] set Region='Eastern Asia' where Country='Japan';
update [Suppliers] set Region='South-East Asia' where Country='Singapore';
update [Suppliers] set Region='Northern Europe' where Country='Netherlands';


create view [ProductDetails_V] as
select 
p.*, 
c.CategoryName, c.Description as [CategoryDescription],
s.CompanyName as [SupplierName], s.Region as [SupplierRegion]
from [Products] p
join [Categories] c on p.CategoryId = c.id
join [Suppliers] s on s.id = p.SupplierId;

