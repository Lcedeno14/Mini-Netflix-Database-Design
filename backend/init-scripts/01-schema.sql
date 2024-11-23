
CREATE TABLE IF NOT EXISTS Manager (
    Manager_ID INT AUTO_INCREMENT PRIMARY KEY,
    FName VARCHAR(50),
    LName VARCHAR(50),
    SSN VARCHAR(11) UNIQUE NOT NULL,
    Hours_Worked INT,
    Email VARCHAR(100) UNIQUE,
    Phone_Number VARCHAR(15),
    Hire_Date DATE,
    Salary DECIMAL(10, 2),
    Status ENUM('Active', 'On Leave', 'Retired', 'Terminated')
);

CREATE TABLE IF NOT EXISTS Subscription_Type (
    Type_Name ENUM('Standard with ads', 'Standard', 'Premium') PRIMARY KEY,  
    Price DECIMAL(5, 2) NOT NULL CHECK (Price IN (6.99, 15.49, 22.99)),  
    Max_Devices INT NOT NULL CHECK (Max_Devices IN (2, 4)),  
    Has_Ads BOOLEAN NOT NULL, 
    Max_Resolution ENUM('1080p', '4k') NOT NULL, 
    Max_Device_Download INT NOT NULL CHECK (Max_Device_Download IN (2, 6))
);

CREATE TABLE IF NOT EXISTS Users (
    User_ID INT AUTO_INCREMENT PRIMARY KEY,
    FName VARCHAR(50), -- Valid name constraint needs to be programatically enforced
    LName VARCHAR(50), -- Same here
    Email VARCHAR(100) UNIQUE NOT NULL, -- Email format constraint //
    Devices_Currently_Watching INT, -- Constraint needs to be programatically enforced by checking Max_Devices in Subscription_Type
	Created_At DATETIME DEFAULT CURRENT_TIMESTAMP,
	Updated_At DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	Card_Name VARCHAR(100),
    Card_Num VARCHAR(16),
    Card_CVC VARCHAR(4),
    Card_Exp_Date DATE,
	Subscription_Type ENUM('Standard with ads', 'Standard', 'Premium'),
	FOREIGN KEY (Subscription_Type) REFERENCES Subscription_Type(Type_Name)
);

CREATE TABLE IF NOT EXISTS Profiles (
    Profile_ID INT AUTO_INCREMENT PRIMARY KEY, 
    Name VARCHAR(50),
    Age INT CHECK (Age BETWEEN 0 AND 120),
    Avatar_Img_URL VARCHAR(255),
    Display_Language ENUM('English', 'Spanish', 'French', 'German', 'Italian', 'Portuguese', 'Chinese', 'Japanese', 'Russian', 'Korean', 'Hindi', 'Arabic') NOT NULL,
    Audio_Subtitle_Language ENUM('English', 'Spanish', 'French', 'German', 'Italian', 'Portuguese', 'Chinese', 'Japanese', 'Russian', 'Korean', 'Hindi', 'Arabic') NOT NULL,
    Autoplay BOOLEAN,
    User_ID INT NOT NULL,
    FOREIGN KEY (User_ID) REFERENCES Users(User_ID),
    UNIQUE (User_ID, Profile_ID)
);

CREATE TABLE IF NOT EXISTS Device (
    Device_ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(50),
    Latitude DECIMAL(9, 6),
    Longitude DECIMAL(9, 6),
    Type VARCHAR(50),
    Is_Watching BOOLEAN,    
    User_ID INT NOT NULL,
    FOREIGN KEY (User_ID) REFERENCES Users(User_ID)
);

CREATE TABLE IF NOT EXISTS Content (
    Content_ID INT AUTO_INCREMENT PRIMARY KEY,
    Content_Type ENUM('Movie', 'TV Show'),
    Title VARCHAR(255),
	Summary TEXT NULL,
    Release_Date DATE,
    Maturity_Rating ENUM('G', 'PG', 'PG-13', 'R', 'NC-17') NOT NULL,
    Duration INT, -- in seconds
    Video_URL VARCHAR(255),
    Trailer_URL VARCHAR(255),
    Flyer_URL VARCHAR(255),
	Manager_ID INT,
    FOREIGN KEY (Manager_ID) REFERENCES Manager(Manager_ID) 
);

CREATE TABLE IF NOT EXISTS Watch_History (
    History_ID INT AUTO_INCREMENT PRIMARY KEY,
    Last_Watched_Timestamp INT, -- in seconds
    Completed BOOLEAN,    
    Profile_ID INT NOT NULL,
    Content_ID INT NOT NULL,
    Device_ID INT NOT NULL,
    FOREIGN KEY (Profile_ID) REFERENCES Profiles(Profile_ID), 
    FOREIGN KEY (Content_ID) REFERENCES Content(Content_ID), 
    FOREIGN KEY (Device_ID) REFERENCES Device(Device_ID)  
);

CREATE TABLE IF NOT EXISTS Genre (
    Genre_ID INT AUTO_INCREMENT PRIMARY KEY,
    Genre_Name ENUM('Action', 'Adventure', 'Animation', 'Comedy', 'Crime', 'Documentary', 'Drama', 'Family', 'Fantasy', 'Horror', 'Musical', 'Mystery', 'Romance', 'Science Fiction', 'Thriller', 'War', 'Western') NOT NULL
);

CREATE TABLE IF NOT EXISTS Content_Genre (
    Content_ID INT NOT NULL,
    Genre_ID INT NOT NULL,
    FOREIGN KEY (Content_ID) REFERENCES Content(Content_ID),
    FOREIGN KEY (Genre_ID) REFERENCES Genre(Genre_ID)
);

CREATE TABLE IF NOT EXISTS Cast (
    Content_ID INT NOT NULL,
    Name VARCHAR(100),
    Position VARCHAR(50),
    Character_Name VARCHAR(100) NULL,
    PRIMARY KEY (Content_ID, Name), 
    FOREIGN KEY (Content_ID) REFERENCES Content(Content_ID)
);

CREATE TABLE IF NOT EXISTS Episodes (
    Content_ID INT NOT NULL,
    Title VARCHAR(255),
    Summary TEXT,
    Duration INT, -- in seconds
    Release_Date DATE,
    Season_Num INT,
    Episode_Num INT,
    PRIMARY KEY (Content_ID, Season_Num, Episode_Num),  -- Composite key to uniquely identify the episode
    FOREIGN KEY (Content_ID) REFERENCES Content(Content_ID)
);

CREATE TABLE IF NOT EXISTS Payment_History (
    Payment_ID INT AUTO_INCREMENT PRIMARY KEY,
    Amount DECIMAL(10, 2),
    Payment_Date DATE,
    Card_Name VARCHAR(100),
    Card_Num VARCHAR(16),
    Card_CVC VARCHAR(4),
    Card_Exp_Date DATE,
	User_ID INT NOT NULL,
    FOREIGN KEY (User_ID) REFERENCES Users(User_ID)
);

CREATE TABLE IF NOT EXISTS Profile_Watchlist (
    Profile_ID INT NOT NULL,
    Content_ID INT NOT NULL,
    Date_Added DATETIME DEFAULT CURRENT_TIMESTAMP, 
    PRIMARY KEY (Profile_ID, Content_ID),
    FOREIGN KEY (Profile_ID) REFERENCES Profiles(Profile_ID),
    FOREIGN KEY (Content_ID) REFERENCES Content(Content_ID)
);