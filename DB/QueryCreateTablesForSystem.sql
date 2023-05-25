
USE HanselCabreraPrueba --NAME OF YOUR DATA BASE
GO
/****** Object:  Table [dbo].[BranchOffices]    Script Date: 13/08/2022 12:10:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BranchOffices](
	[BranchOfficeId] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](100) NOT NULL,
	[BusinessId] [int] NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Description] [varchar](100) NOT NULL,
	[DistrictId] [int] NOT NULL,
	[Address] [varchar](max) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Phone] [varchar](100) NOT NULL,
	[State] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BranchOfficeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Business]    Script Date: 13/08/2022 12:10:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Business](
	[BusinessId] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](100) NOT NULL,
	[Ruc] [varchar](11) NOT NULL,
	[BusinessName] [varchar](100) NOT NULL,
	[Logo] [varchar](max) NOT NULL,
	[DistrictId] [int] NOT NULL,
	[Address] [varchar](max) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[Phone] [varchar](100) NOT NULL,
	[Vision] [varchar](max) NULL,
	[Mision] [varchar](max) NULL,
	[State] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BusinessId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 13/08/2022 12:10:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Description] [nvarchar](max) NULL,
	[AuditCreateUser] [int] NOT NULL,
	[AuditCreateDate] [datetime2](7) NOT NULL,
	[AuditUpdateUser] [int] NULL,
	[AuditUpdateDate] [datetime2](7) NULL,
	[AuditDeleteUser] [int] NULL,
	[AuditDeleteDate] [datetime2](7) NULL,
	[State] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clients]    Script Date: 13/08/2022 12:10:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clients](
	[ClientId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NULL,
	[DocumentTypeId] [int] NOT NULL,
	[DocumentNumber] [varchar](20) NULL,
	[Address] [varchar](max) NULL,
	[Phone] [varchar](20) NULL,
	[Email] [varchar](255) NULL,
	[State] [int] NOT NULL,
	[AuditCreateUser] [int] NOT NULL,
	[AuditCreateDate] [datetime2](7) NOT NULL,
	[AuditUpdateUser] [int] NULL,
	[AuditUpdateDate] [datetime2](7) NULL,
	[AuditDeleteUser] [int] NULL,
	[AuditDeleteDate] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 13/08/2022 12:10:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[DepartmentId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[State] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DepartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Districts]    Script Date: 13/08/2022 12:10:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Districts](
	[DistrictId] [int] IDENTITY(1,1) NOT NULL,
	[ProvinceId] [int] NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[State] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DistrictId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DocumentTypes]    Script Date: 13/08/2022 12:10:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocumentTypes](
	[DocumentTypeId] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](10) NULL,
	[Name] [varchar](255) NULL,
	[Abbreviation] [varchar](5) NULL,
	[State] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[DocumentTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MenuRoles]    Script Date: 13/08/2022 12:10:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuRoles](
	[MenuRolId] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [int] NULL,
	[MenuId] [int] NULL,
	[State] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MenuRolId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menus]    Script Date: 13/08/2022 12:10:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menus](
	[MenuId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](150) NULL,
	[Icon] [varchar](50) NULL,
	[URL] [varchar](150) NULL,
	[FatherId] [int] NULL,
	[State] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MenuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 13/08/2022 12:10:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](max) NULL,
	[Name] [nvarchar](50) NULL,
	[Stock] [int] NOT NULL,
	[Image] [nvarchar](max) NULL,
	[SellPrice] [decimal](18, 2) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[ProviderId] [int] NOT NULL,
	[State] [int] NOT NULL,
	[AuditCreateUser] [int] NOT NULL,
	[AuditCreateDate] [datetime2](7) NOT NULL,
	[AuditUpdateUser] [int] NULL,
	[AuditUpdateDate] [datetime2](7) NULL,
	[AuditDeleteUser] [int] NULL,
	[AuditDeleteDate] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Providers]    Script Date: 13/08/2022 12:10:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Providers](
	[ProviderId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](255) NOT NULL,
	[DocumentTypeId] [int] NOT NULL,
	[DocumentNumber] [varchar](20) NOT NULL,
	[Address] [nvarchar](max) NULL,
	[Phone] [nvarchar](15) NOT NULL,
	[State] [int] NOT NULL,
	[AuditCreateUser] [int] NOT NULL,
	[AuditCreateDate] [datetime2](7) NOT NULL,
	[AuditUpdateUser] [int] NULL,
	[AuditUpdateDate] [datetime2](7) NULL,
	[AuditDeleteUser] [int] NULL,
	[AuditDeleteDate] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProviderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provinces]    Script Date: 13/08/2022 12:10:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provinces](
	[ProvinceId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[State] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProvinceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PurcharseDetails]    Script Date: 13/08/2022 12:10:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurcharseDetails](
	[PurcharseDetailId] [int] IDENTITY(1,1) NOT NULL,
	[PurcharseId] [int] NULL,
	[ProductId] [int] NULL,
	[Quantity] [int] NULL,
	[Price] [decimal](18, 2) NULL,
	[AuditCreateUser] [int] NOT NULL,
	[AuditCreateDate] [datetime2](7) NOT NULL,
	[AuditUpdateUser] [int] NULL,
	[AuditUpdateDate] [datetime2](7) NULL,
	[AuditDeleteUser] [int] NULL,
	[AuditDeleteDate] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[PurcharseDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Purcharses]    Script Date: 13/08/2022 12:10:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Purcharses](
	[PurcharseId] [int] IDENTITY(1,1) NOT NULL,
	[ProviderId] [int] NULL,
	[UserId] [int] NULL,
	[PurcharseDate] [datetime2](7) NULL,
	[Tax] [decimal](18, 2) NULL,
	[Total] [decimal](18, 2) NULL,
	[State] [int] NULL,
	[AuditCreateUser] [int] NOT NULL,
	[AuditCreateDate] [datetime2](7) NOT NULL,
	[AuditUpdateUser] [int] NULL,
	[AuditUpdateDate] [datetime2](7) NULL,
	[AuditDeleteUser] [int] NULL,
	[AuditDeleteDate] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[PurcharseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 13/08/2022 12:10:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](50) NULL,
	[State] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SaleDetails]    Script Date: 13/08/2022 12:10:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SaleDetails](
	[SaleDetailId] [int] IDENTITY(1,1) NOT NULL,
	[SaleId] [int] NULL,
	[ProductId] [int] NULL,
	[Quantity] [int] NULL,
	[Price] [decimal](18, 2) NULL,
	[Discount] [decimal](18, 2) NULL,
	[AuditCreateUser] [int] NOT NULL,
	[AuditCreateDate] [datetime2](7) NOT NULL,
	[AuditUpdateUser] [int] NULL,
	[AuditUpdateDate] [datetime2](7) NULL,
	[AuditDeleteUser] [int] NULL,
	[AuditDeleteDate] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[SaleDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sales]    Script Date: 13/08/2022 12:10:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sales](
	[SaleId] [int] IDENTITY(1,1) NOT NULL,
	[ClientId] [int] NULL,
	[UserId] [int] NULL,
	[SaleDate] [datetime2](7) NULL,
	[Tax] [decimal](18, 2) NULL,
	[Total] [decimal](18, 2) NULL,
	[State] [int] NULL,
	[AuditCreateUser] [int] NOT NULL,
	[AuditCreateDate] [datetime2](7) NOT NULL,
	[AuditUpdateUser] [int] NULL,
	[AuditUpdateDate] [datetime2](7) NULL,
	[AuditDeleteUser] [int] NULL,
	[AuditDeleteDate] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[SaleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRoles]    Script Date: 13/08/2022 12:10:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoles](
	[UserRoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [int] NULL,
	[UserId] [int] NULL,
	[State] [int] NULL,
	[BranchOfficeId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserRoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 13/08/2022 12:10:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NULL,
	[Password] [varchar](max) NULL,
	[Email] [varchar](max) NULL,
	[Image] [varchar](max) NULL,
	[State] [int] NULL,
	[AuditCreateUser] [int] NOT NULL,
	[AuditCreateDate] [datetime2](7) NOT NULL,
	[AuditUpdateUser] [int] NULL,
	[AuditUpdateDate] [datetime2](7) NULL,
	[AuditDeleteUser] [int] NULL,
	[AuditDeleteDate] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsersBranchOffices]    Script Date: 13/08/2022 12:10:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersBranchOffices](
	[UserBranchOfficeId] [int] IDENTITY(1,1) NOT NULL,
	[BranchOfficeId] [int] NULL,
	[UserId] [int] NULL,
	[State] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserBranchOfficeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BranchOffices]  WITH CHECK ADD FOREIGN KEY([BusinessId])
REFERENCES [dbo].[Business] ([BusinessId])
GO
ALTER TABLE [dbo].[BranchOffices]  WITH CHECK ADD FOREIGN KEY([DistrictId])
REFERENCES [dbo].[Districts] ([DistrictId])
GO
ALTER TABLE [dbo].[Business]  WITH CHECK ADD FOREIGN KEY([DistrictId])
REFERENCES [dbo].[Districts] ([DistrictId])
GO
ALTER TABLE [dbo].[Clients]  WITH CHECK ADD FOREIGN KEY([DocumentTypeId])
REFERENCES [dbo].[DocumentTypes] ([DocumentTypeId])
GO
ALTER TABLE [dbo].[Districts]  WITH CHECK ADD  CONSTRAINT [FK_Districts_Provinces] FOREIGN KEY([ProvinceId])
REFERENCES [dbo].[Provinces] ([ProvinceId])
GO
ALTER TABLE [dbo].[Districts] CHECK CONSTRAINT [FK_Districts_Provinces]
GO
ALTER TABLE [dbo].[MenuRoles]  WITH CHECK ADD  CONSTRAINT [FK_MenuRoles_Menu] FOREIGN KEY([MenuId])
REFERENCES [dbo].[Menus] ([MenuId])
GO
ALTER TABLE [dbo].[MenuRoles] CHECK CONSTRAINT [FK_MenuRoles_Menu]
GO
ALTER TABLE [dbo].[MenuRoles]  WITH CHECK ADD  CONSTRAINT [FK_MenuRoles_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([RoleId])
GO
ALTER TABLE [dbo].[MenuRoles] CHECK CONSTRAINT [FK_MenuRoles_Roles]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([CategoryId])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([ProviderId])
REFERENCES [dbo].[Providers] ([ProviderId])
GO
ALTER TABLE [dbo].[Providers]  WITH CHECK ADD FOREIGN KEY([DocumentTypeId])
REFERENCES [dbo].[DocumentTypes] ([DocumentTypeId])
GO
ALTER TABLE [dbo].[Provinces]  WITH CHECK ADD FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Departments] ([DepartmentId])
GO
ALTER TABLE [dbo].[PurcharseDetails]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[PurcharseDetails]  WITH CHECK ADD FOREIGN KEY([PurcharseId])
REFERENCES [dbo].[Purcharses] ([PurcharseId])
GO
ALTER TABLE [dbo].[Purcharses]  WITH CHECK ADD FOREIGN KEY([ProviderId])
REFERENCES [dbo].[Providers] ([ProviderId])
GO
ALTER TABLE [dbo].[Purcharses]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[SaleDetails]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[SaleDetails]  WITH CHECK ADD FOREIGN KEY([SaleId])
REFERENCES [dbo].[Sales] ([SaleId])
GO
ALTER TABLE [dbo].[Sales]  WITH CHECK ADD FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([ClientId])
GO
ALTER TABLE [dbo].[Sales]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD FOREIGN KEY([BranchOfficeId])
REFERENCES [dbo].[BranchOffices] ([BranchOfficeId])
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([RoleId])
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[UsersBranchOffices]  WITH CHECK ADD FOREIGN KEY([BranchOfficeId])
REFERENCES [dbo].[BranchOffices] ([BranchOfficeId])
GO
ALTER TABLE [dbo].[UsersBranchOffices]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO