#Savannah Scott
#script to create database for app, make all tables, and the populate all tables with sample data
#create database
CREATE DATABASE SoccerApp_DB;
USE SoccerApp_DB;
#creating all the tables
CREATE TABLE Accounts_T(
	username VARCHAR(40) PRIMARY KEY,
	email VARCHAR(40) NOT NULL,
	phoneNumber VARCHAR(12),
	password VARCHAR(50) NOT NULL,
	notificationSetting VARCHAR(40)
);
CREATE TABLE Articles_T (
	articleID INT AUTO_INCREMENT PRIMARY KEY,
	headline VARCHAR(40),
	authorFirstName VARCHAR(40), 
	authorLastName VARCHAR(40),
	text LONGTEXT
);
CREATE TABLE League_T(
	name VARCHAR(40) PRIMARY KEY,
	country VARCHAR(40), 
	champion VARCHAR(40)
);
CREATE TABLE Teams_T(
	name VARCHAR(40) PRIMARY KEY,
	history VARCHAR(1000),
	manager VARCHAR(50),
	standing INT,
	stadiumName VARCHAR(40),
	stadiumCity VARCHAR(40),
	stadiumState VARCHAR(40),
	stadiumCountry VARCHAR(40)
);
CREATE TABLE Player_T(
	ID INT AUTO_INCREMENT PRIMARY KEY,
	firstName VARCHAR(40),
	lastName VARCHAR(40),
	DOB DATE,
	team VARCHAR(40),
	FOREIGN KEY (team) REFERENCES Teams_T (name) 
);
CREATE TABLE AccountFavTeams_T(
	entryID INT AUTO_INCREMENT PRIMARY KEY,
	username VARCHAR(40), 
	teamName VARCHAR(40),
	FOREIGN KEY (username) REFERENCES Accounts_T(username),
	FOREIGN KEY (teamName) REFERENCES Teams_T(name)
);
CREATE TABLE ArticleImage_T(
	imageID INT AUTO_INCREMENT,
	articleID INT,
    	image BLOB(2147483647),
	PRIMARY KEY(imageID, articleID),
	FOREIGN KEY (articleID) REFERENCES Articles_T (articleID)
);
CREATE TABLE LeagueStatistics_T(
	leagueName VARCHAR(40),
	statisticType VARCHAR(40),
	value FLOAT,
	PRIMARY KEY (leagueName, statisticType),
	FOREIGN KEY (leagueName) REFERENCES League_T (name)
);
CREATE TABLE LeagueTeams_T(
	entryID INT AUTO_INCREMENT,
	leagueName VARCHAR(40),
	teamName VARCHAR(40),
	PRIMARY KEY (entryID, leagueName),
	FOREIGN KEY (leagueName) REFERENCES League_T (name),
	FOREIGN KEY (teamName) REFERENCES Teams_T(name)
);
CREATE TABLE TeamPlayers_T(
	teamName VARCHAR(40),
	playerID INT,
	PRIMARY KEY(teamName, playerID),
	FOREIGN KEY (teamName) REFERENCES Teams_T(name),
	FOREIGN KEY (playerID) REFERENCES Player_T(ID)
);
CREATE TABLE TeamStatistics_T(
	team VARCHAR(40),
	statisticType VARCHAR(40),
	value FLOAT,
	PRIMARY KEY (team, statisticType),
	FOREIGN KEY (team) REFEReNCES Teams_T (name)
);
CREATE TABLE PlayerStatistics_T(
	playerID INT, 
	statisticType VARCHAR(40),
	value FLOAT,
	PRIMARY KEY(playerID, statisticType),
	FOREIGN KEY (playerID) REFERENCES Player_T(ID)
);
CREATE TABLE PlayerPosition_T(
	playerID INT,
	position VARCHAR(40),
	entryID INT AUTO_INCREMENT PRIMARY KEY,
	FOREIGN KEY (playerID) REFERENCES Player_T(ID)
);
CREATE TABLE Game_T(
	ID INT AUTO_INCREMENT,
	locationStadium VARCHAR(40),
	locationCity VARCHAR(40),
	locationState VARCHAR(2),
	locationCountry VARCHAR(40),
	date DATE,
	time TIME,
	teamAID VARCHAR(40),
	teamBID VARCHAR(40),
	teamAScore INT,
	teamBScore INT,
	PRIMARY KEY (ID, teamAID, teamBID),
	FOREIGN KEY (teamAID) REFERENCES Teams_T (name),
	FOREIGN KEY (teamBID) REFERENCES Teams_T (name)
);
CREATE TABLE GameStats_T(
	gameID INT,
	teamName VARCHAR(40),
	goals INT,
	shots INT,
	shotsOnGoal INT,
	fouls INT,
	saves INT,
	PRIMARY KEY(gameID, teamName),
	FOREIGN KEY (gameID) REFERENCES Game_T (ID),
	FOREIGN KEY (teamName) REFERENCES Teams_T (name)
);
#inserting 3 rows into each table
INSERT INTO articles_t 
	VALUES (DEFAULT, "Jones out for Season", "Lisa", "Smith", "sample text xxx..."),
	(DEFAULT, "2022's Preseason Predictions", "Martha", "Kennedy", "sample text xyx..."),
	(DEFAULT, "Keys Exits Chelsea", "Anna", "Todd", "sample text zzz...");
#could not figure out how to insert an image; NULL instead
INSERT INTO articleimage_t 
	VALUES (DEFAULT, 1, NULL),
	(DEFAULT, 2, NULL),
    	(DEFAULT, 3, NULL);
INSERT INTO teams_t 
	VALUES ("Arsenal", "founded in 1987...", "Jonas Eidevail", 1, "Meadow Park", "Borehamwood", NULL, "England"),
   	("Houston Dash", "founded in 2013...", "James Clarkson", 7, "PNC Stadium", "Houston", "Texas", "United States"),
   	("Chelsea", "founded in 1992...", "Emma Hayes", 2, "Kingsmeadow", "London", NULL, "England");
INSERT INTO league_t 
	VALUES ("Women's Super League (WSL)", "England", "Chelsea"),
    	("National Women's Soccer League (NWSL)", "United States", "North Carolina Courage"),
    	("Frauen-Bundesliga", "Germany", "Bayern Munich");
INSERT INTO player_t 
	VALUES (DEFAULT, "Vivianne", "Miedema", '1996-07-15', "Arsenal"),
    	(DEFAULT, "Kristie", "Mewis", '1991-02-25', "Houston Dash"),
    	(DEFAULT, "Leah", "Williamson", '1997-03-29', "Arsenal");
INSERT INTO accounts_t 
	VALUES ("user369", "soccerfan34@gmail.com", "443-920-3399", "password", "off"),
    	("sammyman45", "samsam4@gmail.com", "553-720-3899", "username", "on"),
    	("lsmith", "lsmith446@gmail.com", "756-279-0045", "Whj77tfD", "on");
INSERT INTO accountfavteams_t 
	VALUES (DEFAULT, "lsmith", "Arsenal"),
    	(DEFAULT, "user369", "Chelsea"),
    	(DEFAULT, "user369", "Houston Dash");
INSERT INTO game_t 
	VALUES (DEFAULT, "Meadow Park", "Borehamwood", NULL, 'England', '2020-09-14', '14:00:00', "Arsenal", "Chelsea", 2, 0), 
    	(DEFAULT, "Meadow Park", "Borehamwood", NULL, 'England', '2020-03-20', '12:00:00', "Arsenal", "Chelsea", 2, 1),
    	(DEFAULT, "Kingsmeadow", "London", NULL, 'England', '2021-09-16', '14:00:00', "Chelsea", "Arsenal", 1, 0);
INSERT INTO gamestats_t 
	VALUES (1, "Arsenal", 2, 6, 3, 1, 3),
     	(1, "Chelsea", 0, 4, 3, 3, 3),
      	(2, "Arsenal", 2, 4, 2, 2, 4);
INSERT INTO leagueteams_t 
	VALUES (DEFAULT, "Women's Super League (WSL)", "Arsenal"),
    	(DEFAULT, "Women's Super League (WSL)", "Chelsea"),
    	(DEFAULT, "National Women's Soccer League (NWSL)", "Arsenal");
INSERT INTO leaguestatistics_t 
	VALUES ("Women's Super League (WSL)", "shots", 200.00),
    	("Women's Super League (WSL)", "saves", 146.00),
    	("National Women's Soccer League (NWSL)", "shots", 227.00);
INSERT INTO playerstatistics_t 
	VALUES ("1", "goals", 84),
    	("1", "assits", 79),
   	("2", "goals", 30);
INSERT INTO playerposition_t 
	VALUES ("1", "forward", DEFAULT),
    	("2", "midfielder", DEFAULT),
    	("3", "forward", DEFAULT);
INSERT INTO teamplayers_t 
	VALUES ("Arsenal", 1),
    	("Houston Dash", 2),
    	("Chelsea", 3);
INSERT INTO teamstatistics_t 
	VALUES ("Arsenal", "shots", 500.00),
    	("Houston Dash", "saves", 100.00),
    	("Chelsea", "shots", 450.00);