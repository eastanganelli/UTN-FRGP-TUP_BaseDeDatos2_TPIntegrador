CREATE TABLE [dbo].[Clientes] (
  [ID] [bigint] IDENTITY,
  [IDCondicionIVA] [smallint] NOT NULL,
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
  ADD CONSTRAINT [FK_Clientes_CondicionIVA_ID] FOREIGN KEY ([IDCondicionIVA]) REFERENCES [dbo].[CondicionIVA] ([ID]) ON UPDATE CASCADE
GO