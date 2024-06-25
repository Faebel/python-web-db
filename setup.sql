--
-- Example setup file for a web database project.
--

-- create user and grant privileges to user
create user '<example_user>'@'%' identified by '<example_password>';
grant all on web_database_project.* to '<example_user>'@'%';
flush privileges;

-- select the database and create tables
use web_database_project;
create table book(
    id int not null auto_increment primary key,
    title varchar(255) not null
);

-- insert data into database
insert into book(title) values ('How to Build a Computer');
insert into book(title) values ('How to Boot a Computer');
insert into book(title) values ('How to Reboot a Computer');
insert into book(title) values ('How to Make a Computer Do What You Want');
insert into book(title) values ('How to Turn Off a Computer');
insert into book(title) values ('How to Go Outside and Play');
INSERT INTO book(title) VALUES ('Der Name der Rose');
INSERT INTO book(title) VALUES ('Der Hobbit');
INSERT INTO book(title) VALUES ('Alles steht Kopf');
INSERT INTO book(title) VALUES ('Homo Deus: Eine kurze Geschichte von Morgen');
INSERT INTO book(title) VALUES ('Sapiens: Eine kurze Geschichte der Menschheit');
INSERT INTO book(title) VALUES ('Das Mädchen mit dem Drachentätowierung');
INSERT INTO book(title) VALUES ('Der Teufel trägt Prada');
INSERT INTO book(title) VALUES ('Die Tribute von Panem');
INSERT INTO book(title) VALUES ('Harry Potter und der Stein der Weisen');
INSERT INTO book(title) VALUES ('Das Schicksal ist ein mieser Verräter');
INSERT INTO book(title) VALUES ('Der Wind in den Weiden');
INSERT INTO book(title) VALUES ('Die unendliche Geschichte');
INSERT INTO book(title) VALUES ('Der Hundertjährige, der aus dem Fenster kletterte und verschwand');
INSERT INTO book(title) VALUES ('Die vergessene Stadt der Inka');
