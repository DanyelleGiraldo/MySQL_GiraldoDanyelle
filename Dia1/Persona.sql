create database Campuslands;
use Campuslands;

create table horarios(
	id int not null auto_increment,
    primary key(id),
    horainicio varchar(6),
    horafinal varchar(6),
    nombre varchar(20)
);

create table salones(
	id int  not null auto_increment,
    primary key(id),
    nombre varchar(20),
	capacidad int
);

create table rutas(
	id int not null auto_increment,
    primary key (id),
    nombre varchar(20) not null,
    modulos varchar(20) not null,
    skills varchar(20) not null
);

create table profesores(
	id int not null auto_increment,
    primary key(id),
    nombre varchar(20) not null,
    apllido varchar(30) not null,
    ruta_id int, 
    foreign key(ruta_id) references rutas(id)
);

CREATE TABLE curso (
    id INT NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (id),
    nombre VARCHAR(20) NOT NULL,
    salon_id INT,
    horario_id INT,
    profesor_id int,
    foreign key(profesor_id) references profesores(id),
    FOREIGN KEY (salon_id) REFERENCES salones(id),
    FOREIGN KEY (horario_id) REFERENCES horarios(id)
);

CREATE TABLE grupo (
    id INT NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (id),
    nombre VARCHAR(50) NOT NULL,
    curso_id INT,
    FOREIGN KEY (curso_id) REFERENCES curso(id)
);

CREATE TABLE camper (
    Id INT NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (Id),
    Nombre VARCHAR(50) NOT NULL,
    Apellido VARCHAR(50) NOT NULL,
    Cedula VARCHAR(20) NOT NULL,
    Grupo_Id INT,
    FOREIGN KEY (Grupo_Id) REFERENCES grupo(id)
);
select * from horarios;
insert into horarios(horainicio,horafinal,nombre) values ("8:00", "10:00", "noche")

select * from salones;
insert into salones(nombre, capacidad) values ("Sputnik", 30);

select * from rutas;
insert into rutas(nombre, modulos, skills) values ("java", "5 modulos", "10 skills");

select * from profesores;
insert into profesores(nombre, apellido, ruta_id) values ("Camilo", "Ernesto", 1);

select * from curso;
insert into curso(nombre, salon_id, horario_id, profesor_id) values ("P4", 1, 1, 1);

select * from grupo;
insert into grupo(nombre, curso_id) values ("Tarde 1", 1);

SELECT * from camper;
insert into camper(Nombre, Apellido, Cedula, Grupo_Id) values ("Daniel", "Giraldo", "1098660852", 1)