# ventas-tech-db

Base de datos de ventas de una distribuidora de tecnología, desarrollada como parte del proyecto **RetailPro** del curso de Data Analytics. El repositorio reúne el script de creación de la base, las consultas SQL de análisis de negocio y el modelo en Power BI.

## Contenido del repositorio

| Archivo | Descripción | Motor |
|---|---|---|
| `ventas_tech_db.sql` | Crea la base de datos `Ventas_Tech_DB` y sus tablas, y carga los datos de ejemplo. | MySQL |
| `m4_consultas_negocio.sql` | Consultas SQL de negocio (módulo 4): resumen ejecutivo mensual, ranking de productos y clientes recurrentes. | MySQL |
| `m5_consultas_joins.sql` | Consultas con `JOIN` (módulo 5) que combinan ventas, clientes, productos y categorías. | SQL Server |
| `Acre_Ivana_Checkpoint2.pbix` | Archivo de Power BI con el modelo de datos y las medidas DAX. | Power BI |

## Herramientas utilizadas

- **MySQL y MySQL Workbench**: creación de la base y consultas del módulo 4.
- **SQL Server y SQL Server Management Studio (SSMS)**: consultas del módulo 5.
- **Power BI Desktop**: modelado y medidas DAX.
- **GitHub**: control de versiones y publicación del proyecto.

## Cómo ejecutar los scripts SQL

### Creación de la base y consultas del módulo 4 (MySQL)

1. Abrí MySQL Workbench y conectate a tu servidor local.
2. Abrí `ventas_tech_db.sql` desde **File > Open SQL Script** y ejecutalo completo. El script crea la base `Ventas_Tech_DB`, sus tablas y los datos, e incluye la instrucción `USE Ventas_Tech_DB;`.
3. Abrí y ejecutá `m4_consultas_negocio.sql`.

### Consultas del módulo 5 (SQL Server)

1. Abrí SSMS y conectate a tu instancia.
2. Seleccioná la base `Ventas_Tech_M5`, que es donde se ejecutaron estas consultas.
3. Abrí y ejecutá `m5_consultas_joins.sql`.

> **Importante:** los scripts de MySQL y el de SQL Server usan sintaxis distinta (por ejemplo, `EXTRACT(MONTH FROM ...)` y `LIMIT` en MySQL, frente a `MONTH(...)` y `TOP` en SQL Server). Ejecutarlos en el motor equivocado produce errores.
>
> El script que crea la base `Ventas_Tech_M5` en SQL Server no está incluido en este repositorio.

## Cómo abrir el modelo de Power BI

Abrí `Acre_Ivana_Checkpoint2.pbix` con Power BI Desktop. El modelo incluye las medidas DAX del Checkpoint 2.

## Autoría

Proyecto realizado por Ivana Acre como parte del curso de Data Analytics.
