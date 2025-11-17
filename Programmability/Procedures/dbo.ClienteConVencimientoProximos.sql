SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[ClienteConVencimientoProximos] (@idCliente BIGINT)
AS
BEGIN
    SELECT 
        C.Nombre,
        COUNT(*) AS NumeroFacturasConVencimientoProximo
    FROM Clientes C
    INNER JOIN Ventas V ON C.ID = V.[IDCliente ]
    INNER JOIN Facturas F ON V.ID = F.IDFactura
    WHERE F.VencimientoCAE BETWEEN DATEADD(day, 1, GETDATE()) AND DATEADD(month, 1, GETDATE())
    GROUP BY C.Nombre;
END;
GO