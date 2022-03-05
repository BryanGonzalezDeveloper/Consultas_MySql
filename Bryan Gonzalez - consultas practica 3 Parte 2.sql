USE tienda;
/*1. Devuelve un listado de todos los fabricantes que existen en la base de datos,
 junto con los productos que tiene cada uno de ellos. 
El listado deberá mostrar también aquellos fabricantes que no tienen productos asociados.
*/

SELECT
f.codigo,
f.nombre AS Fabricante,
p.nombre AS Producto
FROM fabricante AS f
LEFT JOIN producto AS p ON f.codigo=p.codigo_fabricante;

/*
2. Devuelve un listado donde sólo aparezcan aquellos
 fabricantes que no tienen ningún producto asociado.
 */
 
SELECT
f.codigo,
f.nombre AS Fabricante
FROM fabricante AS f
LEFT JOIN producto AS p ON f.codigo=p.codigo_fabricante
WHERE p.nombre IS NULL;

/*
3. ¿Pueden existir productos que no estén relacionados con un fabricante?
Justifique su respuesta.
Respuesta: No es posible debido a que la relacion es uno a muchos, los productos dependen 
de la existencia de un fabricante para poder existir.
*/
