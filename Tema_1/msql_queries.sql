/*  BASE DE DATOS TIENDA  */


/* Llista el nom de tots els productos que hi ha en la taula producto. */

SELECT nombre FROM `producto`;

/* Llista els noms i els preus de tots els productos de la taula producto. */

SELECT nombre, precio FROM `producto`;

/* Llista totes les columnes de la taula producto. */

SELECT * FROM `producto`;

/* Llista el nom dels productos, el preu en euros i el preu en dòlars nord-americans (USD). */

SELECT nombre, precio, precio * 1.07 FROM `producto`;

/* Llista el nom dels productos, el preu en euros i el preu en dòlars nord-americans. Utilitza els següents àlies per a les columnes: nom de producto, euros, dòlars nord-americans. */

SELECT nombre, precio, precio *1,07 FROM `producto`;

/* Llista el nom dels productos, el preu en euros i el preu en dòlars nord-americans. Utilitza els següents àlies per a les columnes: nom de producto, euros, dòlars nord-americans. */

SELECT nombre AS `Nombre de producto`, precio AS `Euros`, precio * 1.07 AS `Dólares Norteamericanos` FROM `producto`;

/* Llista els noms i els preus de tots els productos de la taula producto, convertint els noms a majúscula. */

SELECT UPPER (nombre), precio FROM `producto`;

/* Llista els noms i els preus de tots els productos de la taula producto, convertint els noms a minúscula. */

SELECT LOWER (nombre), precio FROM `producto`;

/* Llista el nom de tots els fabricants en una columna, i en una altra columna obtingui en majúscules els dos primers caràcters del nom del fabricant. */

SELECT nombre AS `Nombre del fabricante`, SUBSTRING(nombre,1,2)  AS abbr FROM `fabricante`;

/* Llista els noms i els preus de tots els productos de la taula producto, arrodonint el valor del preu. */

SELECT nombre, ROUND(precio) As `Precio` FROM `producto`;

/* Llista els noms i els preus de tots els productos de la taula producto, truncant el valor del preu per a mostrar-lo sense cap xifra decimal. */

SELECT nombre, TRUNCATE(precio,0) AS `precio` FROM `producto`;

/* Llista el codi dels fabricants que tenen productos en la taula producto. */

SELECT fabricante.codigo AS `Codigo fabricante` FROM `producto` JOIN `fabricante` ON producto.codigo_fabricante = fabricante.codigo;

/* Llista el codi dels fabricants que tenen productos en la taula producto, eliminant els codis que apareixen repetits. */

SELECT DISTINCT(codigo_fabricante) AS `Código fabricante`FROM `producto`;

/* Llista els noms dels fabricants ordenats de manera ascendent. */

SELECT nombre AS `Fabricante` FROM `fabricante` ORDER BY nombre ASC;

/* Llista els noms dels fabricants ordenats de manera descendent. */

SELECT nombre AS `Fabricante` FROM `fabricante` ORDER BY nombre DESC;

/* Llista els noms dels productos ordenats en primer lloc pel nom de manera ascendent i en segon lloc pel preu de manera descendent. */

SELECT nombre AS `Nombre del producto`, precio AS `Precio` FROM `producto` ORDER BY nombre ASC, precio DESC;

/* Retorna una llista amb les 5 primeres files de la taula fabricante. */

SELECT * FROM `fabricante` LIMIT 3;

/* Retorna una llista amb 2 files a partir de la quarta fila de la taula fabricante. La quarta fila també s'ha d'incloure en la resposta. */

SELECT * FROM `fabricante` LIMIT 3,3; 

/* Llista el nom i el preu del producto més barat. (Utilitzi solament les clàusules ORDER BY i LIMIT). NOTA: Aquí no podria usar MIN(preu), necessitaria GROUP BY */

SELECT nombre AS `Nombre del producto`, precio FROM `producto` ORDER BY precio ASC LIMIT 1;

/* Llista el nom i el preu del producto més car. (Utilitzi solament les clàusules ORDER BY i LIMIT). NOTA: Aquí no podria usar MAX(preu), necessitaria GROUP BY. */

SELECT nombre AS `Nombre producto`, precio FROM `producto` ORDER BY precio DESC LIMIT 1;

/* Llista el nom de tots els productos del fabricant el codi de fabricant del qual és igual a 2.*/

SELECT * FROM `producto` WHERE producto.codigo_fabricante="2";

/* Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades. */

SELECT producto.nombre AS `Nombre del producto`, producto.precio AS `Precio`, fabricante.nombre AS `Nombre del fabricante` FROM `fabricante` JOIN  `producto` ON fabricante.codigo = producto.codigo_fabricante;

/* Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades. Ordeni el resultat pel nom del fabricant, per ordre alfabètic. */

SELECT producto.nombre AS `Nombre del producto`, producto.precio AS `Precio`, fabricante.nombre AS `Nombre del fabricante` FROM `fabricante` JOIN  `producto` ON fabricante.codigo = producto.codigo_fabricante ORDER BY fabricante.nombre ASC;

/* Retorna una llista amb el codi del producte, nom del producte, codi del fabricant i nom del fabricant, de tots els productes de la base de dades. */

SELECT producto.codigo AS `Código del producto`, producto.nombre as `Nombre del producto` , fabricante.codigo AS `Código del fabricante`, fabricante.nombre AS `Nombre del fabricante` FROM `fabricante` JOIN  `producto` ON fabricante.codigo = producto.codigo_fabricante;

/* Retorna el nom del producte, el seu preu i el nom del seu fabricant, del producte més barat. */

SELECT producto.nombre, producto.precio, fabricante.nombre FROM `fabricante` INNER JOIN  `producto` ON fabricante.codigo = producto.codigo_fabricante ORDER BY producto.precio ASC LIMIT 1;

/* Retorna el nom del producte, el seu preu i el nom del seu fabricant, del producte més car. */

SELECT producto.nombre AS `Nombre del producto`, producto.precio AS `Precio`, fabricante.nombre AS `Nombre del fabricante` FROM `fabricante` JOIN  `producto` ON fabricante.codigo = producto.codigo_fabricante ORDER BY producto.precio ASC LIMIT 1;

/* Retorna una llista de tots els productes del fabricant Lenovo. */

SELECT producto.nombre AS `Nombre del producto`, fabricante.nombre AS `Nombre del fabricante` FROM `fabricante` JOIN  `producto` ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre = "Lenovo";

/* Retorna una llista de tots els productes del fabricant Crucial que tinguin un preu major que 200€. */

SELECT producto.nombre AS `Nombre del producto`, producto.precio AS `Precio del producto`, fabricante.nombre AS `Nombre del fabricante`  FROM `fabricante` JOIN  `producto` ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre="Crucial" AND producto.precio > 200;

/* Retorna un llistat amb tots els productes dels fabricants Asus, Hewlett-Packard y Seagate. Sense utilitzar l'operador IN. */

SELECT producto.nombre AS `Nombre del producto`, fabricante.nombre AS `Fabricante` FROM `fabricante` JOIN `producto` ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre="Asus" OR fabricante.nombre="Hewlett-Packard" OR fabricante.nombre="Seagate";

/* Retorna un llistat amb el nom i el preu de tots els productes dels fabricants el nom dels quals acabi per la vocal e. */

SELECT fabricante.nombre AS `Nombre del fabricante`, producto.precio `Precio` FROM `fabricante` JOIN `producto` ON fabricante.codigo = producto.codigo_fabricante WHERE RIGHT(fabricante.nombre, 1) = "e";

/* Retorna un llistat amb el nom i el preu de tots els productes el nom de fabricant dels quals contingui el caràcter w en el seu nom. */

SELECT producto.nombre AS `Nombre del producto`, producto.precio AS `Precio`, fabricante.nombre FROM `fabricante` LEFT JOIN `producto` ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre LIKE "%w%";

/* Retorna un llistat amb el nom de producte, preu i nom de fabricant, de tots els productes que tinguin un preu major o igual a 180€. Ordeni el resultat en primer lloc pel preu (en ordre descendent) i en segon lloc pel nom (en ordre ascendent) */

SELECT producto.nombre AS `Nombre del producto`, producto.precio AS `Precio`, fabricante.nombre AS `Nombre del fabricante` FROM `fabricante` JOIN `producto` ON fabricante.codigo = producto.codigo_fabricante WHERE producto.precio >= 180 ORDER BY producto.precio DESC, producto.nombre ASC;

/* Retorna un llistat amb el codi i el nom de fabricant, solament d'aquells fabricants que tenen productes associats en la base de dades. */

SELECT fabricante.codigo AS `Código del fabricante`, fabricante.nombre AS `Nombre del fabricante` FROM `fabricante` JOIN `producto` ON fabricante.codigo = producto.codigo_fabricante WHERE producto.nombre IS NOT NULL;

/* Retorna un llistat de tots els fabricants que existeixen en la base de dades, juntament amb els productes que té cadascun d'ells. El llistat haurà de mostrar també aquells fabricants que no tenen productes associats. */

SELECT fabricante.nombre AS `Nombre del fabricante`, producto.nombre AS `Productos asociados` FROM `fabricante` LEFT JOIN `producto` ON fabricante.codigo = producto.codigo_fabricante;

/* Retorna un llistat on només apareguin aquells fabricants que no tenen cap producte associat. */

SELECT fabricante.nombre AS `Nombre del fabricante`, producto.nombre AS `Productos asociados` FROM `fabricante` LEFT JOIN `producto` ON fabricante.codigo = producto.codigo_fabricante WHERE producto.nombre IS NULL;

/* Retorna tots els productes del fabricant Lenovo. (Sense utilitzar INNER JOIN). */

SELECT producto.nombre AS `Productos de Lenovo` FROM `producto` WHERE producto.codigo_fabricante = 2;

/* Retorna totes les dades dels productes que tenen el mateix preu que el producte més car del fabricant Lenovo. (Sense utilitzar INNER JOIN). */

SELECT * FROM `producto` WHERE codigo_fabricante = 2 AND producto.precio = (SELECT producto.precio FROM `producto` WHERE codigo_fabricante = "2" ORDER BY precio DESC LIMIT 1);

/* Llista el nom del producte més car del fabricant Lenovo. */

SELECT producto.nombre AS `Nombre del producto` FROM `fabricante` JOIN `producto` ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre = "Lenovo" AND producto.precio ORDER BY producto.precio DESC LIMIT 1;

/* Llista el nom del producte més barat del fabricant Hewlett-Packard. */

SELECT producto.nombre AS `Nombre del producto` FROM `fabricante` JOIN `producto` ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre = "Hewlett-Packard" AND producto.precio ORDER BY producto.precio ASC LIMIT 1;

/* Retorna tots els productes de la base de dades que tenen un preu major o igual al producte més car del fabricant Lenovo. */

SELECT producto.nombre AS `Nombre del producto` FROM `producto` JOIN `fabricante` ON fabricante.codigo = producto.codigo_fabricante WHERE producto.precio >= (SELECT producto.precio FROM `fabricante` JOIN `producto` ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre = "Lenovo" AND producto.precio ORDER BY producto.precio DESC LIMIT 1) AND fabricante.nombre != "Lenovo";

/* Llesta tots els productes del fabricant Asus que tenen un preu superior al preu mitjà de tots els seus productes. */

SELECT producto.nombre AS `Nombre del producto` FROM `producto` JOIN `fabricante` ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre = "Asus" AND producto.precio >= (SELECT AVG(producto.precio) FROM `producto` JOIN `fabricante` ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre = "Asus");