CREATE TABLE [dbo].[Productos_Tiene_Proveedor] (
  [IDProducto] [bigint] NOT NULL,
  [IDProveedor] [bigint] NOT NULL,
  [PrecioProveedor] [decimal](10, 2) NOT NULL,
  CONSTRAINT [PK_ProductosTieneProveedor] PRIMARY KEY CLUSTERED ([IDProducto], [IDProveedor]),
  CONSTRAINT [CK_ProductosTieneProveedor_PrecioProveedor] CHECK ([PrecioProveedor]>(0))
)
ON [PRIMARY]
GO

ALTER TABLE [dbo].[Productos_Tiene_Proveedor]
  ADD CONSTRAINT [FK_PTP_Producto] FOREIGN KEY ([IDProducto]) REFERENCES [dbo].[Productos] ([ID])
GO

ALTER TABLE [dbo].[Productos_Tiene_Proveedor]
  ADD CONSTRAINT [FK_PTP_Proveedor] FOREIGN KEY ([IDProveedor]) REFERENCES [dbo].[Proveedores] ([ID])
GO