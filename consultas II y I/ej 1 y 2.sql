#ejercicio 1
select nombre,apellido from cliente; #a

select nombre from cliente where nombre = "juan";#b

select nombre, codigo, `precio unitario`, proveedor_dni from producto;#c

select cliente_dni from cliente_has_producto where producto_codigo = 1;#d

update cliente set direccion = "CUENca" where codigo=111111;#e

#ejercicio 2

select camioneros_dni from camion_has_camioneros where camion_matrícula = 1 and fecha = "2023-04-26"; 

select nombre from provincia;

update camioneros set salario = salario + (salario*10)/100; 

select codigopaquetes, descripcion, camioneros_dni from paquetes;

delete from paquetes where codigopaquetes<100;





