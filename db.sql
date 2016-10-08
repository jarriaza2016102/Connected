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
	value_str VARCHAR(255) NULL,
	value_int INT NULL,
	value_dbl FLOAT NULL,
	value_date DATE NULL,
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
