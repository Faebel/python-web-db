--
-- Example setup file for a web database project.
--

-- create database and user, grant privileges to user
create database ${MYSQL_DATABASE};
create user '${MYSQL_USER}'@'%' identified by '${MYSQL_PASSWORD}';
grant all on ${MYSQL_DATABASE}.* to '${MYSQL_USER}'@'%';
flush privileges;

-- select the database and create tables
use ${MYSQL_DATABASE};
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
