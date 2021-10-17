-- Base de dades Tienda
-- 1.Llista el nom de tots els productos que hi ha en la taula producto.
SELECT  nombre FROM producto;
-- 2.Llista els noms i els preus de tots els productos de la taula producto.
SELECT nombre, precio FROM producto;
-- 3.Llista totes les columnes de la taula producto.
SELECT * FROM producto;
-- 4.Llista el nom dels productos, el preu en euros i el preu en dòlars estatunidencs (USD).
SELECT nombre, precio As precio_Euro, precio*1.3 As precio_dolars FROM producto;
-- 5.Llista el nom dels productos, el preu en euros i el preu en dòlars estatunidencs (USD). Utilitza els següents àlies per a les columnes: nom de producto, euros, dolars.
SELECT nombre As nom_de_producte,precio As euros,precio*1.3 As dolars FROM producto;
-- 6.Llista els noms i els preus de tots els productos de la taula producto, convertint els noms a majúscula.
SELECT UPPER(nombre), precio FROM producto;
-- 7.Llista els noms i els preus de tots els productos de la taula producto, convertint els noms a minúscula.
SELECT LOWER(nombre), precio FROM producto;
-- 8.Llista el nom de tots els fabricants en una columna, i en una altra columna obtingui en majúscules els dos primers caràcters del nom del fabricant.
SELECT nombre, UPPER(SUBSTRING(nombre,1,2)) As inicials FROM fabricante;
-- 9.Llista els noms i els preus de tots els productos de la taula producto, arrodonint el valor del preu.
SELECT nombre,ROUND(precio,0) FROM producto;
-- 10.Llista els noms i els preus de tots els productos de la taula producto, truncant el valor del preu per a mostrar-lo sense cap xifra decimal.
SELECT nombre,TRUNCATE(precio,0)FROM producto;
-- 11.Llista el codi dels fabricants que tenen productos en la taula producto.
SELECT fabricante.codigo FROM fabricante INNER JOIN producto ON(fabricante.codigo=producto.codigo_fabricante);
-- 12.Llista el codi dels fabricants que tenen productos en la taula producto, eliminant els codis que apareixen repetits.
SELECT DISTINCTROW fabricante.codigo FROM fabricante INNER JOIN producto ON(fabricante.codigo=producto.codigo_fabricante);
-- 13.Llista els noms dels fabricants ordenats de manera ascendent.
SELECT nombre FROM fabricante ORDER BY nombre ASC;
-- 14.Llista els noms dels fabricants ordenats de manera descendent.
SELECT nombre FROM fabricante ORDER BY nombre DESC;
-- 15.Llista els noms dels productos ordenats en primer lloc pel nom de manera ascendent i en segon lloc pel preu de manera descendent.
SELECT * FROM  producto ORDER BY nombre DESC , precio DESC ;
-- 16.Retorna una llista amb les 5 primeres files de la taula fabricante.
SELECT * FROM fabricante LIMIT 5;
-- 17.Retorna una llista amb 2 files a partir de la quarta fila de la taula fabricante. La quarta fila també s'ha d'incloure en la resposta.
SELECT * FROM fabricante LIMIT 3,2;
-- 18.Llista el nom i el preu del producto més barat. (Utilitzi solament les clàusules ORDER BY i LIMIT). NOTA: Aquí no podria usar MIN(preu), necessitaria GROUP BY
SELECT nombre, precio FROM producto ORDER BY precio ASC LIMIT 1;
-- 19.Llista el nom i el preu del producto més car. (Utilitzi solament les clàusules ORDER BY i LIMIT). NOTA: Aquí no podria usar MAX(preu), necessitaria GROUP BY.
SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;
-- 20.Llista el nom de tots els productos del fabricant el codi de fabricant del qual és igual a 2.
SELECT nombre FROM producto WHERE codigo_fabricante =2;
-- 21.Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades.
SELECT producto.nombre, precio, fabricante.nombre AS nombre_fabricante FROM  producto INNER JOIN fabricante ON (fabricante.codigo=producto.codigo_fabricante);
-- 22.Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades. Ordeni el resultat pel nom del fabricador, per ordre alfabètic.
SELECT producto.nombre, precio, fabricante.nombre AS nombre_fabricante  FROM  producto INNER JOIN fabricante ON (fabricante.codigo=producto.codigo_fabricante) ORDER BY fabricante.nombre ASC;
-- 23.Retorna una llista amb el codi del nproducte, nom del producte, codi del fabricador i nom del fabricador, de tots els productes de la base de dades.
SELECT producto.codigo AS codigo_producto, producto.nombre AS nombre_producto, fabricante.codigo AS codigo_fabricante,precio, fabricante.nombre AS nombre_fabricante  FROM  producto INNER JOIN fabricante ON (fabricante.codigo=producto.codigo_fabricante);
-- 24.Retorna el nom del producte, el seu preu i el nom del seu fabricant, del producte més barat.
SELECT  producto.nombre AS nombre_producto,precio,  fabricante.nombre AS nombre_fabricante  FROM  producto INNER JOIN fabricante ON (fabricante.codigo=producto.codigo_fabricante)ORDER BY precio ASC LIMIT 1;
-- 25.Retorna el nom del producte, el seu preu i el nom del seu fabricant, del producte més car.
SELECT  producto.nombre AS nombre_producto,precio,  fabricante.nombre AS nombre_fabricante    FROM  producto INNER JOIN fabricante ON (fabricante.codigo=producto.codigo_fabricante)ORDER BY precio DESC LIMIT 1;
-- 26.Retorna una llista de tots els productes del fabricador Lenovo.
SELECT producto.nombre FROM producto INNER JOIN fabricante ON (fabricante.codigo=producto.codigo_fabricante) WHERE fabricante.nombre='Lenovo';
-- 27.Retorna una llista de tots els productes del fabricant Crucial que tinguin un preu major que 200€.
SELECT producto.nombre FROM producto INNER JOIN fabricante ON (fabricante.codigo=producto.codigo_fabricante) WHERE fabricante.nombre='Crucial' AND producto.precio>200;
-- 28.Retorna un llistat amb tots els productes dels fabricants Asus, Hewlett-Packardy Seagate. Sense utilitzar l'operador IN.
SELECT producto.nombre FROM producto INNER JOIN fabricante ON (fabricante.codigo=producto.codigo_fabricante) WHERE fabricante.nombre='Asus' OR fabricante.nombre='Hewlett-Packard'OR fabricante.nombre='Seagate';
-- 29.Retorna un llistat amb tots els productes dels fabricants Asus, Hewlett-Packardy Seagate. Utilitzant l'operador IN.
SELECT producto.nombre FROM producto INNER JOIN fabricante ON (fabricante.codigo=producto.codigo_fabricante) WHERE fabricante.nombre IN('Asus','Hewlett-Packard','Seagate');
-- 30.Retorna un llistat amb el nom i el preu de tots els productes dels fabricants el nom dels quals acabi per la vocal e.
SELECT producto.nombre, precio  FROM producto INNER JOIN fabricante ON (fabricante.codigo=producto.codigo_fabricante) WHERE fabricante.nombre LIKE '%e';
-- 31.Retorna un llistat amb el nom i el preu de tots els productes el nom de fabricant dels quals contingui el caràcter w en el seu nom.
SELECT producto.nombre, precio  FROM producto INNER JOIN fabricante ON (fabricante.codigo=producto.codigo_fabricante) WHERE fabricante.nombre LIKE '%w%';
-- 32.Retorna un llistat amb el nom de producte, preu i nom de fabricant, de tots els productes que tinguin un preu major o igual a 180€. Ordeni el resultat en primer lloc pel preu (en ordre descendent) i en segon lloc pel nom (en ordre ascendent)
SELECT producto.nombre AS nombre_producto, precio, fabricante.nombre AS nombre_fabricante  FROM  producto INNER JOIN fabricante ON (fabricante.codigo=producto.codigo_fabricante) WHERE precio>=180 ORDER BY producto.precio DESC, fabricante.nombre ASC;
-- 33.Retorna un llistat amb el codi i el nom de fabricant, solament d'aquells fabricants que tenen productes associats en la base de dades.
SELECT codigo,nombre FROM fabricante WHERE EXISTS (SELECT * FROM producto WHERE fabricante.codigo = producto.codigo_fabricante );
-- 34.Retorna un llistat de tots els fabricants que existeixen en la base de dades, juntament amb els productes que té cadascun d'ells. El llistat haurà de mostrar també aquells fabricants que no tenen productes associats.
SELECT fabricante.codigo,fabricante.nombre, producto.nombre FROM fabricante LEFT JOIN producto ON (fabricante.codigo=producto.codigo_fabricante );
-- 35.Retorna un llistat on només apareguin aquells fabricants que no tenen cap producte associat.
SELECT * FROM fabricante WHERE NOT EXISTS (SELECT * FROM producto WHERE fabricante.codigo = producto.codigo_fabricante );
-- 36.Retorna tots els productes del fabricador Lenovo. (Sense utilitzar INNER JOIN).
SELECT nombre FROM producto WHERE  EXISTS(SELECT * FROM fabricante WHERE fabricante.codigo = producto.codigo_fabricante AND fabricante.nombre='Lenovo');
-- 37.Retorna totes les dades dels productes que tenen el mateix preu que el producte més car del fabricador Lenovo. (Sense utilitzar INNER JOIN).
SELECT * FROM producto WHERE  precio =(SELECT MAX(precio)FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo'));
-- 38.Llista el nom del producte més car del fabricador Lenovo.
SELECT fabricante.nombre,MAX(precio)FROM producto INNER JOIN fabricante ON (fabricante.codigo=producto.codigo_fabricante) WHERE fabricante.nombre='Lenovo';
-- 39.Llista el nom del producte més barat del fabricant Hewlett-Packard.
SELECT fabricante.nombre,MIN(precio)FROM producto INNER JOIN fabricante ON (fabricante.codigo=producto.codigo_fabricante) WHERE fabricante.nombre='Hewlett-Packard';
-- 40.Retorna tots els productes de la base de dades que tenen un preu major o igual al producte més car del fabricador Lenovo.
SELECT * FROM producto WHERE precio >= (SELECT MAX(precio)FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo'));
-- 41.Llesta tots els productes del fabricador Asus que tenen un preu superior al preu mitjà de tots els seus productes.
SELECT * FROM producto WHERE precio > (SELECT AVG(precio) FROM producto WHERE codigo_fabricante =(SELECT codigo FROM fabricante WHERE nombre ='Asus'));