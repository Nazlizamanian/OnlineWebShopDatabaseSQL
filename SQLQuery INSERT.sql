--INSERT into all Tables 

SELECT * FROM Account 

--Insert Account
INSERT INTO Account
VALUES ( 'Kevin99', 'kevin123', 'true');

INSERT INTO Account
VALUES ( 'Adrian00', 'adrian123', 'false');

INSERT INTO Account
VALUES ( 'Minna89', 'minna123', 'true');

INSERT INTO Account
VALUES ( 'Evelina01', 'evelina123', 'false');

INSERT INTO Account
VALUES ( 'Roberto78', 'roberto123', 'true');


INSERT INTO Account
VALUES ( 'Marucs02', 'marcus123', 'false');

--Insert into Customer
SELECT * FROM Customer
INSERT INTO Customer
VALUES ( '2', '20000102-3456', 'Adrian', 'Moreno', '0701234567', 'adrian00@gmail.com');

INSERT INTO Customer
VALUES ( '4', '20010506-8844', 'Evelina', 'Eriksson', '0707895423', 'evelina01@gmail.com');

INSERT INTO Customer
VALUES ( '6', '20020403-8724', 'Marcus', 'Andersson', '0702521155', 'marcus02@hotmail.com');


--Insert into Order
SELECT * FROM [Order]
INSERT INTO [Order]
VALUES( '1', '2023-03-05', '2023-03-08', 'Left Warehouse', '1');

INSERT INTO [Order]
VALUES( '2', '2023-03-08', '2023-03-10', 'Shippped', '1');

INSERT INTO [Order]
VALUES( '3', '2023-03-11', '2023-03-03', 'Shipped', '1');

UPDATE [order]
set shippingDate='2023-03-12 12:37:15'
where orderID=3
SELECT * FROM [Order]


--Insert into Product
SELECT * FROM Product
INSERT INTO Product(itemNumber, productName, productCategory, productColor, size, price, isInStock, stock, taxes)
VALUES ( 'D01', 'Knitted Summer Dress', 'Dress', 'Yellow', 'M', '300', 'true', '30', '0.25');

INSERT INTO Product(itemNumber, productName, productCategory, productColor, size, price, isInStock, stock, taxes)
VALUES( 'D02', 'Sunny Midi Dress', 'Dress', 'Pink', 'M', '250', 'true', '30', '0.25');

INSERT INTO Product(itemNumber, productName, productCategory, productColor, size, price, isInStock, stock, taxes)
VALUES( 'P01', 'Tailored Slim Fit Chinos', 'Pants', 'Black', 'M', '400', 'true', '30', '0.25');

INSERT INTO Product(itemNumber, productName, productCategory, productColor, size, price, isInStock, stock, taxes)
VALUES( 'P02', 'Straight Fit Jeans', 'Pants', 'Blue', 'M', '500', 'true', '25', '0.25');

INSERT INTO Product(itemNumber, productName, productCategory, productColor, size, price, isInStock, stock, taxes)
VALUES('S01', 'Knitted Sweater V-line', 'Sweater', 'White', 'S', '250', 'true', '35', '0.25');

INSERT INTO Product(itemNumber, productName, productCategory, productColor, size, price, isInStock, stock, taxes)
VALUES( 'S02', 'Loose Fit Sweater', 'Sweater', 'Blue', 'XS', '340', 'true', '32', '0.25');

INSERT INTO Product(itemNumber, productName, productCategory, productColor, size, price, isInStock, stock, taxes)
VALUES( 'D03', 'Summer Midi Dress', 'Dress', 'Red', 'XS', '340', 'false', '', '0.25');

INSERT INTO Product(itemNumber, productName, productCategory, productColor, size, price, isInStock, stock, taxes)
VALUES( 'P03', 'Regular Fit Jeans', 'Pants', 'Blue', 'L', '550', 'false', '', '0.25');

INSERT INTO Product(itemNumber, productName, productCategory, productColor, size, price, isInStock, stock, taxes)
VALUES( 'P04', 'Ripped Regular Jeans', 'Pants', 'Blue', 'XS', '670', 'false', '', '0.25');

--Insert into the middle tables 
INSERT INTO ProductToOrder (orderID, productID) VALUES(1, 1);
INSERT INTO ProductToOrder (orderID, productID) VALUES(2, 2);
INSERT INTO ProductToOrder (orderID, productID) VALUES(3, 3);

INSERT INTO ProductToProductCategory(productID,productCategoryID) VALUES (1,1);
INSERT INTO ProductToProductCategory(productID,productCategoryID) VALUES (2,1);
INSERT INTO ProductToProductCategory(productID,productCategoryID) VALUES (3,3);
INSERT INTO ProductToProductCategory(productID,productCategoryID) VALUES (4,3);
INSERT INTO ProductToProductCategory(productID,productCategoryID) VALUES (5,2);
INSERT INTO ProductToProductCategory(productID,productCategoryID) VALUES (6,2);
INSERT INTO ProductToProductCategory(productID,productCategoryID) VALUES (7,1);
INSERT INTO ProductToProductCategory(productID,productCategoryID) VALUES (8,1);
INSERT INTO ProductToProductCategory(productID,productCategoryID) VALUES (9,3);

SELECT * FROM Product 
select * from ProductCategory

INSERT INTO OrderToCustomer(orderID, customerID) VALUES(1, 1);
INSERT INTO OrderToCustomer(orderID, customerID) VALUES(2, 2);
INSERT INTO OrderToCustomer(orderID, customerID) VALUES(3, 3);

INSERT INTO AddressToCustomer(addressID,customerID) VALUES(2,1);
INSERT INTO AddressToCustomer(addressID,customerID) VALUES(3,2);
INSERT INTO AddressToCustomer(addressID,customerID) VALUES(4,3);

INSERT INTO OrderToShipping(orderID,shippingID) VALUES(1,3);
INSERT INTO OrderToShipping(orderID,shippingID) VALUES(2,4);
INSERT INTO OrderToShipping(orderID,shippingID) VALUES(3,5);

SELECT * FROM [order]
SELECT * FROM Shipping

--Insert into ProductCategory 
SELECT * FROM ProductCategory
INSERT INTO ProductCategory 
VALUES ( 'Dress');
INSERT INTO ProductCategory 
VALUES ( 'Sweater');
INSERT INTO ProductCategory 
VALUES ( 'Pants');

SELECT * FROM [Order]


--Insert into Payment 
SELECT * FROM Payment
INSERT INTO Payment (orderID, paymentDetails, timeOfPayment)
VALUES ( '1', 'Klarna', '2023-3-06 14:25:06');

INSERT INTO Payment (orderID, paymentDetails, timeOfPayment)
VALUES ( '2', 'CreditCard', '2023-03-08 15:40:10');

INSERT INTO Payment (orderID, paymentDetails, timeOfPayment)
VALUES ( '3', 'CreditCard', '2023-03-11 17:50:20');

UPDATE Payment
set timeOfPayment='2023-03-06 14:25:06'
WHERE paymentID=1;

--Insert into Address
SELECT * FROM [Address]
INSERT INTO Address (customerID, street, city, country, zip)
VALUES ( '2', 'Odengatan 31', 'Stockholm', 'Sweden','10465' );

INSERT INTO Address (customerID, street, city, country, zip)
VALUES ( '3', 'Marklandsgatan 14', 'Gothenburg', 'Sweden','42441' );


--Insert into Shipping 
SELECT TOP 10 * FROM Shipping
SELECT * FROM [Order]
SELECT * FROM [Address]

INSERT INTO Shipping
VALUES ( '2023-03-08 13:00', 'Left warehouse','Rådmansgatan 25', 'Stockholm', 'Sweden', '11121' );
INSERT INTO Shipping
VALUES ( '2023-03-10 14:00:10', 'Left warehouse','Odengatan 31', 'Stockholm', 'Sweden', '10465' );
INSERT INTO Shipping
VALUES ( '2023-03-10 09:30:05', 'Out for delivery','Marklandsgatan 14', 'Gothenburg', 'Sweden', '42441' );
