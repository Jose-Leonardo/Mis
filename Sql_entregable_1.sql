--tabla de usuarios ---------------------
create table users( 
  id uuid Primary key,
  name varchar not null,
  email varchar not null unique,
  age int not null,
  password1 int not null unique
);
--Tabla de Categorias-----------------
create table Categories( 
  id uuid Primary key,
  name varchar not null,
  id_foreign uuid not null
);
--tabla de cursos--------------------
create table Courses( 
  id uuid Primary key,
  title varchar not null,
  description varchar not null,
  level varchar not null,
  teacher varchar not null,
  review int not null,
  id_foreign uuid not null
);
--tebla de roles------------------
create table roles( 
  id uuid Primary key,
  student varchar not null,
  teacher varchar not null,
  admin varchar not null,
  id_foreign uuid not null
);
--Tabla de cursos video -----------
create table CourseVideo( 
  id uuid Primary key,
  title varchar not null,
  url varchar not null,
  id_foreign uuid not null
);
--DAtos de los usuarios -----------
insert into users(
	id,
	name,
	email,
	age,
	password1
)values(
	'86e883b3-37fe-4340-8b55-e42fe81d007e',
	'Leonardo',
	'augl020225gamil.com',
	21,
	3310),(
	'f767ea92-c781-46fb-8b9a-1a41f4a305ff',
	'Rodo',
	'Rodogamil.com',
	24,
	0733);
	
select * from users ;
--Datos de Categorias --------------------------
insert into Categories (
	id,
	name,
	id_foreign
)values(
	'd8ad9d30-5134-43c0-9367-d9d8ed2a2355',
	'Jacrip',
	'86e883b3-37fe-4340-8b55-e42fe81d007e'),(
	'6911abb1-b3b9-49d8-8f06-9cf16f2aebd2',
	'Css',
	'f767ea92-c781-46fb-8b9a-1a41f4a305ff');
---entrelasar las tablas--------------------------
select * from categories ;
alter table "categories" add foreign key ("id_foreign") references "users"("id");
---Datos de cursos ---------------------------------
insert into courses (
	id,
	title,
	description,
	level,
	teacher,
	review,
	id_foreign
)values(
	'c61950f5-5271-488b-8491-1b43f6c3ada0',
	'Introducion a JS',
	'abordaremos conocimientos basicos de e intermedio sobre js',
	'medio',
	'Juan Carlos',
	50,
	'd8ad9d30-5134-43c0-9367-d9d8ed2a2355'
	),(
	'77868e73-1904-429c-b152-7a390c6d6818',
	'Css avanzado',
	'abordaremos conocimientos avanzados de Css, como animation',
	'Avanzado',
	'Jose Garcia',
	30,
	'6911abb1-b3b9-49d8-8f06-9cf16f2aebd2');
---entrelasar las tablas--------------------------
select * from courses ;
alter table courses add foreign key ("id_foreign") references "categories"("id");
---Llenar tabla de Roles-----------------------------
insert into roles (
	id,
	student,
	teacher,
	admin,
	id_foreign
)values(
	'1e6cc096-e5ed-428b-aa6f-64be85602e08',
	'Rodo',
	'Jose Garcia',
	'dios',
	'77868e73-1904-429c-b152-7a390c6d6818'),(
	'233a640b-7feb-4c49-b954-5f7e65716c1f',
	'Leonardo',
	'Juan Carlos',
	'jesus',
	'c61950f5-5271-488b-8491-1b43f6c3ada0');
---entrelasar las tablas--------------------------
select * from roles ;
alter table roles add foreign key ("id_foreign") references "courses"("id");
---Llenar tabla de Roles-----------------------------
insert into coursevideo(
	id,
	title,
	url,
	id_foreign
)values(
	'c32b3a39-74e3-4c91-9168-7dc1ed8ab2bb',
	'Css avanzado',
	'https://www.youtube.com/results?search_query=css+avansado',
	'77868e73-1904-429c-b152-7a390c6d6818'),(
	'323bc96e-4413-4c51-bd25-92cfa9fc9079',
	'Introduccion a JS',
	'https://www.youtube.com/results?search_query=introducing+js',
	'c61950f5-5271-488b-8491-1b43f6c3ada0');
---entrelasar las tablas--------------------------
select * from coursevideo;
alter table coursevideo  add foreign key ("id_foreign") references "courses"("id");
/*-----------------join inplicitamente ------------------------------*/

select * from users, categories where users.id = categories.id_foreign;

/*---------------join inplicitamente --------------------------------*/

select * from users inner join categories on users.id = categories.id_foreign;

---Crear nueva tabla que que tontenga todods los datos- tabla normalizadora---
create table normalizar( 
  id_users uuid not null,
  id_categori uuid not null,
  id_courses uuid not null,
  id_roles uuid not null,
  id_coursesvideo uuid not null
);
---coloco los datos correspondientes de las tablas --------------
insert into normalizar(
  id_users,
  id_categori,
  id_courses,
  id_roles,
  id_coursesvideo
)values(
	'86e883b3-37fe-4340-8b55-e42fe81d007e',
	'd8ad9d30-5134-43c0-9367-d9d8ed2a2355',
	'c61950f5-5271-488b-8491-1b43f6c3ada0',
	'233a640b-7feb-4c49-b954-5f7e65716c1f',
	'323bc96e-4413-4c51-bd25-92cfa9fc9079' ),(
	'f767ea92-c781-46fb-8b9a-1a41f4a305ff',
	'6911abb1-b3b9-49d8-8f06-9cf16f2aebd2',
	'77868e73-1904-429c-b152-7a390c6d6818',
	'1e6cc096-e5ed-428b-aa6f-64be85602e08',
	'c32b3a39-74e3-4c91-9168-7dc1ed8ab2bb' );
---relaciono las tablas correspondientes --------------
select * from normalizar;
alter table normalizar  add foreign key ("id_courses") references "courses"("id");
alter table normalizar  add foreign key ("id_users") references "users"("id");
alter table normalizar  add foreign key ("id_categori") references "categories"("id");
alter table normalizar  add foreign key ("id_roles") references "roles"("id");
alter table normalizar  add foreign key ("id_coursesvideo") references "coursevideo"("id");