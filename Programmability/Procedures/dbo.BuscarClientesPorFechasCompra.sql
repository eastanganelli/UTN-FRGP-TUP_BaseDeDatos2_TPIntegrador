SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[BuscarClientesPorFechasCompra]
(
    @fechaInicio DATE,
    @fechaFin DATE
)
AS
BEGIN
    SELECT 
        C.ID AS ClienteID,
        C.Nombre,
        COUNT(V.ID) AS CantidadCompras,
        SUM(I.Cantidad * I.PrecioUnitario) AS MontoTotal
    FROM Ventas V
    INNER JOIN Items I ON V.ID = I.IDVenta
    INNER JOIN Clientes C ON V.IDCliente = C.ID
    WHERE V.FechaVenta BETWEEN @fechaInicio AND @fechaFin
    GROUP BY C.ID, C.Nombre
    ORDER BY MontoTotal DESC;
END;
GO