from datetime import timedelta, datetime
from random import randint
from random import choice as rc
import sqlite3


# This function will return a random datetime between two datetime objects.
def random_date(start, end):
  return start + timedelta(seconds=randint(0, int((end - start).total_seconds())))

# Connect to the DB
conn = sqlite3.connect('Northwind.sqlite')
c = conn.cursor()

# ShipName, ShipAddress, ShipCity, ShipRegion, ShipPostalCode
c.execute("select distinct ShipName, ShipAddress, ShipCity, ShipRegion, ShipPostalCode, ShipCountry from [Order]")
locations = [(row[0], row[1], row[2], row[3], row[4], row[5]) for row in c.fetchall()]

# Customer.Id
c.execute("select distinct id from [Employee]")
employees = [row[0] for row in c.fetchall()]

# Shipper.Id
c.execute("select distinct id from [Shipper]")
shippers = [row[0] for row in c.fetchall()]

# Customer.Id
c.execute("select distinct id from [Customer]")
customers = [row[0] for row in c.fetchall()]

# Create a bunch of new orders
for i in range(randint(15000,16000)):
  sql = 'INSERT INTO [Order] (CustomerId, EmployeeId, OrderDate, RequiredDate, ShippedDate, ShipVia, Freight, ShipName, ShipAddress, ShipCity, ShipRegion, ShipPostalCode, ShipCountry) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)'
  location = rc(locations)
  order_date = random_date(datetime.strptime('2012-07-10', '%Y-%m-%d'), datetime.today())
  required_date = random_date(order_date, order_date+timedelta(days=randint(14,60)))
  shipped_date = random_date(order_date, order_date+timedelta(days=randint(1,30)))
  params = (
    rc(customers),  # CustomerId
    rc(employees),  # EmployeeId
    order_date,     # OrderDate
    required_date,  # RequiredDate
    shipped_date,   # ShippedDate
    rc(shippers),   # ShipVia
    0.00,           # Freight
    location[0],    # ShipName
    location[1],    # ShipAddress
    location[2],    # ShipCity
    location[3],    # ShipRegion
    location[4],    # ShipPostalCode
    location[5],    # ShipCountry
  )
  c.execute(sql,params)


# Product.Id
c.execute("select distinct id, UnitPrice from [Product]")
products = [(row[0], row[1]) for row in c.fetchall()]

# Order.Id
c.execute("select distinct id from [Order] where Freight = 0.00")
orders = [row[0] for row in c.fetchall()]

# Fill the order with items
for order in orders:
  used = []
  for x in range(randint(1,len(products))):
    sql = 'INSERT INTO [OrderDetail] (Id, OrderId, ProductId, UnitPrice, Quantity, Discount) VALUES (?, ?, ?, ?, ?, ?)'
    control = 1
    while control:
      product = rc(products)
      if product not in used:
        used.append(product)
        control = 0
    params = (
      "%s/%s" % (order, product[0]),
      order,          # OrderId
      product[0],     # ProductId
      product[1],     # UnitPrice
      randint(1,50),  # Quantity
      0,              # Discount
    )
    c.execute(sql,params)

# Cleanup
# c.execute('update [Order] set OrderDate = date(OrderDate), RequiredDate = date(RequiredDate), ShippedDate = date(ShippedDate)')
c.execute("select sum(Quantity)*0.25+10, OrderId from [OrderDetail] group by OrderId")
orders = [(row[0],row[1]) for row in c.fetchall()]
for order in orders:
  c.execute("update [Order] set Freight=? where Id=?", (order[0], order[1]))


conn.commit()
conn.close()