CREATE TABLE [dbo].[HistorialPrecios] (
  [ID] [int] IDENTITY,
  [IDProducto] [bigint] NOT NULL,
  [Precio] [decimal](18, 2) NOT NULL,
  [FechaDesde] [datetime] NOT NULL DEFAULT (getdate()),
  [FechaHasta] [datetime] NULL,
  PRIMARY KEY CLUSTERED ([ID]),
  CONSTRAINT [CK_HistorialPrecios_Desde_Hasta] CHECK ([FechaHasta]>[FechaDesde]),
  CONSTRAINT [CK_HistorialPrecios_Precio] CHECK ([Precio]>(0))
)
ON [PRIMARY]
GO

ALTER TABLE [dbo].[HistorialPrecios]
  ADD CONSTRAINT [FK_HistorialPrecios_Producto] FOREIGN KEY ([IDProducto]) REFERENCES [dbo].[Productos] ([ID])
GO