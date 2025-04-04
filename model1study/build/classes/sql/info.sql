----/java/sql/info.sql
create table info (
	writer varchar(20) primary key,
	title varchar(50),
	content varchar(500)
)

select * from info