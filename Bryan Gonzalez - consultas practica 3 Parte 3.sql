USE tienda;

/*
1. Calcula el número total de productos que hay en la tabla productos.
*/
SELECT count(*) as 'Total de productos' from producto;

/* 2. Calcula el número total de fabricantes que hay en la tabla fabricante.*/
SELECT count(*) as 'Total de fabricantes' from fabricante;

/* 3. Calcula el número de valores distintos de código de fabricante aparecen en la tabla productos.*/
SELECT count(DISTINCT codigo_fabricante) as 'Total de codigo de fabircantes' from producto;

/* 4. Calcula la media del precio de todos los productos.*/
select avg(precio) as 'Precio promedio' from producto;

/*5. Calcula el precio más barato de todos los productos.*/
select min(precio) as 'precio minimo' from producto;

/*6. Calcula el precio más caro de todos los productos.*/
select max(precio) as 'Precio maximo' from producto;

/*7. Lista el nombre y el precio del producto más barato.*/
select nombre, min(precio) as 'Precio' from producto;

/*8. Lista el nombre y el precio del producto más caro.*/
select nombre, max(precio) as 'Precio' from producto;

/*9. Calcula la suma de los precios de todos los productos.*/
select sum(precio) as 'Suma' from producto;

/*10. Calcula el número de productos que tiene el fabricante Asus.*/
select count(producto.codigo) as 'Total de productos' from producto
inner join fabricante on fabricante.codigo=producto.codigo_fabricante
where fabricante.nombre='Asus';

/*11. Calcula la media del precio de todos los productos del fabricante Asus.*/
select avg(producto.precio) as 'Precio medio de productos' from producto
inner join fabricante on fabricante.codigo=producto.codigo_fabricante
where fabricante.nombre='Asus';

/*12. Calcula el precio más barato de todos los productos del fabricante Asus.*/
select min(producto.precio) as 'Precio mas barato ' from producto
inner join fabricante on fabricante.codigo=producto.codigo_fabricante
where fabricante.nombre='Asus';

/*13. Calcula el precio más caro de todos los productos del fabricante Asus.*/
select max(producto.precio) as 'Precio mas caro ' from producto
inner join fabricante on fabricante.codigo=producto.codigo_fabricante
where fabricante.nombre='Asus';

/*14. Calcula la suma de todos los productos del fabricante Asus. */
select sum(producto.precio) as 'Suma de productos ASus' from producto
inner join fabricante on fabricante.codigo=producto.codigo_fabricante
where fabricante.nombre='Asus';

/*
15. Muestra el precio máximo, precio mínimo, precio medio y el número total
 de productos que tiene el fabricante Crucial.
*/
select max(producto.precio) as 'Precio maximo',
min(producto.precio) as 'Precio minimo',
avg(producto.precio) as 'Precio medio',
count(producto.codigo) as 'Total de productos'
 from producto
inner join fabricante on fabricante.codigo=producto.codigo_fabricante
where fabricante.nombre='Crucial';

/*
16. Muestra el número total de productos que tiene cada uno de los fabricantes.
El listado también debe incluir los fabricantes que no tienen ningún producto.
El resultado mostrará dos columnas, una con el nombre del fabricante y otra con
el número de productos que tiene. Ordene el resultado descendentemente por el número de
productos. */

select 
 f.nombre as 'Fabricante',
 count(p.codigo) as 'Total de productos'
 from fabricante as f
left join producto as p on f.codigo=p.codigo_fabricante
group by f.nombre
order by count(p.codigo) desc;

/*17. Muestra el precio máximo, precio mínimo y precio medio de los productos de 
cada uno de los fabricantes. El resultado mostrará el nombre del fabricante
 junto con los datos que se solicitan.*/
 select 
 f.nombre as 'Fabricante',
 max(p.precio) as 'Precio maximo',
 min(p.precio) as 'Precio minimo',
 avg(p.precio) as 'Precio medio',
 count(p.codigo) as 'Total de productos'
 from fabricante as f
inner join producto as p on f.codigo=p.codigo_fabricante
group by f.nombre;

/*18. Muestra el precio máximo, precio mínimo, precio medio y el número total de productos de los fabricantes 
que tienen un precio medio superior a 200€. 
No es necesario mostrar el nombre del fabricante, con el código del fabricante es suficiente.*/
 select 
 p.codigo_fabricante,
 max(p.precio) as 'Precio maximo',
 min(p.precio) as 'Precio minimo',
 avg(p.precio) as 'Precio medio',
 count(p.codigo) as 'Total de productos'
 from fabricante as f
inner join producto as p on f.codigo=p.codigo_fabricante
group by p.codigo_fabricante
having avg(p.precio)>200;

/*
19. Muestra el nombre de cada fabricante, junto con el precio máximo, precio mínimo, precio medio y el número total 
de productos de los fabricantes que tienen un precio medio superior a 200€. 
Es necesario mostrar el nombre del fabricante.*/
select 
 f.nombre as 'Fabricante',
 max(p.precio) as 'Precio maximo',
 min(p.precio) as 'Precio minimo',
 avg(p.precio) as 'Precio medio',
 count(p.codigo) as 'Total de productos'
 from fabricante as f
inner join producto as p on f.codigo=p.codigo_fabricante
group by f.nombre
having avg(p.precio)>200;


/*20. Calcula el número de productos que tienen un precio mayor o igual a 180€.*/
select count(p.codigo) as 'Total de productos' from producto
where precio>=180;

/*21. Calcula el número de productos que tiene cada fabricante con un precio mayor o igual a 180€.*/
select 
f.nombre as 'Fabricante',
count(p.codigo) as 'Total de productos'
from fabricante as f
inner join producto as p on f.codigo=p.codigo_fabricante
where p.precio>=180
group by f.nombre;


/*22. Lista el precio medio los productos de cada fabricante, mostrando solamente el código del fabricante.*/
select p.codigo_fabricante, avg(p.precio) as 'Precio medio' from producto as p
group by p.codigo_fabricante;

/*23. Lista el precio medio los productos de cada fabricante, mostrando solamente el nombre del fabricante.*/
select f.nombre as 'Fabricante', avg(p.precio) as 'Precio medio' from producto as p
inner join fabricante as f on f.codigo=p.codigo_fabricante
group by f.nombre;


/*24. Lista los nombres de los fabricantes cuyos productos tienen un precio medio mayor o igual a 150€.*/
select f.nombre as 'Fabricante', avg(p.precio) as 'Precio medio' from producto as p
inner join fabricante as f on f.codigo=p.codigo_fabricante
group by f.nombre
having avg(p.precio)>=150;



/*25. Devuelve un listado con los nombres de los fabricantes que tienen 2 o más productos.*/
select f.nombre as 'Fabricante', count(p.codigo) as 'Total de productos' from producto as p
inner join fabricante as f on f.codigo=p.codigo_fabricante
group by f.nombre
having count(p.codigo)>=2;

/*26. Devuelve un listado con los nombres de los fabricantes y el número de productos que tiene 
cada uno con un precio superior o igual a 220 €. No es necesario mostrar el nombre de los fabricantes 
que no tienen productos que cumplan la condición.*/
select f.nombre as 'Fabricante', count(p.codigo) as 'Total de productos' from producto as p
inner join fabricante as f on f.codigo=p.codigo_fabricante
where p.precio>=220
group by f.nombre;