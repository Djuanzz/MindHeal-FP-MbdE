CREATE DATABASE perspective;

USE perspective;

SHOW TABLES;

-- DESCRIBE
DESCRIBE users;
DESCRIBE offices;
DESCRIBE schedules;
DESCRIBE transactions;
DESCRIBE psychologists; 

-- DROP
DROP TABLE users;
DROP TABLE offices;
DROP TABLE schedules;
DROP TABLE transactions;
DROP TABLE psychologists;

-- CREATE TABLE
CREATE TABLE `users` (
    `user_id` VARCHAR(191) NOT NULL,
    `email` VARCHAR(100) NOT NULL,
    `password` VARCHAR(100) NOT NULL,
    `name` VARCHAR(100) NOT NULL,
    UNIQUE INDEX `users_email_key`(`email`),
    PRIMARY KEY (`user_id`)
);

CREATE TABLE `psychologists` (
    `psychologist_id` VARCHAR(191) NOT NULL,
    `name` VARCHAR(100) NOT NULL,
    `email` VARCHAR(100) NOT NULL,
    `description` TEXT NOT NULL,
    `session_count` INTEGER NOT NULL,
    `office_id` VARCHAR(191) NOT NULL,
    UNIQUE INDEX `psychologists_email_key`(`email`),
    PRIMARY KEY (`psychologist_id`)
);

CREATE TABLE `offices` (
    `office_id` VARCHAR(191) NOT NULL,
    `name` VARCHAR(100) NOT NULL,
    `province` VARCHAR(50) NOT NULL,
    `city` VARCHAR(50) NOT NULL,
    `address` VARCHAR(300) NOT NULL,
    `phone_number` VARCHAR(20) NOT NULL,
    PRIMARY KEY (`office_id`)
);

CREATE TABLE `schedules` (
    `schedule_id` VARCHAR(191) NOT NULL,
    `days` DATETIME NOT NULL,
    `session` INTEGER NOT NULL,
    `occupied` BOOLEAN NOT NULL DEFAULT false,
    `psychologist_id` VARCHAR(191) NOT NULL,
    `transaction_id` VARCHAR(191) NOT NULL,
    UNIQUE INDEX `schedules_transaction_id_key`(`transaction_id`),
    PRIMARY KEY (`schedule_id`)
);

CREATE TABLE `transactions` (
    `transaction_id` VARCHAR(191) NOT NULL,
    `is_paid` BOOLEAN NOT NULL DEFAULT false,
    `payment_method` ENUM('credit_card', 'debit_card', 'cash') NOT NULL DEFAULT 'cash',
    `amount` FLOAT NOT NULL,
    `payment_date` DATE NOT NULL,
    `user_id` VARCHAR(191) NOT NULL,
    PRIMARY KEY (`transaction_id`)
);

ALTER TABLE `psychologists` ADD CONSTRAINT `psychologists_office_id_fkey` FOREIGN KEY (`office_id`) REFERENCES `offices`(`office_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE `schedules` ADD CONSTRAINT `schedules_psychologist_id_fkey` FOREIGN KEY (`psychologist_id`) REFERENCES `psychologists`(`psychologist_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE `schedules` ADD CONSTRAINT `schedules_transaction_id_fkey` FOREIGN KEY (`transaction_id`) REFERENCES `transactions`(`transaction_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE `transactions` ADD CONSTRAINT `transactions_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `users`(`user_id`) ON DELETE RESTRICT ON UPDATE CASCADE;