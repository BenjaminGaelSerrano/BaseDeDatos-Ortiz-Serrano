
 #----------------------------------------------------------------------------------------------------------------------------

create database repaso_funciones;
INSERT INTO alumno (DNI, año_ingreso, nombre, telefono, direccion, apellido)
VALUES (12345678, 2020, 'Juan', 912345678, 'Calle Principal 123', 'Pérez');
INSERT INTO falta (codigo_falta, fecha, justificada, dni_alumno)
VALUES (1, '2024-06-01', true, 12345678);
INSERT INTO profesor (año_ingreso, DNI, nombre, apellido, direccion, telefono)
VALUES (2015, 87654321, 'María', 'Gómez', 'Avenida Central 456', 987654321);
INSERT INTO materia (codigo, nombre, horas_semanales, dni_profesor)
VALUES (1001, 'Matemáticas', 4, 87654321);
INSERT INTO materia_has_alumno (trimestre1, trimestre2, trimestre3, cant_faltas, año, codigo_materia, DNI_alumno)
VALUES (85, 90, 88, 5, 2024, 1001, 12345678);

create table alumno(
	 DNI int primary key,
     año_ingreso int ,
     nombre varchar(45),
     telefono int,
     direccion varchar(45),
     apellido varchar(45)
    );
create table falta(
	codigo_falta int primary key,
    fecha date,
    justificada bool,
    dni_alumno int,
    foreign key(dni_alumno) references alumno(DNI)
    
);
create table profesor(
	año_ingreso int,
    DNI int primary key,
    nombre varchar(45),
    apellido varchar(45),
    direccion varchar(45),
    telefono int
    );
create table materia(
	codigo int primary key,
	nombre varchar(45),
    horas_semanales int,
    dni_profesor int,
    foreign key(dni_profesor) references profesor(DNI)

);
create table materia_has_alumno(
	trimestre1 int,
    trimestre2 int,
    trimestre3 int,
    cant_faltas int,
    año int,
    codigo_materia int ,
	foreign key(codigo_materia) references materia(codigo),
    DNI_alumno int ,
    foreign key(DNI_alumno) references alumno(DNI),
    primary key(DNI_alumno,codigo_materia)
    );
#2 agregar una regla para que elcampo “cantFaltas” sea un número positivo.    
alter table materia_has_alumno add check (cant_faltas > 0);
#3 Mostrar la cantidad de alumnos que aprobaron los tres trimestres de la materia con nombre “MatemáticaI” este año.
select count(DNI) from alumno join materia_has_alumno on alumno.DNI=DNI_alumno join materia on codigo_materia=materia.codigo where trimestre1>=6 and trimestre2>=6 and trimestre3>=6 and materia.nombre="MatematicaI"; 
#4. Mostrar nombre, apellido y dni de los alumnos que tengan aprobadas todas las materias que están cursando este año.
select alumno.nombre, alumno.DNI from alumno join materia_has_alumno on alumno.DNI = DNI_alumno where trimestre1>=6 and trimestre2>=6 and trimestre3>=6 group by DNI having count(*)>=12;
#5. Listar la cantidad de profesores que entraron por año.
select count(año_ingreso), año_ingreso from profesor group by año_ingreso;
#6.Mostrar la mayor calificación en el tercer trimestre de la materia con nombre “Base de Datos”.
select max(trimestre3) from materia_has_alumno join materia on  materia.codigo = codigo_materia where materia.nombre = "Base de Datos";
#7.Mostrar la cantidad de alumnos que no faltaron nunca.
select count(*)from alumno left join falta on alumno.DNI=dni_alumno where dni_alumno is null; 

#---------------------------------------------------------------------------------------------------------------------
#ejercicio 2
INSERT INTO pelicula (codigo, genero, nombre, fecha_estreno)
VALUES (1, 'Acción', 'Matrix', '1999-03-31');

INSERT INTO pelicula (codigo, genero, nombre, fecha_estreno)
VALUES (2, 'Comedia', 'La La Land', '2016-12-09');

INSERT INTO pelicula (codigo, genero, nombre, fecha_estreno)
VALUES (3, 'Drama', 'El Padrino', '1972-03-24');

INSERT INTO pelicula (codigo, genero, nombre, fecha_estreno)
VALUES (4, 'Ciencia Ficción', 'Blade Runner', '1982-06-25');

INSERT INTO pelicula (codigo, genero, nombre, fecha_estreno)
VALUES (5, 'Aventura', 'Piratas del Caribe: La maldición del Perla Negra', '2003-07-09');


INSERT INTO sala (codigo, capacidad)
VALUES (1, 100);

INSERT INTO sala (codigo, capacidad)
VALUES (2, 80);

INSERT INTO sala (codigo, capacidad)
VALUES (3, 120);

INSERT INTO sala (codigo, capacidad)
VALUES (4, 150);

INSERT INTO sala (codigo, capacidad)
VALUES (5, 90);


INSERT INTO funcion (codigo, fecha, hora, precio_entrada, codigo_pelicula, sala_codigo)
VALUES (1, '2024-07-01', '18:00:00', 1500, 1, 1);

INSERT INTO funcion (codigo, fecha, hora, precio_entrada, codigo_pelicula, sala_codigo)
VALUES (2, '2024-07-02', '20:30:00', 1200, 2, 2);

INSERT INTO funcion (codigo, fecha, hora, precio_entrada, codigo_pelicula, sala_codigo)
VALUES (3, '2024-07-03', '17:45:00', 1800, 3, 3);

INSERT INTO funcion (codigo, fecha, hora, precio_entrada, codigo_pelicula, sala_codigo)
VALUES (4, '2024-07-04', '19:15:00', 1600, 4, 4);

INSERT INTO funcion (codigo, fecha, hora, precio_entrada, codigo_pelicula, sala_codigo)
VALUES (5, '2024-07-05', '21:00:00', 1400, 5, 5);


INSERT INTO compra (codigo, dni_cliente, fecha, cant_entradas, codigo_funcion)
VALUES (1, 12345678, '2024-07-01', 2, 1);

INSERT INTO compra (codigo, dni_cliente, fecha, cant_entradas, codigo_funcion)
VALUES (2, 87654321, '2024-07-02', 3, 2);

INSERT INTO compra (codigo, dni_cliente, fecha, cant_entradas, codigo_funcion)
VALUES (3, 11112222, '2024-07-03', 1, 3);

INSERT INTO compra (codigo, dni_cliente, fecha, cant_entradas, codigo_funcion)
VALUES (4, 33334444, '2024-07-04', 4, 4);

INSERT INTO compra (codigo, dni_cliente, fecha, cant_entradas, codigo_funcion)
VALUES (5, 55556666, '2024-07-05', 2, 5);


INSERT INTO butaca (codigo, letra, numero)
VALUES (1, 'A', 1);

INSERT INTO butaca (codigo, letra, numero)
VALUES (2, 'B', 3);

INSERT INTO butaca (codigo, letra, numero)
VALUES (3, 'C', 5);

INSERT INTO butaca (codigo, letra, numero)
VALUES (4, 'D', 2);

INSERT INTO butaca (codigo, letra, numero)
VALUES (5, 'E', 4);

INSERT INTO butaca_has_compra (codigo_compra, butaca_codigo)
VALUES (1, 1);

INSERT INTO butaca_has_compra (codigo_compra, butaca_codigo)
VALUES (1, 2);

INSERT INTO butaca_has_compra (codigo_compra, butaca_codigo)
VALUES (2, 3);

INSERT INTO butaca_has_compra (codigo_compra, butaca_codigo)
VALUES (3, 4);

INSERT INTO butaca_has_compra (codigo_compra, butaca_codigo)
VALUES (4, 5);
create table pelicula (
	codigo int primary key,
    genero varchar(40),
    nombre varchar(45),
    fecha_estreno date
);
create table sala(
	codigo int primary key,
    capacidad int
);
create table funcion(
	codigo int primary key,
    fecha date,
    hora time,
    precio_entrada int,
    codigo_pelicula int,
    foreign key (codigo_pelicula) references pelicula(codigo)
    );
    alter table funcion add column sala_codigo int;
    alter table funcion add foreign key (sala_codigo) references sala(codigo);
    
create table compra(
	codigo int primary key,
    dni_cliente int,
    fecha date,
    cant_entradas int,
    codigo_funcion int,
    foreign key (codigo_funcion) references funcion(codigo)
    );

create table butaca(
	codigo int primary key,
	letra char,
    numero int
    

);

create table butaca_has_compra(
	codigo_compra int,
    foreign key (codigo_compra) references compra(codigo),
    butaca_codigo int,
    foreign key (butaca_codigo) references butaca(codigo),
    primary key(butaca_codigo,codigo_compra)
);
#2 Agregar una regla para que el campo “cantEntradas” sea mayor a cero.
alter table compra add check (cant_entradas>0);
#3 Listar el total recaudado por cada película en el mes de mayo.
select  sum(cant_entradas*precio_entrada) from compra join funcion on codigo_funcion = funcion.codigo join pelicula on pelicula.codigo=codigo_pelicula where funcion.fecha like "%05%" group by pelicula.codigo; 
#4.Mostrar el precio promedio de las entradas del cine, que se estrenaron en 2024.
select avg(precio_entrada) from funcion join pelicula on codigo_pelicula=pelicula.codigo where fecha_estreno="2024--01--01"; 
#5.Mostrar el total a abonar por compra, teniendo en cuenta la cantidad de entradas compradas, para las funciones que aún se transmitieron.
select cant_entradas*precio_entrada from compra join funcion on codigo_funcion=funcion.codigo where funcion.fecha like "2024%"; 
#6.Mostrar la cantidad de compras que realizó cada cliente, para aquellos que realizaron más de 10.
select count(*) from compra group by dni_cliente having count(*)>10;
#7 Mostrar la mayor capacidad en una sala que tiene el cine.
select max(capacidad) from sala;

INSERT INTO alumno (DNI, año_ingreso, nombre, telefono, direccion, apellido)
VALUES (11111111, 2023, 'Ana', 912345678, 'Calle Alegre 123', 'González');

INSERT INTO alumno (DNI, año_ingreso, nombre, telefono, direccion, apellido)
VALUES (22222222, 2022, 'Pedro', 987654321, 'Avenida Central 456', 'López');

INSERT INTO alumno (DNI, año_ingreso, nombre, telefono, direccion, apellido)
VALUES (33333333, 2021, 'María', 945678321, 'Plaza Mayor 789', 'Martínez');

INSERT INTO alumno (DNI, año_ingreso, nombre, telefono, direccion, apellido)
VALUES (44444444, 2023, 'Jorge', 934567890, 'Calle Principal 567', 'Ruiz');

INSERT INTO falta (codigo_falta, fecha, justificada, dni_alumno)
VALUES (1, '2024-06-15', true, 11111111);

INSERT INTO falta (codigo_falta, fecha, justificada, dni_alumno)
VALUES (2, '2024-06-20', false, 22222222);

INSERT INTO falta (codigo_falta, fecha, justificada, dni_alumno)
VALUES (3, '2024-06-25', false, 33333333);

INSERT INTO falta (codigo_falta, fecha, justificada, dni_alumno)
VALUES (4, '2024-06-30', true, 44444444);

INSERT INTO profesor (año_ingreso, DNI, nombre, apellido, direccion, telefono)
VALUES (2010, 55555555, 'Carlos', 'Pérez', 'Calle del Sol 789', 912345678);

INSERT INTO profesor (año_ingreso, DNI, nombre, apellido, direccion, telefono)
VALUES (2015, 66666666, 'Laura', 'Gómez', 'Avenida Libertad 456', 987654321);

INSERT INTO profesor (año_ingreso, DNI, nombre, apellido, direccion, telefono)
VALUES (2005, 77777777, 'Roberto', 'Díaz', 'Plaza España 123', 945678321);

INSERT INTO profesor (año_ingreso, DNI, nombre, apellido, direccion, telefono)
VALUES (2018, 88888888, 'Sofía', 'Jiménez', 'Calle Mayor 567', 934567890);

INSERT INTO materia (codigo, nombre, horas_semanales, dni_profesor)
VALUES (1008, 'Matemáticas', 4, 55555555);

INSERT INTO materia (codigo, nombre, horas_semanales, dni_profesor)
VALUES (1002, 'Historia', 3, 66666666);

INSERT INTO materia (codigo, nombre, horas_semanales, dni_profesor)
VALUES (1003, 'Literatura', 3, 77777777);

INSERT INTO materia (codigo, nombre, horas_semanales, dni_profesor)
VALUES (1004, 'Física', 4, 88888888);

INSERT INTO materia_has_alumno (trimestre1, trimestre2, trimestre3, cant_faltas, año, codigo_materia, DNI_alumno)
VALUES (85, 90, 88, 2, 2024, 1001, 11111111);

INSERT INTO materia_has_alumno (trimestre1, trimestre2, trimestre3, cant_faltas, año, codigo_materia, DNI_alumno)
VALUES (78, 85, 80, 3, 2024, 1002, 22222222);

INSERT INTO materia_has_alumno (trimestre1, trimestre2, trimestre3, cant_faltas, año, codigo_materia, DNI_alumno)
VALUES (90, 92, 89, 1, 2024, 1003, 33333333);

INSERT INTO materia_has_alumno (trimestre1, trimestre2, trimestre3, cant_faltas, año, codigo_materia, DNI_alumno)
VALUES (85, 88, 86, 4, 2024, 1004, 44444444);







#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------