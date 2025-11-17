SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE VIEW [dbo].[RecaudacionTrimestral] 
AS SELECT 
    YEAR(V.FechaVenta) AS Año,
    DATEPART(QUARTER, V.FechaVenta) AS Trimestre,
    SUM(ict.Total) AS RecaudacionTotal
FROM Ventas V
INNER JOIN ItemsConTotales ict ON V.ID = ict.IDVenta
INNER JOIN TipoDeComprobante tdc ON v.IDTipoComprobante = tdc.ID
WHERE tdc.TipoComprobante LIKE 'FACTURAS%'
GROUP BY 
    YEAR(V.FechaVenta),
    DATEPART(QUARTER, V.FechaVenta)
GO