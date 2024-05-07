-- ##################################
-- #########Ejercicio dia 4##########
-- ##################################

-- Creacion y uso de la db de paises
CREATE  database Paises;
use Paises;

-- Creacion de la tabla pais
create table pais(
	id_pais int primary key auto_increment,
	nombre varchar(20),
	continent varchar(50),
	poblacion int
);

-- Creacion de la tabla idioma
create table idioma(
	id_idioma int primary key auto_increment,
	idioma varchar(50)
);

-- Creacion de la tabla idioma del pais
create table idioma_pais(
	id_pais int not null,
	foreign key (id_pais) references pais(id_pais),
	id_idioma int not null,
	foreign key (id_idioma) references idioma(id_idioma),
	es_oficial tinyint(1)
);

-- Creacion de la tabla ciudad
create table ciudad(
	id_Ciudad int primary key auto_increment,
	nombre varchar(20),
	id_pais int,
	foreign key (id_pais) references pais(id_pais)
);

show tables;

-- Inserciones en la tabla "pais"
INSERT INTO pais (nombre, continent, poblacion) VALUES 
('Estados Unidos', 'América del Norte', 331000000),
('China', 'Asia', 1441000000),
('Brasil', 'América del Sur', 212000000),
('India', 'Asia', 1380000000),
('Rusia', 'Europa/Asia', 146000000),
('Indonesia', 'Asia', 273500000),
('México', 'América del Norte', 126200000),
('Japón', 'Asia', 125500000),
('Filipinas', 'Asia', 111000000),
('Egipto', 'África', 104000000);

-- Inserciones en la tabla "idioma"
INSERT INTO idioma (idioma) VALUES 
('Inglés'),
('Mandarín'),
('Portugués'),
('Hindi'),
('Ruso'),
('Indonesio'),
('Español'),
('Japonés'),
('Tagalo'),
('Árabe');

-- Inserciones en la tabla "idioma_pais"
-- Asignación aleatoria de idiomas oficiales a cada país
INSERT INTO idioma_pais (id_pais, id_idioma, es_oficial) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(5, 5, 1),
(6, 6, 1),
(7, 7, 1),
(8, 8, 1),
(9, 9, 1),
(10, 10, 1);

-- Inserciones en la tabla "ciudad"
INSERT INTO ciudad (nombre, id_pais) VALUES
('Nueva York', 1),
('Pekín', 2),
('São Paulo', 3),
('Bombay', 4),
('Moscú', 5),
('Yakarta', 6),
('Ciudad de México', 7),
('Tokio', 8),
('Manila', 9),
('El Cairo', 10);
