SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE VIEW [dbo].[RecaudacionTrimestral] AS
SELECT 
    YEAR(V.FechaVenta) AS Año,
    DATEPART(QUARTER, V.FechaVenta) AS Trimestre,
    SUM(I.Cantidad * I.PrecioUnitario) AS RecaudacionTotal
FROM Ventas V
INNER JOIN Items I 
    ON V.ID = I.IDVenta
GROUP BY 
    YEAR(V.FechaVenta),
    DATEPART(QUARTER, V.FechaVenta);
GO