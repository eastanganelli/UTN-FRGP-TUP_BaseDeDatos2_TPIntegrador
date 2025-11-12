SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE VIEW [dbo].[ClienteMayorCompras] AS
SELECT TOP 1
    C.ID AS ClienteID,
    C.Nombre,
    COUNT(V.ID) AS CantidadCompras,
    SUM(I.PrecioTotal) AS MontoTotal
FROM Ventas V
INNER JOIN Items I
    ON V.ID = I.IDVenta
INNER JOIN Clientes C
    ON V.IDCliente = C.ID
WHERE YEAR(V.FechaVenta) = 2025
GROUP BY C.ID, C.Nombre
ORDER BY CantidadCompras DESC; -- OK, porque usamos TOP
GO