SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE VIEW [dbo].[Facturas] 
AS WITH items_por_venta (Venta, CantidadProductos, Total) AS (
    SELECT
        ict.IDVenta AS Venta,
        COUNT(*) AS CantidadProductos,
        SUM(ict.Total) AS Total
    FROM ItemsConTotales ict
    GROUP BY ict.IDVenta
)
SELECT
    V.ID AS IDFactura,
    CONCAT(C.Nombre, ' ', C.Apellido) AS Nombre,
    CIVA.CondicionIVA AS CondicionIVA,
    V.FechaVenta AS FechaEmision,
    TC.TipoComprobante,
    TC.ID AS CodigoTipoComprobante,
    V.CAE,
    V.VencimientoCAE,
    ipv.CantidadProductos,
    ipv.Total AS Total,
    ROUND(ipv.Total * (1+(CIVA.Porcentaje/100)), 2) AS TotalConIVA
FROM items_por_venta ipv
INNER JOIN Ventas V ON ipv.Venta = V.ID
INNER JOIN Clientes C ON V.[IDCliente ] = C.ID
INNER JOIN TipoDeComprobante TC ON V.IDTipoComprobante = TC.ID
INNER JOIN CondicionIVA CIVA ON C.IDCondicionIVA = CIVA.ID
GO