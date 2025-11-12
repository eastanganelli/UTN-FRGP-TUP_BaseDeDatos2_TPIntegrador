CREATE TABLE [dbo].[Clientes] (
  [ID] [bigint] IDENTITY,
  [IDTipoResponsable] [smallint] NOT NULL,
  [Nombre] [varchar](100) NOT NULL,
  [Apellido] [varchar](100) NOT NULL,
  [Telefono] [varchar](15) NULL,
  [CUIT_CUIL] [varchar](15) NULL,
  [Alta] [bit] NOT NULL DEFAULT (1),
  [Email] [varchar](225) NULL,
  [TotalCompras] [decimal](18, 2) NULL DEFAULT (0),
  PRIMARY KEY CLUSTERED ([ID])
)
ON [PRIMARY]
GO