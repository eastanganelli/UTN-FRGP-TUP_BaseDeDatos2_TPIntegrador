CREATE TABLE [dbo].[Items] (
  [ID] [bigint] IDENTITY,
  [IDVenta] [bigint] NOT NULL,
  [IDProducto] [bigint] NOT NULL,
  [Cantidad] [int] NOT NULL,
  [PrecioUnitario] [decimal] NOT NULL,
  PRIMARY KEY CLUSTERED ([ID]),
  UNIQUE ([ID]),
  CONSTRAINT [CK_Items_Cantidad] CHECK ([Cantidad]>=(0)),
  CONSTRAINT [CK_Items_PrecioUnitario] CHECK ([PrecioUnitario]>(0))
)
ON [PRIMARY]
GO

CREATE UNIQUE INDEX [Items_index_0]
  ON [dbo].[Items] ([IDVenta], [IDProducto])
  ON [PRIMARY]
GO

SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE TRIGGER [dbo].[TR_VerificarStock]
ON [Items]
AFTER INSERT
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted I
        INNER JOIN Productos P
            ON I.IDProducto = P.ID
        WHERE I.Cantidad > P.Stock
    )
    BEGIN
        RAISERROR('No hay suficiente stock para este producto', 16, 1)
        ROLLBACK TRANSACTION
    END
END;
GO

SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE TRIGGER [dbo].[TR_RestarStock]
ON [Items]
AFTER INSERT
AS
BEGIN
    UPDATE P
    SET P.Stock = P.Stock - I.Cantidad
    FROM Productos P
    INNER JOIN inserted I
        ON P.ID = I.IDProducto
END;
GO

ALTER TABLE [dbo].[Items]
  ADD CONSTRAINT [FK_Items_Productos] FOREIGN KEY ([IDProducto]) REFERENCES [dbo].[Productos] ([ID])
GO

ALTER TABLE [dbo].[Items]
  ADD CONSTRAINT [FK_Items_Ventas] FOREIGN KEY ([IDVenta]) REFERENCES [dbo].[Ventas] ([ID])
GO