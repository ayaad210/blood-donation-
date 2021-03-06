USE [master]
GO
/****** Object:  Database [BloodDatabase]    Script Date: 2019/11/20 21:12:58 ******/
CREATE DATABASE [BloodDatabase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BloodDatabase', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\BloodDatabase.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BloodDatabase_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\BloodDatabase_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [BloodDatabase] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BloodDatabase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BloodDatabase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BloodDatabase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BloodDatabase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BloodDatabase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BloodDatabase] SET ARITHABORT OFF 
GO
ALTER DATABASE [BloodDatabase] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BloodDatabase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BloodDatabase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BloodDatabase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BloodDatabase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BloodDatabase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BloodDatabase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BloodDatabase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BloodDatabase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BloodDatabase] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BloodDatabase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BloodDatabase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BloodDatabase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BloodDatabase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BloodDatabase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BloodDatabase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BloodDatabase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BloodDatabase] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BloodDatabase] SET  MULTI_USER 
GO
ALTER DATABASE [BloodDatabase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BloodDatabase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BloodDatabase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BloodDatabase] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BloodDatabase] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BloodDatabase] SET QUERY_STORE = OFF
GO
USE [BloodDatabase]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [BloodDatabase]
GO
/****** Object:  Table [dbo].[AcceptorAccesses]    Script Date: 2019/11/20 21:12:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AcceptorAccesses](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[DonorId] [int] NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[phone] [nvarchar](50) NOT NULL,
	[accesscount] [int] NULL,
 CONSTRAINT [PK_AcceptorAccesses] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AllowBloods]    Script Date: 2019/11/20 21:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AllowBloods](
	[BloodTypeid] [int] NOT NULL,
	[AllowedBloodID] [int] NOT NULL,
 CONSTRAINT [PK_AllowBloods] PRIMARY KEY CLUSTERED 
(
	[BloodTypeid] ASC,
	[AllowedBloodID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BloodTypes]    Script Date: 2019/11/20 21:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BloodTypes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_BloodTypes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contacts]    Script Date: 2019/11/20 21:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contacts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[Message] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Contacts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Donations]    Script Date: 2019/11/20 21:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Donations](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NULL,
	[place] [int] NULL,
	[address] [nvarchar](500) NULL,
	[BloodType] [int] NULL,
	[gender] [bit] NOT NULL,
	[phone] [nvarchar](50) NULL,
	[Email] [varchar](100) NULL,
	[LastDon] [date] NULL,
	[isFree] [bit] NULL,
 CONSTRAINT [PK_Donations] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notes]    Script Date: 2019/11/20 21:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[text] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Notes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Places]    Script Date: 2019/11/20 21:13:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Places](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Places] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 2019/11/20 21:13:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[password] [nvarchar](200) NOT NULL,
	[username] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AcceptorAccesses] ON 

INSERT [dbo].[AcceptorAccesses] ([id], [DonorId], [name], [phone], [accesscount]) VALUES (49, 3, N'asasa', N'1148421703', 1)
INSERT [dbo].[AcceptorAccesses] ([id], [DonorId], [name], [phone], [accesscount]) VALUES (50, 3, N'Mohamed Ayaad`', N'1148421709', 2)
INSERT [dbo].[AcceptorAccesses] ([id], [DonorId], [name], [phone], [accesscount]) VALUES (51, 2, N'asasa', N'01148421703', 3)
INSERT [dbo].[AcceptorAccesses] ([id], [DonorId], [name], [phone], [accesscount]) VALUES (52, 3, N'asasa', N'11484217037', 0)
INSERT [dbo].[AcceptorAccesses] ([id], [DonorId], [name], [phone], [accesscount]) VALUES (53, 4, N'Mohamed Ayaad`', N'1148421703', 0)
INSERT [dbo].[AcceptorAccesses] ([id], [DonorId], [name], [phone], [accesscount]) VALUES (54, 4, N'Mohamed Ayaad`', N'11484217037', 0)
INSERT [dbo].[AcceptorAccesses] ([id], [DonorId], [name], [phone], [accesscount]) VALUES (55, 4, N'samy', N'015245321', 20)
INSERT [dbo].[AcceptorAccesses] ([id], [DonorId], [name], [phone], [accesscount]) VALUES (56, 3, N'saad', N'015245321', 0)
INSERT [dbo].[AcceptorAccesses] ([id], [DonorId], [name], [phone], [accesscount]) VALUES (57, 3, N'samy', N'0152453217', 1)
INSERT [dbo].[AcceptorAccesses] ([id], [DonorId], [name], [phone], [accesscount]) VALUES (58, 4, N'samy', N'0152453217', 1)
INSERT [dbo].[AcceptorAccesses] ([id], [DonorId], [name], [phone], [accesscount]) VALUES (60, 4, N'asasa', N'01148421701', 0)
SET IDENTITY_INSERT [dbo].[AcceptorAccesses] OFF
INSERT [dbo].[AllowBloods] ([BloodTypeid], [AllowedBloodID]) VALUES (1, 1)
INSERT [dbo].[AllowBloods] ([BloodTypeid], [AllowedBloodID]) VALUES (1, 2)
INSERT [dbo].[AllowBloods] ([BloodTypeid], [AllowedBloodID]) VALUES (1, 3)
INSERT [dbo].[AllowBloods] ([BloodTypeid], [AllowedBloodID]) VALUES (1, 4)
INSERT [dbo].[AllowBloods] ([BloodTypeid], [AllowedBloodID]) VALUES (2, 1)
INSERT [dbo].[AllowBloods] ([BloodTypeid], [AllowedBloodID]) VALUES (2, 4)
INSERT [dbo].[AllowBloods] ([BloodTypeid], [AllowedBloodID]) VALUES (3, 1)
INSERT [dbo].[AllowBloods] ([BloodTypeid], [AllowedBloodID]) VALUES (4, 1)
INSERT [dbo].[AllowBloods] ([BloodTypeid], [AllowedBloodID]) VALUES (4, 2)
SET IDENTITY_INSERT [dbo].[BloodTypes] ON 

INSERT [dbo].[BloodTypes] ([id], [Name]) VALUES (1, N'o')
INSERT [dbo].[BloodTypes] ([id], [Name]) VALUES (2, N'o-')
INSERT [dbo].[BloodTypes] ([id], [Name]) VALUES (3, N'B-')
INSERT [dbo].[BloodTypes] ([id], [Name]) VALUES (4, N'B+')
SET IDENTITY_INSERT [dbo].[BloodTypes] OFF
SET IDENTITY_INSERT [dbo].[Contacts] ON 

INSERT [dbo].[Contacts] ([Id], [Email], [Name], [Message]) VALUES (1, N'ayaad210@gmail.com', N'ahmed', N'jhjkahcfsjkhdfd')
SET IDENTITY_INSERT [dbo].[Contacts] OFF
SET IDENTITY_INSERT [dbo].[Donations] ON 

INSERT [dbo].[Donations] ([id], [Name], [place], [address], [BloodType], [gender], [phone], [Email], [LastDon], [isFree]) VALUES (2, N'فاعل خير', 1, N'mohagreen', 2, 1, N'01148421703', N'ayaad277@gmail.com', CAST(N'2016-02-12' AS Date), 1)
INSERT [dbo].[Donations] ([id], [Name], [place], [address], [BloodType], [gender], [phone], [Email], [LastDon], [isFree]) VALUES (3, N'sss', 1, N'ngh', 3, 1, N'11484217403', N'ayaad0@gmail.com', CAST(N'2019-07-07' AS Date), 1)
INSERT [dbo].[Donations] ([id], [Name], [place], [address], [BloodType], [gender], [phone], [Email], [LastDon], [isFree]) VALUES (4, N'ahmed', 1, NULL, 1, 1, N'01148421701', N'ayaad0@gmail.com', CAST(N'2019-07-07' AS Date), 0)
INSERT [dbo].[Donations] ([id], [Name], [place], [address], [BloodType], [gender], [phone], [Email], [LastDon], [isFree]) VALUES (5, N'4', 1, NULL, 4, 0, N'01148421777', N'ayaad277@gmail.com', CAST(N'2019-07-07' AS Date), NULL)
INSERT [dbo].[Donations] ([id], [Name], [place], [address], [BloodType], [gender], [phone], [Email], [LastDon], [isFree]) VALUES (6, N'mohamed Elsorady', 2, NULL, 3, 1, N'11484217037', N'ayaad277@gmail.com', CAST(N'2019-11-11' AS Date), 1)
INSERT [dbo].[Donations] ([id], [Name], [place], [address], [BloodType], [gender], [phone], [Email], [LastDon], [isFree]) VALUES (7, N'salem', 2, N'sanhor', 1, 1, N'114842170371', N'ayaad20@gmail.com', CAST(N'2019-10-15' AS Date), 1)
INSERT [dbo].[Donations] ([id], [Name], [place], [address], [BloodType], [gender], [phone], [Email], [LastDon], [isFree]) VALUES (8, N'ahmed saad', 2, N'sanhor', 3, 1, N'011484217011', N'ayaad211@gmail.com', CAST(N'2019-11-24' AS Date), 1)
INSERT [dbo].[Donations] ([id], [Name], [place], [address], [BloodType], [gender], [phone], [Email], [LastDon], [isFree]) VALUES (9, N'khaled', 1, NULL, 2, 1, N'1148421703', N'ayaad218@gmail.com', CAST(N'2019-06-18' AS Date), 0)
SET IDENTITY_INSERT [dbo].[Donations] OFF
SET IDENTITY_INSERT [dbo].[Notes] ON 

INSERT [dbo].[Notes] ([id], [text]) VALUES (2, N'about the error and where it originated in the code. Description: An unhandled exception occurred during the execution of the current web request. Please review the stack trace for more information about the error and where it originated in the cod')
INSERT [dbo].[Notes] ([id], [text]) VALUES (3, N'about the error and where it originated in the code. Description: An unhandled exception occurred during the execution of the current web request. Please review the stack trace for more information about the error and where it originated in the cod')
SET IDENTITY_INSERT [dbo].[Notes] OFF
SET IDENTITY_INSERT [dbo].[Places] ON 

INSERT [dbo].[Places] ([id], [Name]) VALUES (1, N'البحيرة')
INSERT [dbo].[Places] ([id], [Name]) VALUES (2, N'الاسماعلية')
SET IDENTITY_INSERT [dbo].[Places] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([id], [Name], [password], [username]) VALUES (1, N'Mhamed', N'12345', N'ayaad210@gmail.com')
SET IDENTITY_INSERT [dbo].[Users] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Donations]    Script Date: 2019/11/20 21:13:00 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Donations] ON [dbo].[Donations]
(
	[phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AcceptorAccesses] ADD  CONSTRAINT [DF_AcceptorAccesses_accesscount]  DEFAULT ((0)) FOR [accesscount]
GO
ALTER TABLE [dbo].[AcceptorAccesses]  WITH CHECK ADD  CONSTRAINT [FK_AcceptorAccesses_Donations] FOREIGN KEY([DonorId])
REFERENCES [dbo].[Donations] ([id])
GO
ALTER TABLE [dbo].[AcceptorAccesses] CHECK CONSTRAINT [FK_AcceptorAccesses_Donations]
GO
ALTER TABLE [dbo].[AllowBloods]  WITH CHECK ADD  CONSTRAINT [FK_AllowBloods_BloodTypes] FOREIGN KEY([BloodTypeid])
REFERENCES [dbo].[BloodTypes] ([id])
GO
ALTER TABLE [dbo].[AllowBloods] CHECK CONSTRAINT [FK_AllowBloods_BloodTypes]
GO
ALTER TABLE [dbo].[AllowBloods]  WITH CHECK ADD  CONSTRAINT [FK_AllowBloods_BloodTypes1] FOREIGN KEY([AllowedBloodID])
REFERENCES [dbo].[BloodTypes] ([id])
GO
ALTER TABLE [dbo].[AllowBloods] CHECK CONSTRAINT [FK_AllowBloods_BloodTypes1]
GO
ALTER TABLE [dbo].[Donations]  WITH CHECK ADD  CONSTRAINT [FK_Donations_BloodTypes] FOREIGN KEY([BloodType])
REFERENCES [dbo].[BloodTypes] ([id])
GO
ALTER TABLE [dbo].[Donations] CHECK CONSTRAINT [FK_Donations_BloodTypes]
GO
ALTER TABLE [dbo].[Donations]  WITH CHECK ADD  CONSTRAINT [FK_Donations_Places] FOREIGN KEY([place])
REFERENCES [dbo].[Places] ([id])
GO
ALTER TABLE [dbo].[Donations] CHECK CONSTRAINT [FK_Donations_Places]
GO
/****** Object:  StoredProcedure [dbo].[GetAllowedByid]    Script Date: 2019/11/20 21:13:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetAllowedByid]
@typeid int 
as
select b.id ,b.Name ,0 as allow into #temp6  from [dbo].[BloodTypes] as b

update #temp6 set allow=1  where id in (select a.AllowedBloodID from AllowBloods as a where a.BloodTypeid=@typeid)

select id,Name ,allow from #temp6
GO
/****** Object:  StoredProcedure [dbo].[GetAllowedByid_]    Script Date: 2019/11/20 21:13:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetAllowedByid_]
@typeid int 
as
select b.id ,b.Name ,0 as allow into #temp6  from [dbo].[BloodTypes] as b

update #temp6 set allow=1  where id in (select a.AllowedBloodID from AllowBloods as a where a.BloodTypeid=@typeid)

select id,Name ,allow from #temp6
GO
/****** Object:  StoredProcedure [dbo].[GetAllowedByid__]    Script Date: 2019/11/20 21:13:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetAllowedByid__]
@typeid int 
as
select b.id ,b.Name ,0 as allow into #temp6  from [dbo].[BloodTypes] as b

update #temp6 set allow=1  where id in (select a.AllowedBloodID from AllowBloods as a where a.BloodTypeid=@typeid)

select id,Name ,allow from #temp6

GO
/****** Object:  StoredProcedure [dbo].[GetAllowedByid___]    Script Date: 2019/11/20 21:13:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetAllowedByid___]
@typeid int 
as
select b.id ,b.Name ,0 as allow into #temp6  from [dbo].[BloodTypes] as b
update #temp6 set allow=1  where id in (select a.AllowedBloodID from AllowBloods as a where a.BloodTypeid=@typeid)

return select id,Name ,allow from #temp6
GO
/****** Object:  StoredProcedure [dbo].[GetedByid___]    Script Date: 2019/11/20 21:13:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetedByid___]
@typeid int 
as
select b.id ,b.Name ,0 as allow into #temp6  from [dbo].[BloodTypes] as b
update #temp6 set allow=1  where id in (select a.AllowedBloodID from AllowBloods as a where a.BloodTypeid=@typeid)

return select id,Name ,allow from #temp6
GO
/****** Object:  StoredProcedure [dbo].[test]    Script Date: 2019/11/20 21:13:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 create proc [dbo].[test]
@typeid int 
as
select*  from BloodTypes
GO
USE [master]
GO
ALTER DATABASE [BloodDatabase] SET  READ_WRITE 
GO
