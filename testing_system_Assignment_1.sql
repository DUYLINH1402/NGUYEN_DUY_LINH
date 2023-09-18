DROP DATABASE IF EXISTS testing_system_assignment_1;
CREATE DATABASE testing_system_assignment_1;
USE testing_system_assignment_1;

CREATE TABLE Department(
	DepartmentID					INT,
    DepartmentName			VARCHAR(50)
);

CREATE TABLE `Position`(
	PositionID							INT,
	PositionName						VARCHAR(50)
);

CREATE TABLE `Account`(
	AccountID							INT,
	Email								VARCHAR(60),
	Username							VARCHAR(60),
	Fullname							VARCHAR(60),
	DepartmentID						INT,
	PositionID							INT,
	CreateDate							DATE
);

CREATE TABLE `Group`(
	GroupID								INT,
	GroupName							VARCHAR(50),
	CreatorID							INT,
	CreateDate							DATE
);

CREATE TABLE GroupAccount(
	GroupID								INT,
	AccountID							VARCHAR(50),
	JoinDate							DATE
);

CREATE TABLE TypeQuestion(
	TypeID								INT,
	TypeName							VARCHAR(50)
);

CREATE TABLE CategoryQuestion(
	CategoryID							INT,
	CategoryName						VARCHAR(500)
);

CREATE TABLE Question(
	QuestionID							INT,
	Content								VARCHAR(50),
	CategoryID							INT,
	TypeID								INT,
    CreatorID							INT,
	CreateDate							DATE
);
    
CREATE TABLE Answer(
	AnswerID							INT,
	Content								VARCHAR(50),
	QuestionID							INT,
	isCorrect							INT
);

CREATE TABLE Exam(
	ExamID								INT,
	`Code`								VARCHAR(100),
	Title								VARCHAR(100),
	CategoryID							INT,
    Duration							INT,
	CreatorID							INT,
    CreateDate							DATE
);

CREATE TABLE ExamQuestion(
	ExamID								INT,
	QuestionID							INT
);
ALTER TABLE ExamQuestion
ADD COLUMN date_of_purchase DATE;
RENAME TABLE ExamQuestion to ExamQuestion_Data;
