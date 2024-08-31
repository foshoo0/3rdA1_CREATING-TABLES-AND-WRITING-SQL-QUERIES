DROP TABLE IF EXISTS Customers;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Shippings;
DROP TABLE IF EXISTS Users;
DROP TABLE IF EXISTS Friends;
DROP TABLE IF EXISTS GroupMembershipRequests;
DROP TABLE IF EXISTS Groups;
DROP TABLE IF EXISTS Posts;

-- Create Users Table
CREATE TABLE Users (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(50),
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DateOfBirth DATE,
    Password VARCHAR(255),
    DateAdded TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create Friends Table
CREATE TABLE Friends (
    FriendID INT AUTO_INCREMENT PRIMARY KEY,
    FriendWhoAdded INT,
    FriendBeingAdded INT,
    IsAccepted BOOLEAN,
    DateAdded TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- Create Groups Table
CREATE TABLE Groups (
    GroupID INT AUTO_INCREMENT PRIMARY KEY,
    GroupName VARCHAR(100),
    CreatedBy INT,
    DateAdded TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- Create Posts Table
CREATE TABLE Posts (
    PostID INT AUTO_INCREMENT PRIMARY KEY,
    PostDescription VARCHAR(255),
    PostedBy INT,
    IsPublic BOOLEAN,
    IsOnlyForFriends BOOLEAN,
    GroupID INT,
    DatePosted TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create Group Membership Requests Table
CREATE TABLE GroupMembershipRequests (
    GroupMemberShipRequestsID INT AUTO_INCREMENT PRIMARY KEY,
    GroupID INT,
    GroupMemberUserID INT,
    IsGroupMemberShipAccepted BOOLEAN,
    DateAccepted TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- Insert 5 records into Users table
INSERT INTO Users (UserID, Username, FirstName, LastName, DateOfBirth, Password, DateAdded) VALUES
(1, 'scopozio0', 'Stacy', 'Copozio', '2014-02-14', 'uI3%J+NlU{2(ERCQak', '2023-10-30'),
(2, 'rmcfadzean1', 'Roseanna', 'McFadzean', '2014-01-03', 'iC7(Y`0aS59Oc12', '2023-12-31'),
(3, 'leneas2', 'Laurette', 'Eneas', '2006-05-29', 'mN8_fVNbK{>N', '2024-04-14'),
(4, 'cjinks3', 'Crichton', 'Jinks', '2003-03-15', 'oZ0~N84$>yOMF', '2024-08-09'),
(5, 'ebrabant4', 'Eddie', 'Brabant', '2001-09-29', 'hJ0,"Ef+~_U?RP4X', '2024-06-26');

-- Insert 10 records into Posts Table
INSERT INTO Posts (PostID, PostDescription, PostedBy, IsPublic, IsOnlyForFriends, GroupID, DatePosted) VALUES
(1, 'Is anyone available for a group project on Monday?', 4, false, true, 1, '2023-02-08'),
(2, 'Does anyone have notes for yesterday History lecture?', 3, false, false, 2, '2023-08-02'),
(3, 'What’s the best coffee shop on campus for studying?', 1, true, true, 5, '2023-04-22'),
(4, 'What’s the best coffee shop on campus for studying?', 3, false, true, 2, '2023-11-03'),
(5, 'Looking for someone to review my essay on environmental policies.', 4, false, true, 3, '2023-04-14'),
(6, 'How do I join the student council?', 3, false, false, 2, '2024-02-13'),
(7, 'I’m struggling with my thesis. Any tips?', 4, true, true, 4, '2023-10-26'),
(8, 'How do I join the student council?', 2, true, false, 5, '2023-12-02'),
(9, 'Seeking help with coding assignments. Any volunteers?', 4, true, true, 2, '2023-08-26'),
(10, 'What’s the best coffee shop on campus for studying?', 5, false, false, 2, '2024-05-18');

-- Insert 3 records into Groups Table
INSERT INTO Groups (GroupID, GroupName, CreatedBy, DateAdded) VALUES
(1, 'Language Learners', 1, '2024-06-01'),
(2, 'Math Study Group', 1, '2024-06-15'),
(3, 'Music Lovers', 2, '2024-01-29');

-- Insert 5 records into GroupMembershipRequests Table
INSERT INTO GroupMembershipRequests (GroupMemberShipRequestsID, GroupID, GroupMemberUserID, IsGroupMemberShipAccepted, DateAccepted) VALUES
(1, 2, 2, false, '2024-07-31'),
(2, 1, 1, true, '2023-10-07'),
(3, 1, 5, false, '2024-02-13'),
(4, 3, 2, true, '2023-12-10'),
(5, 2, 4, false, '2023-10-20');

-- Insert 10 records into Friends Table
INSERT INTO Friends (FriendID, FriendWhoAdded, FriendBeingAdded, IsAccepted, DateAdded) VALUES
(1, 5, 5, true, '2024-06-20'),
(2, 4, 1, false, '2024-08-24'),
(3, 1, 1, true, '2023-10-02'),
(4, 2, 5, true, '2023-12-29'),
(5, 2, 1, true, '2024-01-18'),
(6, 3, 3, true, '2024-07-08'),
(7, 1, 2, false, '2024-03-18'),
(8, 3, 4, true, '2024-08-22'),
(9, 3, 5, false, '2024-06-21'),
(10, 5, 1, false, '2024-01-06');


-----Activity-------
--1-----------------
SELECT * FROM Users
WHERE DateOfBirth BETWEEN '2000-01-01' AND '2004-12-31';
--2-----------------
SELECT * FROM Posts
WHERE PostedBy = 4;
--3-----------------
SELECT Groupname
FROM Groups;
--4-----------------
SELECT * FROM GroupMembershipRequests
WHERE GroupMemberUserID = 2;
--5-----------------
SELECT * FROM Friends
WHERE FriendWhoAdded = 2 OR FriendBeingAdded = 2 AND IsAccepted = 1;
--6-----------------
SELECT * FROM Friends
WHERE FriendWhoAdded = 1;
--7-----------------
SELECT * FROM Posts
WHERE GroupID = 2 AND IsPublic = 0 AND IsOnlyForFriends = 0;
--8-----------------
SELECT * FROM GroupMembershipRequests
WHERE GroupID = 2 AND IsGroupMemberShipAccepted = 0;



