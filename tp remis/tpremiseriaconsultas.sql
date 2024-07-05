
create database tpremiseria;

Create table clientes(
	id int primary key,
	dni int,
	apellido_y_nombre varchar(45),
	direccion varchar(45),
	telefono int,
	observaciones varchar(45)
);
Create table choferes(
	id int primary key,
	dni int,
	apellido_y_nombre varchar(45),
	direccion varchar(45),
	telefono int
);
Create table autos(
	patente int primary key,
    modelo varchar(45)
);
create table cuenta_corriente(
	codigo int primary key,
    saldo int,
	cliente_id int,
    foreign key(cliente_id) references clientes(id)
);
alter table cuenta_corriente add column deuda int;
create table viajes(
	codigo int primary key, 
	fecha date,
    destino varchar(45),
    horallegada time,
    costo int,
    id_chofer int,
    foreign key(id_chofer) references choferes(id),
    patente_auto int,
    foreign key(patente_auto) references autos(patente),
    id_cliente int,
    foreign key(id_cliente) references clientes(id)
);



INSERT INTO clientes (id, dni, apellido_y_nombre, direccion, telefono, observaciones)
VALUES (1, 12345678, 'González, Juan', 'Calle Falsa 123', 123456789, 'Cliente nuevo');

INSERT INTO clientes (id, dni, apellido_y_nombre, direccion, telefono, observaciones)
VALUES (2, 87654321, 'Pérez, Ana', 'Avenida Siempreviva 742', 987654321, 'Prefiere contacto por email');

INSERT INTO clientes (id, dni, apellido_y_nombre, direccion, telefono, observaciones)
VALUES (3, 11223344, 'López, Carlos', 'Boulevard de los Sueños 456', 112233445, 'Requiere factura A');

INSERT INTO clientes (id, dni, apellido_y_nombre, direccion, telefono, observaciones)
VALUES (4, 44332211, 'Martínez, Laura', 'Pasaje del Sol 789', 443322110, 'Cliente frecuente');

INSERT INTO clientes (id, dni, apellido_y_nombre, direccion, telefono, observaciones)
VALUES (5, 55667788, 'Ramírez, Pedro', 'Calle de la Luna 101', 556677889, 'Pendiente de pago');

#inserts choferes

INSERT INTO choferes (id, dni, apellido_y_nombre, direccion, telefono)
VALUES (6, 23456789, 'Fernández, Alberto', 'Calle Mayor 100', 234567890);

INSERT INTO choferes (id, dni, apellido_y_nombre, direccion, telefono)
VALUES (7, 34567890, 'García, María', 'Avenida del Parque 200', 345678901);

INSERT INTO choferes (id, dni, apellido_y_nombre, direccion, telefono)
VALUES (8, 45678901, 'Rodríguez, José', 'Calle de la Libertad 300', 456789012);

INSERT INTO choferes (id, dni, apellido_y_nombre, direccion, telefono)
VALUES (9, 56789012, 'Sánchez, Elena', 'Boulevard Central 400', 567890123);

INSERT INTO choferes (id, dni, apellido_y_nombre, direccion, telefono)
VALUES (10, 67890123, 'López, Miguel', 'Pasaje de la Esperanza 500', 678901234);

#autos

INSERT INTO autos (patente, modelo)
VALUES (123456, 'Toyota Corolla');

INSERT INTO autos (patente, modelo)
VALUES (234567, 'Honda Civic');

INSERT INTO autos (patente, modelo)
VALUES (345678, 'Ford Focus');

INSERT INTO autos (patente, modelo)
VALUES (456789, 'Chevrolet Cruze');

INSERT INTO autos (patente, modelo)
VALUES (567890, 'Volkswagen Golf');

#viaje inserts


INSERT INTO viajes (codigo, fecha, destino, horallegada, costo, id_chofer, patente_auto, id_cliente)
 VALUES(50, '2024-07-01', 'Ciudad A', '10:30:00', 500, 6, 123456, 1),
 (51, '2024-07-02', 'Ciudad B', '12:45:00', 700, 7, 234567, 2),
 (52, '2024-07-03', 'Ciudad C', '14:20:00', 600, 8, 345678, 3),
 (53, '2024-07-04', 'Ciudad D', '16:50:00', 800, 9, 456789, 4),
 (54, '2024-07-05', 'Ciudad E', '18:30:00', 750, 10, 567890, 5),
 (55, '2024-07-06', 'Ciudad F', '09:00:00', 550, 6, 123456, 2),
 (56, '2024-07-07', 'Ciudad G', '11:15:00', 650, 7, 234567, 3),
 (57, '2024-07-08', 'Ciudad H', '13:40:00', 720, 8, 345678, 4),
 (58, '2024-07-09', 'Ciudad I', '15:10:00', 670, 9, 456789, 5),
 (59, '2024-07-10', 'Ciudad J', '17:55:00', 790, 10, 567890, 1);
select * from viajes;

#consultas
#3
alter table viajes add check(costo >= 0);
#8 Eliminar el chofer con id 1.
delete from choferes where id=1;
#9. Eliminar todos los viajes del cliente con id 3.
delete from viajes where id_cliente= 3;
#10. ¿Cuántos autos tiene la agencia?
select count(*) from autos;
#11. Listar el costo promedio que tienen los viajes del cliente con id 4.
select avg(costo) from viajes where id_cliente=4;
#12. Listar el costo más alto de los viajes del cliente con id 3.
select max(costo) from viajes where id_cliente=3;
#13. Hacer una lista de todos los clientes cuyo nombre empieza con la letra A
select apellido_y_nombre from clientes where apellido_y_nombre like "A%"; 
#14. Hacer una lista de viajes que se realizaron entre el 10-10-2023 y el 30-10-2023 ordenados por destino.
select codigo from viajes where fecha < "2023-10-30" and fecha > "2023-10-10" order by destino;
#15. ¿Cuánto es lo que debe el cliente con id 5?
select deuda, cliente_id from cuenta_corriente where cliente_id=5;
#16. Mostrar la cantidad de viajes por chofer.
select id_chofer, count(*) from viajes group by id_chofer;
#17. Calcular cuánto hubiera salido cada viaje agregándole un 21%.
select codigo, costo *1.21 from viajes;
#18 ¿Cuánto salió el viaje más caro?
select max(costo) from viajes;
#19 ¿Cuánto salió el viaje más barato?
select min(costo) from viajes;
#20 Hacer un listado de la cantidad de viajes realizados, agrupados por fecha y chofer
select count(*), fecha, id_chofer from viajes group by fecha, id_chofer;
#21 Hacer un listado de cantidad de viajes contratados por cliente, para aquellos que realizaron más de 5 viajes.
select count(*), id_cliente from viajes group by id_cliente having count(id_cliente)>5;
#22 Hacer un listado de lo que debe cada empresa que tiene cuenta corriente.
select id_cliente, deuda from cliente;
#23 Hacer un listado de los autos utilizados por el chofer con id 4 mostrando el nombre y
#apellido del chofer, patente del auto utilizado para el viaje y costo.
select apellido_y_nombre, patente_auto, costo from viajes join choferes on id_chofer=choferes.id where id_chofer=6;
#24 Hacer un listado de la cantidad de viajes realizados por cliente durante el año 2023.
#El listado debe mostrar id_cliente, nombre y apellido, cantidad de viajes realizados.
select count(*), id_cliente, clientes.apellido_y_nombre from viajes join clientes on id_cliente = clientes.id where fecha >= "2024-1-1" and fecha <= "2024-12-31"
group by id_cliente;#no servia usar el codigo ya que no tiene sentido 
#25. Mostrar el listado que le adjunta la agencia a los choferes al final del día, para el día de hoy
select count(*), costo, costo*0.18 from viajes where fecha = current_date() group by costo;