CREATE TABLE [dbo].[Productos] (
  [ID] [bigint] IDENTITY,
  [Nombre] [varchar](100) NOT NULL,
  [Descripcion] [varchar](100) NOT NULL,
  [Precio] [decimal] NOT NULL,
  [Stock] [int] NOT NULL,
  [IDCategoria] [bigint] NOT NULL,
  PRIMARY KEY CLUSTERED ([ID]),
  UNIQUE ([ID]),
  CONSTRAINT [CK_Productos_Precio] CHECK ([Precio]>(0)),
  CONSTRAINT [CK_Productos_Stock] CHECK ([Stock]>=(0))
)
ON [PRIMARY]
GO

ALTER TABLE [dbo].[Productos]
  ADD CONSTRAINT [FK_Productos_Categorias] FOREIGN KEY ([IDCategoria]) REFERENCES [dbo].[Categorias] ([ID])
GO