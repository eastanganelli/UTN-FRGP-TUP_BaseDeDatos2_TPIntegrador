CREATE TABLE [dbo].[Proveedor_Tiene_Emails] (
  [Correo] [char](100) NOT NULL,
  [IDProveedor] [bigint] NOT NULL,
  [IDEtiqueta] [int] NOT NULL,
  PRIMARY KEY CLUSTERED ([Correo])
)
ON [PRIMARY]
GO

ALTER TABLE [dbo].[Proveedor_Tiene_Emails]
  ADD CONSTRAINT [FK_Proveedor_Tiene_Emails] FOREIGN KEY ([IDProveedor]) REFERENCES [dbo].[Proveedores] ([ID])
GO

ALTER TABLE [dbo].[Proveedor_Tiene_Emails]
  ADD CONSTRAINT [FK_Proveedor_Tiene_Emails_Etiqueta] FOREIGN KEY ([IDEtiqueta]) REFERENCES [dbo].[Etiquetas] ([ID]) ON UPDATE CASCADE
GO