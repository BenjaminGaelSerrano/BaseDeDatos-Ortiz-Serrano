#ejercicio 1 

insert into especialidad value ("otorrino",2000);
insert into especialidad value ("ginecólogo",2500);
insert into especialidad value ("pediatra",2800);
insert into especialidad value ("traumatólogo",1500);

insert into ingreso value (2345743,43,4,23767865,3143,4324,"2023-04-26");
insert into ingreso value (5654354,867,24,54353565,3456,6755,"2023-04-23");
insert into ingreso value (4343244,645,6,46546457,3007,4532,"2023-04-28");
insert into ingreso value (5432543,234,5,64575768,3004,4656,"2023-04-22");

insert into medico value(3143,"alfredo",91453,4324);
insert into medico value(3456,"josé",91542468,6755);
insert into medico value(3007,"ricardo",91186289,4532);
insert into medico value(3004,"gabriel",91135234,4656);


insert into medico_has_especialidad value (3143,"otorrino","gutierrez");
insert into medico_has_especialidad value(3456,"pediatra","giménez");
insert into medico_has_especialidad value(3007,"traumatólogo","perez");
insert into medico_has_especialidad value(3004,"ginecólogo","ortiz");



insert into paciente value( 911469865,"francisco",23767865,"1991-03-08","chivilcoy 804","CABA");
insert into paciente value( 916787689,"Gonzalo",54353565,"1998-02-23","sarmiento 3674","lomas de zamora");
insert into paciente value( 135345476,"santiago",46546457,"2007-07-09","rosario de la frontera 4914","CABA");
insert into paciente value( 914476586,"pepo",64575768,"1975-07-30","olazabal 83","CABA");

select apellido from medico_has_especialidad where especialidad_nombre="traumatologo" order by apellido;

delete from ingreso where fecha_de_ingreso like  "2016-%-%";

select cama from ingreso where paciente_codigo=1;

update medico_has_especialidad set especialidad_nombre = "pediatra" where medico_codigo = 5; 

select nombre,codigo from medico where nombre like "a%";


#ejercicio 2

insert into venta value("1992-04-30",4,348738);
insert into venta value("1998-04-20",6,352738);
insert into venta value("2008-09-13",7,148798);
insert into venta value("1992-04-30",2,348737);

insert into proveedores value (76, "juancho", "talo", "country", "caba", 1176895678);
insert into proveedores value (97, "fede", "garciudo", "cuzco", "cuyo", 1179295678);
insert into proveedores value (570, "jujuy", "tarhado", "cuyo", "nehuen", 1187295678);
insert into proveedores value (39, "federico", "degui", "tacuen3456", "paraguay", 1134595678);

insert into `producto informatico` value (4, "disco magnetico ROM diushthax", 51000, 15, "disco god"  );
insert into `producto informatico` value (6, "memoria ram", 45000, 13, "RAM"  );
insert into `producto informatico` value (7, "CACHE ZARPADA EN conectores", 70000, 7, "MEMORIA CACHE"  );
insert into `producto informatico` value (2, "BUS DE DATOS DESUBICADO", 6000, 8, "bus"  );

select nombre, `precio unitario` from `producto informatico` where `precio unitario`>1000;

insert into cliente_5 value (348738, "hernan", "gonzales", "casita", 1146456556); 
insert into cliente_5 value (352738, "gasty", "galindez", "ezeiza3456", 1127386556);
insert into cliente_5 value (148798, "alfredo", "perez", "constituyentes 4562", 1146456789);
insert into cliente_5 value (348737, "nehu", "faya", "villamaipu", 11537365439); 

select * from cliente_5 where apellido like "p%";
delete from `producto informatico` where descripcion is null;

insert into `producto informatico_has_proveedores` value (9803, 7);
insert into `producto informatico_has_proveedores` value (981252, 9);
insert into `producto informatico_has_proveedores` value (9812765, 47);
insert into `producto informatico_has_proveedores` value (956256, 5);

select `producto informatico_codigo` from `producto informatico_has_proveedores` where proveedores_código = "7";
select nombre, descripcion, `precio unitario`, `precio unitario`+`precio unitario`*0.1 from `producto informatico`;
 
 #practica join
 
 
 select código, direccion, codigo, `precio unitario` from proveedores join `producto informatico_has_proveedores` on código=proveedores_código join `producto informatico` on codigo=`producto informatico_codigo`; 
 
 select * from venta;
 
 select codigo from cliente_5 left join venta on codigo = cliente_codigo where `producto informatico_codigo` != 4;
 
 select codigo from cliente_5 join venta on codigo = cliente_codigo where `producto informatico_codigo` = 6;



