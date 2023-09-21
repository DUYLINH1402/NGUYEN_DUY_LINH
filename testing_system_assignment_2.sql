DROP DATABASE IF EXISTS Testing_System_Assignment_1;
CREATE DATABASE Testing_System_Assignment_1;
USE Testing_System_Assignment_1;

DROP DATABASE IF EXISTS Department;
CREATE TABLE Department(
	DepartmentID					INT PRIMARY KEY AUTO_INCREMENT,
    DepartmentName					VARCHAR(50) NOT NULL UNIQUE KEY
);
INSERT INTO Department(DepartmentName) VALUES 	('Nhan su'),
												('ky thuat'),
												('ke toan'),
												('tap vu'),
												('bao tri');
DROP DATABASE IF EXISTS `Position`;
CREATE TABLE `Position`(
	PositionID							INT PRIMARY KEY AUTO_INCREMENT,
	PositionName						ENUM('Dev', 'Test', 'Scrum Master', 'PM')
);
INSERT INTO `Position`(PositionName) VALUES 	('Dev'),
												('Test'),
												('Scrum Master'),
												('PM'),
												('Dev');
DROP DATABASE IF EXISTS  `Account`;
CREATE TABLE `Account`(
	AccountID							INT PRIMARY KEY,
	Email								VARCHAR(60) NOT NULL UNIQUE KEY,
	Username							VARCHAR(60) NOT NULL,
	Fullname							VARCHAR(60) NOT NULL,
	DepartmentID						INT,
	PositionID							TINYINT,
	CreateDate							DATE DEFAULT ('2023-09-21')
);
ALTER TABLE `Account` ADD CONSTRAINT fk_01 FOREIGN KEY (DepartmentID) REFERENCES department(DepartmentID);
INSERT INTO `Account`(accountid,email,username,fullname) VALUES 
(001,'1duylinh@gmail.com','duylinh1','nguyen duy linh 1'),
(002,'2duylinh@gmail.com','duylinh2','nguyen duy linh 2'),
(003,'3duylinh@gmail.com','duylinh3','nguyen duy linh 3'),
(004,'4duylinh@gmail.com','duylinh4','nguyen duy linh 4'),
(005,'5duylinh@gmail.com','duylinh5','nguyen duy linh 5');

DROP DATABASE IF EXISTS  `Group`;
CREATE TABLE `Group`(
	GroupID								INT PRIMARY KEY AUTO_INCREMENT,
	GroupName							VARCHAR(50) NOT NULL,
	CreatorID							INT ,
	CreateDate							DATE DEFAULT ('2023-09-21')
);
INSERT INTO `Group`(GroupName,CreatorID)
VALUES ('VTI_ACADEMY_1',001),
		('VTI_ACADEMY_2',001),
        ('VTI_ACADEMY_3',001),
        ('VTI_ACADEMY_4',001),
        ('VTI_ACADEMY_5',001);
DROP DATABASE IF EXISTS  GroupAccount;
CREATE TABLE GroupAccount(
	GroupID								INT,
	AccountID							VARCHAR(50) UNIQUE KEY,
	JoinDate							DATE DEFAULT ('2023-09-21')
);

INSERT INTO GroupAccount(GroupID,AccountID)
VALUES 	(001,'A123'),
		(002,'A456'),
		(003,'A789'),
		(004,'A246'),
		(005,'A357');
      
DROP DATABASE IF EXISTS  TypeQuestion;
CREATE TABLE TypeQuestion(
	TypeID								INT PRIMARY KEY AUTO_INCREMENT,
	TypeName							ENUM ('Essay', 'Multiple-Choice')
);
INSERT INTO TypeQuestion(TypeName) VALUES	 ('Essay'),
											('Multiple-Choice'),
											('Essay'),
											('Multiple-Choice'),
											('Multiple-Choice');
                                            
DROP DATABASE IF EXISTS  CategoryQuestion;
CREATE TABLE CategoryQuestion(
	CategoryID							INT PRIMARY KEY AUTO_INCREMENT,
	CategoryName						VARCHAR(500)
);
INSERT INTO CategoryQuestion(CategoryName) VALUES 	('TRAC_NGHIEM'),
													('DUNG_SAI'),
													('TRAC_NGHIEM'),
													('TU_LUAN'),
													('SUY_LUAN');

DROP DATABASE IF EXISTS  Question;
CREATE TABLE Question(
	QuestionID							INT PRIMARY KEY AUTO_INCREMENT,
	Content								VARCHAR(50),
	CategoryID							INT,
	TypeID								INT,
    CreatorID							INT,
	CreateDate							DATE
);

INSERT INTO  Question(Content,CategoryID,TypeID) VALUES 	('NOI_DUNG_QUESTION',0001,1000),
																	('NOI_DUNG_QUESTION',0002,2000),
																	('NOI_DUNG_QUESTION',0003,3000),
																	('NOI_DUNG_QUESTION',0004,4000),
																	('NOI_DUNG_QUESTION',0005,5000);
    
DROP DATABASE IF EXISTS Answer;
CREATE TABLE Answer(
	AnswerID							INT PRIMARY KEY AUTO_INCREMENT,
	Content								VARCHAR(50),
	QuestionID							INT,
	isCorrect							INT
);
INSERT INTO Answer(Content) VALUES 	('NOI_DUNG_ANSWER'),
									('NOI_DUNG_ANSWER'),
									('NOI_DUNG_ANSWER'),
									('NOI_DUNG_ANSWER'),
									('NOI_DUNG_ANSWER');

DROP DATABASE IF EXISTS  Exam;
CREATE TABLE Exam(
	ExamID								INT PRIMARY KEY AUTO_INCREMENT,
	`Code`								VARCHAR(100),
	Title								VARCHAR(100),
	CategoryID							INT,
    Duration							INT,
	CreatorID							INT,
    CreateDate							DATE
);
INSERT INTO Exam(`Code`,Title,Duration) VALUES ('AVASDV15','TIEU DE',90),
												('ADVSA55','TIEU DE',120),
												('AVASDHMH85','TIEU DE',60),
												('AVASDREYNR3','TIEU DE',15),
												('AVASDSWQV','TIEU DE',180);

DROP DATABASE IF EXISTS ExamQuestion;
CREATE TABLE ExamQuestion(
	ExamID								INT PRIMARY KEY AUTO_INCREMENT,
	QuestionID							INT
);