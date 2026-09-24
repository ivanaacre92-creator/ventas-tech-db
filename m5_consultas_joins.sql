-- Consulta 1: Vista base del proyecto (INNER JOIN)
SELECT v.fecha_venta, c.nombre, p.nombre_producto, cat.nombre_categoria, cantidad, precio_unitario, v.cantidad * v.precio_unitario AS total_calculado, ciudad
FROM ventas v
INNER JOIN clientes c ON v.id_cliente = c.id_cliente
INNER JOIN productos p ON v.id_producto = p.id_producto
INNER JOIN categorias cat ON p.id_categoria = cat.id_categoria;



-- Consulta 2: Clientes sin ventas 

-- A MODO DE EJEMPLO SE INSERTAN 2 CLIENTES SIN VENTAS PARA PODER DEMOSTRAR LA CONSULTA 2
INSERT INTO clientes (id_cliente, nombre, email, ciudad, fecha_registro)
VALUES (6, 'Sofía Martínez', 'sofia.martinez@email.com', 'Mendoza', '2024-06-01');

INSERT INTO clientes (id_cliente, nombre, email, ciudad, fecha_registro)
VALUES (7, 'Tatiana Díaz', 'tatianaacre1@email.com', 'Córdoba', '2024-12-19');


SELECT c.nombre, c.email, c.fecha_registro
FROM clientes c
LEFT JOIN ventas v ON c.id_cliente = v.id_cliente
WHERE v.id_venta IS NULL;



--Consulta 3: productos sin ventas

-- EJEMPLO DE PRODUCTO SIN VENTAS, AGREGADO PARA PODER DEMOSTRAR LA CONSULTA 3
INSERT INTO productos (id_producto, nombre_producto, id_categoria, precio, stock, activo)
VALUES (7, 'Webcam HD', 1, 45.00, 10, 1);


SELECT p.nombre_producto, cat.nombre_categoria, p.precio
FROM productos p
LEFT JOIN ventas v ON p.id_producto = v.id_producto
INNER JOIN categorias cat ON p.id_categoria = cat.id_categoria
WHERE v.id_venta IS NULL;



--Consulta 4: Consolidado por canal (UNION ALL)
SELECT canal, SUM(total) AS total_por_canal
FROM (
    SELECT fecha_venta, cantidad * precio_unitario AS total, 'Primera quincena' AS canal
    FROM ventas
    WHERE fecha_venta <= '2024-03-10'

    UNION ALL

    SELECT fecha_venta, cantidad * precio_unitario AS total, 'Segunda quincena' AS canal
    FROM ventas
    WHERE fecha_venta > '2024-03-10'
) AS ventas_unidas
GROUP BY canal;