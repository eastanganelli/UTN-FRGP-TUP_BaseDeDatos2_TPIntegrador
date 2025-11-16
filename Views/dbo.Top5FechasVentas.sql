SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE VIEW [dbo].[Top5FechasVentas] AS
SELECT TOP 5
    V.FechaVenta,
    SUM(I.Cantidad * I.PrecioUnitario) AS Recaudacion
FROM Ventas V
INNER JOIN Items I 
    ON V.ID = I.IDVenta
GROUP BY V.FechaVenta
ORDER BY Recaudacion DESC; -- OK, porque usamos TOP
GO