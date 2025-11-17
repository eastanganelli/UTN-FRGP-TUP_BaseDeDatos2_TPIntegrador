CREATE TABLE [dbo].[Proveedores] (
  [ID] [bigint] IDENTITY,
  [IDCondicionIVA] [smallint] NOT NULL,
  [Nombre] [varchar](100) NOT NULL,
  [Telefono] [varchar](15) NOT NULL,
  [Direccion] [varchar](150) NOT NULL,
  [Rubro] [varchar](50) NOT NULL,
  [Alta] [bit] NOT NULL,
  [Email] [varchar](50) NOT NULL,
  PRIMARY KEY CLUSTERED ([ID]),
  UNIQUE ([ID])
)
ON [PRIMARY]
GO

ALTER TABLE [dbo].[Proveedores]
  ADD CONSTRAINT [FK_Proveedores_CondicionIVA_ID] FOREIGN KEY ([IDCondicionIVA]) REFERENCES [dbo].[CondicionIVA] ([ID])
GO