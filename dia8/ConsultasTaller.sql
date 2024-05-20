use empresa;

-- Lista el primer apellido de todos los empleados.
select apellido1 from empleado;

-- 2. Lista el primer apellido de los empleados eliminando los apellidos que estén repetidos.

select distinct apellido1 from empleado;

-- Lista todas las columnas de la tabla empleado. 

select * from empleado;

-- Lista el nombre y los apellidos de todos los empleados.

select e.nombre, e.apellido1 as primer_apellido, e.apellido2 as segundo_apellido from empleado e;

 -- Lista el identificador de los departamentos de los empleados que aparecen en la tabla empleado.
 
 select d.id from departamento d join empleado e on e.id_departamento = d.id;
 
 /*
 Lista el identificador de los departamentos de los empleados que aparecen
en la tabla empleado, eliminando los identificadores que aparecen repetidos.
 */
 
select distinct d.id from departamento d join empleado e on e.id_departamento = d.id;
 
-- Lista el nombre y apellidos de los empleados en una única columna.

-- solucion con funcion
DELIMITER  ||
create function nombre_completo_empleado(idemploy int) 
returns varchar(300)
begin 
	DECLARE nombre_completo VARCHAR(300);
    SELECT CONCAT(nombre, ' ', apellido1, ' ', IFNULL(apellido2, '')) INTO nombre_completo
    FROM empleado
    WHERE id = idemploy;
    RETURN nombre_completo;
end ||
DELIMITER ;

select nombre_completo_empleado(3);
 
-- solucion con query normal

select concat(nombre, ' ', apellido1, ' ', ifnull(apellido2, '')) as nombre_completo from empleado;
 
 /*
Lista el nombre y apellidos de los empleados en una única columna,
convirtiendo todos los caracteres en mayúscula.
 */
 
select UPPER(concat(nombre, ' ', apellido1, ' ', ifnull(apellido2, ''))) as nombre_completo  from empleado;
 
/*
Lista el nombre y apellidos de los empleados en una única columna,
convirtiendo todos los caracteres en minúscula.
*/
select LOWER(concat(nombre, ' ', apellido1, ' ', ifnull(apellido2, ''))) as nombre_completo  from empleado;

/*
Lista el identificador de los empleados junto al nif, pero el nif deberá
aparecer en dos columnas, una mostrará únicamente los dígitos del nif y la
otra la letra.
*/
CREATE VIEW vista_empleado_nif_desglosado AS 
SELECT 
    id, 
    nif,
    SUBSTRING(nif, 1, 8) AS nif_digitos,
    SUBSTRING(nif, 9, 1) AS nif_letra
FROM empleado;


SELECT id, nif, nif_digitos, nif_letra FROM vista_empleado_nif_desglosado;

/*
Lista el nombre de cada departamento y el valor del presupuesto actual del
que dispone. Para calcular este dato tendrá que restar al valor del
presupuesto inicial (columna presupuesto) los gastos que se han generado
(columna gastos). Tenga en cuenta que en algunos casos pueden existir
valores negativos. Utilice un alias apropiado para la nueva columna columna
que está calculando.
*/

select d.nombre as Nombre_departamento, d.presupuesto - d.gastos as Presupuesto_dispo from departamento d; 

/*
Lista el nombre de los departamentos y el valor del presupuesto actual
ordenado de forma ascendente.
*/

select d.nombre as Nombre_departamento, d.presupuesto - d.gastos as Presupuesto_dispo from departamento d order by Presupuesto_dispo ASC; 

/*
Lista el nombre de todos los departamentos ordenados de forma
ascendente.
*/
select d.nombre from departamento d group by d.nombre asc;

/*
14. Lista el nombre de todos los departamentos ordenados de forma
descendente.
*/
select d.nombre from departamento d group by d.nombre desc;

/*
Lista los apellidos y el nombre de todos los empleados, ordenados de forma
alfabética tendiendo en cuenta en primer lugar sus apellidos y luego su
nombre.
*/

select e.nombre, e.apellido1 from empleado e order by e.apellido1, e.nombre;

/*
Devuelve una lista con el nombre y el presupuesto, de los 3 departamentos
que tienen mayor presupuesto.
*/

select d.nombre, d.presupuesto from departamento d order by presupuesto desc limit 3;

/*
17. Devuelve una lista con el nombre y el presupuesto, de los 3 departamentos
que tienen menor presupuesto.
*/

select d.nombre, d.presupuesto from departamento d order by presupuesto asc limit 3;


/*
18. Devuelve una lista con el nombre y el gasto, de los 2 departamentos que
tienen mayor gasto.
*/

select d.nombre, d.gastos from departamento d order by d.gastos desc limit 2;

/*
19. Devuelve una lista con el nombre y el gasto, de los 2 departamentos que
tienen menor gasto.
*/

select d.nombre, d.gastos from departamento d order by d.gastos asc limit 2;

/*
20. Devuelve una lista con 5 filas a partir de la tercera fila de la tabla empleado. La
tercera fila se debe incluir en la respuesta. La respuesta debe incluir todas las
columnas de la tabla empleado.
*/
select * from empleado limit 5 offset 2;

/*
21. Devuelve una lista con el nombre de los departamentos y el presupuesto, de
aquellos que tienen un presupuesto mayor o igual a 150000 euros.
*/

select d.nombre, d.presupuesto from departamento d where d.presupuesto >= 150000;

/*
22. Devuelve una lista con el nombre de los departamentos y el gasto, de
aquellos que tienen menos de 5000 euros de gastos.
*/

select d.nombre, d.presupuesto from departamento d where d.presupuesto < 5000;

/*
23. Devuelve una lista con el nombre de los departamentos y el presupuesto, de
aquellos que tienen un presupuesto entre 100000 y 200000 euros. Sin
utilizar el operador BETWEEN.
*/
select d.nombre, d.presupuesto 
from departamento d 
where d.presupuesto >= 100000 and d.presupuesto <= 200000;

/*
24. Devuelve una lista con el nombre de los departamentos que no tienen un
presupuesto entre 100000 y 200000 euros. Sin utilizar el operador BETWEEN.
*/

select nombre from departamento where presupuesto < 100000 or presupuesto > 200000;

/*
25. Devuelve una lista con el nombre de los departamentos que tienen un
presupuesto entre 100000 y 200000 euros. Utilizando el operador BETWEEN.
*/
SELECT nombre, presupuesto
FROM departamento
WHERE presupuesto BETWEEN 100000 AND 200000;

/*
26. Devuelve una lista con el nombre de los departamentos que no tienen un
presupuesto entre 100000 y 200000 euros. Utilizando el operador BETWEEN.
*/

SELECT nombre, presupuesto
FROM departamento
WHERE presupuesto not BETWEEN 100000 AND 200000;

/*
27. Devuelve una lista con el nombre de los departamentos, gastos y
presupuesto, de aquellos departamentos donde los gastos sean mayores
que el presupuesto del que disponen.
*/

select d.nombre, d.gastos, d.presupuesto from departamento d where d.gastos > (d.presupuesto-d.gastos);

/*
28. Devuelve una lista con el nombre de los departamentos, gastos y
presupuesto, de aquellos departamentos donde los gastos sean menores
que el presupuesto del que disponen.
*/
select nombre, gastos, presupuesto from departamento where gastos < (presupuesto-gastos);

/*
29. Devuelve una lista con el nombre de los departamentos, gastos y
presupuesto, de aquellos departamentos donde los gastos sean iguales al
presupuesto del que disponen.
*/

select nombre, gastos, presupuesto from departamento where gastos = (presupuesto-gastos);

-- 30. Lista todos los datos de los empleados cuyo segundo apellido sea NULL.

select * from empleado where apellido2 is null;

-- 31. Lista todos los datos de los empleados cuyo segundo apellido no sea NULL.

select * from empleado where apellido2 is not null;

-- 32. Lista todos los datos de los empleados cuyo segundo apellido sea López.

select * from empleado where apellido2 = "López";

/*
33. Lista todos los datos de los empleados cuyo segundo apellido
sea Díaz o Moreno. Sin utilizar el operador IN.
*/
select * from empleado WHERE apellido2 = 'Díaz' OR apellido2 = 'Moreno';

/*
34. Lista todos los datos de los empleados cuyo segundo apellido
sea Díaz o Moreno. Utilizando el operador IN.
*/

select * from empleado where apellido2 in ('Díaz', 'Moreno');

/*
35. Lista los nombres, apellidos y nif de los empleados que trabajan en el
departamento 3.
*/
select nombre, apellido1, apellido2, nif from empleado where id_departamento = 3;

/*
36. Lista los nombres, apellidos y nif de los empleados que trabajan en los
departamentos 2, 4 o 5.
*/
select nombre, apellido1, apellido2, nif from empleado where id_departamento in (2,4,5);

-- Consultas multitabla (Composición interna)

/*
1. Devuelve un listado con los empleados y los datos de los departamentos
donde trabaja cada uno.
*/

select e.id, e.nif, e.nombre as nombre_empleado, e.apellido1, e.apellido2, e.id_departamento , d.* from empleado e join departamento d on id_departamento = d.id;

/*
2. Devuelve un listado con los empleados y los datos de los departamentos
donde trabaja cada uno. Ordena el resultado, en primer lugar por el nombre
del departamento (en orden alfabético) y en segundo lugar por los apellidos
y el nombre de los empleados.
*/

select e.id, e.nif, e.nombre as nombre_empleado, e.apellido1, e.apellido2, e.id_departamento , d.* 
from empleado e join departamento d on id_departamento = d.id order by d.nombre, e.nombre, e.apellido1, e.apellido2 asc;

/*
3. Devuelve un listado con el identificador y el nombre del departamento,
solamente de aquellos departamentos que tienen empleados.
*/

select distinct d.id, d.nombre from departamento  d join empleado e on d.id = e.id_departamento;


/*
4. Devuelve un listado con el identificador, el nombre del departamento y el
valor del presupuesto actual del que dispone, solamente de aquellos
departamentos que tienen empleados. El valor del presupuesto actual lo
puede calcular restando al valor del presupuesto inicial
(columna presupuesto) el valor de los gastos que ha generado
(columna gastos).
*/

select distinct d.id, d.nombre as nombre_departamento, (d.presupuesto-d.gastos) as presupuesto_disponible from departamento d join empleado e on e.id_departamento = d.id;

/*
Devuelve el nombre del departamento donde trabaja el empleado que tiene
el nif 38382980M.
*/

SELECT d.nombre
FROM empleado e
JOIN departamento d ON e.id_departamento = d.id
WHERE e.nif = '38382980M';

/*
6. Devuelve el nombre del departamento donde trabaja el empleado Pepe Ruiz
Santana.
*/
DELIMITER //

CREATE FUNCTION nombre_departamento_empleado(nombre_param VARCHAR(100), apellido1_param VARCHAR(100), apellido2_param VARCHAR(100))
RETURNS VARCHAR(100)
BEGIN
    DECLARE departamento_nombre VARCHAR(100);
    
    SELECT d.nombre INTO departamento_nombre
    FROM empleado e
    JOIN departamento d ON e.id_departamento = d.id
    WHERE e.nombre = nombre_param AND e.apellido1 = apellido1_param AND e.apellido2 = apellido2_param
    LIMIT 1;
    
    RETURN departamento_nombre;
END//

DELIMITER ;

SELECT nombre_departamento_empleado('Pepe', 'Ruiz', 'Santana') AS nombre_departamento;

-- Solucion sin funcion
SELECT d.nombre
FROM empleado e
JOIN departamento d ON e.id_departamento = d.id
WHERE e.nombre = 'Pepe' and e.apellido1 = "Ruiz" and apellido2 = "Santana";

/*
7. Devuelve un listado con los datos de los empleados que trabajan en el
departamento de I+D. Ordena el resultado alfabéticamente.
*/
select e.* 
from empleado e 
join departamento d on d.id = e.id_departamento 
where d.nombre = "I+D" 
order by e.nombre asc;

/*
8. Devuelve un listado con los datos de los empleados que trabajan en el
departamento de Sistemas, Contabilidad o I+D. Ordena el resultado
alfabéticamente.
*/

select e.* 
from empleado e 
join departamento d on d.id = e.id_departamento 
where d.nombre in ("I+D", "Sistemas", "Contabilidad") 
order by e.nombre asc;

/*
9. Devuelve una lista con el nombre de los empleados que tienen los
departamentos que no tienen un presupuesto entre 100000 y 200000 euros.
*/
select e.nombre 
from empleado e 
join departamento d on d.id = e.id_departamento 
where d.presupuesto not between 100000 and 200000;

/*
10. Devuelve un listado con el nombre de los departamentos donde existe
algún empleado cuyo segundo apellido sea NULL. Tenga en cuenta que no
debe mostrar nombres de departamentos que estén repetidos.
*/
select d.nombre from departamento d join empleado e on d.id = e.id_departamento where e.apellido2 is null;


-- Consultas multitabla (Composición externa)

/*
 1. Devuelve un listado con todos los empleados junto con los datos de los
 departamentos donde trabajan. Este listado también debe incluir los
 empleados que no tienen ningún departamento asociado.
 */
select * from empleado e left join departamento d on d.id = e.id_departamento;

/*
 2. Devuelve un listado donde sólo aparezcan aquellos empleados que no
 tienen ningún departamento asociado.
 */
SELECT e.* 
FROM empleado e 
LEFT JOIN departamento d ON e.id_departamento = d.id 
WHERE d.id IS NULL;

/*
 3. Devuelve un listado donde sólo aparezcan aquellos departamentos que no
 tienen ningún empleado asociado. 
 */
select d.* from departamento d left join empleado e on e.id_departamento = d.id where e.id_departamento is null;

/*
4. Devuelve un listado con todos los empleados junto con los datos de los
departamentos donde trabajan. El listado debe incluir los empleados que no
tienen ningún departamento asociado y los departamentos que no tienen
ningún empleado asociado. Ordene el listado alfabéticamente por el
nombre del departamento. 
*/
select * from empleado e left join departamento d on d.id = e.id_departamento order by d.nombre asc;

/*
5. Devuelve un listado con los empleados que no tienen ningún departamento
asociado y los departamentos que no tienen ningún empleado asociado.
Ordene el listado alfabéticamente por el nombre del departamento. 
*/

SELECT d.id AS departamento_id, d.nombre AS departamento_nombre, d.presupuesto AS departamento_presupuesto, d.gastos AS departamento_gastos,
       NULL AS empleado_id, NULL AS empleado_nif, NULL AS empleado_nombre, NULL AS empleado_apellido1, NULL AS empleado_apellido2, NULL AS empleado_id_departamento
FROM departamento d 
LEFT JOIN empleado e ON e.id_departamento = d.id 
WHERE e.id_departamento IS NULL 

UNION 

SELECT NULL AS departamento_id, NULL AS departamento_nombre, NULL AS departamento_presupuesto, NULL AS departamento_gastos,
       e.id AS empleado_id, e.nif AS empleado_nif, e.nombre AS empleado_nombre, e.apellido1 AS empleado_apellido1, e.apellido2 AS empleado_apellido2, e.id_departamento AS empleado_id_departamento
FROM empleado e 
LEFT JOIN departamento d ON e.id_departamento = d.id 
WHERE d.id IS NULL;

-- Consultas resumen

-- 1. Calcula la suma del presupuesto de todos los departamentos.

select sum(presupuesto) as suma_presupuesto_total from departamento;

-- 2. Calcula la media del presupuesto de todos los departamentos.
select avg(presupuesto) as media_presupuesto from departamento;

-- 3. Calcula el valor mínimo del presupuesto de todos los departamentos.

select min(presupuesto) as minimo_presupuesto from departamento;

/*
4. Calcula el nombre del departamento y el presupuesto que tiene asignado,
del departamento con menor presupuesto. 
*/
select nombre, presupuesto from departamento where presupuesto=(select min(presupuesto) from departamento);

-- 5. Calcula el valor máximo del presupuesto de todos los departamentos.

select max(presupuesto) as presupuesto_maximo from departamento;

/*
6. Calcula el nombre del departamento y el presupuesto que tiene asignado,
del departamento con mayor presupuesto. 
 */
select nombre, presupuesto from departamento where presupuesto >= (select max(presupuesto) from departamento);

-- 7. Calcula el número total de empleados que hay en la tabla empleado.

select count(e.id) as num_empleados from empleado e;

/*
8. Calcula el número de empleados que no tienen NULL en su segundo
apellido. 
 */
select count(e.id) as num_empleados from empleado e where e.apellido2 is null;

/*
9. Calcula el número de empleados que hay en cada departamento. Tienes que
devolver dos columnas, una con el nombre del departamento y otra con el
número de empleados que tiene asignados. 
 */

select d.nombre as nombre_departamento, count(e.id) as num_empleados 
from departamento d 
join empleado e on e.id_departamento = d.id group by d.nombre;


/*
10. Calcula el nombre de los departamentos que tienen más de 2 empleados. El
resultado debe tener dos columnas, una con el nombre del departamento y
otra con el número de empleados que tiene asignados. 
 */

select d.nombre as nombre_departamento, count(e.id) as num_empleados 
from departamento d 
join empleado e on e.id_departamento = d.id group by d.nombre having count(e.id) > 2;

/*
11. Calcula el número de empleados que trabajan en cada uno de los
departamentos. El resultado de esta consulta también tiene que incluir
aquellos departamentos que no tienen ningún empleado asociado. 
*/

select d.nombre as nombre_departamento, count(e.id) as num_empleados 
from departamento d 
left join empleado e on e.id_departamento = d.id group by d.nombre;

/*
12. Calcula el número de empleados que trabajan en cada unos de los
departamentos que tienen un presupuesto mayor a 200000 euros. 
*/

select d.nombre as nombre_departamento, count(e.id) as num_empleados 
from departamento d 
left join empleado e on e.id_departamento = d.id where d.presupuesto > 200000 group by d.nombre;



































