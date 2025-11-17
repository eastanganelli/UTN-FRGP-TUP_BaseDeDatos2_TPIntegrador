SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE VIEW [dbo].[ClienteMayorCompras] 
AS SELECT TOP 1
    C.ID AS ClienteID,
    C.Nombre,
    COUNT(V.ID) AS CantidadCompras,
    SUM(ict.Total) AS MontoTotal
FROM Ventas V
INNER JOIN ItemsConTotales ict ON V.ID = ict.IDVenta
INNER JOIN Clientes C ON V.IDCliente = C.ID
INNER JOIN TipoDeComprobante tdc ON V.IDTipoComprobante = tdc.ID
WHERE YEAR(V.FechaVenta) = 2025 AND tdc.TipoComprobante LIKE 'FACTURAS%'
GROUP BY C.ID, C.Nombre
ORDER BY CantidadCompras DESC
GO