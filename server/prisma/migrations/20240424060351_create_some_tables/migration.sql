/*
  Warnings:

  - You are about to alter the column `days` on the `schedules` table. The data in that column could be lost. The data in that column will be cast from `DateTime(0)` to `DateTime`.

*/
-- AlterTable
ALTER TABLE `schedules` MODIFY `days` DATETIME NOT NULL;
