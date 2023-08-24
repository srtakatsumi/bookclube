CREATE TABLE `CLIENT` (
	`client_id` int NOT NULL AUTO_INCREMENT,
	`first_name` varchar(255) NOT NULL,
	`last_name` varchar(255) NOT NULL,
	`phone_1` varchar(255) NOT NULL,
	`phone_2` varchar(255) NOT NULL,
	`email` varchar(255) NOT NULL,
	`street` varchar(255) NOT NULL,
	`neighborhood` varchar(255) NOT NULL,
	`city` varchar(255) NOT NULL,
	`state` varchar(255) NOT NULL,
	`zip_code` varchar(255) NOT NULL,
	PRIMARY KEY (`client_id`)
);

CREATE TABLE `physical_person` (
	`client_id` int NOT NULL AUTO_INCREMENT,
	`CPF` int NOT NULL,
	`RG` int NOT NULL,
	PRIMARY KEY (`client_id`)
);

CREATE TABLE `legal_person` (
	`client_id` int NOT NULL AUTO_INCREMENT,
	`CNPJ` int NOT NULL,
	`IE` int NOT NULL,
	PRIMARY KEY (`client_id`)
);

CREATE TABLE `order` (
	`id_order` int NOT NULL AUTO_INCREMENT,
	`id_client` int NOT NULL,
	`date` DATETIME NOT NULL,
	`order_value` FLOAT NOT NULL,
	PRIMARY KEY (`id_order`)
);

CREATE TABLE `order_item` (
	`order_id` int NOT NULL AUTO_INCREMENT,
	`id_book` int NOT NULL,
	`order_quantity` int NOT NULL,
	`item_value` FLOAT NOT NULL,
	PRIMARY KEY (`order_id`)
);

CREATE TABLE `publisher` (
	`id_publisher` int NOT NULL AUTO_INCREMENT,
	`phone_1` varchar(255) NOT NULL,
	`phone_2` varchar(255) NOT NULL,
	`email` varchar(255) NOT NULL,
	`contact_name` varchar(255) NOT NULL,
	PRIMARY KEY (`id_publisher`)
);

CREATE TABLE `book` (
	`id_book` int NOT NULL AUTO_INCREMENT,
	`id_publisher` int NOT NULL,
	`year_published` int NOT NULL,
	`value` FLOAT NOT NULL,
	`category` varchar(255) NOT NULL,
	`title` varchar(255) NOT NULL,
	`book_name` varchar(255) NOT NULL,
	`ISBN`  NOT NULL,
	PRIMARY KEY (`id_book`)
);

CREATE TABLE `stock` (
	`id_book` int NOT NULL AUTO_INCREMENT,
	`id_publisher` int NOT NULL,
	`Stock_quantity` int NOT NULL,
	PRIMARY KEY (`id_book`)
);

ALTER TABLE `physical_person` ADD CONSTRAINT `physical_person_fk0` FOREIGN KEY (`client_id`) REFERENCES `CLIENT`(`client_id`);

ALTER TABLE `legal_person` ADD CONSTRAINT `legal_person_fk0` FOREIGN KEY (`client_id`) REFERENCES `CLIENT`(`client_id`);

ALTER TABLE `order` ADD CONSTRAINT `order_fk0` FOREIGN KEY (`id_order`) REFERENCES `CLIENT`(`client_id`);

ALTER TABLE `order_item` ADD CONSTRAINT `order_item_fk0` FOREIGN KEY (`order_id`) REFERENCES `order`(`id_order`);

ALTER TABLE `publisher` ADD CONSTRAINT `publisher_fk0` FOREIGN KEY (`id_publisher`) REFERENCES `book`(`id_publisher`);

ALTER TABLE `book` ADD CONSTRAINT `book_fk0` FOREIGN KEY (`id_book`) REFERENCES `order_item`(`id_book`);

ALTER TABLE `stock` ADD CONSTRAINT `stock_fk0` FOREIGN KEY (`id_book`) REFERENCES `book`(`id_book`);

ALTER TABLE `stock` ADD CONSTRAINT `stock_fk1` FOREIGN KEY (`id_publisher`) REFERENCES `book`(`id_publisher`);
