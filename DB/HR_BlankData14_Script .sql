
/****** Object:  Database [HR_BlankData14]    Script Date: 28/02/2017 17:49:38 ******/
CREATE DATABASE [HR_BlankData]
 GO
USE [HR_BlankData]
GO
/****** Object:  Table [dbo].[Absence]    Script Date: 28/02/2017 17:49:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Absence](
	[AbsenceId] [int] IDENTITY(1,1) NOT NULL,
	[OrganisationId] [int] NOT NULL,
	[PersonnelAbsenceEntitlementId] [int] NOT NULL,
	[AbsenceTypeId] [int] NOT NULL,
	[AbsenceStatusByUser] [nvarchar](128) NULL,
	[AbsenceStatusDateTimeUtc] [datetime2](7) NULL,
	[Description] [nvarchar](max) NULL,
	[ReturnToWorkCompleted] [bit] NULL,
	[DoctorsNoteSupplied] [bit] NULL,
	[ApprovalStateId] [int] NOT NULL,
 CONSTRAINT [PK_Absence] PRIMARY KEY CLUSTERED 
(
	[AbsenceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AbsenceDay]    Script Date: 28/02/2017 17:49:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbsenceDay](
	[AbsenceDayId] [int] IDENTITY(1,1) NOT NULL,
	[OrganisationId] [int] NOT NULL,
	[AbsenceId] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[AM] [bit] NOT NULL,
	[PM] [bit] NOT NULL,
	[Duration] [float] NOT NULL,
 CONSTRAINT [PK_AbsenceDay] PRIMARY KEY CLUSTERED 
(
	[AbsenceDayId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AbsencePeriod]    Script Date: 28/02/2017 17:49:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbsencePeriod](
	[AbsencePeriodId] [int] IDENTITY(1,1) NOT NULL,
	[StartDate] [datetime2](7) NOT NULL,
	[EndDate] [datetime2](7) NOT NULL,
	[OrganisationId] [int] NOT NULL,
 CONSTRAINT [PK_AbsencePeriod] PRIMARY KEY CLUSTERED 
(
	[AbsencePeriodId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AbsencePolicy]    Script Date: 28/02/2017 17:49:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbsencePolicy](
	[AbsencePolicyId] [int] IDENTITY(1,1) NOT NULL,
	[OrganisationId] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[WorkingPatternId] [int] NULL,
 CONSTRAINT [PK_AbsencePolicy] PRIMARY KEY CLUSTERED 
(
	[AbsencePolicyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AbsencePolicyEntitlement]    Script Date: 28/02/2017 17:49:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbsencePolicyEntitlement](
	[AbsencePolicyEntitlementId] [int] IDENTITY(1,1) NOT NULL,
	[OrganisationId] [int] NOT NULL,
	[AbsenceTypeId] [int] NOT NULL,
	[FrequencyId] [int] NOT NULL,
	[Entitlement] [float] NOT NULL,
	[MaximumCarryForward] [float] NOT NULL,
	[IsUnplanned] [bit] NOT NULL,
	[IsPaid] [bit] NOT NULL,
	[AbsencePolicyId] [int] NOT NULL,
	[HasEntitlement] [bit] NOT NULL,
 CONSTRAINT [PK_AbsencePolicyEntitlement] PRIMARY KEY CLUSTERED 
(
	[AbsencePolicyEntitlementId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AbsencePolicyPeriod]    Script Date: 28/02/2017 17:49:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbsencePolicyPeriod](
	[AbsencePolicyPeriodId] [int] IDENTITY(1,1) NOT NULL,
	[OrganisationId] [int] NOT NULL,
	[AbsencePolicyId] [int] NOT NULL,
	[AbsencePeriodId] [int] NOT NULL,
 CONSTRAINT [PK_AbsencePolicyPeriod] PRIMARY KEY CLUSTERED 
(
	[AbsencePolicyPeriodId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AbsenceStatus]    Script Date: 28/02/2017 17:49:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AbsenceStatus](
	[AbsenceStatusId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_AbsenceStatus] PRIMARY KEY CLUSTERED 
(
	[AbsenceStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AbsenceType]    Script Date: 28/02/2017 17:49:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbsenceType](
	[AbsenceTypeId] [int] IDENTITY(1,1) NOT NULL,
	[OrganisationId] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[ColourId] [int] NOT NULL,
 CONSTRAINT [PK_AbsenceType] PRIMARY KEY CLUSTERED 
(
	[AbsenceTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Alert]    Script Date: 28/02/2017 17:49:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alert](
	[AlertId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](1000) NULL,
	[OrganisationId] [int] NOT NULL,
 CONSTRAINT [PK_Alert] PRIMARY KEY CLUSTERED 
(
	[AlertId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Approval]    Script Date: 28/02/2017 17:49:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Approval](
	[OrganisationId] [int] NOT NULL,
	[ApprovalEntityTypeId] [int] NOT NULL,
	[EntityId] [int] NOT NULL,
	[ApproverAspNetUserId] [nvarchar](128) NULL,
	[ApprovalLevelId] [int] NOT NULL,
	[ApprovalStateId] [int] NULL,
	[CreatedDateUtc] [datetime2](7) NOT NULL,
	[UpdatedDateUtc] [datetime2](7) NULL,
	[ApprovalId] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ApprovalId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ApprovalEntityType]    Script Date: 28/02/2017 17:49:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApprovalEntityType](
	[ApprovalEntityTypeId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ApprovalEntity] PRIMARY KEY CLUSTERED 
(
	[ApprovalEntityTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ApprovalLevel]    Script Date: 28/02/2017 17:49:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApprovalLevel](
	[ApprovalLevelId] [int] IDENTITY(1,1) NOT NULL,
	[OrganisationId] [int] NOT NULL,
	[ApprovalModelId] [int] NOT NULL,
	[LevelNumber] [int] NOT NULL,
 CONSTRAINT [PK_ApprovalLevel] PRIMARY KEY CLUSTERED 
(
	[ApprovalLevelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ApprovalLevelUser]    Script Date: 28/02/2017 17:49:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApprovalLevelUser](
	[ApprovalLevelUserId] [int] IDENTITY(1,1) NOT NULL,
	[OrganisationId] [int] NULL,
	[ApprovalLevelId] [int] NOT NULL,
	[AspNetUserId] [nvarchar](128) NULL,
 CONSTRAINT [PK_ApprovalLevelUser] PRIMARY KEY CLUSTERED 
(
	[ApprovalLevelUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ApprovalModel]    Script Date: 28/02/2017 17:49:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApprovalModel](
	[ApprovalModelId] [int] IDENTITY(1,1) NOT NULL,
	[OrganisationId] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ApprovalModel] PRIMARY KEY CLUSTERED 
(
	[ApprovalModelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ApprovalState]    Script Date: 28/02/2017 17:49:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApprovalState](
	[ApprovalStateId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ApprovalState] PRIMARY KEY CLUSTERED 
(
	[ApprovalStateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 28/02/2017 17:49:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
	[Discriminator] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 28/02/2017 17:49:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 28/02/2017 17:49:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 28/02/2017 17:49:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 28/02/2017 17:49:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
	[OrganisationId] [int] NULL,
	[PersonnelId] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUsersAlertSchedule]    Script Date: 28/02/2017 17:49:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsersAlertSchedule](
	[AspnetUsersAlertScheduleId] [int] IDENTITY(1,1) NOT NULL,
	[AspNetUsersId] [nvarchar](128) NOT NULL,
	[AlertId] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsersAlertSchedule] PRIMARY KEY CLUSTERED 
(
	[AspnetUsersAlertScheduleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Building]    Script Date: 28/02/2017 17:49:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Building](
	[BuildingId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[OrganisationId] [int] NOT NULL,
	[SiteId] [int] NOT NULL,
	[Address1] [nvarchar](100) NULL,
 CONSTRAINT [PK_Building] PRIMARY KEY CLUSTERED 
(
	[BuildingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Colour]    Script Date: 28/02/2017 17:49:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Colour](
	[ColourId] [int] NOT NULL,
	[Hex] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ColourId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Company]    Script Date: 28/02/2017 17:49:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[CompanyId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[OrganisationId] [int] NOT NULL,
	[ColourId] [int] NOT NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[CompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CompanyBuilding]    Script Date: 28/02/2017 17:49:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompanyBuilding](
	[CompanyBuildingId] [int] IDENTITY(1,1) NOT NULL,
	[BuildingId] [int] NOT NULL,
	[CompanyId] [int] NOT NULL,
	[OrganisationId] [int] NOT NULL,
 CONSTRAINT [PK_CompanyBuilding] PRIMARY KEY CLUSTERED 
(
	[CompanyBuildingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Country]    Script Date: 28/02/2017 17:49:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[CountryId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[OrganisationId] [int] NOT NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[CountryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Department]    Script Date: 28/02/2017 17:49:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[DepartmentId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[OrganisationId] [int] NOT NULL,
	[ColourId] [int] NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[DepartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EmergencyContact]    Script Date: 28/02/2017 17:49:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EmergencyContact](
	[EmergencyContactId] [int] IDENTITY(1,1) NOT NULL,
	[OrganisationId] [int] NOT NULL,
	[PersonnelId] [int] NOT NULL,
	[Relationship] [varchar](50) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Forenames] [nvarchar](100) NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
	[CountryId] [int] NULL,
	[Address1] [nvarchar](100) NULL,
	[Address2] [nvarchar](100) NULL,
	[Address3] [nvarchar](100) NULL,
	[Address4] [nvarchar](100) NULL,
	[Postcode] [nvarchar](12) NULL,
	[Telephone] [varchar](15) NOT NULL,
	[Mobile] [varchar](15) NULL,
 CONSTRAINT [PK_EmergencyContact] PRIMARY KEY CLUSTERED 
(
	[EmergencyContactId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Employment]    Script Date: 28/02/2017 17:49:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employment](
	[EmploymentId] [int] IDENTITY(1,1) NOT NULL,
	[OrganisationId] [int] NOT NULL,
	[PersonnelId] [int] NOT NULL,
	[StartDate] [datetime2](7) NOT NULL,
	[EndDate] [datetime2](7) NULL,
	[TerminationDate] [datetime2](7) NULL,
	[BuildingId] [int] NOT NULL,
	[ReportsToPersonnelId] [int] NULL,
	[JobTitle] [nvarchar](100) NULL,
	[JobDescription] [nvarchar](max) NULL,
	[EndEmploymentReasonId] [int] NULL,
	[WorkingPatternId] [int] NULL,
	[PublicHolidayPolicyId] [int] NOT NULL,
	[AbsencePolicyId] [int] NOT NULL,
	[CompanyId] [int] NOT NULL,
	[EmploymentTypeId] [int] NOT NULL,
	[JobTitleId] [int] NULL,
	[JobGradeId] [int] NULL,
 CONSTRAINT [PK_Employment] PRIMARY KEY CLUSTERED 
(
	[EmploymentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EmploymentDepartment]    Script Date: 28/02/2017 17:49:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmploymentDepartment](
	[EmploymentDepartmentId] [int] IDENTITY(1,1) NOT NULL,
	[EmploymentId] [int] NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[OrganisationId] [int] NOT NULL,
 CONSTRAINT [PK_EmploymentDepartment] PRIMARY KEY CLUSTERED 
(
	[EmploymentDepartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EmploymentPersonnelAbsenceEntitlement]    Script Date: 28/02/2017 17:49:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmploymentPersonnelAbsenceEntitlement](
	[EmploymentPersonnelAbsenceEntitlementId] [int] IDENTITY(1,1) NOT NULL,
	[EmploymentId] [int] NOT NULL,
	[PersonnelAbsenceEntitlementId] [int] NOT NULL,
	[OrganisationId] [int] NOT NULL,
 CONSTRAINT [PK_EmploymentPersonnelAbsenceEntitlement] PRIMARY KEY CLUSTERED 
(
	[EmploymentPersonnelAbsenceEntitlementId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EmploymentTeam]    Script Date: 28/02/2017 17:49:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmploymentTeam](
	[EmploymentTeamId] [int] IDENTITY(1,1) NOT NULL,
	[EmploymentId] [int] NOT NULL,
	[TeamId] [int] NOT NULL,
	[OrganisationId] [int] NOT NULL,
 CONSTRAINT [PK_EmploymentTeam] PRIMARY KEY CLUSTERED 
(
	[EmploymentTeamId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EmploymentType]    Script Date: 28/02/2017 17:49:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmploymentType](
	[EmploymentTypeId] [int] IDENTITY(1,1) NOT NULL,
	[OrganisationId] [int] NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_EmploymentType] PRIMARY KEY CLUSTERED 
(
	[EmploymentTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Frequency]    Script Date: 28/02/2017 17:49:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Frequency](
	[FrequencyId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Periods] [int] NOT NULL,
 CONSTRAINT [PK_Frequency] PRIMARY KEY CLUSTERED 
(
	[FrequencyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Host]    Script Date: 28/02/2017 17:49:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Host](
	[HostId] [smallint] IDENTITY(1,1) NOT NULL,
	[HostName] [nvarchar](100) NOT NULL,
	[OrganisationId] [int] NOT NULL,
 CONSTRAINT [PK_Host] PRIMARY KEY CLUSTERED 
(
	[HostId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[JobGrade]    Script Date: 28/02/2017 17:49:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobGrade](
	[JobGradeId] [int] IDENTITY(1,1) NOT NULL,
	[OrganisationId] [int] NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_JobGrade] PRIMARY KEY CLUSTERED 
(
	[JobGradeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[JobTitle]    Script Date: 28/02/2017 17:49:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobTitle](
	[JobTitleId] [int] IDENTITY(1,1) NOT NULL,
	[OrganisationId] [int] NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_JobTitle] PRIMARY KEY CLUSTERED 
(
	[JobTitleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[JobTitleDocument]    Script Date: 28/02/2017 17:49:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobTitleDocument](
	[JobTitleDocumentId] [int] IDENTITY(1,1) NOT NULL,
	[OrganisationId] [int] NOT NULL,
	[JobTitleId] [int] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_JobTitleDocument] PRIMARY KEY CLUSTERED 
(
	[JobTitleDocumentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[JobTitleJobGrade]    Script Date: 28/02/2017 17:49:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobTitleJobGrade](
	[JobTitleJobGradeId] [int] IDENTITY(1,1) NOT NULL,
	[JobTitleId] [int] NULL,
	[JobGradeId] [int] NULL,
	[OrganisationId] [int] NULL,
 CONSTRAINT [PK_JobTitleJobGradeId] PRIMARY KEY CLUSTERED 
(
	[JobTitleJobGradeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Organisation]    Script Date: 28/02/2017 17:49:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Organisation](
	[OrganisationId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Organisation_1] PRIMARY KEY CLUSTERED 
(
	[OrganisationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Overtime]    Script Date: 28/02/2017 17:49:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Overtime](
	[OvertimeId] [int] IDENTITY(1,1) NOT NULL,
	[OrganisationId] [int] NOT NULL,
	[OvertimePreferenceId] [int] NOT NULL,
	[PersonnelId] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[Hours] [float] NOT NULL,
	[Reason] [nvarchar](255) NOT NULL,
	[Comment] [nvarchar](255) NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[CreatedDateUtc] [datetime] NULL,
	[UpdatedBy] [nvarchar](50) NULL,
	[UpdatedDateUtc] [datetime] NULL,
	[ApprovalStateId] [int] NOT NULL,
 CONSTRAINT [PK_Overtime] PRIMARY KEY CLUSTERED 
(
	[OvertimeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OvertimePreference]    Script Date: 28/02/2017 17:49:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OvertimePreference](
	[OvertimePreferenceId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_OvertimePreference] PRIMARY KEY CLUSTERED 
(
	[OvertimePreferenceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Personnel]    Script Date: 28/02/2017 17:49:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Personnel](
	[PersonnelId] [int] IDENTITY(1,1) NOT NULL,
	[OrganisationId] [int] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Forenames] [nvarchar](100) NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
	[DOB] [datetime2](7) NOT NULL,
	[CountryId] [int] NOT NULL,
	[Address1] [nvarchar](100) NOT NULL,
	[Address2] [nvarchar](100) NULL,
	[Address3] [nvarchar](100) NULL,
	[Address4] [nvarchar](100) NULL,
	[Postcode] [nvarchar](12) NOT NULL,
	[Telephone] [varchar](15) NOT NULL,
	[Mobile] [varchar](15) NULL,
	[NINumber] [varchar](10) NOT NULL,
	[BankAccountNumber] [varchar](10) NULL,
	[BankSortCode] [varchar](6) NULL,
	[BankAccountName] [nvarchar](100) NULL,
	[BankAddress1] [nvarchar](100) NULL,
	[BankAddress2] [nvarchar](100) NULL,
	[BankAddress3] [nvarchar](100) NULL,
	[BankAddress4] [nvarchar](100) NULL,
	[BankPostcode] [nvarchar](12) NULL,
	[BankTelephone] [varchar](15) NULL,
	[Email] [varchar](256) NOT NULL,
 CONSTRAINT [PK_Personnel] PRIMARY KEY CLUSTERED 
(
	[PersonnelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PersonnelAbsenceEntitlement]    Script Date: 28/02/2017 17:49:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersonnelAbsenceEntitlement](
	[PersonnelAbsenceEntitlementId] [int] IDENTITY(1,1) NOT NULL,
	[OrganisationId] [int] NOT NULL,
	[PersonnelId] [int] NOT NULL,
	[AbsencePolicyPeriodId] [int] NOT NULL,
	[AbsenceTypeId] [int] NULL,
	[StartDate] [datetime2](7) NOT NULL,
	[EndDate] [datetime2](7) NOT NULL,
	[Entitlement] [float] NULL,
	[CarriedOver] [float] NULL,
	[Used] [float] NULL,
	[Remaining] [float] NULL,
	[MaximumCarryForward] [float] NULL,
	[FrequencyId] [int] NOT NULL,
 CONSTRAINT [PK_PersonnelAbsenceEntitlement] PRIMARY KEY CLUSTERED 
(
	[PersonnelAbsenceEntitlementId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PersonnelApprovalModel]    Script Date: 28/02/2017 17:49:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersonnelApprovalModel](
	[PersonnelApprovalModelId] [int] IDENTITY(1,1) NOT NULL,
	[OrganisationId] [int] NOT NULL,
	[PersonnelId] [int] NOT NULL,
	[ApprovalModelId] [int] NOT NULL,
	[ApprovalEntityTypeId] [int] NOT NULL,
 CONSTRAINT [PK_PersonnelApprovalModel] PRIMARY KEY CLUSTERED 
(
	[PersonnelApprovalModelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PublicHoliday]    Script Date: 28/02/2017 17:49:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PublicHoliday](
	[PublicHolidayId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Date] [datetime2](7) NOT NULL,
	[OrganisationId] [int] NOT NULL,
	[PublicHolidayPolicyId] [int] NOT NULL,
 CONSTRAINT [PK_PublicHoliday] PRIMARY KEY CLUSTERED 
(
	[PublicHolidayId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PublicHolidayPolicy]    Script Date: 28/02/2017 17:49:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PublicHolidayPolicy](
	[PublicHolidayPolicyId] [int] IDENTITY(1,1) NOT NULL,
	[OrganisationId] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_PublicHolidayPolicy] PRIMARY KEY CLUSTERED 
(
	[PublicHolidayPolicyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Site]    Script Date: 28/02/2017 17:49:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Site](
	[SiteId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[CountryId] [int] NOT NULL,
	[OrganisationId] [int] NOT NULL,
 CONSTRAINT [PK_Site] PRIMARY KEY CLUSTERED 
(
	[SiteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Team]    Script Date: 28/02/2017 17:49:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Team](
	[TeamId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[OrganisationId] [int] NOT NULL,
	[ColourId] [int] NOT NULL,
 CONSTRAINT [PK_Team] PRIMARY KEY CLUSTERED 
(
	[TeamId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WorkingPattern]    Script Date: 28/02/2017 17:49:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkingPattern](
	[WorkingPatternId] [int] IDENTITY(1,1) NOT NULL,
	[OrganisationId] [int] NOT NULL,
 CONSTRAINT [PK_WorkingPattern] PRIMARY KEY CLUSTERED 
(
	[WorkingPatternId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WorkingPatternDay]    Script Date: 28/02/2017 17:49:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkingPatternDay](
	[WorkingPatternDayId] [int] IDENTITY(1,1) NOT NULL,
	[WorkingPatternId] [int] NOT NULL,
	[DayOfWeek] [smallint] NOT NULL,
	[AM] [bit] NOT NULL,
	[PM] [bit] NOT NULL,
 CONSTRAINT [PK_WorkingPatternDay] PRIMARY KEY CLUSTERED 
(
	[WorkingPatternDayId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[PersonnelSearchField]    Script Date: 28/02/2017 17:49:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[PersonnelSearchField]
AS 
SELECT 
		PersonnelId,
		OrganisationId,
		Title,
		Forenames,
		Surname,
		DOB,
		CountryId,
		Address1,
		Address2,
		Address3,
		Address4,
		Postcode,
		Telephone,
		Mobile,
		NINumber,
		BankAccountNumber,
		BankSortCode,
		BankAccountName,
		BankAddress1,
		BankAddress2,
		BankAddress3,
		BankAddress4,
		BankPostcode,
		BankTelephone,
		Email,
	
		ISNULL(Surname, '') + ISNULL(Forenames, '') + ISNULL(Surname, '') + ISNULL(CONVERT(varchar,DOB, 101), '') + ISNULL(CONVERT(varchar,DOB, 103), '') + ISNULL(CONVERT(varchar,DOB, 105), '') + ISNULL(CONVERT(varchar,DOB, 126), '') + ISNULL(EMail, '') + ISNULL(Postcode, '') + ISNULL(Mobile, '') AS SearchField
FROM 
	Personnel  WITH (NOLOCK)






GO
/****** Object:  View [dbo].[UserAuthorisationFilter]    Script Date: 28/02/2017 17:49:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[UserAuthorisationFilter]
AS 
SELECT 
	ROW_NUMBER() OVER(ORDER BY p.PersonnelId, ur.RoleId) AS Id,
	p.PersonnelId,
	u.Id AS AspNetUsersId, 
	u.OrganisationId,
	ur.RoleId,
	r.Name AS RoleName
FROM
	AspNetUsers u
INNER JOIN
	AspNetUserRoles ur
		ON u.Id = ur.UserId
INNER JOIN
	AspNetRoles r 
		on ur.RoleId = r.Id
LEFT JOIN
	Personnel p 
		ON u.PersonnelId = p.PersonnelId





GO
SET IDENTITY_INSERT [dbo].[AbsenceStatus] ON 

GO
INSERT [dbo].[AbsenceStatus] ([AbsenceStatusId], [Name]) VALUES (1, N'Unapproved')
GO
INSERT [dbo].[AbsenceStatus] ([AbsenceStatusId], [Name]) VALUES (2, N'Approved')
GO
INSERT [dbo].[AbsenceStatus] ([AbsenceStatusId], [Name]) VALUES (3, N'Declined')
GO
SET IDENTITY_INSERT [dbo].[AbsenceStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[ApprovalEntityType] ON 

GO
INSERT [dbo].[ApprovalEntityType] ([ApprovalEntityTypeId], [Name]) VALUES (1, N'Absence')
GO
INSERT [dbo].[ApprovalEntityType] ([ApprovalEntityTypeId], [Name]) VALUES (2, N'Overtime')
GO
SET IDENTITY_INSERT [dbo].[ApprovalEntityType] OFF
GO
SET IDENTITY_INSERT [dbo].[ApprovalState] ON 

GO
INSERT [dbo].[ApprovalState] ([ApprovalStateId], [Name]) VALUES (1, N'Unapproved')
GO
INSERT [dbo].[ApprovalState] ([ApprovalStateId], [Name]) VALUES (2, N'In Approval')
GO
INSERT [dbo].[ApprovalState] ([ApprovalStateId], [Name]) VALUES (3, N'Approved')
GO
INSERT [dbo].[ApprovalState] ([ApprovalStateId], [Name]) VALUES (4, N'Declined')
GO
SET IDENTITY_INSERT [dbo].[ApprovalState] OFF
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [Discriminator]) VALUES (N'1', N'SuperAdmin', N'ApplicationRole')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [Discriminator]) VALUES (N'2', N'Admin', N'ApplicationRole')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [Discriminator]) VALUES (N'3', N'User', N'ApplicationRole')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'01b40bcf-c599-473c-854c-4effa911ec1e', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'032c1e43-fba7-47f8-a477-9a09dcf82daa', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'04ee5f8b-e018-4a17-aac9-b6019cfce276', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'0a6b1e2b-4ac3-414e-8738-9e5a4d9b6e36', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'0b23dc04-f364-45ba-b98e-fb0a49f94656', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'0e1f2504-a4a0-47c8-a544-34d0f87be84d', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'0f13e616-a95a-47a5-9995-60cbc592c3d1', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'0f7a08f6-1a5a-4319-a5fd-1f2fa719634d', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'10f5e02b-c762-4565-8b2d-0f43aa081319', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'116fc575-4a86-4f13-b997-fe9f32d305ff', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'127a06b6-eccf-4d87-a3d6-6ded8db06fa7', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'1700c28e-d342-4959-bb7d-641d66f6719f', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'171a1ccd-5b8e-446e-93ba-d57a09f30038', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'1ca4f2bf-dd06-44a4-aa09-2b4dcf5b4a79', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'1f2db86c-81fb-4eec-9d5f-0c780eafb590', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'246e2f76-68bd-486a-8468-c54851c87541', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'24b0530f-ce19-4004-be38-a6cc1533e322', N'2')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'25e7ccce-481b-48eb-93f9-e2d5d34ef3a6', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'2992313b-87d5-4229-8c3a-6578d222e293', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'2ac20a85-a6dc-4429-92e1-15b00f08adb8', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'2b212e45-53b4-4a91-b3d6-da59ac72fa8c', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'2b804bc1-9dc4-4cf6-ae56-a5ffb713b8f1', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'2b9a1443-fa62-4cb0-aec7-b7b5770436ac', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'2c4ebd78-f541-440c-b9de-fad81a0f5a98', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'2d921f72-b892-4cca-b294-210592790854', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'2e6eb4ce-a1e1-4b29-92eb-de5d428cb6cc', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'2f4ebcc1-5ff9-4f9f-a31d-66c47aee5894', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'2fd4cd69-4a25-46e0-af8c-2ed5d28f610f', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'30ee0b23-785a-4d06-a95d-0f7b6d9ce31f', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'316f648b-6ca2-4d98-9f93-c7afdd943789', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'320ac667-ee90-48a2-9b53-fb9c10ec0d61', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'33bb0ae7-2832-4072-8622-fec97b97b71b', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'35cc370a-f717-496e-b227-75cc1641420d', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'368eb845-84c0-4b41-a3fe-4b8e17566012', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'38279ad7-91c8-4968-932c-0a5a05ab495c', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'3deed64b-69ec-49fc-905f-a73cd5582f3c', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'3fda0c97-10ed-47c9-b4ec-7783950de914', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'40ee8af2-4d7c-4a93-af2b-118d78db6b81', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'431aa089-ac08-48d6-b671-e1087f85bcb8', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'4741b301-d9dc-4c8e-b029-a8688a0a0308', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'475e52f8-bb3b-4834-ae84-17842b12b0c8', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'491e3deb-c570-47f1-aec9-b649ac239db2', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'4cdce9f5-89a3-4680-a211-1c0913bf58bf', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'50b3a684-5599-4a40-9f0f-47a5c37e8e15', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'52634401-d7fa-4831-9660-dc0db35a6182', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'52abb99d-d48a-4d32-ba55-bbb89bece8de', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'552b29ce-8872-4f8c-b8dd-747ae4333e4e', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'55a1f00f-cd0b-491f-b04b-57803b0db161', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'58bfb3ef-4949-4d43-8c89-a1409d16a08a', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'594e3477-339d-4749-8b89-58d75936a640', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'5f4dd0b1-b3e8-4203-bc10-1df868bf5963', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'648b8178-35bf-4223-8ebf-7649977683c7', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'6d1ac742-b071-42ac-8c8b-4a7921e7cb93', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'6ef120ae-6041-4314-86ee-884093da1a68', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'6fa2b32d-5e7a-421e-a07a-9993a3f31e25', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'76b86419-ffc0-48f5-bf33-59c6af00a30c', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'777e2ec6-d74a-4707-a1ef-16c96f73248d', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'7d585050-8a4a-4d9a-960b-2228875ddc46', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'8157d325-2c95-4811-82b3-b215fd49afa4', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'81c6963a-e6b6-40f2-8ff7-ab17a033d95f', N'2')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'81f122b6-12f3-463b-9da0-0a5442cca932', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'87731cf8-8a27-4efe-8f6a-7ed3b2b5f255', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'87856032-423b-4815-aeb8-69b7e4683a22', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'8a1fd140-cf16-4243-87d7-35f4a6a24964', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'8acf06ba-e517-4b6e-abcb-359024cc2ad9', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'9126ad61-924c-4ec3-8eaf-05386fb9a999', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'951adbe5-0358-434a-9679-361df7fd7c97', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'995a714c-8876-41ab-8e48-1c79b01d459f', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'9b923fee-8028-493a-b54d-666fb6397a75', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'9bb0610e-788e-4dfc-93b6-82af4c016765', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'9effd70d-1f78-46e1-ac53-34a385128d0f', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'a4110fcf-efe0-4055-986e-02e1d2affbc4', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'a665ba9e-db2c-46bc-9ba1-db9516f69ca7', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'a79cb6fc-1cba-4f32-96f9-e1e4e9890ee5', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'aab6fc24-4f57-4de7-9979-3b790eef72c9', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'ac669362-e345-42b9-81cf-14f7c15483b1', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'ae397432-e4aa-44a6-80a6-dc9bea2a251e', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'afcf5153-7257-4d0e-9095-2d2286c0abbe', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'afdca75e-d51d-410b-abfc-a3fb0b61a198', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'b38dc1bf-0691-4edf-9428-7b205a07f80d', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'b7ca56c6-e0b1-4d0c-8657-01ee818a377f', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'b8b98ad6-d3db-4ff5-9c24-5b0f7c9cee3a', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'baa66088-ea1b-43ab-b8b0-ee75523e613a', N'2')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'bb141879-1336-4a91-8640-506a9d1f71bf', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'bbe75a61-9216-4c97-8e5c-2a85ec3b6885', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'c1a636b0-4939-4da5-8e76-bbb2c876d82b', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'c2971d39-34ae-4165-89dc-78fedde57f81', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'c42d62c2-1c0b-4f32-8c0f-c13ab60e3073', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'c7ef57ec-c373-49bc-bbcb-f677b6dea483', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'c89371f4-0eea-4b6a-bfc9-b690a01f9e5f', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'ca1a33e0-4455-484c-a494-2d6ee9921359', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'cb97b8f6-3c63-410d-9d97-658a401a3c7a', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'cd588053-3088-4ad2-b26d-22b0822fe855', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'ceddcad2-e6ab-4046-a109-11c1c8b5ffa3', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'd328e7fc-fc33-4967-b2c6-315c4448aff1', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'd44536bd-ffe2-4feb-ac45-7008d86a8383', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'df92751c-3494-495f-87bc-d5c3dfcdf79d', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'e142cf51-13d8-40af-8e2f-50b792770cbb', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'e2ae65fc-51f3-4d01-8c0c-063c4abd0da2', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'e3482627-f15f-4d8d-b347-572e78e41dae', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'e9980260-e5b9-4e13-bb3d-eb7d9a91fe01', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'ea78e966-60fc-42d3-8fd2-68e826d1c56d', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'f1e97402-9a85-4dbc-8919-fcaf4318f7c7', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'f6295d2a-12ee-4d1e-ab0b-707716a24d6a', N'2')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'f72d0864-d72f-468b-940c-1a3deb3b3250', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'fa4c3ca7-d0d6-4c09-9dd7-22af3c5d6abe', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'fbe3dde3-c2da-4337-9667-0d363bfac5c5', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'fdd6d9a2-1d33-4e76-a4e5-7988effb6d81', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'fe4e498e-2790-4d03-8bf8-06962bb0e79f', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'fe861a67-db8e-401f-95f3-9142300a7e84', N'1')
GO
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [OrganisationId], [PersonnelId]) VALUES (N'fe861a67-db8e-401f-95f3-9142300a7e84', N'superadmin@itsupportlimited.com', 1, N'AFAer9GyepjQA5csPi4JDIGT/8xTLOOISoUgP76GyRR4ovNixtJPGeYPJ4aoWAXhqw==', N'dac1f363-20c6-4593-a998-f35725ba23c9', NULL, 0, 0, NULL, 0, 0, N'superadmin@itsupportlimited.com', NULL, NULL)
GO
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [OrganisationId], [PersonnelId]) VALUES (N'f6295d2a-12ee-4d1e-ab0b-707716a24d6a', N'admin1@itsupportlimited.com', 1, N'AKx/BlAAgt0InFnzYZGtOlEmZLDyeRPCG8dT9pQF6EHLo5tBitvfQVUdE27RXmiZ6Q==', N'62873593-517e-4f95-9f64-0490e940528a', NULL, 0, 0, NULL, 0, 0, N'admin1@itsupportlimited.com', 1, NULL)
GO
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [OrganisationId], [PersonnelId]) VALUES (N'24b0530f-ce19-4004-be38-a6cc1533e322', N'admin2@itsupportlimited.com', 1, N'ACVfIh0mQ5oH9pdcSc6ERNl7qQCkqRoD7QRygwJbfypaJn0kgM1gT14pb94Zimmi2g==', N'e34fdba4-6bec-417f-923f-8d95dda829b2', NULL, 0, 0, NULL, 0, 0, N'admin2@itsupportlimited.com', 1, NULL)
GO
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [OrganisationId], [PersonnelId]) VALUES (N'afcf5153-7257-4d0e-9095-2d2286c0abbe', N'employee@itsupportlimited.com', 1, N'APKaRU8mmaEDb4qhGZtULX9+BL7P3egWUXbAmBLNaWdRzsJT0CIk+heD4A7sWhp/sw==', N'cf421afd-9c38-457c-a6af-c521e1d602d9', NULL, 0, 0, NULL, 0, 0, N'employee@itsupportlimited.com', NULL, NULL)
GO
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [OrganisationId], [PersonnelId]) VALUES (N'81c6963a-e6b6-40f2-8ff7-ab17a033d95f', N'admindevuk@itsupportlimited.com', 1, N'AOZ7eoPANrypxjGJqhmnnz6qbbgFbu4Jv1Wi2hvT+v1R6xkP9cvS5PVG6AdYH3f+ow==', N'87edef0d-7230-4a5e-81a5-00e45867c9b7', NULL, 0, 0, NULL, 0, 0, N'admindevuk@itsupportlimited.com', 1, NULL)
GO
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [OrganisationId], [PersonnelId]) VALUES (N'baa66088-ea1b-43ab-b8b0-ee75523e613a', N'admindevmumbai@itsupportlimited.com', 1, N'AAmuYdVcwfyvri+pKSdq1fDhPzxrHGR4xNVNXO2+E6lff1YWbpYHSIPVe4zcEjYSxw==', N'2638a07d-1d70-4d9d-aea8-9fa592ebd519', NULL, 0, 0, NULL, 0, 0, N'admindevmumbai@itsupportlimited.com', 1, NULL)
GO
INSERT [dbo].[Colour] ([ColourId], [Hex]) VALUES (1, N'ff8000')
GO
INSERT [dbo].[Colour] ([ColourId], [Hex]) VALUES (2, N'FF0000')
GO
INSERT [dbo].[Colour] ([ColourId], [Hex]) VALUES (3, N'808080')
GO
INSERT [dbo].[Colour] ([ColourId], [Hex]) VALUES (4, N'708090')
GO
INSERT [dbo].[Colour] ([ColourId], [Hex]) VALUES (5, N'000000')
GO
INSERT [dbo].[Colour] ([ColourId], [Hex]) VALUES (6, N'FFFFE0')
GO
INSERT [dbo].[Colour] ([ColourId], [Hex]) VALUES (7, N'FFD700')
GO
INSERT [dbo].[Colour] ([ColourId], [Hex]) VALUES (8, N'FFC0CB')
GO
INSERT [dbo].[Colour] ([ColourId], [Hex]) VALUES (9, N'FF69B4')
GO
INSERT [dbo].[Colour] ([ColourId], [Hex]) VALUES (10, N'FFA07A')
GO
INSERT [dbo].[Colour] ([ColourId], [Hex]) VALUES (11, N'FA8072')
GO
INSERT [dbo].[Colour] ([ColourId], [Hex]) VALUES (12, N'DC143C')
GO
INSERT [dbo].[Colour] ([ColourId], [Hex]) VALUES (13, N'B22222')
GO
INSERT [dbo].[Colour] ([ColourId], [Hex]) VALUES (14, N'FF0000')
GO
INSERT [dbo].[Colour] ([ColourId], [Hex]) VALUES (15, N'FF4500')
GO
INSERT [dbo].[Colour] ([ColourId], [Hex]) VALUES (16, N'FF8C00')
GO
INSERT [dbo].[Colour] ([ColourId], [Hex]) VALUES (17, N'FFA500')
GO
INSERT [dbo].[Colour] ([ColourId], [Hex]) VALUES (18, N'DEB887')
GO
INSERT [dbo].[Colour] ([ColourId], [Hex]) VALUES (19, N'F4A460')
GO
INSERT [dbo].[Colour] ([ColourId], [Hex]) VALUES (20, N'B8860B')
GO
INSERT [dbo].[Colour] ([ColourId], [Hex]) VALUES (21, N'CD853F')
GO
INSERT [dbo].[Colour] ([ColourId], [Hex]) VALUES (22, N'8B4513')
GO
INSERT [dbo].[Colour] ([ColourId], [Hex]) VALUES (23, N'A52A2A')
GO
INSERT [dbo].[Colour] ([ColourId], [Hex]) VALUES (24, N'800000')
GO
INSERT [dbo].[Colour] ([ColourId], [Hex]) VALUES (25, N'556B2F')
GO
INSERT [dbo].[Colour] ([ColourId], [Hex]) VALUES (26, N'6B8E23')
GO
INSERT [dbo].[Colour] ([ColourId], [Hex]) VALUES (27, N'32CD32')
GO
INSERT [dbo].[Colour] ([ColourId], [Hex]) VALUES (28, N'00FF00')
GO
INSERT [dbo].[Colour] ([ColourId], [Hex]) VALUES (29, N'00FF7F')
GO
INSERT [dbo].[Colour] ([ColourId], [Hex]) VALUES (30, N'008000')
GO
INSERT [dbo].[Colour] ([ColourId], [Hex]) VALUES (31, N'006400')
GO
INSERT [dbo].[Colour] ([ColourId], [Hex]) VALUES (32, N'00FFFF')
GO
INSERT [dbo].[Colour] ([ColourId], [Hex]) VALUES (33, N'E0FFFF')
GO
INSERT [dbo].[Colour] ([ColourId], [Hex]) VALUES (34, N'AFEEEE')
GO
INSERT [dbo].[Colour] ([ColourId], [Hex]) VALUES (35, N'40E0D0')
GO
INSERT [dbo].[Colour] ([ColourId], [Hex]) VALUES (36, N'20B2AA')
GO
INSERT [dbo].[Colour] ([ColourId], [Hex]) VALUES (37, N'008080')
GO
INSERT [dbo].[Colour] ([ColourId], [Hex]) VALUES (38, N'B0C4DE')
GO
INSERT [dbo].[Colour] ([ColourId], [Hex]) VALUES (39, N'87CEEB')
GO
INSERT [dbo].[Colour] ([ColourId], [Hex]) VALUES (40, N'00BFFF')
GO
INSERT [dbo].[Colour] ([ColourId], [Hex]) VALUES (41, N'1E90FF')
GO
INSERT [dbo].[Colour] ([ColourId], [Hex]) VALUES (42, N'0000FF')
GO
INSERT [dbo].[Colour] ([ColourId], [Hex]) VALUES (43, N'000080')
GO
INSERT [dbo].[Colour] ([ColourId], [Hex]) VALUES (44, N'DDA0DD')
GO
INSERT [dbo].[Colour] ([ColourId], [Hex]) VALUES (45, N'EE82EE')
GO
INSERT [dbo].[Colour] ([ColourId], [Hex]) VALUES (46, N'FF00FF')
GO
INSERT [dbo].[Colour] ([ColourId], [Hex]) VALUES (47, N'9400D3')
GO
INSERT [dbo].[Colour] ([ColourId], [Hex]) VALUES (48, N'800080')
GO
INSERT [dbo].[Colour] ([ColourId], [Hex]) VALUES (49, N'4B0082')
GO
INSERT [dbo].[Colour] ([ColourId], [Hex]) VALUES (50, N'6A5ACD')
GO
INSERT [dbo].[Colour] ([ColourId], [Hex]) VALUES (51, N'6699CC')
GO
SET IDENTITY_INSERT [dbo].[Frequency] ON 

GO
INSERT [dbo].[Frequency] ([FrequencyId], [Name], [Periods]) VALUES (1, N'Yearly', 1)
GO
INSERT [dbo].[Frequency] ([FrequencyId], [Name], [Periods]) VALUES (2, N'Quarterly', 2)
GO
SET IDENTITY_INSERT [dbo].[Frequency] OFF
GO
SET IDENTITY_INSERT [dbo].[Host] ON 

GO
INSERT [dbo].[Host] ([HostId], [HostName], [OrganisationId]) VALUES (1, N'LocalHost', 1)
GO
INSERT [dbo].[Host] ([HostId], [HostName], [OrganisationId]) VALUES (2, N'Agukdev01', 1)
GO
SET IDENTITY_INSERT [dbo].[Host] OFF
GO
SET IDENTITY_INSERT [dbo].[Organisation] ON 

GO
INSERT [dbo].[Organisation] ([OrganisationId], [Name]) VALUES (1, N'Dev Mumbai Organisation')
GO
SET IDENTITY_INSERT [dbo].[Organisation] OFF
GO
SET IDENTITY_INSERT [dbo].[OvertimePreference] ON 

GO
INSERT [dbo].[OvertimePreference] ([OvertimePreferenceId], [Name]) VALUES (1, N'Paid')
GO
INSERT [dbo].[OvertimePreference] ([OvertimePreferenceId], [Name]) VALUES (2, N'TOIL')
GO
SET IDENTITY_INSERT [dbo].[OvertimePreference] OFF
GO
SET IDENTITY_INSERT [dbo].[WorkingPattern] ON 

GO
INSERT [dbo].[WorkingPattern] ([WorkingPatternId], [OrganisationId]) VALUES (1, 1)
GO
INSERT [dbo].[WorkingPattern] ([WorkingPatternId], [OrganisationId]) VALUES (2, 1)
GO
INSERT [dbo].[WorkingPattern] ([WorkingPatternId], [OrganisationId]) VALUES (3, 1)
GO
INSERT [dbo].[WorkingPattern] ([WorkingPatternId], [OrganisationId]) VALUES (4, 1)
GO
INSERT [dbo].[WorkingPattern] ([WorkingPatternId], [OrganisationId]) VALUES (5, 1)
GO
INSERT [dbo].[WorkingPattern] ([WorkingPatternId], [OrganisationId]) VALUES (6, 1)
GO
INSERT [dbo].[WorkingPattern] ([WorkingPatternId], [OrganisationId]) VALUES (7, 1)
GO
INSERT [dbo].[WorkingPattern] ([WorkingPatternId], [OrganisationId]) VALUES (8, 1)
GO
INSERT [dbo].[WorkingPattern] ([WorkingPatternId], [OrganisationId]) VALUES (9, 1)
GO
INSERT [dbo].[WorkingPattern] ([WorkingPatternId], [OrganisationId]) VALUES (10, 1)
GO
INSERT [dbo].[WorkingPattern] ([WorkingPatternId], [OrganisationId]) VALUES (11, 1)
GO
INSERT [dbo].[WorkingPattern] ([WorkingPatternId], [OrganisationId]) VALUES (12, 1)
GO
INSERT [dbo].[WorkingPattern] ([WorkingPatternId], [OrganisationId]) VALUES (13, 1)
GO
INSERT [dbo].[WorkingPattern] ([WorkingPatternId], [OrganisationId]) VALUES (14, 1)
GO
INSERT [dbo].[WorkingPattern] ([WorkingPatternId], [OrganisationId]) VALUES (15, 1)
GO
INSERT [dbo].[WorkingPattern] ([WorkingPatternId], [OrganisationId]) VALUES (16, 1)
GO
INSERT [dbo].[WorkingPattern] ([WorkingPatternId], [OrganisationId]) VALUES (17, 1)
GO
INSERT [dbo].[WorkingPattern] ([WorkingPatternId], [OrganisationId]) VALUES (18, 1)
GO
INSERT [dbo].[WorkingPattern] ([WorkingPatternId], [OrganisationId]) VALUES (19, 1)
GO
INSERT [dbo].[WorkingPattern] ([WorkingPatternId], [OrganisationId]) VALUES (20, 1)
GO
INSERT [dbo].[WorkingPattern] ([WorkingPatternId], [OrganisationId]) VALUES (21, 1)
GO
INSERT [dbo].[WorkingPattern] ([WorkingPatternId], [OrganisationId]) VALUES (22, 1)
GO
INSERT [dbo].[WorkingPattern] ([WorkingPatternId], [OrganisationId]) VALUES (23, 1)
GO
INSERT [dbo].[WorkingPattern] ([WorkingPatternId], [OrganisationId]) VALUES (24, 1)
GO
INSERT [dbo].[WorkingPattern] ([WorkingPatternId], [OrganisationId]) VALUES (25, 1)
GO
INSERT [dbo].[WorkingPattern] ([WorkingPatternId], [OrganisationId]) VALUES (26, 1)
GO
INSERT [dbo].[WorkingPattern] ([WorkingPatternId], [OrganisationId]) VALUES (27, 1)
GO
INSERT [dbo].[WorkingPattern] ([WorkingPatternId], [OrganisationId]) VALUES (28, 1)
GO
INSERT [dbo].[WorkingPattern] ([WorkingPatternId], [OrganisationId]) VALUES (29, 1)
GO
INSERT [dbo].[WorkingPattern] ([WorkingPatternId], [OrganisationId]) VALUES (30, 1)
GO
INSERT [dbo].[WorkingPattern] ([WorkingPatternId], [OrganisationId]) VALUES (31, 1)
GO
INSERT [dbo].[WorkingPattern] ([WorkingPatternId], [OrganisationId]) VALUES (32, 1)
GO
INSERT [dbo].[WorkingPattern] ([WorkingPatternId], [OrganisationId]) VALUES (33, 1)
GO
INSERT [dbo].[WorkingPattern] ([WorkingPatternId], [OrganisationId]) VALUES (34, 1)
GO
INSERT [dbo].[WorkingPattern] ([WorkingPatternId], [OrganisationId]) VALUES (35, 1)
GO
INSERT [dbo].[WorkingPattern] ([WorkingPatternId], [OrganisationId]) VALUES (36, 1)
GO
INSERT [dbo].[WorkingPattern] ([WorkingPatternId], [OrganisationId]) VALUES (37, 1)
GO
INSERT [dbo].[WorkingPattern] ([WorkingPatternId], [OrganisationId]) VALUES (38, 1)
GO
INSERT [dbo].[WorkingPattern] ([WorkingPatternId], [OrganisationId]) VALUES (39, 1)
GO
INSERT [dbo].[WorkingPattern] ([WorkingPatternId], [OrganisationId]) VALUES (40, 1)
GO
INSERT [dbo].[WorkingPattern] ([WorkingPatternId], [OrganisationId]) VALUES (41, 1)
GO
INSERT [dbo].[WorkingPattern] ([WorkingPatternId], [OrganisationId]) VALUES (42, 1)
GO
INSERT [dbo].[WorkingPattern] ([WorkingPatternId], [OrganisationId]) VALUES (43, 1)
GO
INSERT [dbo].[WorkingPattern] ([WorkingPatternId], [OrganisationId]) VALUES (44, 1)
GO
INSERT [dbo].[WorkingPattern] ([WorkingPatternId], [OrganisationId]) VALUES (45, 1)
GO
INSERT [dbo].[WorkingPattern] ([WorkingPatternId], [OrganisationId]) VALUES (46, 1)
GO
INSERT [dbo].[WorkingPattern] ([WorkingPatternId], [OrganisationId]) VALUES (47, 1)
GO
INSERT [dbo].[WorkingPattern] ([WorkingPatternId], [OrganisationId]) VALUES (48, 1)
GO
INSERT [dbo].[WorkingPattern] ([WorkingPatternId], [OrganisationId]) VALUES (49, 1)
GO
INSERT [dbo].[WorkingPattern] ([WorkingPatternId], [OrganisationId]) VALUES (50, 1)
GO
INSERT [dbo].[WorkingPattern] ([WorkingPatternId], [OrganisationId]) VALUES (51, 1)
GO
INSERT [dbo].[WorkingPattern] ([WorkingPatternId], [OrganisationId]) VALUES (52, 1)
GO
INSERT [dbo].[WorkingPattern] ([WorkingPatternId], [OrganisationId]) VALUES (53, 1)
GO
INSERT [dbo].[WorkingPattern] ([WorkingPatternId], [OrganisationId]) VALUES (54, 1)
GO
INSERT [dbo].[WorkingPattern] ([WorkingPatternId], [OrganisationId]) VALUES (55, 1)
GO
INSERT [dbo].[WorkingPattern] ([WorkingPatternId], [OrganisationId]) VALUES (56, 1)
GO
INSERT [dbo].[WorkingPattern] ([WorkingPatternId], [OrganisationId]) VALUES (57, 1)
GO
INSERT [dbo].[WorkingPattern] ([WorkingPatternId], [OrganisationId]) VALUES (58, 1)
GO
INSERT [dbo].[WorkingPattern] ([WorkingPatternId], [OrganisationId]) VALUES (59, 1)
GO
INSERT [dbo].[WorkingPattern] ([WorkingPatternId], [OrganisationId]) VALUES (60, 1)
GO
INSERT [dbo].[WorkingPattern] ([WorkingPatternId], [OrganisationId]) VALUES (61, 1)
GO
INSERT [dbo].[WorkingPattern] ([WorkingPatternId], [OrganisationId]) VALUES (62, 1)
GO
INSERT [dbo].[WorkingPattern] ([WorkingPatternId], [OrganisationId]) VALUES (63, 1)
GO
INSERT [dbo].[WorkingPattern] ([WorkingPatternId], [OrganisationId]) VALUES (64, 1)
GO
INSERT [dbo].[WorkingPattern] ([WorkingPatternId], [OrganisationId]) VALUES (65, 1)
GO
INSERT [dbo].[WorkingPattern] ([WorkingPatternId], [OrganisationId]) VALUES (66, 1)
GO
INSERT [dbo].[WorkingPattern] ([WorkingPatternId], [OrganisationId]) VALUES (67, 1)
GO
INSERT [dbo].[WorkingPattern] ([WorkingPatternId], [OrganisationId]) VALUES (68, 1)
GO
INSERT [dbo].[WorkingPattern] ([WorkingPatternId], [OrganisationId]) VALUES (69, 1)
GO
INSERT [dbo].[WorkingPattern] ([WorkingPatternId], [OrganisationId]) VALUES (70, 1)
GO
INSERT [dbo].[WorkingPattern] ([WorkingPatternId], [OrganisationId]) VALUES (71, 1)
GO
INSERT [dbo].[WorkingPattern] ([WorkingPatternId], [OrganisationId]) VALUES (72, 1)
GO
INSERT [dbo].[WorkingPattern] ([WorkingPatternId], [OrganisationId]) VALUES (73, 1)
GO
INSERT [dbo].[WorkingPattern] ([WorkingPatternId], [OrganisationId]) VALUES (74, 1)
GO
INSERT [dbo].[WorkingPattern] ([WorkingPatternId], [OrganisationId]) VALUES (75, 1)
GO
INSERT [dbo].[WorkingPattern] ([WorkingPatternId], [OrganisationId]) VALUES (76, 1)
GO
INSERT [dbo].[WorkingPattern] ([WorkingPatternId], [OrganisationId]) VALUES (77, 1)
GO
INSERT [dbo].[WorkingPattern] ([WorkingPatternId], [OrganisationId]) VALUES (78, 1)
GO
INSERT [dbo].[WorkingPattern] ([WorkingPatternId], [OrganisationId]) VALUES (79, 1)
GO
INSERT [dbo].[WorkingPattern] ([WorkingPatternId], [OrganisationId]) VALUES (80, 1)
GO
INSERT [dbo].[WorkingPattern] ([WorkingPatternId], [OrganisationId]) VALUES (81, 1)
GO
INSERT [dbo].[WorkingPattern] ([WorkingPatternId], [OrganisationId]) VALUES (82, 1)
GO
INSERT [dbo].[WorkingPattern] ([WorkingPatternId], [OrganisationId]) VALUES (83, 1)
GO
INSERT [dbo].[WorkingPattern] ([WorkingPatternId], [OrganisationId]) VALUES (84, 1)
GO
INSERT [dbo].[WorkingPattern] ([WorkingPatternId], [OrganisationId]) VALUES (85, 1)
GO
SET IDENTITY_INSERT [dbo].[WorkingPattern] OFF
GO
ALTER TABLE [dbo].[AbsenceDay] ADD  CONSTRAINT [DF_AbsenceDay_AM]  DEFAULT ((0)) FOR [AM]
GO
ALTER TABLE [dbo].[AbsenceDay] ADD  CONSTRAINT [DF_AbsenceDay_PM]  DEFAULT ((0)) FOR [PM]
GO
ALTER TABLE [dbo].[Overtime] ADD  DEFAULT (getutcdate()) FOR [CreatedDateUtc]
GO
ALTER TABLE [dbo].[Overtime] ADD  CONSTRAINT [DF_Overtime_ApprovalStateId]  DEFAULT ((1)) FOR [ApprovalStateId]
GO
ALTER TABLE [dbo].[Absence]  WITH CHECK ADD  CONSTRAINT [FK_Absence_AbsenceType] FOREIGN KEY([AbsenceTypeId])
REFERENCES [dbo].[AbsenceType] ([AbsenceTypeId])
GO
ALTER TABLE [dbo].[Absence] CHECK CONSTRAINT [FK_Absence_AbsenceType]
GO
ALTER TABLE [dbo].[Absence]  WITH CHECK ADD  CONSTRAINT [FK_Absence_ApprovalState] FOREIGN KEY([ApprovalStateId])
REFERENCES [dbo].[ApprovalState] ([ApprovalStateId])
GO
ALTER TABLE [dbo].[Absence] CHECK CONSTRAINT [FK_Absence_ApprovalState]
GO
ALTER TABLE [dbo].[Absence]  WITH CHECK ADD  CONSTRAINT [FK_Absence_Organisation] FOREIGN KEY([OrganisationId])
REFERENCES [dbo].[Organisation] ([OrganisationId])
GO
ALTER TABLE [dbo].[Absence] CHECK CONSTRAINT [FK_Absence_Organisation]
GO
ALTER TABLE [dbo].[Absence]  WITH CHECK ADD  CONSTRAINT [FK_Absence_PersonnelAbsenceEntitlement] FOREIGN KEY([PersonnelAbsenceEntitlementId])
REFERENCES [dbo].[PersonnelAbsenceEntitlement] ([PersonnelAbsenceEntitlementId])
GO
ALTER TABLE [dbo].[Absence] CHECK CONSTRAINT [FK_Absence_PersonnelAbsenceEntitlement]
GO
ALTER TABLE [dbo].[AbsenceDay]  WITH CHECK ADD  CONSTRAINT [FK_AbsenceDay_Absence] FOREIGN KEY([AbsenceId])
REFERENCES [dbo].[Absence] ([AbsenceId])
GO
ALTER TABLE [dbo].[AbsenceDay] CHECK CONSTRAINT [FK_AbsenceDay_Absence]
GO
ALTER TABLE [dbo].[AbsenceDay]  WITH CHECK ADD  CONSTRAINT [FK_AbsenceDay_Organisation] FOREIGN KEY([OrganisationId])
REFERENCES [dbo].[Organisation] ([OrganisationId])
GO
ALTER TABLE [dbo].[AbsenceDay] CHECK CONSTRAINT [FK_AbsenceDay_Organisation]
GO
ALTER TABLE [dbo].[AbsencePeriod]  WITH CHECK ADD  CONSTRAINT [FK_AbsencePeriod_Organisation] FOREIGN KEY([OrganisationId])
REFERENCES [dbo].[Organisation] ([OrganisationId])
GO
ALTER TABLE [dbo].[AbsencePeriod] CHECK CONSTRAINT [FK_AbsencePeriod_Organisation]
GO
ALTER TABLE [dbo].[AbsencePolicy]  WITH CHECK ADD  CONSTRAINT [FK_AbsencePolicy_Organisation] FOREIGN KEY([OrganisationId])
REFERENCES [dbo].[Organisation] ([OrganisationId])
GO
ALTER TABLE [dbo].[AbsencePolicy] CHECK CONSTRAINT [FK_AbsencePolicy_Organisation]
GO
ALTER TABLE [dbo].[AbsencePolicy]  WITH CHECK ADD  CONSTRAINT [FK_AbsencePolicy_WorkingPattern] FOREIGN KEY([WorkingPatternId])
REFERENCES [dbo].[WorkingPattern] ([WorkingPatternId])
GO
ALTER TABLE [dbo].[AbsencePolicy] CHECK CONSTRAINT [FK_AbsencePolicy_WorkingPattern]
GO
ALTER TABLE [dbo].[AbsencePolicyEntitlement]  WITH CHECK ADD  CONSTRAINT [FK_AbsencePolicyEntitlement_AbsencePolicy] FOREIGN KEY([AbsencePolicyId])
REFERENCES [dbo].[AbsencePolicy] ([AbsencePolicyId])
GO
ALTER TABLE [dbo].[AbsencePolicyEntitlement] CHECK CONSTRAINT [FK_AbsencePolicyEntitlement_AbsencePolicy]
GO
ALTER TABLE [dbo].[AbsencePolicyEntitlement]  WITH CHECK ADD  CONSTRAINT [FK_AbsencePolicyEntitlement_AbsenceType] FOREIGN KEY([AbsenceTypeId])
REFERENCES [dbo].[AbsenceType] ([AbsenceTypeId])
GO
ALTER TABLE [dbo].[AbsencePolicyEntitlement] CHECK CONSTRAINT [FK_AbsencePolicyEntitlement_AbsenceType]
GO
ALTER TABLE [dbo].[AbsencePolicyEntitlement]  WITH CHECK ADD  CONSTRAINT [FK_AbsencePolicyEntitlement_Frequency] FOREIGN KEY([FrequencyId])
REFERENCES [dbo].[Frequency] ([FrequencyId])
GO
ALTER TABLE [dbo].[AbsencePolicyEntitlement] CHECK CONSTRAINT [FK_AbsencePolicyEntitlement_Frequency]
GO
ALTER TABLE [dbo].[AbsencePolicyEntitlement]  WITH CHECK ADD  CONSTRAINT [FK_AbsencePolicyEntitlement_Organisation] FOREIGN KEY([OrganisationId])
REFERENCES [dbo].[Organisation] ([OrganisationId])
GO
ALTER TABLE [dbo].[AbsencePolicyEntitlement] CHECK CONSTRAINT [FK_AbsencePolicyEntitlement_Organisation]
GO
ALTER TABLE [dbo].[AbsencePolicyPeriod]  WITH CHECK ADD  CONSTRAINT [FK_AbsencePolicyPeriod_AbsencePeriod] FOREIGN KEY([AbsencePeriodId])
REFERENCES [dbo].[AbsencePeriod] ([AbsencePeriodId])
GO
ALTER TABLE [dbo].[AbsencePolicyPeriod] CHECK CONSTRAINT [FK_AbsencePolicyPeriod_AbsencePeriod]
GO
ALTER TABLE [dbo].[AbsencePolicyPeriod]  WITH CHECK ADD  CONSTRAINT [FK_AbsencePolicyPeriod_AbsencePolicy] FOREIGN KEY([AbsencePolicyId])
REFERENCES [dbo].[AbsencePolicy] ([AbsencePolicyId])
GO
ALTER TABLE [dbo].[AbsencePolicyPeriod] CHECK CONSTRAINT [FK_AbsencePolicyPeriod_AbsencePolicy]
GO
ALTER TABLE [dbo].[AbsencePolicyPeriod]  WITH CHECK ADD  CONSTRAINT [FK_AbsencePolicyPeriod_Organisation] FOREIGN KEY([OrganisationId])
REFERENCES [dbo].[Organisation] ([OrganisationId])
GO
ALTER TABLE [dbo].[AbsencePolicyPeriod] CHECK CONSTRAINT [FK_AbsencePolicyPeriod_Organisation]
GO
ALTER TABLE [dbo].[AbsenceType]  WITH CHECK ADD  CONSTRAINT [FK_AbsenceType_Colour] FOREIGN KEY([ColourId])
REFERENCES [dbo].[Colour] ([ColourId])
GO
ALTER TABLE [dbo].[AbsenceType] CHECK CONSTRAINT [FK_AbsenceType_Colour]
GO
ALTER TABLE [dbo].[AbsenceType]  WITH CHECK ADD  CONSTRAINT [FK_AbsenceType_Organisation] FOREIGN KEY([OrganisationId])
REFERENCES [dbo].[Organisation] ([OrganisationId])
GO
ALTER TABLE [dbo].[AbsenceType] CHECK CONSTRAINT [FK_AbsenceType_Organisation]
GO
ALTER TABLE [dbo].[Approval]  WITH CHECK ADD  CONSTRAINT [FK_Approval_ApprovalEntityType] FOREIGN KEY([ApprovalEntityTypeId])
REFERENCES [dbo].[ApprovalEntityType] ([ApprovalEntityTypeId])
GO
ALTER TABLE [dbo].[Approval] CHECK CONSTRAINT [FK_Approval_ApprovalEntityType]
GO
ALTER TABLE [dbo].[Approval]  WITH CHECK ADD  CONSTRAINT [FK_Approval_Organisation] FOREIGN KEY([OrganisationId])
REFERENCES [dbo].[Organisation] ([OrganisationId])
GO
ALTER TABLE [dbo].[Approval] CHECK CONSTRAINT [FK_Approval_Organisation]
GO
ALTER TABLE [dbo].[ApprovalLevel]  WITH CHECK ADD  CONSTRAINT [FK_ApprovalLevel_ApprovalModel] FOREIGN KEY([ApprovalModelId])
REFERENCES [dbo].[ApprovalModel] ([ApprovalModelId])
GO
ALTER TABLE [dbo].[ApprovalLevel] CHECK CONSTRAINT [FK_ApprovalLevel_ApprovalModel]
GO
ALTER TABLE [dbo].[ApprovalLevel]  WITH CHECK ADD  CONSTRAINT [FK_ApprovalLevel_Organisation] FOREIGN KEY([OrganisationId])
REFERENCES [dbo].[Organisation] ([OrganisationId])
GO
ALTER TABLE [dbo].[ApprovalLevel] CHECK CONSTRAINT [FK_ApprovalLevel_Organisation]
GO
ALTER TABLE [dbo].[ApprovalLevelUser]  WITH CHECK ADD  CONSTRAINT [FK_ApprovalLevelUser_ApprovalLevel] FOREIGN KEY([ApprovalLevelId])
REFERENCES [dbo].[ApprovalLevel] ([ApprovalLevelId])
GO
ALTER TABLE [dbo].[ApprovalLevelUser] CHECK CONSTRAINT [FK_ApprovalLevelUser_ApprovalLevel]
GO
ALTER TABLE [dbo].[ApprovalLevelUser]  WITH CHECK ADD  CONSTRAINT [FK_ApprovalLevelUser_Organisation] FOREIGN KEY([OrganisationId])
REFERENCES [dbo].[Organisation] ([OrganisationId])
GO
ALTER TABLE [dbo].[ApprovalLevelUser] CHECK CONSTRAINT [FK_ApprovalLevelUser_Organisation]
GO
ALTER TABLE [dbo].[ApprovalModel]  WITH CHECK ADD  CONSTRAINT [FK_ApprovalModel_Organisation] FOREIGN KEY([OrganisationId])
REFERENCES [dbo].[Organisation] ([OrganisationId])
GO
ALTER TABLE [dbo].[ApprovalModel] CHECK CONSTRAINT [FK_ApprovalModel_Organisation]
GO
ALTER TABLE [dbo].[Building]  WITH CHECK ADD  CONSTRAINT [FK_Building_Organisation] FOREIGN KEY([OrganisationId])
REFERENCES [dbo].[Organisation] ([OrganisationId])
GO
ALTER TABLE [dbo].[Building] CHECK CONSTRAINT [FK_Building_Organisation]
GO
ALTER TABLE [dbo].[Building]  WITH CHECK ADD  CONSTRAINT [FK_Building_Site] FOREIGN KEY([SiteId])
REFERENCES [dbo].[Site] ([SiteId])
GO
ALTER TABLE [dbo].[Building] CHECK CONSTRAINT [FK_Building_Site]
GO
ALTER TABLE [dbo].[Company]  WITH CHECK ADD  CONSTRAINT [FK_Company_Colour] FOREIGN KEY([ColourId])
REFERENCES [dbo].[Colour] ([ColourId])
GO
ALTER TABLE [dbo].[Company] CHECK CONSTRAINT [FK_Company_Colour]
GO
ALTER TABLE [dbo].[Company]  WITH CHECK ADD  CONSTRAINT [FK_Company_Organisation] FOREIGN KEY([OrganisationId])
REFERENCES [dbo].[Organisation] ([OrganisationId])
GO
ALTER TABLE [dbo].[Company] CHECK CONSTRAINT [FK_Company_Organisation]
GO
ALTER TABLE [dbo].[CompanyBuilding]  WITH CHECK ADD  CONSTRAINT [FK_CompanyBuilding_Building] FOREIGN KEY([BuildingId])
REFERENCES [dbo].[Building] ([BuildingId])
GO
ALTER TABLE [dbo].[CompanyBuilding] CHECK CONSTRAINT [FK_CompanyBuilding_Building]
GO
ALTER TABLE [dbo].[CompanyBuilding]  WITH CHECK ADD  CONSTRAINT [FK_CompanyBuilding_Company] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([CompanyId])
GO
ALTER TABLE [dbo].[CompanyBuilding] CHECK CONSTRAINT [FK_CompanyBuilding_Company]
GO
ALTER TABLE [dbo].[CompanyBuilding]  WITH CHECK ADD  CONSTRAINT [FK_CompanyBuilding_Organisation] FOREIGN KEY([OrganisationId])
REFERENCES [dbo].[Organisation] ([OrganisationId])
GO
ALTER TABLE [dbo].[CompanyBuilding] CHECK CONSTRAINT [FK_CompanyBuilding_Organisation]
GO
ALTER TABLE [dbo].[Country]  WITH CHECK ADD  CONSTRAINT [FK_Country_Organisation] FOREIGN KEY([OrganisationId])
REFERENCES [dbo].[Organisation] ([OrganisationId])
GO
ALTER TABLE [dbo].[Country] CHECK CONSTRAINT [FK_Country_Organisation]
GO
ALTER TABLE [dbo].[Department]  WITH CHECK ADD  CONSTRAINT [FK__Departmen__Colou__6754599E] FOREIGN KEY([ColourId])
REFERENCES [dbo].[Colour] ([ColourId])
GO
ALTER TABLE [dbo].[Department] CHECK CONSTRAINT [FK__Departmen__Colou__6754599E]
GO
ALTER TABLE [dbo].[Department]  WITH CHECK ADD  CONSTRAINT [FK_Department_Organisation] FOREIGN KEY([OrganisationId])
REFERENCES [dbo].[Organisation] ([OrganisationId])
GO
ALTER TABLE [dbo].[Department] CHECK CONSTRAINT [FK_Department_Organisation]
GO
ALTER TABLE [dbo].[EmergencyContact]  WITH CHECK ADD  CONSTRAINT [FK_EmergencyContact_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([CountryId])
GO
ALTER TABLE [dbo].[EmergencyContact] CHECK CONSTRAINT [FK_EmergencyContact_Country]
GO
ALTER TABLE [dbo].[EmergencyContact]  WITH CHECK ADD  CONSTRAINT [FK_EmergencyContact_Organisation] FOREIGN KEY([OrganisationId])
REFERENCES [dbo].[Organisation] ([OrganisationId])
GO
ALTER TABLE [dbo].[EmergencyContact] CHECK CONSTRAINT [FK_EmergencyContact_Organisation]
GO
ALTER TABLE [dbo].[EmergencyContact]  WITH CHECK ADD  CONSTRAINT [FK_EmergencyContact_Personnel] FOREIGN KEY([PersonnelId])
REFERENCES [dbo].[Personnel] ([PersonnelId])
GO
ALTER TABLE [dbo].[EmergencyContact] CHECK CONSTRAINT [FK_EmergencyContact_Personnel]
GO
ALTER TABLE [dbo].[Employment]  WITH CHECK ADD  CONSTRAINT [FK_Employment_AbsencePolicy] FOREIGN KEY([AbsencePolicyId])
REFERENCES [dbo].[AbsencePolicy] ([AbsencePolicyId])
GO
ALTER TABLE [dbo].[Employment] CHECK CONSTRAINT [FK_Employment_AbsencePolicy]
GO
ALTER TABLE [dbo].[Employment]  WITH CHECK ADD  CONSTRAINT [FK_Employment_Building1] FOREIGN KEY([BuildingId])
REFERENCES [dbo].[Building] ([BuildingId])
GO
ALTER TABLE [dbo].[Employment] CHECK CONSTRAINT [FK_Employment_Building1]
GO
ALTER TABLE [dbo].[Employment]  WITH CHECK ADD  CONSTRAINT [FK_Employment_Company] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([CompanyId])
GO
ALTER TABLE [dbo].[Employment] CHECK CONSTRAINT [FK_Employment_Company]
GO
ALTER TABLE [dbo].[Employment]  WITH CHECK ADD  CONSTRAINT [FK_Employment_EmploymentType] FOREIGN KEY([EmploymentTypeId])
REFERENCES [dbo].[EmploymentType] ([EmploymentTypeId])
GO
ALTER TABLE [dbo].[Employment] CHECK CONSTRAINT [FK_Employment_EmploymentType]
GO
ALTER TABLE [dbo].[Employment]  WITH CHECK ADD  CONSTRAINT [FK_Employment_Organisation] FOREIGN KEY([OrganisationId])
REFERENCES [dbo].[Organisation] ([OrganisationId])
GO
ALTER TABLE [dbo].[Employment] CHECK CONSTRAINT [FK_Employment_Organisation]
GO
ALTER TABLE [dbo].[Employment]  WITH CHECK ADD  CONSTRAINT [FK_Employment_Personnel] FOREIGN KEY([PersonnelId])
REFERENCES [dbo].[Personnel] ([PersonnelId])
GO
ALTER TABLE [dbo].[Employment] CHECK CONSTRAINT [FK_Employment_Personnel]
GO
ALTER TABLE [dbo].[Employment]  WITH CHECK ADD  CONSTRAINT [FK_Employment_Personnel1] FOREIGN KEY([ReportsToPersonnelId])
REFERENCES [dbo].[Personnel] ([PersonnelId])
GO
ALTER TABLE [dbo].[Employment] CHECK CONSTRAINT [FK_Employment_Personnel1]
GO
ALTER TABLE [dbo].[Employment]  WITH CHECK ADD  CONSTRAINT [FK_Employment_PublicHolidayPolicy] FOREIGN KEY([PublicHolidayPolicyId])
REFERENCES [dbo].[PublicHolidayPolicy] ([PublicHolidayPolicyId])
GO
ALTER TABLE [dbo].[Employment] CHECK CONSTRAINT [FK_Employment_PublicHolidayPolicy]
GO
ALTER TABLE [dbo].[Employment]  WITH CHECK ADD  CONSTRAINT [FK_Employment_WorkingPattern] FOREIGN KEY([WorkingPatternId])
REFERENCES [dbo].[WorkingPattern] ([WorkingPatternId])
GO
ALTER TABLE [dbo].[Employment] CHECK CONSTRAINT [FK_Employment_WorkingPattern]
GO
ALTER TABLE [dbo].[EmploymentDepartment]  WITH CHECK ADD  CONSTRAINT [FK_EmploymentDepartment_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([DepartmentId])
GO
ALTER TABLE [dbo].[EmploymentDepartment] CHECK CONSTRAINT [FK_EmploymentDepartment_Department]
GO
ALTER TABLE [dbo].[EmploymentDepartment]  WITH CHECK ADD  CONSTRAINT [FK_EmploymentDepartment_Employment] FOREIGN KEY([EmploymentId])
REFERENCES [dbo].[Employment] ([EmploymentId])
GO
ALTER TABLE [dbo].[EmploymentDepartment] CHECK CONSTRAINT [FK_EmploymentDepartment_Employment]
GO
ALTER TABLE [dbo].[EmploymentDepartment]  WITH CHECK ADD  CONSTRAINT [FK_EmploymentDepartment_Organisation] FOREIGN KEY([OrganisationId])
REFERENCES [dbo].[Organisation] ([OrganisationId])
GO
ALTER TABLE [dbo].[EmploymentDepartment] CHECK CONSTRAINT [FK_EmploymentDepartment_Organisation]
GO
ALTER TABLE [dbo].[EmploymentPersonnelAbsenceEntitlement]  WITH CHECK ADD  CONSTRAINT [FK_EmploymentPersonnelAbsenceEntitlement_Employment] FOREIGN KEY([EmploymentId])
REFERENCES [dbo].[Employment] ([EmploymentId])
GO
ALTER TABLE [dbo].[EmploymentPersonnelAbsenceEntitlement] CHECK CONSTRAINT [FK_EmploymentPersonnelAbsenceEntitlement_Employment]
GO
ALTER TABLE [dbo].[EmploymentPersonnelAbsenceEntitlement]  WITH CHECK ADD  CONSTRAINT [FK_EmploymentPersonnelAbsenceEntitlement_Organisation] FOREIGN KEY([OrganisationId])
REFERENCES [dbo].[Organisation] ([OrganisationId])
GO
ALTER TABLE [dbo].[EmploymentPersonnelAbsenceEntitlement] CHECK CONSTRAINT [FK_EmploymentPersonnelAbsenceEntitlement_Organisation]
GO
ALTER TABLE [dbo].[EmploymentPersonnelAbsenceEntitlement]  WITH CHECK ADD  CONSTRAINT [FK_EmploymentPersonnelAbsenceEntitlement_PersonnelAbsenceEntitlement] FOREIGN KEY([PersonnelAbsenceEntitlementId])
REFERENCES [dbo].[PersonnelAbsenceEntitlement] ([PersonnelAbsenceEntitlementId])
GO
ALTER TABLE [dbo].[EmploymentPersonnelAbsenceEntitlement] CHECK CONSTRAINT [FK_EmploymentPersonnelAbsenceEntitlement_PersonnelAbsenceEntitlement]
GO
ALTER TABLE [dbo].[EmploymentTeam]  WITH CHECK ADD  CONSTRAINT [FK_EmploymentTeam_Employment] FOREIGN KEY([EmploymentId])
REFERENCES [dbo].[Employment] ([EmploymentId])
GO
ALTER TABLE [dbo].[EmploymentTeam] CHECK CONSTRAINT [FK_EmploymentTeam_Employment]
GO
ALTER TABLE [dbo].[EmploymentTeam]  WITH CHECK ADD  CONSTRAINT [FK_EmploymentTeam_Organisation] FOREIGN KEY([OrganisationId])
REFERENCES [dbo].[Organisation] ([OrganisationId])
GO
ALTER TABLE [dbo].[EmploymentTeam] CHECK CONSTRAINT [FK_EmploymentTeam_Organisation]
GO
ALTER TABLE [dbo].[EmploymentTeam]  WITH CHECK ADD  CONSTRAINT [FK_EmploymentTeam_Team] FOREIGN KEY([TeamId])
REFERENCES [dbo].[Team] ([TeamId])
GO
ALTER TABLE [dbo].[EmploymentTeam] CHECK CONSTRAINT [FK_EmploymentTeam_Team]
GO
ALTER TABLE [dbo].[EmploymentType]  WITH CHECK ADD FOREIGN KEY([OrganisationId])
REFERENCES [dbo].[Organisation] ([OrganisationId])
GO
ALTER TABLE [dbo].[Host]  WITH CHECK ADD  CONSTRAINT [FK_Host_Organisation] FOREIGN KEY([OrganisationId])
REFERENCES [dbo].[Organisation] ([OrganisationId])
GO
ALTER TABLE [dbo].[Host] CHECK CONSTRAINT [FK_Host_Organisation]
GO
ALTER TABLE [dbo].[JobGrade]  WITH CHECK ADD FOREIGN KEY([OrganisationId])
REFERENCES [dbo].[Organisation] ([OrganisationId])
GO
ALTER TABLE [dbo].[JobTitle]  WITH CHECK ADD FOREIGN KEY([OrganisationId])
REFERENCES [dbo].[Organisation] ([OrganisationId])
GO
ALTER TABLE [dbo].[JobTitleDocument]  WITH CHECK ADD FOREIGN KEY([JobTitleId])
REFERENCES [dbo].[JobTitle] ([JobTitleId])
GO
ALTER TABLE [dbo].[JobTitleDocument]  WITH CHECK ADD FOREIGN KEY([OrganisationId])
REFERENCES [dbo].[Organisation] ([OrganisationId])
GO
ALTER TABLE [dbo].[JobTitleJobGrade]  WITH CHECK ADD FOREIGN KEY([JobGradeId])
REFERENCES [dbo].[JobGrade] ([JobGradeId])
GO
ALTER TABLE [dbo].[JobTitleJobGrade]  WITH CHECK ADD FOREIGN KEY([JobTitleId])
REFERENCES [dbo].[JobTitle] ([JobTitleId])
GO
ALTER TABLE [dbo].[JobTitleJobGrade]  WITH CHECK ADD FOREIGN KEY([OrganisationId])
REFERENCES [dbo].[Organisation] ([OrganisationId])
GO
ALTER TABLE [dbo].[Overtime]  WITH CHECK ADD FOREIGN KEY([OrganisationId])
REFERENCES [dbo].[Organisation] ([OrganisationId])
GO
ALTER TABLE [dbo].[Overtime]  WITH CHECK ADD FOREIGN KEY([OvertimePreferenceId])
REFERENCES [dbo].[OvertimePreference] ([OvertimePreferenceId])
GO
ALTER TABLE [dbo].[Overtime]  WITH CHECK ADD FOREIGN KEY([PersonnelId])
REFERENCES [dbo].[Personnel] ([PersonnelId])
GO
ALTER TABLE [dbo].[Overtime]  WITH CHECK ADD  CONSTRAINT [FK_Overtime_ApprovalState] FOREIGN KEY([ApprovalStateId])
REFERENCES [dbo].[ApprovalState] ([ApprovalStateId])
GO
ALTER TABLE [dbo].[Overtime] CHECK CONSTRAINT [FK_Overtime_ApprovalState]
GO
ALTER TABLE [dbo].[Personnel]  WITH CHECK ADD  CONSTRAINT [FK_Personnel_Organisation] FOREIGN KEY([OrganisationId])
REFERENCES [dbo].[Organisation] ([OrganisationId])
GO
ALTER TABLE [dbo].[Personnel] CHECK CONSTRAINT [FK_Personnel_Organisation]
GO
ALTER TABLE [dbo].[PersonnelAbsenceEntitlement]  WITH CHECK ADD  CONSTRAINT [FK_PersonnelAbsenceEntitlement_AbsencePolicyPeriod] FOREIGN KEY([AbsencePolicyPeriodId])
REFERENCES [dbo].[AbsencePolicyPeriod] ([AbsencePolicyPeriodId])
GO
ALTER TABLE [dbo].[PersonnelAbsenceEntitlement] CHECK CONSTRAINT [FK_PersonnelAbsenceEntitlement_AbsencePolicyPeriod]
GO
ALTER TABLE [dbo].[PersonnelAbsenceEntitlement]  WITH CHECK ADD  CONSTRAINT [FK_PersonnelAbsenceEntitlement_AbsenceType] FOREIGN KEY([AbsenceTypeId])
REFERENCES [dbo].[AbsenceType] ([AbsenceTypeId])
GO
ALTER TABLE [dbo].[PersonnelAbsenceEntitlement] CHECK CONSTRAINT [FK_PersonnelAbsenceEntitlement_AbsenceType]
GO
ALTER TABLE [dbo].[PersonnelAbsenceEntitlement]  WITH CHECK ADD  CONSTRAINT [FK_PersonnelAbsenceEntitlement_Frequency] FOREIGN KEY([FrequencyId])
REFERENCES [dbo].[Frequency] ([FrequencyId])
GO
ALTER TABLE [dbo].[PersonnelAbsenceEntitlement] CHECK CONSTRAINT [FK_PersonnelAbsenceEntitlement_Frequency]
GO
ALTER TABLE [dbo].[PersonnelAbsenceEntitlement]  WITH CHECK ADD  CONSTRAINT [FK_PersonnelAbsenceEntitlement_Organisation] FOREIGN KEY([OrganisationId])
REFERENCES [dbo].[Organisation] ([OrganisationId])
GO
ALTER TABLE [dbo].[PersonnelAbsenceEntitlement] CHECK CONSTRAINT [FK_PersonnelAbsenceEntitlement_Organisation]
GO
ALTER TABLE [dbo].[PersonnelAbsenceEntitlement]  WITH CHECK ADD  CONSTRAINT [FK_PersonnelAbsenceEntitlement_Personnel] FOREIGN KEY([PersonnelId])
REFERENCES [dbo].[Personnel] ([PersonnelId])
GO
ALTER TABLE [dbo].[PersonnelAbsenceEntitlement] CHECK CONSTRAINT [FK_PersonnelAbsenceEntitlement_Personnel]
GO
ALTER TABLE [dbo].[PersonnelApprovalModel]  WITH CHECK ADD  CONSTRAINT [FK_PersonnelApprovalModel_ApprovalEntity] FOREIGN KEY([ApprovalEntityTypeId])
REFERENCES [dbo].[ApprovalEntityType] ([ApprovalEntityTypeId])
GO
ALTER TABLE [dbo].[PersonnelApprovalModel] CHECK CONSTRAINT [FK_PersonnelApprovalModel_ApprovalEntity]
GO
ALTER TABLE [dbo].[PersonnelApprovalModel]  WITH CHECK ADD  CONSTRAINT [FK_PersonnelApprovalModel_ApprovalModel] FOREIGN KEY([ApprovalModelId])
REFERENCES [dbo].[ApprovalModel] ([ApprovalModelId])
GO
ALTER TABLE [dbo].[PersonnelApprovalModel] CHECK CONSTRAINT [FK_PersonnelApprovalModel_ApprovalModel]
GO
ALTER TABLE [dbo].[PersonnelApprovalModel]  WITH CHECK ADD  CONSTRAINT [FK_PersonnelApprovalModel_Organisation] FOREIGN KEY([OrganisationId])
REFERENCES [dbo].[Organisation] ([OrganisationId])
GO
ALTER TABLE [dbo].[PersonnelApprovalModel] CHECK CONSTRAINT [FK_PersonnelApprovalModel_Organisation]
GO
ALTER TABLE [dbo].[PersonnelApprovalModel]  WITH CHECK ADD  CONSTRAINT [FK_PersonnelApprovalModel_Personnel] FOREIGN KEY([PersonnelId])
REFERENCES [dbo].[Personnel] ([PersonnelId])
GO
ALTER TABLE [dbo].[PersonnelApprovalModel] CHECK CONSTRAINT [FK_PersonnelApprovalModel_Personnel]
GO
ALTER TABLE [dbo].[PublicHoliday]  WITH CHECK ADD  CONSTRAINT [FK_PublicHoliday_Organisation] FOREIGN KEY([OrganisationId])
REFERENCES [dbo].[Organisation] ([OrganisationId])
GO
ALTER TABLE [dbo].[PublicHoliday] CHECK CONSTRAINT [FK_PublicHoliday_Organisation]
GO
ALTER TABLE [dbo].[PublicHoliday]  WITH CHECK ADD  CONSTRAINT [FK_PublicHoliday_PublicHolidayPolicy] FOREIGN KEY([PublicHolidayPolicyId])
REFERENCES [dbo].[PublicHolidayPolicy] ([PublicHolidayPolicyId])
GO
ALTER TABLE [dbo].[PublicHoliday] CHECK CONSTRAINT [FK_PublicHoliday_PublicHolidayPolicy]
GO
ALTER TABLE [dbo].[PublicHolidayPolicy]  WITH CHECK ADD  CONSTRAINT [FK_PublicHolidayPolicy_Organisation] FOREIGN KEY([OrganisationId])
REFERENCES [dbo].[Organisation] ([OrganisationId])
GO
ALTER TABLE [dbo].[PublicHolidayPolicy] CHECK CONSTRAINT [FK_PublicHolidayPolicy_Organisation]
GO
ALTER TABLE [dbo].[Site]  WITH CHECK ADD  CONSTRAINT [FK_Site_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([CountryId])
GO
ALTER TABLE [dbo].[Site] CHECK CONSTRAINT [FK_Site_Country]
GO
ALTER TABLE [dbo].[Site]  WITH CHECK ADD  CONSTRAINT [FK_Site_Organisation] FOREIGN KEY([OrganisationId])
REFERENCES [dbo].[Organisation] ([OrganisationId])
GO
ALTER TABLE [dbo].[Site] CHECK CONSTRAINT [FK_Site_Organisation]
GO
ALTER TABLE [dbo].[Team]  WITH CHECK ADD  CONSTRAINT [FK_Team_Colour] FOREIGN KEY([ColourId])
REFERENCES [dbo].[Colour] ([ColourId])
GO
ALTER TABLE [dbo].[Team] CHECK CONSTRAINT [FK_Team_Colour]
GO
ALTER TABLE [dbo].[Team]  WITH CHECK ADD  CONSTRAINT [FK_Team_Organisation] FOREIGN KEY([OrganisationId])
REFERENCES [dbo].[Organisation] ([OrganisationId])
GO
ALTER TABLE [dbo].[Team] CHECK CONSTRAINT [FK_Team_Organisation]
GO
ALTER TABLE [dbo].[WorkingPattern]  WITH CHECK ADD  CONSTRAINT [FK_WorkingPattern_Organisation] FOREIGN KEY([OrganisationId])
REFERENCES [dbo].[Organisation] ([OrganisationId])
GO
ALTER TABLE [dbo].[WorkingPattern] CHECK CONSTRAINT [FK_WorkingPattern_Organisation]
GO
ALTER TABLE [dbo].[WorkingPatternDay]  WITH CHECK ADD  CONSTRAINT [FK_WorkingPatternDay_WorkingPattern] FOREIGN KEY([WorkingPatternId])
REFERENCES [dbo].[WorkingPattern] ([WorkingPatternId])
GO
ALTER TABLE [dbo].[WorkingPatternDay] CHECK CONSTRAINT [FK_WorkingPatternDay_WorkingPattern]
GO
ALTER TABLE [dbo].[AbsenceDay]  WITH CHECK ADD  CONSTRAINT [CK_AbsenceDay_AMPMDuration] CHECK  ((([AM]=(1) OR [PM]=(1)) AND ([Duration]=(0.5) OR [Duration]=(1))))
GO
ALTER TABLE [dbo].[AbsenceDay] CHECK CONSTRAINT [CK_AbsenceDay_AMPMDuration]
GO
/****** Object:  StoredProcedure [dbo].[SearchPersonnel]    Script Date: 28/02/2017 17:49:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[SearchPersonnel]
	@SearchKeyword nvarchar(100)
AS
BEGIN
	SET @SearchKeyword = REPLACE(@SearchKeyword, ' ', '%')

	SELECT
		PersonnelId,
		OrganisationId,
		Title,
		Forenames,
		Surname,
		DOB,
		CountryId,
		Address1,
		Address2,
		Address3,
		Address4,
		Postcode,
		Telephone,
		Mobile,
		NINumber,
		BankAccountNumber,
		BankSortCode,
		BankAccountName,
		BankAddress1,
		BankAddress2,
		BankAddress3,
		BankAddress4,
		BankPostcode,
		BankTelephone,
		Email,
		SearchField
	FROM 
		[PersonnelSearchField]
	WHERE  
		ISNULL(@SearchKeyword, '') = '' 
	OR  
		SearchField Like '%' + @SearchKeyword + '%' 
  END


