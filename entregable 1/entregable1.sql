CREATE TABLE "users" (
  "id" uuid PRIMARY KEY,
  "role_id" uuid NOT NULL,
  "name" varchar NOT NULL,
  "email" varchar UNIQUE NOT NULL,
  "password" varchar NOT NULL,
  "age" int NOT NULL
);

CREATE TABLE "courses" (
  "id" uuid PRIMARY KEY,
  "user_id" uuid NOT NULL,
  "title" varchar,
  "decription" varchar NOT NULL,
  "level" varchar NOT NULL,
  "teacher" varchar NOT NULL,
  "category_id" uuid NOT NULL
);

CREATE TABLE "course_video" (
  "id" uuid PRIMARY KEY,
  "courses_id" uuid NOT NULL,
  "title" varchar NOT NULL,
  "url" varchar UNIQUE NOT NULL
);

CREATE TABLE "categories" (
  "id" uuid PRIMARY KEY,
  "name" varchar NOT NULL
);

CREATE TABLE "roles" (
  "id" uuid PRIMARY KEY,
  "name" varchar NOT NULL
);

ALTER TABLE "courses" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("category_id") REFERENCES "categories" ("id");

ALTER TABLE "users" ADD FOREIGN KEY ("role_id") REFERENCES "roles" ("id");

ALTER TABLE "course_video" ADD FOREIGN KEY ("courses_id") REFERENCES "courses" ("id");



-- add users roles
insert into roles ( id,name) values 
('3ae7ecba-a311-47cd-9c75-68de60358242', 'Admin'),
('7494bacb-bde1-4fe3-b448-9431ef766009','student'),
('a86f7fdb-f987-4148-a50a-03c4bcd7b3d4','teacher');

--add users
insert into users (id, role_id,name,password,email,age) values 
('a05ebe22-1872-406e-81fa-8182eaccd2da', '3ae7ecba-a311-47cd-9c75-68de60358242','nelson', 'root', 'nelson.k@gmail.com','28'),
('2d253f3f-aba2-42e7-af61-7c36e873c4be', '7494bacb-bde1-4fe3-b448-9431ef766009','juan', 'root123', 'juanpepe@gmail.com','22'),
('21170225-e760-44fc-98ca-d6b4d7ce6c9e', 'a86f7fdb-f987-4148-a50a-03c4bcd7b3d4','pepito', 'root321', 'pepito@gmail.com','19');

--add categories for courses
insert into categories  ( id, name) values 
('689c509f-0d1a-4f6f-99b9-18ce620410f1', 'SQL'),
('f4e62bfd-5551-4c5f-ab05-87e2aad5ef9c', 'NEXT.JS'),
('76e48961-8d10-4b61-95e1-6e260dbc145e','NODE');

--add courses
insert into courses (id, user_id, title,decription,level,teacher,category_id) values
('4716864a-99af-4a01-92ff-03faceb0d39c','2d253f3f-aba2-42e7-af61-7c36e873c4be', 'Sql advanced', 'Take your SQL skills to the next level',' advanced','pepitoSenior', '689c509f-0d1a-4f6f-99b9-18ce620410f1' ),
('37bc7641-a96d-4c02-be88-5ad916083017','2d253f3f-aba2-42e7-af61-7c36e873c4be', 'Next.js mid leve', ' improve your skills Next React','mid', 'JoseM', 'f4e62bfd-5551-4c5f-ab05-87e2aad5ef9c' ),
('56258e6f-0080-4999-aa3e-82829515f1de','2d253f3f-aba2-42e7-af61-7c36e873c4be', 'Node Module', 'Getting Started Guide', 'Noob', 'maria', '76e48961-8d10-4b61-95e1-6e260dbc145e');

-- add course video.
insert into course_video (id, courses_id,title,url) values 
('0ac11d06-2334-4a43-9c4f-4f367c667982','4716864a-99af-4a01-92ff-03faceb0d39c', 'Sql Advanced 1', 'https://academlo.notion.site' ),
('16c8a76a-f32d-4832-b2a1-6b8d85aba360','37bc7641-a96d-4c02-be88-5ad916083017', 'Next.js 1', 'https://academlo.notion.site/next.js'),
('74a44b4c-e9d7-470a-956a-0a24d986b863','56258e6f-0080-4999-aa3e-82829515f1de','Node part 1', 'https://academlo.notion.site/node.1');





--- normalizando 

CREATE TABLE "courses_video" (
  "id" uuid PRIMARY KEY,
  "course_id" uuid,
  "title_id_courses" uuid,
  "url" varchar
);

CREATE TABLE "title_id_courses" (
  "id" uuid PRIMARY KEY,
  "title" varchar
);

CREATE TABLE "courses" (
  "id" uuid PRIMARY KEY,
  "users_id" uuid,
  "title_id" uuid,
  "descripcion_id" uuid,
  "level" varchar,
  "teacher" uuid,
  "catergory_id" uuid
);

CREATE TABLE "title_id" (
  "id" uuid PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "descripcion_id" (
  "id" uuid PRIMARY KEY,
  "descripcion" varchar
);

CREATE TABLE "teacher_id" (
  "id" uuid PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "users" (
  "id" uuid PRIMARY KEY,
  "role_id" uuid NOT NULL,
  "name" varchar NOT NULL,
  "email" varchar UNIQUE NOT NULL,
  "password" varchar NOT NULL,
  "age" int NOT NULL
);

CREATE TABLE "roles" (
  "id" uuid PRIMARY KEY,
  "name" varchar NOT NULL
);

CREATE TABLE "categories" (
  "id" uuid PRIMARY KEY,
  "name" varchar NOT NULL
);

ALTER TABLE "courses" ADD FOREIGN KEY ("descripcion_id") REFERENCES "descripcion_id" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("teacher") REFERENCES "teacher_id" ("id");

ALTER TABLE "courses_video" ADD FOREIGN KEY ("title_id_courses") REFERENCES "title_id_courses" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("title_id") REFERENCES "title_id" ("id");

ALTER TABLE "courses_video" ADD FOREIGN KEY ("course_id") REFERENCES "courses" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("users_id") REFERENCES "users" ("id");

ALTER TABLE "users" ADD FOREIGN KEY ("role_id") REFERENCES "roles" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("catergory_id") REFERENCES "categories" ("id");





