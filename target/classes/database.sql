-- Table: users
CREATE TABLE users (
  id       INT          NOT NULL AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL
)
  ENGINE = InnoDB;

-- Table: roles
CREATE TABLE roles (
  id   INT          NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL
)
  ENGINE = InnoDB;

-- Table for mapping user and roles: user_roles
CREATE TABLE user_roles (
  user_id INT NOT NULL,
  role_id INT NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users (id),
  FOREIGN KEY (role_id) REFERENCES roles (id),

  UNIQUE (user_id, role_id)
)
  ENGINE = InnoDB;
  
-- table: books
 create table books(
  ID INT NOT NULL AUTO_INCREMENT,
  BOOK_TITLE VARCHAR(255) NOT NULL,
  BOOK_AUTHOR VARCHAR(255) NOT NULL,
  BOOK_PRICE INT NOT NULL,
  PRIMARY KEY (ID)
 )
 ENGINE = InnoDB;

-- Insert data

INSERT INTO users VALUES (1, 'maxshkurko', '$2a$11$uSXS6rLJ91WjgOHhEGDx..VGs7MkKZV68Lv5r1uwFu7HgtRn3dcXG');

INSERT INTO roles VALUES (1, 'ROLE_USER');
INSERT INTO roles VALUES (2, 'ROLE_ADMIN');

INSERT INTO user_roles VALUES (1, 2);

INSERT INTO books (ID, BOOK_TITLE, BOOK_AUTHOR, BOOK_PRICE) VALUES ('1', 'First Book', 'First Author', '30000');
INSERT INTO books (ID, BOOK_TITLE, BOOK_AUTHOR, BOOK_PRICE) VALUES ('2', 'Second Book', 'Second Author', '20000');
INSERT INTO books (ID, BOOK_TITLE, BOOK_AUTHOR, BOOK_PRICE) VALUES ('3', 'Third Book', 'Third Author', '15000');
INSERT INTO books (ID, BOOK_TITLE, BOOK_AUTHOR, BOOK_PRICE) VALUES ('4', 'Fourth Book', 'Fourth Author', '25000');
INSERT INTO books (ID, BOOK_TITLE, BOOK_AUTHOR, BOOK_PRICE) VALUES ('5', 'Fifth Book', 'Fifth Author', '80000');
INSERT INTO books (ID, BOOK_TITLE, BOOK_AUTHOR, BOOK_PRICE) VALUES ('6', 'Sixth Book', 'Sixth Author', '50000');