SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE VIEW [dbo].[ItemsConTotales] 
AS SELECT
  i.ID, i.IDVenta, i.IDProducto, i.Cantidad, i.PrecioUnitario, (i.Cantidad * i.PrecioUnitario) AS Total
FROM Items i;
GO