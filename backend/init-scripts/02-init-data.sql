INSERT INTO Subscription_Type (Type_Name, Price, Max_Devices, Has_Ads, Max_Resolution, Max_Device_Download)
VALUES 
('Standard with ads', 6.99, 2, TRUE, '1080p', 2),
('Standard', 15.49, 2, FALSE, '1080p', 2),
('Premium', 22.99, 4, FALSE, '4k', 6);

INSERT INTO Manager (FName, LName, SSN, Hours_Worked, Email, Phone_Number, Hire_Date, Salary, Status)
VALUES
('Michael', 'Scott', '123-45-6789', 40, 'michael.scott@example.com', '1234567890', '2010-01-01', 80000.00, 'Active'),
('Leslie', 'Knope', '234-56-7890', 35, 'leslie.knope@example.com', '2345678901', '2012-03-15', 90000.00, 'Active'),
('Ron', 'Swanson', '345-67-8901', 20, 'ron.swanson@example.com', '3456789012', '2008-06-10', 75000.00, 'Retired');

INSERT INTO Users (FName, LName, Email, Devices_Currently_Watching, Card_Name, Card_Num, Card_CVC, Card_Exp_Date, Subscription_Type)
VALUES
('Alice', 'Smith', 'alice.smith@example.com', 2, 'Alice Smith', '1234567890123456', '123', '2025-12-31', 'Standard'),
('Bob', 'Johnson', 'bob.johnson@example.com', 3, 'Bob Johnson', '2345678901234567', '234', '2026-01-15', 'Premium'),
('Charlie', 'Brown', 'charlie.brown@example.com', 1, 'Charlie Brown', '3456789012345678', '345', '2025-05-20', 'Standard with ads'),
('Diana', 'Ross', 'diana.ross@example.com', 0, 'Diana Ross', '4567890123456789', '456', '2026-03-10', 'Premium'),
('Edward', 'King', 'edward.king@example.com', 2, 'Edward King', '5678901234567890', '567', '2025-11-11', 'Standard');

INSERT INTO Profiles (Name, Age, Avatar_Img_URL, Display_Language, Audio_Subtitle_Language, Autoplay, User_ID)
VALUES
('Alice Profile 1', 25, 'http://example.com/avatar1.png', 'English', 'English', TRUE, 1),
('Alice Profile 2', 27, 'http://example.com/avatar2.png', 'English', 'French', TRUE, 1),
('Bob Profile 1', 30, 'http://example.com/avatar3.png', 'English', 'English', TRUE, 2),
('Bob Profile 2', 32, 'http://example.com/avatar4.png', 'Spanish', 'English', FALSE, 2),
('Bob Profile 3', 35, 'http://example.com/avatar5.png', 'English', 'Spanish', TRUE, 2),
('Bob Profile 4', 28, 'http://example.com/avatar6.png', 'Spanish', 'English', TRUE, 2),
('Charlie Profile 1', 18, 'http://example.com/avatar7.png', 'English', 'French', TRUE, 3),
('Charlie Profile 2', 20, 'http://example.com/avatar8.png', 'English', 'Spanish', FALSE, 3),
('Charlie Profile 3', 22, 'http://example.com/avatar9.png', 'French', 'English', TRUE, 3),
('Diana Profile 1', 27, 'http://example.com/avatar10.png', 'English', 'English', FALSE, 4),
('Diana Profile 2', 29, 'http://example.com/avatar11.png', 'French', 'English', TRUE, 4),
('Diana Profile 3', 25, 'http://example.com/avatar12.png', 'English', 'Spanish', TRUE, 4),
('Edward Profile 1', 35, 'http://example.com/avatar13.png', 'English', 'English', TRUE, 5),
('Edward Profile 2', 40, 'http://example.com/avatar14.png', 'Spanish', 'English', FALSE, 5),
('Edward Profile 3', 38, 'http://example.com/avatar15.png', 'French', 'English', TRUE, 5),
('Edward Profile 4', 42, 'http://example.com/avatar16.png', 'English', 'Spanish', TRUE, 5);

INSERT INTO Device (Name, Latitude, Longitude, Type, Is_Watching, User_ID)
VALUES
('Alice Laptop', 37.7749, -122.4194, 'Laptop', TRUE, 1),
('Alice Smartphone', 34.0522, -118.2437, 'Smartphone', FALSE, 1),
('Bob Laptop', 40.7128, -74.0060, 'Laptop', TRUE, 2),
('Bob Smartphone', 51.5074, -0.1278, 'Smartphone', FALSE, 2),
('Bob Tablet', 35.6895, 139.6917, 'Tablet', TRUE, 2),
('Bob Console', 34.0522, -118.2437, 'Console', FALSE, 2),
('Charlie Laptop', 52.5200, 13.4050, 'Laptop', TRUE, 3),
('Charlie Smartphone', 48.8566, 2.3522, 'Smartphone', FALSE, 3),
('Charlie Smart TV', 41.9028, 12.4964, 'Smart TV', TRUE, 3),
('Diana Laptop', 36.7783, -119.4179, 'Laptop', TRUE, 4),
('Diana Smartphone', 39.9042, 116.4074, 'Smartphone', FALSE, 4),
('Edward Tablet', 51.1657, 10.4515, 'Tablet', TRUE, 5),
('Edward Console', 55.7558, 37.6173, 'Console', FALSE, 5);