update Customer set Region='British Isles' where Country='UK';
update Customer set Region='British Isles' where Country='Ireland';
update Customer set Region='North America' where Country='USA';
update Customer set Region='North America' where Country='Canada';
update Customer set Region='Central America' where Country='Mexico';
update Customer set Region='South America' where Country='Argentina';
update Customer set Region='South America' where Country='Brazil';
update Customer set Region='South America' where Country='Venezuela';
update Customer set Region='Eastern Europe' where Country='Poland';
update Customer set Region='Northern Europe' where Country='Sweden';
update Customer set Region='Northern Europe' where Country='Denmark';
update Customer set Region='Southern Europe' where Country='Spain';
update Customer set Region='Southern Europe' where Country='Italy';
update Customer set Region='Southern Europe' where Country='Portugal';
update Customer set Region='Western Europe' where Country='Germany';
update Customer set Region='Western Europe' where Country='France';
update Customer set Region='Western Europe' where Country='Belgium';
update Customer set Region='Western Europe' where Country='Switzerland';
update Customer set Region='Western Europe' where Country='Austria';
update Customer set Region='Scandinavia' where Country='Norway';
update Customer set Region='Scandinavia' where Country='Finland';

update Employee set Region='British Isles' where Country='UK';
update Employee set Region='North America' where Country='USA';
update [Employee] set BirthDate = date(BirthDate,'+16 year');
update [Employee] set HireDate = date(HireDate,'+16 year');

update [Order] set ShipRegion='British Isles' where ShipCountry='UK';
update [Order] set ShipRegion='British Isles' where ShipCountry='Ireland';
update [Order] set ShipRegion='North America' where ShipCountry='USA';
update [Order] set ShipRegion='North America' where ShipCountry='Canada';
update [Order] set ShipRegion='Central America' where ShipCountry='Mexico';
update [Order] set ShipRegion='South America' where ShipCountry='Argentina';
update [Order] set ShipRegion='South America' where ShipCountry='Brazil';
update [Order] set ShipRegion='South America' where ShipCountry='Venezuela';
update [Order] set ShipRegion='Eastern Europe' where ShipCountry='Poland';
update [Order] set ShipRegion='Northern Europe' where ShipCountry='Sweden';
update [Order] set ShipRegion='Northern Europe' where ShipCountry='Denmark';
update [Order] set ShipRegion='Southern Europe' where ShipCountry='Spain';
update [Order] set ShipRegion='Southern Europe' where ShipCountry='Italy';
update [Order] set ShipRegion='Southern Europe' where ShipCountry='Portugal';
update [Order] set ShipRegion='Western Europe' where ShipCountry='Germany';
update [Order] set ShipRegion='Western Europe' where ShipCountry='France';
update [Order] set ShipRegion='Western Europe' where ShipCountry='Belgium';
update [Order] set ShipRegion='Western Europe' where ShipCountry='Switzerland';
update [Order] set ShipRegion='Western Europe' where ShipCountry='Austria';
update [Order] set ShipRegion='Scandinavia' where ShipCountry='Norway';
update [Order] set ShipRegion='Scandinavia' where ShipCountry='Finland';

update [Order] set OrderDate = date(OrderDate,'+16 year');
update [Order] set RequiredDate = date(RequiredDate,'+16 year');
update [Order] set ShippedDate = date(ShippedDate,'+16 year');

update [Supplier] set Region='British Isles' where Country='UK';
update [Supplier] set Region='British Isles' where Country='Ireland';
update [Supplier] set Region='North America' where Country='USA';
update [Supplier] set Region='North America' where Country='Canada';
update [Supplier] set Region='Central America' where Country='Mexico';
update [Supplier] set Region='South America' where Country='Argentina';
update [Supplier] set Region='South America' where Country='Brazil';
update [Supplier] set Region='South America' where Country='Venezuela';
update [Supplier] set Region='Eastern Europe' where Country='Poland';
update [Supplier] set Region='Northern Europe' where Country='Sweden';
update [Supplier] set Region='Northern Europe' where Country='Denmark';
update [Supplier] set Region='Southern Europe' where Country='Spain';
update [Supplier] set Region='Southern Europe' where Country='Italy';
update [Supplier] set Region='Southern Europe' where Country='Portugal';
update [Supplier] set Region='Western Europe' where Country='Germany';
update [Supplier] set Region='Western Europe' where Country='France';
update [Supplier] set Region='Western Europe' where Country='Belgium';
update [Supplier] set Region='Western Europe' where Country='Switzerland';
update [Supplier] set Region='Western Europe' where Country='Austria';
update [Supplier] set Region='Scandinavia' where Country='Norway';
update [Supplier] set Region='Scandinavia' where Country='Finland';
update [Supplier] set Region='Eastern Asia' where Country='Japan';
update [Supplier] set Region='South-East Asia' where Country='Singapore';
update [Supplier] set Region='Northern Europe' where Country='Netherlands';


create view [ProductDetails_V] as
select 
p.*, 
c.CategoryName, c.Description as [CategoryDescription],
s.CompanyName as [SupplierName], s.Region as [SupplierRegion]
from [Product] p
join [Category] c on p.CategoryId = c.id
join [Supplier] s on s.id = p.SupplierId;

