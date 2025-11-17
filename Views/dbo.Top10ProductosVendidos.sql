SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE VIEW [dbo].[Top10ProductosVendidos] 
AS SELECT TOP 10
    P.ID AS IDProducto,
    P.Nombre AS Producto,
    SUM(ict.Cantidad) AS UnidadesVendidas,
    SUM(ict.Total) AS Recaudacion
FROM ItemsConTotales ict
INNER JOIN Productos P ON ict.IDProducto = P.ID
INNER JOIN Ventas v ON ict.ID = v.ID
INNER JOIN TipoDeComprobante tdc ON v.IDTipoComprobante = tdc.ID
WHERE tdc.TipoComprobante LIKE 'FACTURAS%'
GROUP BY P.ID, P.Nombre
ORDER BY UnidadesVendidas DESC
GO