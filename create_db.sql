use spices;
CREATE TABLE if not exists `Customer` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) UNIQUE,
  `hash` varchar(255) NOT NULL,
  `registrationDate` timestamp NOT NULL DEFAULT now()
);

CREATE TABLE if not exists `SpiceCategory` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255) UNIQUE,
  `description` text NOT NULL
);

CREATE table if not exists `Spice` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255) UNIQUE,
  `description` text NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `quantity` integer NOT NULL DEFAULT 0,
  `categoryId` integer NOT NULL
);

CREATE TABLE if not exists `SpiceOrder` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `status` varchar(255) NOT NULL,
  `createDate` timestamp NOT NULL DEFAULT now(),
  `customerId` integer NOT NULL
);

CREATE TABLE if not exists `SpiceOrderContent` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `orderId` integer NOT NULL,
  `spiceId` integer NOT NULL,
  `productPrice` decimal(10,2) NOT NULL,
  `productQuantity` integer NOT NULL
);

ALTER TABLE `Spice` ADD FOREIGN KEY (`categoryId`) REFERENCES `SpiceCategory` (`id`);

ALTER TABLE `SpiceOrderContent` ADD FOREIGN KEY (`orderId`) REFERENCES `SpiceOrder` (`id`);

ALTER TABLE `SpiceOrderContent` ADD FOREIGN KEY (`spiceId`) REFERENCES `Spice` (`id`);

ALTER TABLE `SpiceOrder` ADD FOREIGN KEY (`customerId`) REFERENCES `Customer` (`id`);
