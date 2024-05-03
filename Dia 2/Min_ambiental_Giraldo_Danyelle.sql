create database miniseducacion
use miniseducacion

create table visitante(
    visitante_id int primary key,
    nombre varchar(30),
    direccion varchar(30),
    profesion varchar(30)
);

create table tipo_especie(
    tipo_id int primary key,
    nombre varchar(30)
);

create table especie(
    especie_id int primary key,
    deno_cliente varchar(30),
    deno_vulgar varchar(30),
    num_invt int,
    tipo_id int,
    area_id int,
    foreign key (tipo_id) references tipo_especie(tipo_id)
);

create table area(
    area_id int primary key,
    nombre varchar(30),
    extension varchar(8),
    parque_id int,
    especie_id int,
    foreign key (especie_id) references especie(especie_id)
);

create table parque(
    Parque_id int primary key,
    nombre varchar(30),
    dia_declarado datetime,
    extension varchar(8),
    area_id int,
    departamento_id int,
    alojamiento_id int,
    foreign key (area_id) references area(area_id),
    foreign key (alojamiento_id) references alojamiento(alojamiento_id)
);

create table alojamiento(
    alojamiento_id int primary key,
    capacidad int,
    categoria varchar(30),
    visitante_id int,
    foreign key (visitante_id) references visitante(visitante_id)
);

create table proyecto(
    proyecto_id int primary key,
    nombre varchar(30),
    presupuesto varchar(30),
    periodo_realizacion varchar(30)
);

create table personal(
    personal_id int primary key,
    nombre varchar(30),
    direccion varchar(30),
    telefono varchar(20),
    sueldo varchar(20),
    tipo_persona_id int,
    foreign key (tipo_persona_id) references tipoPersona(tipo_id)
);

create table tipoPersona(
    tipo_id int primary key,
    nombre varchar(30)
);

create table departamento(
    departamento_id int primary key,
    parques_id int,
    nombre varchar(30),
    foreign key (parques_id) references parque(Parque_id)
);

INSERT INTO visitante (visitante_id, nombre, direccion, profesion) VALUES
(1, 'Juan Pérez', 'Calle 123', 'Ingeniero'),
(2, 'María García', 'Avenida Principal', 'Abogada'),
(3, 'Carlos Ramírez', 'Calle Central', 'Médico'),
(4, 'Ana Martínez', 'Carrera 45', 'Profesora'),
(5, 'Luis Rodríguez', 'Plaza Mayor', 'Arquitecto'),
(6, 'Laura Sánchez', 'Paseo del Bosque', 'Bióloga'),
(7, 'Pedro Gómez', 'Avenida del Río', 'Veterinario'),
(8, 'Sofía López', 'Calle de los Pájaros', 'Psicóloga'),
(9, 'Diego Fernández', 'Camino Real', 'Estudiante'),
(10, 'Valeria Pérez', 'Paseo de la Montaña', 'Contadora');

INSERT INTO tipo_especie (tipo_id, nombre) VALUES
(1, 'Mamífero'),
(2, 'Reptil'),
(3, 'Ave'),
(4, 'Anfibio'),
(5, 'Pez'),
(6, 'Invertebrado'),
(7, 'Planta'),
(8, 'Hongo'),
(9, 'Bacteria'),
(10, 'Protozoo');

INSERT INTO especie (especie_id, deno_cliente, deno_vulgar, num_invt, tipo_id, area_id) VALUES
(1, 'Canis lupus familiaris', 'Perro', 100, 1, 1),
(2, 'Panthera leo', 'León', 25, 1, 2),
(3, 'Tyrannosaurus rex', 'Tiranosaurio', 5, 2, 3),
(4, 'Gallus gallus domesticus', 'Gallina', 150, 3, 4),
(5, 'Bufo bufo', 'Sapo común', 75, 4, 5),
(6, 'Carassius auratus', 'Pez dorado', 200, 5, 6),
(7, 'Apis mellifera', 'Abeja', 300, 6, 7),
(8, 'Fagus sylvatica', 'Haya', 50, 7, 8),
(9, 'Agaricus bisporus', 'Champiñón', 80, 8, 9),
(10, 'Escherichia coli', 'E. coli', 500, 9, 10);

INSERT INTO area (area_id, nombre, extension, parque_id, especie_id) VALUES
(1, 'Área de mamíferos', '1000 m²', 1, 1),
(2, 'Área de felinos', '500 m²', 1, 2),
(3, 'Área de dinosaurios', '2000 m²', 1, 3),
(4, 'Área de aves', '800 m²', 2, 4),
(5, 'Área de anfibios', '400 m²', 2, 5),
(6, 'Área de peces', '1200 m²', 3, 6),
(7, 'Área de insectos', '600 m²', 3, 7),
(8, 'Área de plantas', '1500 m²', 4, 8),
(9, 'Área de hongos', '700 m²', 4, 9),
(10, 'Área de bacterias', '100 m²', 5, 10);

INSERT INTO parque (Parque_id, nombre, dia_declarado, extension, area_id, departamento_id, alojamiento_id) VALUES
(1, 'Parque Zoológico', '2022-01-01', '5000 m²', 1, 1, 1),
(2, 'Parque Nacional', '2022-03-15', '10000 m²', 2, 2, 2),
(3, 'Reserva Natural', '2022-05-20', '15000 m²', 3, 3, 3),
(4, 'Jardín Botánico', '2022-07-10', '2000 m²', 4, 4, 4),
(5, 'Parque Microscópico', '2022-09-05', '50 m²', 5, 5, 5);

INSERT INTO alojamiento (alojamiento_id, capacidad, categoria, visitante_id) VALUES
(1, 50, 'Cabaña', 1),
(2, 100, 'Hotel', 2),
(3, 30, 'Hostal', 3),
(4, 20, 'Cabaña', 4),
(5, 80, 'Hotel', 5),
(6, 40, 'Hostal', 6),
(7, 60, 'Cabaña', 7),
(8, 150, 'Hotel', 8),
(9, 25, 'Hostal', 9),
(10, 70, 'Cabaña', 10);

INSERT INTO proyecto (proyecto_id, nombre, presupuesto, periodo_realizacion) VALUES
(1, 'Conservación de mamíferos', '$100000', '2023-2025'),
(2, 'Investigación de aves migratorias', '$75000', '2023-2024'),
(3, 'Estudio de flora autóctona', '$50000', '2024-2026'),
(4, 'Preservación de especies endémicas', '$120000', '2022-2027'),
(5, 'Control de microorganismos patógenos', '$90000', '2025-2028');

INSERT INTO personal (personal_id, nombre, direccion, telefono, sueldo, tipo_persona_id) VALUES
(1, 'Roberto González', 'Calle Mayor', '+123456789', '$50000', 1),
(2, 'María Soto', 'Avenida Sur', '+987654321', '$60000', 2),
(3, 'Jorge García', 'Carrera Norte', '+1122334455', '$70000', 3),
(4, 'Laura Martínez', 'Paseo Este', '+9988776655', '$55000', 4),
(5, 'Pedro Pérez', 'Camino Oeste', '+5544332211', '$65000', 5),
(6, 'Sofía López', 'Ruta Central', '+6677889900', '$75000', 6),
(7, 'Diego Fernández', 'Vía Lateral', '+3355778899', '$48000', 7),
(8, 'Valeria Pérez', 'Carretera Principal', '+2211334455', '$70000', 8),
(9, 'Lucas Gómez', 'Paseo del Bosque', '+1155998877', '$60000', 9),
(10, 'Carla Rodríguez', 'Avenida Central', '+9988223366', '$58000', 10);

INSERT INTO tipoPersona (tipo_id, nombre) VALUES
(1, 'Administrativo'),
(2, 'Técnico'),
(3, 'Científico'),
(4, 'Guía'),
(5, 'Guardabosques'),
(6, 'Investigador'),
(7, 'Veterinario'),
(8, 'Contador'),
(9, 'Biologo'),
(10, 'Estudiante');

INSERT INTO departamento (departamento_id, parques_id, nombre) VALUES
(1, 1, 'Administrativo'),
(2, 2, 'Investigación'),
(3, 3, 'Educación Ambiental'),
(4, 4, 'Comunicación'),
(5, 5, 'Salud ');

SELECT * from parque;

