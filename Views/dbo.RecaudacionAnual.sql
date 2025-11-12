SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE VIEW [dbo].[RecaudacionAnual] AS
SELECT 
    YEAR(V.FechaVenta) AS Año,
    SUM(I.PrecioTotal) AS RecaudacionTotal
FROM Ventas V
INNER JOIN Items I 
    ON V.ID = I.IDVenta
GROUP BY 
    YEAR(V.FechaVenta);
GO