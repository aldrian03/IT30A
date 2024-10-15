

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


CREATE TABLE `orderdetails` (
  `ProductID` int(11) NOT NULL,
  `OrderID` int(11) NOT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `UnitPrice` decimal(10,2) DEFAULT NULL,
  `Discount` decimal(5,2) DEFAULT NULL,
  `StatusID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO `orderdetails` (`ProductID`, `OrderID`, `Quantity`, `UnitPrice`, `Discount`, `StatusID`) VALUES
(1, 1, 5, 120.00, 0.10, 1),
(2, 2, 10, 220.00, 0.15, 1),
(3, 3, 7, 170.00, 0.05, 2),
(4, 4, 12, 320.00, 0.20, 2),
(5, 5, 8, 140.00, 0.08, 1);


ALTER TABLE `orderdetails`
  ADD PRIMARY KEY (`ProductID`,`OrderID`),
  ADD KEY `OrderID` (`OrderID`);


ALTER TABLE `orderdetails`
  ADD CONSTRAINT `orderdetails_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `products` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orderdetails_ibfk_2` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;
