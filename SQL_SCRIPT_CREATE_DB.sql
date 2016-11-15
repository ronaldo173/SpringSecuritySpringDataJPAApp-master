CREATE database if not exists music_site;
use music_site;
DROP TABLE IF EXISTS user_roles;
DROP TABLE IF EXISTS users;
CREATE  TABLE users (
  userid int(11) NOT NULL AUTO_INCREMENT,
  username VARCHAR(45) NOT NULL,
  email VARCHAR(255) NOT NULL,
  password VARCHAR(60) NOT NULL ,
  enabled TINYINT NOT NULL DEFAULT 1 ,
  PRIMARY KEY (userid));
  
CREATE TABLE user_roles (
  user_role_id int(11) NOT NULL AUTO_INCREMENT,
  userid int(11) NOT NULL,
  role varchar(45) NOT NULL,
  PRIMARY KEY (user_role_id),
  UNIQUE KEY uni_userid_role (role,userid),
  KEY fk_user_idx (userid),
  CONSTRAINT fk_userid FOREIGN KEY (userid) REFERENCES users (userid));

INSERT INTO users(username,email,password,enabled)
VALUES ('priya','abc@abc.com','$2a$04$CO93CT2ObgMiSnMAWwoBkeFObJlMYi/wzzOnPlsTP44r7qVq0Jln2', true);
INSERT INTO users(username,email,password,enabled)
VALUES ('naveen','def@def.com','$2a$04$j3JpPUp6CTAe.kMWmdRNC.Wie58xDNPfcYz0DBJxWkucJ6ekJuiJm', true);

INSERT INTO user_roles (userid, role)
VALUES (001, 'ROLE_USER');
INSERT INTO user_roles (userid, role)
VALUES (002, 'ROLE_ADMIN');

DROP TABLE IF EXISTS music_comments;
DROP TABLE IF EXISTS music;
CREATE  TABLE music (
  id int(11) NOT NULL AUTO_INCREMENT,
  name VARCHAR(45) NOT NULL,
  content longblob not null,
  PRIMARY KEY (id));
  
  CREATE  TABLE music_comments (
  id int(11) NOT NULL AUTO_INCREMENT,
  id_music int(11) not null,
  comment text not null,
  PRIMARY KEY (id),
  FOREIGN KEY (id_music) REFERENCES music(id)
  );
  
  SHOW VARIABLES WHERE variable_name = 'max_allowed_packet';
SET GLOBAL max_allowed_packet=16777216;

 
