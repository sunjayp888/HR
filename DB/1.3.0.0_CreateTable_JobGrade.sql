USE [HR]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS(SELECT 1  FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'JobGrade')
BEGIN

	CREATE TABLE [dbo].JobGrade(
		[JobGradeId] [int] IDENTITY(1,1) NOT NULL,
		[OrganisationId] [int] FOREIGN KEY REFERENCES Organisation(OrganisationId),
		[Name] [nvarchar](100) NOT NULL		
	 CONSTRAINT [PK_JobGrade] PRIMARY KEY CLUSTERED 
	(
		[JobGradeId] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
	
END