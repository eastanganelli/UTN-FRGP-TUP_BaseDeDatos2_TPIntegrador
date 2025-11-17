SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE VIEW [dbo].[Top5FechasVentas] 
AS SELECT TOP(5)
    V.FechaVenta,
    SUM(ict.Total) AS Recaudacion
FROM ItemsConTotales ict
INNER JOIN Ventas v ON ict.ID = v.ID
INNER JOIN TipoDeComprobante tdc ON v.IDTipoComprobante = tdc.ID
WHERE tdc.TipoComprobante LIKE 'FACTURAS%'
GROUP BY V.FechaVenta
ORDER BY Recaudacion DESC
GO