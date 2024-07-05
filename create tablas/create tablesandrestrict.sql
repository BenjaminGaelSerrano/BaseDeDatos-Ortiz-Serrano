create database claseddl;
create table paciente(
	dni int primary key,
    nombre varchar(45),
    telefono int,
    direccion varchar(45),
    nacimiento date,
    ciudad varchar(45)
	);
    
insert into paciente value(47962432, "Santiago",1123234364,"lasalle","2024-07-09","kapi"); 

create table medico(
	codigo int primary key,
    nombre varchar(45),
    telefono int
	);
    
insert into medico value (12, "benji", 1134576785);

create table ingreso(
	codigo int primary key,
    n_habitacion int, 
    cama int,
    paciente_dni int,
    medico_codigo int,
    foreign key(paciente_dni) references paciente(dni)
    on delete set null
    on update restrict,
    foreign key(medico_codigo) references medico(codigo)
    on delete cascade
    on update cascade
);


update paciente set dni=34287832; 
select *from paciente;#terminar
select *from ingreso;

update paciente set dni=4389726;
update medico set codigo=238268;
select * from ingreso;
select * from medico_has_especialidad;

delete from medico; 
delete from paciente;
select*from ingreso;
delete from medico;
select * from medico_has_especialidad;




insert into ingreso value(123465, 5, 127,47962432,12);

create table especialidad(
	codigo int primary key,
    sueldo int,
    nombre varchar(45)

);

insert into especialidad value(6, 200, "cristian");

create table medico_has_especialidad(
	medico_codigo int,
    especialidad_codigo int,
    foreign key(medico_codigo) references medico(codigo)
    on delete cascade
    on update cascade,
    foreign key(especialidad_codigo) references especialidad(codigo)
    on delete set null
    on update set null,
    primary key(medico_codigo, especialidad_codigo)
    
);

insert into medico_has_especialidad value(12,6);





#ej 6

create table producto_informatico(
	codigo int primary key,
    descripcion varchar(45),
	precio_unitario int,
    stock varchar(45)
    );
    
create table proovedores(
		codigo int primary key,
        nombre varchar(45),
        apellido varchar(45),
        direccion varchar(45),
        provincia varchar(45),
        telefono int
        );
create table cliente(
			codigo int primary key,
            nombre varchar(45),
            apellido varchar(45),
            direccion varchar(45),
            numero_de_telefono int
            );
create table producto_informatico_has_proveedores(
				producto_informatico_codigo int ,
                proovedores_codigo int,
                primary key(producto_informatico_codigo,proovedores_codigo),
                foreign key (producto_informatico_codigo) references producto_informatico(codigo),
                foreign key (proovedores_codigo) references proovedores(codigo)
                );
create table venta (
				producto_informatico_codigo int ,
				cliente_codigo int,
                primary key(producto_informatico_codigo, cliente_codigo),
                foreign key (producto_informatico_codigo) references producto_informatico(codigo)
                on delete restrict
                on update restrict,
                foreign key (cliente_codigo) references cliente(codigo)
				on delete cascade
                on update cascade,
                
                fecha date
                );
                
                
                
#tp turismo

create table clientes(
	dni int primary key,
    direccion varchar(45),
    apellido varchar(45),
	nombre varchar(45),
    telefono int,
    celular int
);
create table pago (
	codigo int primary key,
    metodo_de_pago varchar(45)
);					
create table alojamientos (
	codigo int primary key,
    nombre varchar(45),
    apellido varchar(45),
    categoria varchar(15),
    direc varchar(45),
    telefono int,
    cantidad_personas int,
    bar varchar(45),
    cocina varchar(45),
    garage varchar(45),
    parrilla varchar(45)
);
create table reserva(
	codigo int primary key,
    fi date,
    ff date,
    cpersonas int, 
    clientes_dni int,
    paquete_de_viajes_codigo int,
    foreign key(clientes_dni) references clientes(dni)
    on delete cascade
    on update restrict,
    foreign key(paquete_de_viajes_codigo) references paquete_de_viajes (codigo)
);
create table paquete_de_viajes(
	codigo int primary key,
	lugar varchar(45),
    c_dias int,
    c_noches int,
	costo int,
    
    pago_codigo int,
    alojamientos_codigo int,
    foreign key(pago_codigo) references pago(codigo)
    ON delete cascade
    on update cascade,
    foreign key(alojamientos_codigo) references alojamientos(codigo)
    on delete restrict
    on update set null
	
);
#poner restrict y esqas cosas xddddd

# consultas 1

	create table cliente_consultas1 (
		DNI int primary key,
		nombre varchar(45),
		apellido varchar(45),
		direccion varchar(45),
		nacimiento date 
    );
    create table proovedor_consultas1(
    
		dni int primary key,
		nombre varchar(45),
		direccion varchar(45)
    );
    create table producto_consultas1(
    
		codigo int primary key,
        nombre varchar(45),
        preciounitario int ,
        proovedor_dni int,
        foreign key(proovedor_dni) references proovedor_consultas1(dni)
        on delete set null
        on update restrict
        );
    create table cliente_has_producto_consultas1(
		cliente_DNI int,
        producto_codigo int,
        primary key(cliente_dni,producto_codigo),
        foreign key(cliente_DNI) references cliente_consultas1(DNI)
        on delete cascade
        on update restrict,
        foreign key(producto_codigo) references producto_consultas1(codigo)
        on delete restrict
        on update restrict
        );
        
#ej 2 consultas 1 
create table provincia(
	id int ,
    nombre varchar(45),
    primary key(id)

);        
create table camioneros(
	dni int primary key,
	nombre varchar(45),
	telefono int,
	direccion varchar(45),
	salario int,
	ciudad varchar(45)

);
create table paquetes(
	codigo int primary key,
	descripcion varchar(45),
	destinatario varchar (45),
	direccion_destinatario varchar(45),
	camioneros_dni int,
	provincia_id int,
	foreign key(camioneros_dni) references camioneros(dni)
	on delete cascade
	on update restrict,
	foreign key(provincia_id) references provincia(id)
	on delete restrict
	on update cascade
);
create table camion(
	matricula int primary key,
	modelo varchar(45),
	tipo varchar(45),
	provincia varchar(45)

);

create table camion_has_camioneros (

	camion_matricula int ,
	camioneros_dni int,
	foreign key(camion_matricula) references camion(matricula)
    on delete restrict
    on update cascade,
    foreign key(camioneros_dni)references camioneros(dni)
    on delete cascade
    on update restrict,
    primary key(camion_matricula, camioneros_dni)
    
    


);        





