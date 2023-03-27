--CREATE all tables 

CREATE TABLE Account(
userID INT IDENTITY(1,1),
username VARCHAR(50),
userpassword VARCHAR(50),
isAdmin BIT, 
PRIMARY KEY(userID)
);

CREATE TABLE Product(
productID INT IDENTITY(1,1),
itemNumber VARCHAR(20),
productName VARCHAR(30),
productCategory VARCHAR(40),
productColor VARCHAR(20),
size CHAR(10),
price FLOAT,
isInStock BIT,
stock INT,
taxes FLOAT,
studentDiscount FLOAT, 
newDiscountedPrice FLOAT,
PRIMARY KEY (productID)
);

CREATE TABLE Customer(
customerID INT IDENTITY(1,1),
userID INT, 
ssn VARCHAR(30),
firstName VARCHAR(50),
lastName VARCHAR(50),
phoneNumber VARCHAR(10), 
email VARCHAR(50),
PRIMARY KEY(customerID),
FOREIGN KEY (userID) REFERENCES Account(userID),
);


CREATE TABLE [Order](
orderID INT IDENTITY(1,1), 
customerID INT,
orderDate DATETIME,
shippingDate datetime, 
shippingStatus VARCHAR(50),
quantity INT,
PRIMARY KEY(orderID),
FOREIGN KEY (customerID) REFERENCES Customer(customerID),
);

--middle table between Product and Orders 
CREATE TABLE ProductToOrder(
productID INT,
orderID INT,
FOREIGN KEY (productID) REFERENCES Product (productID),
FOREIGN KEY (orderID) REFERENCES [Order] (orderID), 
);

--Inner join Middle table Product & Order (ProductToOrder)
SELECT * 
FROM Product 
INNER JOIN ProductToOrder po ON product.productID = po.productID
INNER JOIN "order" AS o ON o.orderID = po.orderID


CREATE TABLE ProductCategory(
productCategoryID INT IDENTITY(1,1),
categoryName VARCHAR(40),
PRIMARY KEY(productCategoryID)
);

--middle table between product and productCategory
CREATE TABLE ProductToProductCategory(
productCategoryID INT IDENTITY(1,1),
productID INT,
FOREIGN KEY (productCategoryID) REFERENCES ProductCategory (productCategoryID),
FOREIGN KEY (productID) REFERENCES Product (productID)
);


--Inner join Middle table Product & ProductCategory (ProductToProductCategory)
SELECT * 
FROM Product 
INNER JOIN ProductToProductCategory pc ON product.productID =pc.productID
INNER JOIN ProductCategory ON productCategory.productCategoryID=pc.productCategoryID

CREATE TABLE ProductQuantity(
productQuantityID INT, 
productID INT, 
registrationDate DATETIME,
quantity INT,
PRIMARY KEY (productQuantityID),
FOREIGN KEY (productID) REFERENCES Product (productID)
);

CREATE TABLE Shipping(
shippingID INT IDENTITY(1,1), 
shippingDate DATETIME NOT NULL,
shippingStatus VARCHAR(30), 
shippingStreet VARCHAR(40), 
shippingCity VARCHAR(40),
shippingCountry VARCHAR(40),
shippingZip INT,
PRIMARY KEY (shippingID)
);

--middle table between Order and Shipping 
CREATE TABLE OrderToShipping(
orderID INT,
shippingID INT,
FOREIGN KEY (orderID) REFERENCES [Order] (orderID),
FOREIGN KEY (shippingID) REFERENCES Shipping (shippingID),
);

--Inner join Middle table orders & shipping (ordersToShipping)
SELECT* FROM [Order]
INNER JOIN OrderToShipping ots ON [order].orderID = ots.orderID 
INNER JOIN shipping ON shipping.shippingID = ots.shippingID

CREATE TABLE Payment(
paymentID INT IDENTITY(1,1),
orderID INT, 
paymentDetails VARCHAR(50),
totalPrice FLOAT,
timeOfPayment DATETIME,  
PRIMARY KEY(paymentID),
FOREIGN KEY (orderID) REFERENCES [Order] (orderID)
);

-- middle table between orders and customers 
CREATE TABLE OrderToCustomer(
orderID INT,
customerID INT, 
FOREIGN KEY (orderID) REFERENCES [Order] (orderID),
FOREIGN KEY (customerID) REFERENCES Customer (customerID),
);

--Inner join Middle table orders & customer (ordersToCustomer)
SELECT* FROM [Order]
INNER JOIN OrderToCustomer otc ON [order].orderID = otc.orderID 
INNER JOIN customer ON customer.customerID = otc.customerID


CREATE TABLE Address(
addressID INT IDENTITY(1,1), 
customerID INT,
street VARCHAR(50),
city CHAR(40),
country CHAR(40),
zip INT,
date DATETIME, 
PRIMARY KEY (addressID),
FOREIGN KEY (customerID) REFERENCES Customer(customerID)
);

--middle table between Address and Customer 
CREATE TABLE AddressToCustomer(
addressID INT,
customerID INT,
FOREIGN KEY (addressID) REFERENCES [Address](addressID),
FOREIGN KEY (customerID)REFERENCES Customer(customerID)
);

--Inner join Middle table address & customer (AddressToCustomer)
SELECT* FROM [Address]
INNER JOIN AddressToCustomer atc ON [address].addressID= atc.addressID
INNER JOIN customer AS c ON c.customerID = atc.customerID
