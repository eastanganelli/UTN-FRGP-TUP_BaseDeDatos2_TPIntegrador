CREATE TABLE [dbo].[Clientes] (
  [ID] [bigint] IDENTITY,
  [IDTipoResponsable] [smallint] NOT NULL,
  [Nombre] [varchar](100) NOT NULL,
  [Apellido] [varchar](100) NOT NULL,
  [Telefono] [varchar](15) NULL,
  [CUIT_CUIL] [varchar](15) NULL,
  [Alta] [bit] NOT NULL DEFAULT (1),
  [Email] [varchar](225) NULL,
  PRIMARY KEY CLUSTERED ([ID])
)
ON [PRIMARY]
GO

ALTER TABLE [dbo].[Clientes]
  ADD CONSTRAINT [FK_Clientes_TipoDeResponsables] FOREIGN KEY ([IDTipoResponsable]) REFERENCES [dbo].[TipoDeResponsables] ([ID])
GO