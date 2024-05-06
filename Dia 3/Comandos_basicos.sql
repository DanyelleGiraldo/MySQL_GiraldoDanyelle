create DATABASE Escuela;
use Escuela;

create table persona(
	id int(10) primary key not null,
    nif varchar(9) not null,
    nombre varchar(25) not null,
    apellido1 varchar(50) not null,
    apellido2 varchar(50) not null,
    ciudad varchar(25) not null,
    direccion varchar(50) not null,
    telefono varchar(10) not null,
    fecha_nacimiento datetime not null,
    sexo enum('h','m') not null,
    tipo enum('p','a') not null
);

create table departamento(
	id_departamento int(10) primary key not null,
    nombre varchar(50)
);

create table profesor(
	id_profesor int(10) not null,
    id_departamento int,
    foreign key (id_profesor) references persona(id),
    foreign key (id_departamento) references departamento(id_departamento)
);

create table curso_escolar(
	id_curso_escolar int(10) primary key not null,
    año_inicio year(4),
    año_fin year(4)
);

create table grado(
	id_grado int(10) primary key,
    nombre varchar(100)
);

create table asignatura(
	id_asignatura int(10) primary key,
    nombre varchar(100),
    creditos float,
    tipo enum('Ob','Op'),
    curso tinyint(3),
    id_profesor int(10),
    id_grado int(10),
    foreign key (id_profesor) references profesor(id_profesor),
    foreign key (id_grado) references grado(id_grado)
);

create table alumno_se_matricula_asignatura(
	id_alumno int(10),
    foreign key (id_alumno) references persona(id),
    id_asignatura int(10),
    foreign key (id_asignatura) references asignatura(id_asignatura),
    id_curso_escolar int(10),
    foreign key (id_curso_escolar) references curso_escolar(id_curso_escolar)
);