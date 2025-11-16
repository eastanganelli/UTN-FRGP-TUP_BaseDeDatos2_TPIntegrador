CREATE TABLE [dbo].[Ventas] (
  [ID] [bigint] IDENTITY,
  [IDCliente ] [bigint] NOT NULL,
  [FechaVenta] [date] NOT NULL,
  [IDTipoComprobante] [smallint] NOT NULL,
  [CAE] [varchar](60) NULL,
  [VencimientoCAE] [date] NULL,
  PRIMARY KEY CLUSTERED ([ID]),
  UNIQUE ([ID]),
  CONSTRAINT [CK_Ventas_VencimientoCAE] CHECK ([VencimientoCAE]>=[FechaVenta])
)
ON [PRIMARY]
GO

CREATE UNIQUE INDEX [Ventas_index_0]
  ON [dbo].[Ventas] ([CAE], [VencimientoCAE])
  ON [PRIMARY]
GO

SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE TRIGGER [dbo].[TR_AuditarVentas]
ON [Ventas]
AFTER INSERT
AS
BEGIN
    INSERT INTO AuditoriaVentas (IDVenta, Fecha, MontoTotal)
    SELECT V.ID, V.FechaVenta, SUM(I.PrecioTotal)
    FROM inserted V
    INNER JOIN Items I
        ON V.ID = I.IDVenta
    GROUP BY V.ID, V.FechaVenta
END;

GO

ALTER TABLE [dbo].[Ventas] WITH NOCHECK
  ADD FOREIGN KEY ([IDTipoComprobante]) REFERENCES [dbo].[TipoDeComprobante] ([ID])
GO

ALTER TABLE [dbo].[Ventas] WITH NOCHECK
  ADD FOREIGN KEY ([IDTipoComprobante]) REFERENCES [dbo].[TipoDeComprobante] ([ID])
GO

ALTER TABLE [dbo].[Ventas]
  ADD CONSTRAINT [FK_Ventas_Clientes] FOREIGN KEY ([IDCliente ]) REFERENCES [dbo].[Clientes] ([ID])
GO