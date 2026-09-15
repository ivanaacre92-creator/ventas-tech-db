-- ============================================
-- Consulta 1: Resumen ejecutivo mensual
-- ============================================
SELECT
    EXTRACT(MONTH FROM fecha_venta) AS mes,
    SUM(cantidad * precio_unitario) AS total_facturado,
    COUNT(*) AS cantidad_pedidos,
    AVG(cantidad * precio_unitario) AS ticket_promedio
FROM ventas
GROUP BY EXTRACT(MONTH FROM fecha_venta)
ORDER BY mes;
 
-- ============================================
-- Consulta 2: Ranking de productos (Top 5)
-- ============================================
SELECT
    id_producto,
    SUM(cantidad) AS unidades_vendidas,
    SUM(cantidad * precio_unitario) AS total_facturado
FROM ventas
GROUP BY id_producto
ORDER BY total_facturado DESC
LIMIT 5;
 
-- ============================================
-- Consulta 3: Clientes recurrentes
-- ============================================
SELECT
    id_cliente,
    COUNT(*) AS cantidad_pedidos,
    SUM(cantidad * precio_unitario) AS total_gastado
FROM ventas
GROUP BY id_cliente
HAVING COUNT(*) > 1
ORDER BY total_gastado DESC;
 
-- ============================================
-- Consulta 4: Meses por encima/por debajo del promedio
-- ============================================
SELECT
    EXTRACT(MONTH FROM fecha_venta) AS mes,
    SUM(cantidad * precio_unitario) AS total_facturado,
    CASE
        WHEN SUM(cantidad * precio_unitario) > (
            SELECT AVG(total_mes)
            FROM (
                SELECT SUM(cantidad * precio_unitario) AS total_mes
                FROM ventas
                GROUP BY EXTRACT(MONTH FROM fecha_venta)
            ) AS totales_por_mes
        ) THEN 'Por encima'
        ELSE 'Por debajo'
    END AS comparacion_promedio
FROM ventas
GROUP BY EXTRACT(MONTH FROM fecha_venta)
ORDER BY mes;


-- Hallazgos:
-- 1. Todas las ventas registradas corresponden a marzo (mes 3), por lo que
--    no se puede evaluar tendencia mensual con los datos actuales.
-- 2. El producto 1 concentra el mayor monto facturado ($3.600) pese a vender
--    solo 3 unidades, mientras que el producto 2 vende más unidades (13)
--    pero factura mucho menos ($364) por tener un precio unitario bajo.
-- 3. Los 5 clientes registrados son recurrentes (2 pedidos cada uno); el
--    cliente 1 es el que más gastó ($2.640) y el cliente 4 el que menos ($510).