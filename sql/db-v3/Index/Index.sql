-- Users table
CREATE INDEX idx_users_email ON Users (Email);

-- Locations table
CREATE INDEX idx_locations_name ON Locations (Name);

-- Psychologist table
CREATE INDEX idx_psychologist_email ON Psychologist (Email);
CREATE INDEX idx_psychologist_location ON Psychologist (Location_LocationID);

-- TransactionBill table
CREATE INDEX idx_transactionbill_ispayed ON TransactionBill (IsPayed);

-- Schedule table
CREATE INDEX idx_schedule_psychologist ON Schedule (Psychologist_PsychologistID);
CREATE INDEX idx_schedule_status ON Schedule (ScheduleStatus);

-- UserDiagnosis table
CREATE INDEX idx_userdiagnosis_userhistory ON UserDiagnosis (UserHistory_UserHistoryID);