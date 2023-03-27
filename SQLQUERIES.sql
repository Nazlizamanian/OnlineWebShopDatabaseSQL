--QUERIES 

--1. Calculates the total price of a product (product+ taxes)
SELECT productID, productName, price, taxes, price + (price *taxes) AS totalPrice
FROM Product; 

--2. Average price (taxes included) on all products.
SELECT AVG (price+ (price*taxes)) AS totalPrice
FROM Product; 

--3.Update Product Stock after an order has been made. 
UPDATE product
SET stock = stock - 1
WHERE productID = '4';


--4. DELETE an account. 
DELETE FROM Account
WHERE userID ='6'; 


--5. To check order status, ex if an order has been shipped.
SELECT [order].orderID, customer.ssn, [order].shippingStatus
FROM [order]
JOIN customer ON [order].customerID = customer.customerID
WHERE [order].shippingStatus = 'Shipped';


--6. To check if an account isAdmin or not (if true =1)
SELECT * FROM Account
WHERE isAdmin = 1


--7. To check all order that has been made from last month. 
SELECT * 
FROM [Order]
WHERE orderDate >= DATEADD(day, -30, GETDATE());


--8.How many admins are there?
SELECT COUNT(isAdmin) AS NumberOfAdmins
FROM Account
Where isAdmin = 1; 


--9. If a customer updates their address after an order has been placed, the shipping address is updated too.
SELECT O.orderID, c.ssn, A.street
FROM [Order] AS O
INNER JOIN OrderToCustomer AS OTC ON O.orderID = OTC.orderID
INNER JOIN Customer AS C ON C.customerID=OTC.customerID
INNER JOIN AddressToCustomer AS ATC ON C.customerID=ATC.customerID
INNER JOIN "Address" AS A ON  ATC.addressID=A.addressID


--10. To check if a product is  currently in stock 
SELECT * 
FROM Product
WHERE isInStock = 1;


--11. Gives all the details of a customer and that specfic order.
SELECT * FROM Customer
INNER JOIN [Order] o ON Customer.customerID=o.customerID
WHERE orderID= 3;


--12. To get the total sales made between the date.
SELECT (SUM(price)+SUM(taxes)) AS 'Total Sales'
FROM product
JOIN ProductToOrder ON Product.productID=ProductToOrder.productID
JOIN [Order] ON ProductToOrder.orderID=[Order].orderID
WHERE orderDate BETWEEN '2023-03-01' AND '2023-03-14';
