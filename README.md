# Trabajo Práctico Integrador — Base de Datos 2
Repositorio: eastanganelli/UTN-FRGP-TUP_BaseDeDatos2_TPIntegrador

## Índice
- [Trabajo Práctico Integrador — Base de Datos 2](#trabajo-práctico-integrador--base-de-datos-2)
  - [Índice](#índice)
  - [Introducción](#introducción)
  - [Equipo](#equipo)
  - [Alcance y objetivo del TP](#alcance-y-objetivo-del-tp)
  - [Requisitos](#requisitos)
  - [Estructura del repositorio](#estructura-del-repositorio)

---

## Introducción
Este repositorio contiene la parte de Base de Datos del Trabajo Práctico Integrador de la materia Base de Datos 2 (UTN — FRGP). Aquí se agrupan los scripts T-SQL para crear la estructura, cargar datos de ejemplo, crear vistas, triggers y procedimientos almacenados necesarios para el funcionamiento del proyecto.

## Equipo
- Fano, Martin Daniel  
- Rojas, Agustín Bautista Falcucci  
- Salas, Francisco Daniel  
- Stanganelli, Ezequiel Augusto

## Alcance y objetivo del TP
Breve descripción del tema y objetivo del trabajo práctico:
- Tema: Gestión de Stock.
- Objetivo: Desarrollar e implementar un Sistema de Gestión de Stock que centralice y automatice el registro de productos, proveedores y clientes; actualice automáticamente las existencias tras cada venta; gestione comprobantes y condiciones fiscales; y garantice la integridad y trazabilidad de los datos. El sistema busca mejorar la eficiencia operativa y la toma de decisiones al asegurar la coherencia de la información entre productos, clientes y proveedores.

## Requisitos
- Microsoft SQL Server (versión recomendada: 2016 o superior).
- SQL Server Management Studio (SSMS).

## Estructura del repositorio
Sugerencia de organización de carpetas y archivos (ajustar según lo real):
- /sql
  - init_Database.sql
- /Tables
  - dbo.Categorias.sql
  - dbo.Clientes.sql
  - dbo.CondicionIVA.sql
  - dbo.Etiquetas.sql
  - dbo.HistorialPrecios.sql
  - dbo.Items.sql
  - dbo.MovimientosStock.sql
  - dbo.Productos.sql
  - dbo.Productos_Tiene_proveedor.sql
  - dbo.Proveedor_Tiene_Emails.sql
  - dbo.Proveedor_Tiene_Telefonos.sql
  - dbo.TipoDeComprobante.sql
  - dbo.Ventas.sql
- /Views
  - dbo.ClienteMayorCompras.sql
  - dbo.Facturas.sql
  - dbo.ItemsConTotales.sql
  - dbo.RecaudacionAnual.sql
  - dbo.RecaudacionTrimestral.sql
  - dbo.Top5FechasVentas.sql
  - dbo.Top10ProductosVendidos.sql
- /Programmability/Procedures
  - dbo.BuscarClientesPorFechasCompra.sql
  - dbo.ClienteConVencimientoProximos.sql
  - dbo.ContarFacturasSinCAE.sql
  - dbo.TotalVentasPorTipoComprobante.sql
- /Data
  - expdata.sql
- README.md