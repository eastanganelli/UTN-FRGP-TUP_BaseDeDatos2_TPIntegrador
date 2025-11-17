SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[TotalVentasPorTipoComprobante]
AS
BEGIN
    SELECT 
        TC.TipoComprobante,
        SUM(F.TotalConIVA) AS TotalVentas
    FROM Facturas F
    INNER JOIN TipoDeComprobante TC ON F.CodigoTipoComprobante = TC.ID
    GROUP BY TC.TipoComprobante;
END;
GO