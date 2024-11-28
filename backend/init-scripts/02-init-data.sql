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

INSERT INTO Content (Content_Type, Title, Summary, Release_Date, Maturity_Rating, Duration, Video_URL, Trailer_URL, Flyer_URL, Manager_ID)
VALUES
('Movie', 'Harry Potter and the Sorcerer\'s Stone', 'A young wizard embarks on his magical journey at Hogwarts School of Witchcraft and Wizardry.', '2001-11-16', 'PG', 9060, 'http://example.com/harry_potter.mp4', 'http://example.com/harry_potter_trailer.mp4', 'http://example.com/harry_potter_flyer.jpg', 1),
('Movie', 'Inception', 'A skilled thief enters people\'s dreams to steal secrets but faces a dangerous mission.', '2010-07-16', 'PG-13', 8880, 'http://example.com/inception.mp4', 'http://example.com/inception_trailer.mp4', 'http://example.com/inception_flyer.jpg', 2),
('Movie', 'The Dark Knight', 'Batman faces off against the Joker in a battle for Gotham\'s soul.', '2008-07-18', 'PG-13', 9120, 'http://example.com/dark_knight.mp4', 'http://example.com/dark_knight_trailer.mp4', 'http://example.com/dark_knight_flyer.jpg', 3),
('Movie', 'The Lord of the Rings: The Fellowship of the Ring', 'A group of heroes sets out to destroy a powerful ring and defeat an ancient evil.', '2001-12-19', 'PG-13', 10740, 'http://example.com/lotr_fellowship.mp4', 'http://example.com/lotr_fellowship_trailer.mp4', 'http://example.com/lotr_fellowship_flyer.jpg', 1),
('Movie', 'Avengers: Endgame', 'The Avengers assemble one final time to undo the catastrophic events caused by Thanos.', '2019-04-26', 'PG-13', 10800, 'http://example.com/avengers_endgame.mp4', 'http://example.com/avengers_endgame_trailer.mp4', 'http://example.com/avengers_endgame_flyer.jpg', 2),
('Movie', 'Titanic', 'A young couple falls in love aboard the ill-fated RMS Titanic.', '1997-12-19', 'PG-13', 11460, 'http://example.com/titanic.mp4', 'http://example.com/titanic_trailer.mp4', 'http://example.com/titanic_flyer.jpg', 3),
('Movie', 'Frozen', 'Two sisters discover the true meaning of love and family as they battle icy dangers.', '2013-11-27', 'PG', 6120, 'http://example.com/frozen.mp4', 'http://example.com/frozen_trailer.mp4', 'http://example.com/frozen_flyer.jpg', 1),
('Movie', 'Jurassic Park', 'A theme park with cloned dinosaurs turns into a survival nightmare.', '1993-06-11', 'PG-13', 7680, 'http://example.com/jurassic_park.mp4', 'http://example.com/jurassic_park_trailer.mp4', 'http://example.com/jurassic_park_flyer.jpg', 2),
('TV Show', 'Stranger Things', 'A group of kids in a small town uncovers supernatural mysteries tied to a secret lab.', '2016-07-15', 'PG-13', NULL, 'http://example.com/stranger_things.mp4', 'http://example.com/stranger_things_trailer.mp4', 'http://example.com/stranger_things_flyer.jpg', 3),
('TV Show', 'Game of Thrones', 'Noble families vie for control of the Iron Throne in a fantastical world.', '2011-04-17', 'R', NULL, 'http://example.com/game_of_thrones.mp4', 'http://example.com/game_of_thrones_trailer.mp4', 'http://example.com/game_of_thrones_flyer.jpg', 1);

INSERT INTO Genre (Genre_Name)
VALUES 
('Action'), 
('Adventure'), 
('Animation'), 
('Comedy'), 
('Crime'), 
('Documentary'), 
('Drama'), 
('Family'), 
('Fantasy'), 
('Horror'), 
('Musical'), 
('Mystery'), 
('Romance'), 
('Science Fiction'), 
('Thriller'), 
('War'), 
('Western');

INSERT INTO Content_Genre (Content_ID, Genre_ID)
VALUES
-- Harry Potter and the Sorcerer's Stone
(1, 1),  -- Action
(1, 2),  -- Adventure
(1, 9),  -- Family
(1, 10), -- Fantasy
(1, 13), -- Science Fiction
-- Inception
(2, 1),  -- Action
(2, 2),  -- Adventure
(2, 6),  -- Drama
(2, 13), -- Science Fiction
(2, 15), -- Thriller
-- The Dark Knight
(3, 1),  -- Action
(3, 2),  -- Adventure
(3, 6),  -- Drama
(3, 10), -- Fantasy
(3, 15), -- Thriller
-- The Lord of the Rings: The Fellowship of the Ring
(4, 1),  -- Action
(4, 2),  -- Adventure
(4, 9),  -- Family
(4, 10), -- Fantasy
(4, 13), -- Science Fiction
-- Avengers: Endgame
(5, 1),  -- Action
(5, 2),  -- Adventure
(5, 10), -- Fantasy
(5, 13), -- Science Fiction
(5, 15), -- Thriller
-- Titanic
(6, 4),  -- Drama
(6, 9),  -- Family
(6, 13), -- Romance
(6, 10), -- Fantasy
-- Frozen
(7, 3),  -- Animation
(7, 9),  -- Family
(7, 10), -- Fantasy
(7, 13), -- Musical
-- Jurassic Park
(8, 1),  -- Action
(8, 2),  -- Adventure
(8, 6),  -- Drama
(8, 9),  -- Family
(8, 13), -- Science Fiction
(8, 15), -- Thriller
-- Stranger Things
(9, 1),  -- Action
(9, 2),  -- Adventure
(9, 6),  -- Drama
(9, 9),  -- Family
(9, 10), -- Fantasy
(9, 13), -- Science Fiction
(9, 15), -- Thriller
-- Game of Thrones
(10, 1),  -- Action
(10, 2),  -- Adventure
(10, 6),  -- Drama
(10, 10), -- Fantasy
(10, 15), -- Thriller
(10, 16), -- War
(10, 17); -- Western

INSERT INTO Cast (Content_ID, Name, Position, Character_Name) 
VALUES
-- Harry Potter and the Sorcerer's Stone
(1, 'Daniel Radcliffe', 'Actor', 'Harry Potter'),  
(1, 'Emma Watson', 'Actor', 'Hermione Granger'),  
(1, 'Chris Columbus', 'Director', NULL),  
-- Inception
(2, 'Leonardo DiCaprio', 'Actor', 'Dom Cobb'),  
(2, 'Joseph Gordon-Levitt', 'Actor', 'Arthur'),  
(2, 'Christopher Nolan', 'Director', NULL),  
-- The Dark Knight
(3, 'Christian Bale', 'Actor', 'Bruce Wayne / Batman'),  
(3, 'Heath Ledger', 'Actor', 'Joker'),  
(3, 'Christopher Nolan', 'Director', NULL),  
-- The Lord of the Rings: The Fellowship of the Ring
(4, 'Elijah Wood', 'Actor', 'Frodo Baggins'),  
(4, 'Ian McKellen', 'Actor', 'Gandalf'),  
(4, 'Peter Jackson', 'Director', NULL),  
-- Avengers: Endgame
(5, 'Robert Downey Jr.', 'Actor', 'Tony Stark / Iron Man'),  
(5, 'Chris Hemsworth', 'Actor', 'Thor'),  
(5, 'Anthony Russo', 'Director', NULL),  
(5, 'Joe Russo', 'Director', NULL),  
-- Titanic
(6, 'Leonardo DiCaprio', 'Actor', 'Jack Dawson'),  
(6, 'Kate Winslet', 'Actor', 'Rose DeWitt Bukater'),  
(6, 'James Cameron', 'Director', NULL),  
-- Frozen
(7, 'Idina Menzel', 'Actor', 'Elsa'),  
(7, 'Kristen Bell', 'Actor', 'Anna'),  
(7, 'Chris Buck', 'Director', NULL),  
(7, 'Jennifer Lee', 'Director', NULL),  
-- Jurassic Park
(8, 'Sam Neill', 'Actor', 'Dr. Alan Grant'),  
(8, 'Laura Dern', 'Actor', 'Dr. Ellie Sattler'),  
(8, 'Steven Spielberg', 'Director', NULL),  
-- Stranger Things
(9, 'Winona Ryder', 'Actor', 'Joyce Byers'),  
(9, 'David Harbour', 'Actor', 'Jim Hopper'),  
(9, 'The Duffer Brothers', 'Director', NULL),  
-- Game of Thrones
(10, 'Emilia Clarke', 'Actor', 'Daenerys Targaryen'),  
(10, 'Kit Harington', 'Actor', 'Jon Snow'),  
(10, 'David Benioff', 'Director', NULL),  
(10, 'D.B. Weiss', 'Director', NULL);  

INSERT INTO Episodes (Content_ID, Title, Summary, Duration, Release_Date, Season_Num, Episode_Num) 
VALUES
-- Insert Episodes for Stranger Things (Content_ID = 9)
(9, 'Chapter One: The Vanishing of Will Byers', 'A young boy vanishes, and his friends uncover strange occurrences in their small town.', 3600, '2016-07-15', 1, 1),
(9, 'Chapter Two: The Weirdo on Maple Street', 'The friends search for answers and encounter a mysterious girl with a supernatural power.', 3600, '2016-07-15', 1, 2),
(9, 'Chapter Three: Holly, Jolly', 'The kids face more dangerous encounters as they search for their missing friend.', 3600, '2016-07-15', 1, 3),
(9, 'Chapter Four: The Body', 'The search for Will takes a darker turn when a body is found, but the truth remains elusive.', 3600, '2016-07-15', 1, 4),
(9, 'Chapter Five: The Flea and the Acrobat', 'The group discovers more about the alternate dimension and tries to rescue Will.', 3600, '2016-07-15', 1, 5);
-- Insert Episodes for Game of Thrones (Content_ID = 10)
INSERT INTO Episodes (Content_ID, Title, Summary, Duration, Release_Date, Season_Num, Episode_Num) 
VALUES
(10, 'Winter Is Coming', 'Noble families vie for control of the Iron Throne, and a dire threat looms from the North.', 3600, '2011-04-17', 1, 1),
(10, 'The Kingsroad', 'Jon Snow travels to the Wall, and Eddard Stark begins to uncover the politics of King\'s Landing.', 3600, '2011-04-24', 1, 2),
(10, 'Lord Snow', 'Jon Snow faces challenges at the Wall, and Ned Stark deals with intrigue in King\'s Landing.', 3600, '2011-05-01', 1, 3),
(10, 'Cripples, Bastards, and Broken Things', 'Tyrion Lannister interacts with the people of the kingdom, and Jon Snow faces a difficult test.', 3600, '2011-05-08', 1, 4),
(10, 'The Wolf and the Lion', 'The Stark family deals with betrayal, while the Lannisters make their move in the game of thrones.', 3600, '2011-05-15', 1, 5);

INSERT INTO Watch_History (Last_Watched_Timestamp, Completed, Profile_ID, Content_ID, Episode_ID, Device_ID)
VALUES
(360, TRUE, 1, 1, 1, 1),  -- Alice Profile 1 watched Stranger Things Season 1, Episode 1 on Laptop
(1440, TRUE, 1, 2, 2, 1),  -- Alice Profile 1 watched Game of Thrones Season 1, Episode 2 on Laptop
(1800, TRUE, 1, 3, NULL, 1),  -- Alice Profile 1 watched Inception (Movie) on Laptop
(200, TRUE, 2, 1, 1, 2),  -- Bob Profile 1 watched Stranger Things Season 1, Episode 1 on Laptop
(2880, TRUE, 2, 2, 1, 2),  -- Bob Profile 1 watched Game of Thrones Season 1, Episode 1 on Laptop
(3240, TRUE, 2, 2, 2, 2),  -- Bob Profile 1 watched Game of Thrones Season 1, Episode 2 on Laptop
(3600, TRUE, 2, 4, NULL, 2),  -- Bob Profile 1 watched The Matrix (Movie) on Laptop
(2410, TRUE, 2, 3, NULL, 2),  -- Bob Profile 1 watched Inception (Movie) on Laptop
(3960, TRUE, 3, 1, 1, 3),  -- Charlie Profile 1 watched Stranger Things Season 1, Episode 1 on Laptop
(4320, TRUE, 3, 1, 2, 3),  -- Charlie Profile 1 watched Stranger Things Season 1, Episode 2 on Laptop
(5400, TRUE, 3, 5, NULL, 3),  -- Charlie Profile 1 watched Gladiator (Movie) on Laptop
(5760, TRUE, 4, 1, 1, 4),  -- Diana Profile 1 watched Stranger Things Season 1, Episode 1 on Laptop
(6120, TRUE, 4, 1, 2, 4),  -- Diana Profile 1 watched Stranger Things Season 1, Episode 2 on Laptop
(6480, TRUE, 4, 3, NULL, 4),  -- Diana Profile 1 watched Avatar (Movie) on Laptop
(6840, TRUE, 4, 2, 1, 4),  -- Diana Profile 1 watched Game of Thrones Season 1, Episode 1 on Laptop
(7200, TRUE, 4, 2, 2, 4),  -- Diana Profile 1 watched Game of Thrones Season 1, Episode 2 on Laptop
(7560, TRUE, 5, 1, 1, 5),  -- Edward Profile 1 watched Stranger Things Season 1, Episode 1 on Tablet
(7900, TRUE, 5, 1, 2, 5),  -- Edward Profile 1 watched Stranger Things Season 1, Episode 2 on Tablet
(8280, TRUE, 5, 2, 1, 5),  -- Edward Profile 1 watched Game of Thrones Season 1, Episode 1 on Tablet
(8640, TRUE, 5, 2, 2, 5),  -- Edward Profile 1 watched Game of Thrones Season 1, Episode 2 on Tablet
(9000, TRUE, 5, 6, NULL, 5);  -- Edward Profile 1 watched The Dark Knight (Movie) on Tablet

INSERT INTO Payment_History (Amount, Payment_Date, Card_Name, Card_Num, Card_CVC, Card_Exp_Date, User_ID)
VALUES
(6.99, '2024-01-15', 'Alice Smith', '1234567890123456', '123', '2025-12-31', 1),  -- Alice's Standard Subscription Payment
(6.99, '2024-02-15', 'Alice Smith', '1234567890123456', '123', '2025-12-31', 1),  -- Alice's Standard Subscription Payment
(15.49, '2024-03-15', 'Bob Johnson', '2345678901234567', '234', '2026-01-15', 2),  -- Bob's Premium Subscription Payment
(22.99, '2024-04-01', 'Bob Johnson', '2345678901234567', '234', '2026-01-15', 2),  -- Bob's Premium Subscription Payment
(6.99, '2024-05-15', 'Alice Smith', '1234567890123456', '123', '2025-12-31', 1),  -- Alice's Standard Subscription Payment
(22.99, '2024-06-01', 'Diana Ross', '4567890123456789', '456', '2026-03-10', 4),  -- Diana's Premium Subscription Payment
(15.49, '2024-07-10', 'Charlie Brown', '3456789012345678', '345', '2025-05-20', 3),  -- Charlie's Standard with Ads Subscription Payment
(6.99, '2024-08-15', 'Alice Smith', '1234567890123456', '123', '2025-12-31', 1),  -- Alice's Standard Subscription Payment
(22.99, '2024-09-01', 'Bob Johnson', '2345678901234567', '234', '2026-01-15', 2),  -- Bob's Premium Subscription Payment
(15.49, '2024-10-10', 'Edward King', '5678901234567890', '567', '2025-11-11', 5),  -- Edward's Standard Subscription Payment
(6.99, '2024-11-01', 'Charlie Brown', '3456789012345678', '345', '2025-05-20', 3),  -- Charlie's Standard with Ads Subscription Payment
(6.99, '2024-12-01', 'Alice Smith', '1234567890123456', '123', '2025-12-31', 1),  -- Alice's Standard Subscription Payment
(22.99, '2025-01-01', 'Diana Ross', '4567890123456789', '456', '2026-03-10', 4),  -- Diana's Premium Subscription Payment
(15.49, '2025-02-15', 'Bob Johnson', '2345678901234567', '234', '2026-01-15', 2),  -- Bob's Premium Subscription Payment
(6.99, '2025-03-01', 'Edward King', '5678901234567890', '567', '2025-11-11', 5);  -- Edward's Standard Subscription Payment

INSERT INTO Profile_Watchlist (Profile_ID, Content_ID, Date_Added)
VALUES
(1, 1, '2024-11-01 08:30:00'),
(1, 2, '2024-11-02 09:00:00'),
(1, 3, '2024-11-03 10:15:00'),
(2, 1, '2024-11-04 11:45:00'),
(2, 4, '2024-11-05 12:00:00'),
(2, 5, '2024-11-06 13:30:00'),
(3, 1, '2024-11-07 14:45:00'),
(3, 6, '2024-11-08 15:00:00'),
(3, 7, '2024-11-09 16:00:00'),
(4, 2, '2024-11-10 17:15:00'),
(4, 8, '2024-11-11 18:30:00'),
(5, 3, '2024-11-12 19:45:00'),
(5, 4, '2024-11-13 20:00:00'),
(5, 9, '2024-11-14 21:00:00'),
(6, 5, '2024-11-15 22:15:00'),
(6, 6, '2024-11-16 23:00:00'),
(7, 10, '2024-11-17 08:30:00'),
(8, 3, '2024-11-18 09:45:00'),
(9, 2, '2024-11-19 10:30:00'),
(10, 4, '2024-11-20 11:15:00');
