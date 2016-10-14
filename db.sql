-- Status 0 = inactive, 1 = active, 2 = account deleted, 3 = blocked
-- user_id = master user, user_id_2 = slave user
-- DDL --
-- Store the roles
CREATE TABLE Rol(
	id INT AUTO_INCREMENT PRIMARY KEY,
	label VARCHAR(100) NOT NULL
);
-- Store the users
CREATE TABLE Users(
	id INT AUTO_INCREMENT PRIMARY KEY,
	email VARCHAR(255) UNIQUE NOT NULL,
	fullName VARCHAR(200) NOT NULL,
	password VARCHAR(255) NOT NULL,
	birthady Date NOT NULL,
	status INT DEFAULT 0,
	token VARCHAR(255) NOT NULL,
	rol_id INT NOT NULL,
	created_at DATE NOT NULL,
	updated_at DATE NOT NULL,
	deleted_at DATE NOT NULL,
	FOREIGN KEY ( rol_id ) REFERENCES Rol(id) ON DELETE CASCADE
);
-- It will store the other user information
-- Type 1 = string, 2 = int, 3 = double, 4 = date
CREATE TABLE Data(
	id INT AUTO_INCREMENT PRIMARY KEY,
	label VARCHAR(255) NOT NULL,
	type INT NOT NULL
);
-- It will make the relation between Data and Users
CREATE TABLE User_Data(
	user_id INT NOT NULL,
	data_id INT NOT NULL,
	value_ VARCHAR(255) NULL,
	created_at DATE NOT NULL,
	updated_at DATE NOT NULL,
	deleted_at DATE NOT NULL,
	FOREIGN KEY ( user_id ) REFERENCES Users(id) ON DELETE CASCADE,
	FOREIGN KEY ( data_id ) REFERENCES Data(id) ON DELETE CASCADE,
	PRIMARY KEY ( user_id, data_id )
);
-- Blocked people table
CREATE TABLE BlockedUsers(
	user_id INT NOT NULL,
	user_id_2 INT NOT NULL,
	FOREIGN KEY ( user_id ) REFERENCES Users(id) ON DELETE CASCADE,
	FOREIGN KEY ( user_id_2 ) REFERENCES Users(id) ON DELETE CASCADE,
	PRIMARY KEY( user_id, user_id_2 )
);
-- Blocked reason table
CREATE TABLE BlockedReason(
	id INT AUTO_INCREMENT PRIMARY KEY,
	reference_id INT NOT NULL,
	reason TEXT NOT NULL,
	created_at DATE NOT NULL,
	updated_at DATE NOT NULL,
	deleted_at DATE NOT NULL,
	reference VARCHAR(100) NOT NULL
);
CREATE TABLE Publications(
	id INT AUTO_INCREMENT PRIMARY KEY,
	value TEXT NOT NULL,
	user_id INT NOT NULL,
	status INT NOT NULL,
	created_at DATE NOT NULL,
	updated_at DATE NOT NULL,
	deleted_at DATE NOT NULL,
	FOREIGN KEY ( user_id ) REFERENCES Users(id) ON DELETE CASCADE
);
CREATE TABLE Comments(
	id INT AUTO_INCREMENT PRIMARY KEY,
	user_id INT NOT NULL,
	reference_id INT NOT NULL,
	reference_table VARCHAR(100) NOT NULL,
	content TEXT NOT NULL,
	status INT NOT NULL,
	created_at DATE NOT NULL,
	updated_at DATE NOT NULL,
	deleted_at DATE NOT NULL
);
CREATE TABLE Valorations(
	user_id INT NOT NULL,
	reference_id INT NOT NULL,
	reference_table VARCHAR(100) NOT NULL,
	valoration INT NOT NULL,
	PRIMARY KEY(user_id, reference_id),
	FOREIGN KEY (user_id) REFERENCES Users(id) ON DELETE CASCADE
);
CREATE TABLE Conversations(
	id INT AUTO_INCREMENT PRIMARY KEY,
	owner_user_id INT NOT NULL,
	user_id INT NOT NULL,
	user_id_2 INT NOT NULL,
	created_at DATE NOT NULL,
	updated_at DATE NOT NULL,
	deleted_at DATE NOT NULL,
	FOREIGN KEY ( user_id ) REFERENCES Users(id) ON DELETE CASCADE,
	FOREIGN KEY ( user_id_2 ) REFERENCES Users(id) ON DELETE CASCADE
);
CREATE TABLE Messages(
	id INT AUTO_INCREMENT PRIMARY KEY,
	message TEXT NOT NULL,
	from_user_id INT NOT NULL,
	to_user_id INT NOT NULL,
	conversation_id INT NOT NULL,
	viewed INT NOT NULL,
	view_at DATE NULL,
	deleted_by INT NOT NULL,
	created_at DATE NOT NULL,
	FOREIGN KEY ( from_user_id ) REFERENCES Users(id) ON DELETE CASCADE,
	FOREIGN KEY ( to_user_id ) REFERENCES Users(id) ON DELETE CASCADE,
	FOREIGN KEY ( conversation_id ) REFERENCES Conversations(id) ON DELETE CASCADE
);
-- DML --
-- ROL --
INSERT INTO Rol(label) VALUES('superadmin');
INSERT INTO Rol(label) VALUES('admin');
INSERT INTO Rol(label) VALUES('user');

INSERT INTO Data (label,type) VALUES('first_name',1);
INSERT INTO Data (label,type) VALUES('last_name',1);



INSERT INTO Users (email,fullName,password,birthday,status,token,rol_id) VALUES ('jarriaza2016102@gmail.com','Joseph Arriaza','fac42f5d4f5ca7f8738a688764fa1a38','10/03/1997',1,'0000000000000000',1);


DELIMITER $$
CREATE PROCEDURE `auth_user`(
  IN user_email VARCHAR(255),
  IN user_password VARCHAR(255)
)
BEGIN
  SELECT * FROM Users WHERE email = user_email AND password = user_password;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `reg_user`(
  	IN user_email VARCHAR(255),
  	IN user_password VARCHAR(255),
    IN first_name VARCHAR(100),
    IN last_name VARCHAR(100)
)
BEGIN
	INSERT INTO Users (email,fullName,password,birthday,status,token,rol_id) VALUES (user_email,CONCAT( first_name, " ", last_name ),user_password,'0000-00-00',0,'0000000000000000',3);
	SET @last_id =  ( SELECT LAST_INSERT_ID() );
	SET @fn_data_id = (SELECT id FROM Data WHERE label = 'first_name');
	SET @ln_data_id = (SELECT id FROM Data WHERE label = 'last_name');
	INSERT INTO User_Data(user_id,data_id,value_) 
		VALUES ( @last_id, @fn_data_id, first_name );
	INSERT INTO User_Data(user_id,data_id,value_) 
		VALUES ( @last_id, @ln_data_id, last_name );
	SELECT id,email,fullName,rol_id FROM Users WHERE id = @last_id;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `verify_user`(
  IN user_email VARCHAR(255)
)
BEGIN
	SELECT COUNT(*) as number FROM Users WHERE email = user_email;
END $$
DELIMITER ;
