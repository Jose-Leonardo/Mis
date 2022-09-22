create table users(
    id uuid,
    name varchar,
    email varchar,
    age int,
    height float,
    is_active bool
);
insert into users(
id,
name,
email,
age,
height,
is_active
) values (
'3d26cd4b-b215-4d6b-987f-e85fbb6c31c1',
'otro',
'otro@gamil.com',
21,
1.60,
false );
--estge es un comentario
--GET todos los usuarios

select * from users;
select id, name from users;
select id, name from users where is_active = true;
select id, name from users where is_active != true;
select id, name from users where age = 21;