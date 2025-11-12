SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE VIEW [dbo].[Top10ProductosVendidos] AS
SELECT TOP 10
    P.ID AS IDProducto,
    P.Nombre AS Producto,
    SUM(I.Cantidad) AS UnidadesVendidas,
    SUM(I.PrecioTotal) AS Recaudacion
FROM Items I
INNER JOIN Productos P 
    ON I.IDProducto = P.ID
GROUP BY 
    P.ID, P.Nombre
ORDER BY 
    UnidadesVendidas DESC;  -- OK, porque usamos TOP
GO