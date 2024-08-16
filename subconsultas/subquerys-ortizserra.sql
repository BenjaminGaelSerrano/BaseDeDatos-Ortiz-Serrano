#1. Listar nombre, apellido e id de los clientes que aún no realizaron pedidos (not in).
select nombre,apellido,idcliente from cliente where idcliente not in(select cliente_idcliente from pedidos);
#2. Listar nombre, apellido e id de los clientes que aún no realizaron pedidos (not exists).
select nombre, apellido, idcliente from cliente where not exists (select * from pedidos where cliente_idcliente=idcliente);
#3.Listar nombre, apellido e id de los clientes que realizaron pedidos en el mes de julio
#(mediante una subconsulta).
select nombre, apellido, idcliente from cliente where idcliente in (select cliente_idcliente from pedidos where fecha_compra between "2024-07-01" and "2024-07-31");
#4. Listar el id del cliente que realizó el pedido con mayor descuento.
select idcliente from cliente join pedidos on cliente_idcliente=idcliente where descuento = (select max(descuento) from pedidos);
#5. Listar el/los pedidos con menor descuento del año.
select  * from pedidos where descuento=(select min(descuento) from pedidos);
#6. Listar cuántos tipos de artículos se realizan por pedido (sin subconsulta).
select count(producto), pedidos_idpedido from producto join detallepedido on codigo=producto_codigo group by pedidos_idpedido;
#7. Realizar un top 10 de los clientes que más compras realizaron, mostrando nombre,
#apellido, email y la cantidad de compras realizadas (sin subconsulta).
select nombre, apellido, email,count(cliente_idcliente) from pedidos join cliente on cliente_idcliente=idcliente group by cliente_idcliente order by (count(cliente_idcliente)) limit 10;
#8. Listar los pedidos que tengan más de 3 artículos por pedido (sin subconsulta). 
select pedidos_idpedido from detallepedido group by pedidos_idpedido having count(producto_codigo)>3;
#9. Listar para cada pedido el valor total de la compra (sin subconsulta).
select sum(precio*cantidad)-descuento from producto join detallepedido on producto.codigo=producto_codigo join pedidos on pedidos_idpedido=idpedido group by idpedido;
#10. Listar los pedidos cuyo monto supere los $3500
select idpedido from pedidos join detallepedido on idpedido=pedidos_idpedido join producto on producto_codigo=codigo group by idpedido having sum(precio*cantidad)<3500;
#11. Listar la cantidad de productos vendidos por código de producto (sin subconsulta).
select count(producto_codigo), codigo from producto join detallepedido on producto_codigo=codigo group by codigo;
#12 listar el/los códigos de producto de mayor valor.
select codigo from producto where precio=(select max(precio) from producto);
#13. Eliminar los clientes que no hayan hecho compras en dos años (con not exists y not in).
delete from cliente where idcliente not in(select cliente_idcliente from pedidos where year(fecha_compra)>year(current_date())-2);
#Liste los nombres de los clientes que hayan realizado una compra por un valor total
#mayor a $3.000. Utilice una subconsulta con exists o not exists. ¿De qué otra forma
#podría realizar la misma consulta?
#se podria hacer con un having
#1. Listar nombre, apellido e id de los clientes que aún no realizaron pedidos (not in).
select nombre,apellido,idcliente from cliente where idcliente not in(select cliente_idcliente from pedidos);
#2. Listar nombre, apellido e id de los clientes que aún no realizaron pedidos (not exists).
select nombre, apellido, idcliente from cliente where not exists (select * from pedidos where cliente_idcliente=idcliente);
#3.Listar nombre, apellido e id de los clientes que realizaron pedidos en el mes de julio
#(mediante una subconsulta).
select nombre, apellido, idcliente from cliente where idcliente in (select cliente_idcliente from pedidos where fecha_compra between "2024-07-01" and "2024-07-31");
#4. Listar el id del cliente que realizó el pedido con mayor descuento.
select idcliente from cliente join pedidos on cliente_idcliente=idcliente where descuento = (select max(descuento) from pedidos);
#5. Listar el/los pedidos con menor descuento del año.
select  * from pedidos where descuento=(select min(descuento) from pedidos);
#6. Listar cuántos tipos de artículos se realizan por pedido (sin subconsulta).
select count(producto), pedidos_idpedido from producto join detallepedido on codigo=producto_codigo group by pedidos_idpedido;
#7. Realizar un top 10 de los clientes que más compras realizaron, mostrando nombre,
#apellido, email y la cantidad de compras realizadas (sin subconsulta).
select nombre, apellido, email,count(cliente_idcliente) from pedidos join cliente on cliente_idcliente=idcliente group by cliente_idcliente order by (count(cliente_idcliente)) limit 10;
#8. Listar los pedidos que tengan más de 3 artículos por pedido (sin subconsulta). 
select pedidos_idpedido from detallepedido group by pedidos_idpedido having count(producto_codigo)>3;
#9. Listar para cada pedido el valor total de la compra (sin subconsulta).
select sum(precio*cantidad)-descuento from producto join detallepedido on producto.codigo=producto_codigo join pedidos on pedidos_idpedido=idpedido group by idpedido;
#10. Listar los pedidos cuyo monto supere los $3500
select idpedido from pedidos join detallepedido on idpedido=pedidos_idpedido join producto on producto_codigo=codigo group by idpedido having sum(precio*cantidad)<3500;
#11. Listar la cantidad de productos vendidos por código de producto (sin subconsulta).
select count(producto_codigo), codigo from producto join detallepedido on producto_codigo=codigo group by codigo;
#12 listar el/los códigos de producto de mayor valor.
select codigo from producto where precio=(select max(precio) from producto);
#13. Eliminar los clientes que no hayan hecho compras en dos años (con not exists y not in).
delete from cliente where idcliente not in(select cliente_idcliente from pedidos where year(fecha_compra)>year(current_date())-2);
#14- Liste los nombres de los clientes que hayan realizado una compra por un valor total
#mayor a $3.000. Utilice una subconsulta con exists o not exists. ¿De qué otra forma
#podría realizar la misma consulta?
#se podria hacer con un having
#sin la subquery select nombre from cliente join pedidos on idcliente=cliente_idcliente join detallepedido on pedidos_idpedido=idpedido join producto on codigo=producto_codigo where precio * cantidad>3000 and  idcliente=cliente_idcliente group by idpedido; 
select nombre from cliente where exists ( select cliente_idcliente from pedidos join detallepedido on idpedido=pedidos_idpedido 
join producto on producto_codigo = codigo where idcliente=cliente_idcliente group by idpedido having sum(precio * cantidad)>3000);
#15. Teniendo en cuenta el siguiente ejemplo:
#El pedido nro 1 está compuesto por 3 tipos de artículos diferentes y por 10 unidades en total
#teniendo en cuenta todos los productos.
#Realice dos queries:
#a) En uno muestre la máxima, mínima y promedio de unidades incluidas los pedidos.
select min(minimo),avg(minimo),max(minimo) from(select sum(cantidad) as minimo from detallepedido
 group by pedidos_idpedido)as pepo;
#b)b) En el otro la cantidad máxima, mínima y promedio de tipos de producto diferentes
#incluidos los pedido
select * from detallepedido;
select max(numerito), min(numerito), avg(numerito) from(select count(producto_codigo) as numerito from detallepedido group by pedidos_idpedido) as eldegui;