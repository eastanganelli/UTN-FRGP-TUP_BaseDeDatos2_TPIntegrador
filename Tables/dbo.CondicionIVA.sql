CREATE TABLE [dbo].[CondicionIVA] (
  [ID] [smallint] IDENTITY,
  [CondicionIVA] [varchar](60) NOT NULL,
  [Porcentaje] [float] NOT NULL,
  PRIMARY KEY CLUSTERED ([ID]),
  UNIQUE ([ID])
)
ON [PRIMARY]
GO

ALTER TABLE [dbo].[CondicionIVA] WITH NOCHECK
  ADD CONSTRAINT [CK_CondicionIVA_Porcentaje] CHECK ([Porcentaje]>(0.0))
GO