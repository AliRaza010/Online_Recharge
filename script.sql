USE [master]
GO
/****** Object:  Database [rechargefunctions]    Script Date: 3/12/2020 12:49:50 PM ******/
CREATE DATABASE [rechargefunctions]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'rechargefunctions', FILENAME = N'E:\MSSQL12.SQLEXPRESS\MSSQL\DATA\rechargefunctions.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'rechargefunctions_log', FILENAME = N'E:\MSSQL12.SQLEXPRESS\MSSQL\DATA\rechargefunctions_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [rechargefunctions] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [rechargefunctions].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [rechargefunctions] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [rechargefunctions] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [rechargefunctions] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [rechargefunctions] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [rechargefunctions] SET ARITHABORT OFF 
GO
ALTER DATABASE [rechargefunctions] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [rechargefunctions] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [rechargefunctions] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [rechargefunctions] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [rechargefunctions] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [rechargefunctions] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [rechargefunctions] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [rechargefunctions] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [rechargefunctions] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [rechargefunctions] SET  DISABLE_BROKER 
GO
ALTER DATABASE [rechargefunctions] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [rechargefunctions] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [rechargefunctions] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [rechargefunctions] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [rechargefunctions] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [rechargefunctions] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [rechargefunctions] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [rechargefunctions] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [rechargefunctions] SET  MULTI_USER 
GO
ALTER DATABASE [rechargefunctions] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [rechargefunctions] SET DB_CHAINING OFF 
GO
ALTER DATABASE [rechargefunctions] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [rechargefunctions] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [rechargefunctions] SET DELAYED_DURABILITY = DISABLED 
GO
USE [rechargefunctions]
GO
/****** Object:  Table [dbo].[adminreplay]    Script Date: 3/12/2020 12:49:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[adminreplay](
	[id] [int] NOT NULL,
	[accountno] [varchar](50) NULL,
	[sender] [varchar](50) NULL,
	[replay] [varchar](max) NULL,
 CONSTRAINT [PK_adminreplay] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CallerTune]    Script Date: 3/12/2020 12:49:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CallerTune](
	[Tansaction_id] [int] IDENTITY(1,1) NOT NULL,
	[Transaction_Name] [varchar](50) NULL,
	[Type] [varchar](50) NULL,
	[Account_No] [varchar](50) NULL,
	[amount] [varchar](50) NULL,
	[date] [varchar](50) NULL,
	[time] [varchar](50) NULL,
	[TUNE_CODE] [varchar](50) NULL,
	[TUNE_NAME] [varchar](50) NULL,
	[CHARGES] [varchar](50) NULL,
	[SINGER] [varchar](50) NULL,
	[payment_method] [varchar](50) NULL,
 CONSTRAINT [PK_CallerTune] PRIMARY KEY CLUSTERED 
(
	[Tansaction_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cash_deposit]    Script Date: 3/12/2020 12:49:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cash_deposit](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ACCOUNT_NUMBER] [varchar](50) NULL,
	[amount] [int] NULL,
 CONSTRAINT [PK_cash_deposit] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[contactus]    Script Date: 3/12/2020 12:49:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[contactus](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[EMAIL] [varchar](50) NULL,
	[PHONE] [varchar](50) NULL,
	[MESSAGES] [varchar](max) NULL,
	[sender] [varchar](50) NULL,
	[replay] [varchar](max) NULL,
 CONSTRAINT [PK_contactus] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[feedback]    Script Date: 3/12/2020 12:49:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[feedback](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[phone] [varchar](50) NULL,
	[rating] [varchar](50) NULL,
	[feedback] [varchar](max) NULL,
 CONSTRAINT [PK_feedback] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[loginfo]    Script Date: 3/12/2020 12:49:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[loginfo](
	[username] [varchar](50) NULL,
	[Account_No] [varchar](50) NOT NULL,
	[Email] [varchar](50) NULL,
	[password] [varchar](50) NULL,
	[confirm_password] [varchar](50) NULL,
	[Address] [varchar](50) NULL,
	[mpin] [varchar](50) NULL,
	[image_locations] [varchar](50) NULL,
	[Balance] [int] NULL,
	[Transaction_Name] [varchar](50) NULL,
	[Type] [varchar](50) NULL,
	[mpincheck] [varchar](50) NULL,
	[amount] [int] NULL,
	[date] [varchar](50) NULL,
	[time] [varchar](50) NULL,
	[offer/recharge/consumer_numbers] [varchar](50) NULL,
	[paymentmethod] [varchar](50) NULL,
	[operators] [varchar](50) NULL,
	[accountno] [varchar](50) NULL,
 CONSTRAINT [PK_loginfo_1] PRIMARY KEY CLUSTERED 
(
	[Account_No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[offer]    Script Date: 3/12/2020 12:49:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[offer](
	[Transaction_id] [int] NOT NULL,
	[Transaction_Name] [varchar](50) NULL,
	[Type] [varchar](50) NULL,
	[Account_No] [varchar](50) NULL,
	[mpin] [varchar](50) NULL,
	[amount] [varchar](50) NULL,
	[date] [varchar](50) NULL,
	[time] [varchar](50) NULL,
	[offer/recharge/consumernumber] [varchar](50) NULL,
	[paymentmethod] [varchar](50) NULL,
	[operator] [varchar](50) NULL,
	[offercode] [varchar](50) NULL,
	[offer_type] [varchar](50) NULL,
	[offer_description] [varchar](50) NULL,
	[offer_price] [varchar](50) NULL,
 CONSTRAINT [PK_offer] PRIMARY KEY CLUSTERED 
(
	[Transaction_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[offers]    Script Date: 3/12/2020 12:49:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[offers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [varchar](50) NULL,
	[Network] [varchar](50) NULL,
	[Description_] [varchar](50) NULL,
	[Price] [varchar](50) NULL,
	[Transaction_name] [varchar](50) NULL,
	[Payment_Methods] [varchar](50) NULL,
	[account_no] [varchar](50) NULL,
	[amount] [varchar](50) NULL,
	[Reciever_Mobile_No] [varchar](50) NULL,
 CONSTRAINT [PK_offers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[roletable]    Script Date: 3/12/2020 12:49:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[roletable](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [varchar](50) NOT NULL,
	[Role] [varchar](50) NULL,
 CONSTRAINT [PK_roletable] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[transaction_table]    Script Date: 3/12/2020 12:49:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[transaction_table](
	[Transaction_id] [int] IDENTITY(1,1001) NOT NULL,
	[Transaction_Name] [varchar](50) NULL,
	[Type] [varchar](50) NULL,
	[Account_No] [varchar](50) NULL,
	[mpin] [varchar](50) NULL,
	[amount] [int] NULL,
	[date] [varchar](50) NULL,
	[time] [varchar](50) NULL,
	[offer/recharge/consumer_numbers] [varchar](50) NULL,
	[paymentmethod] [varchar](50) NULL,
	[operators_] [varchar](50) NULL,
 CONSTRAINT [PK_transaction_table] PRIMARY KEY CLUSTERED 
(
	[Transaction_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[userlogin]    Script Date: 3/12/2020 12:49:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[userlogin](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NULL,
	[password] [varchar](50) NULL,
	[user id] [varchar](50) NULL,
	[balance] [int] NULL,
	[Transaction_Name] [varchar](50) NULL,
	[Type] [varchar](50) NULL,
	[mpincheck] [varchar](50) NULL,
	[amount] [int] NULL,
	[date] [varchar](50) NULL,
	[time] [varchar](50) NULL,
	[offer/recharge/consumer_numbers] [varchar](50) NULL,
	[paymentmethod] [varchar](50) NULL,
	[operators] [varchar](50) NULL,
	[account_no] [varchar](50) NULL,
	[mpin] [varchar](50) NULL,
 CONSTRAINT [PK_userlogin] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[adminreplay] ([id], [accountno], [sender], [replay]) VALUES (3040, N'03182232223', N'ADMIN', N'i am fine man')
INSERT [dbo].[adminreplay] ([id], [accountno], [sender], [replay]) VALUES (3041, N'03182232223', N'ADMIN', N'yes')
INSERT [dbo].[adminreplay] ([id], [accountno], [sender], [replay]) VALUES (3042, N'03343020625', N'ADMIN', N'fine and you?')
INSERT [dbo].[adminreplay] ([id], [accountno], [sender], [replay]) VALUES (3045, N'03182232223', N'ADMIN', N'i am fine buddy')
INSERT [dbo].[adminreplay] ([id], [accountno], [sender], [replay]) VALUES (3047, N'03182232223', N'ADMIN', N'thankyou buddy')
INSERT [dbo].[adminreplay] ([id], [accountno], [sender], [replay]) VALUES (3048, N'03182232223', N'ADMIN', N'thankyou buddy')
INSERT [dbo].[adminreplay] ([id], [accountno], [sender], [replay]) VALUES (3049, N'03182232223', N'ADMIN', N'i am fine buddy')
INSERT [dbo].[adminreplay] ([id], [accountno], [sender], [replay]) VALUES (3050, N'03343020624', N'ADMIN', N'thankyou buddy')
INSERT [dbo].[adminreplay] ([id], [accountno], [sender], [replay]) VALUES (3051, N'03343020625', N'ADMIN', N'thankyou buddy')
SET IDENTITY_INSERT [dbo].[CallerTune] ON 

INSERT [dbo].[CallerTune] ([Tansaction_id], [Transaction_Name], [Type], [Account_No], [amount], [date], [time], [TUNE_CODE], [TUNE_NAME], [CHARGES], [SINGER], [payment_method]) VALUES (4, NULL, NULL, N'', N'', NULL, NULL, N'22567', N'ab khud kuch kerna parega', N'RS = 15', N'ATIF ASLAM', N'')
INSERT [dbo].[CallerTune] ([Tansaction_id], [Transaction_Name], [Type], [Account_No], [amount], [date], [time], [TUNE_CODE], [TUNE_NAME], [CHARGES], [SINGER], [payment_method]) VALUES (5, NULL, NULL, N'', N'', NULL, NULL, N'22568', N'DIL DIL PAKISTAN', N'RS = 15', N'JUNAID JAMSHAID', N'')
INSERT [dbo].[CallerTune] ([Tansaction_id], [Transaction_Name], [Type], [Account_No], [amount], [date], [time], [TUNE_CODE], [TUNE_NAME], [CHARGES], [SINGER], [payment_method]) VALUES (6, NULL, NULL, NULL, NULL, NULL, NULL, N'34567', N'BAZIGAR', N'RS =15', N'KUMAR SANU', NULL)
INSERT [dbo].[CallerTune] ([Tansaction_id], [Transaction_Name], [Type], [Account_No], [amount], [date], [time], [TUNE_CODE], [TUNE_NAME], [CHARGES], [SINGER], [payment_method]) VALUES (7, NULL, NULL, N'', N'', NULL, NULL, N'34556', N'HAY JAZBA JUNOON', N'RS = 15', N'ALI AZMAT', N'')
INSERT [dbo].[CallerTune] ([Tansaction_id], [Transaction_Name], [Type], [Account_No], [amount], [date], [time], [TUNE_CODE], [TUNE_NAME], [CHARGES], [SINGER], [payment_method]) VALUES (8, NULL, NULL, NULL, NULL, NULL, NULL, N'67854', N'PAKISTAN ZINDABAD', N'RS = 15', N'SAHIR ALI BAGHA', NULL)
INSERT [dbo].[CallerTune] ([Tansaction_id], [Transaction_Name], [Type], [Account_No], [amount], [date], [time], [TUNE_CODE], [TUNE_NAME], [CHARGES], [SINGER], [payment_method]) VALUES (9, NULL, NULL, NULL, NULL, NULL, NULL, N'55678', N'DOSTI ', N'RS =15', N'JAWAD AHMAD', NULL)
INSERT [dbo].[CallerTune] ([Tansaction_id], [Transaction_Name], [Type], [Account_No], [amount], [date], [time], [TUNE_CODE], [TUNE_NAME], [CHARGES], [SINGER], [payment_method]) VALUES (10, NULL, NULL, NULL, NULL, NULL, NULL, N'67853', N'HUM DEKHENGAY', N'RS = 15', N'JAWAD AHMAD', NULL)
INSERT [dbo].[CallerTune] ([Tansaction_id], [Transaction_Name], [Type], [Account_No], [amount], [date], [time], [TUNE_CODE], [TUNE_NAME], [CHARGES], [SINGER], [payment_method]) VALUES (11, NULL, NULL, NULL, NULL, NULL, NULL, N'76578', N'AHD E WAFA', N'RS = 15', N'RAHET FATEH ALI KHAN', NULL)
INSERT [dbo].[CallerTune] ([Tansaction_id], [Transaction_Name], [Type], [Account_No], [amount], [date], [time], [TUNE_CODE], [TUNE_NAME], [CHARGES], [SINGER], [payment_method]) VALUES (12, NULL, NULL, NULL, NULL, NULL, NULL, N'87654', N'MERAY PASS TUM HO', N'RS = 15', N'RAHET FATEH ALI KHAN', NULL)
SET IDENTITY_INSERT [dbo].[CallerTune] OFF
SET IDENTITY_INSERT [dbo].[contactus] ON 

INSERT [dbo].[contactus] ([id], [Name], [EMAIL], [PHONE], [MESSAGES], [sender], [replay]) VALUES (3031, N'ALI', NULL, N'hfhg', NULL, NULL, NULL)
INSERT [dbo].[contactus] ([id], [Name], [EMAIL], [PHONE], [MESSAGES], [sender], [replay]) VALUES (3032, N'ALI', N'ali@gmail.com', N'hfhg', N'ok', NULL, NULL)
INSERT [dbo].[contactus] ([id], [Name], [EMAIL], [PHONE], [MESSAGES], [sender], [replay]) VALUES (3033, N'ALI', N'ali@gmail.com', N'hfhg', N'ok', NULL, NULL)
INSERT [dbo].[contactus] ([id], [Name], [EMAIL], [PHONE], [MESSAGES], [sender], [replay]) VALUES (3034, N'salman', N'salman@yahoo.com', N'090078601', N'sir how are you', NULL, NULL)
INSERT [dbo].[contactus] ([id], [Name], [EMAIL], [PHONE], [MESSAGES], [sender], [replay]) VALUES (3035, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[contactus] ([id], [Name], [EMAIL], [PHONE], [MESSAGES], [sender], [replay]) VALUES (3036, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[contactus] ([id], [Name], [EMAIL], [PHONE], [MESSAGES], [sender], [replay]) VALUES (3037, N'gfgf', N'ali@gmail.com', N'hfhg', N'OAJXSD', NULL, NULL)
INSERT [dbo].[contactus] ([id], [Name], [EMAIL], [PHONE], [MESSAGES], [sender], [replay]) VALUES (3038, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[contactus] ([id], [Name], [EMAIL], [PHONE], [MESSAGES], [sender], [replay]) VALUES (3039, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[contactus] ([id], [Name], [EMAIL], [PHONE], [MESSAGES], [sender], [replay]) VALUES (3040, N'ALI', NULL, N'03182232223', N'sir how are you', NULL, NULL)
INSERT [dbo].[contactus] ([id], [Name], [EMAIL], [PHONE], [MESSAGES], [sender], [replay]) VALUES (3041, N'ALI', N'ali@gmail.com', N'03182232223', N'sir how are you', NULL, NULL)
INSERT [dbo].[contactus] ([id], [Name], [EMAIL], [PHONE], [MESSAGES], [sender], [replay]) VALUES (3042, N'idrees', N'idrees@gmail.com', N'03343020625', N'sir how are you', NULL, NULL)
INSERT [dbo].[contactus] ([id], [Name], [EMAIL], [PHONE], [MESSAGES], [sender], [replay]) VALUES (3043, N'ALI', N'ali@gmail.com', N'03182232223', N'OAJXSD', NULL, NULL)
INSERT [dbo].[contactus] ([id], [Name], [EMAIL], [PHONE], [MESSAGES], [sender], [replay]) VALUES (3044, N'ALI', N'ali@gmail.com', N'03182232223', N'ok', NULL, NULL)
INSERT [dbo].[contactus] ([id], [Name], [EMAIL], [PHONE], [MESSAGES], [sender], [replay]) VALUES (3045, N'ALI', N'ali@gmail.com', N'03182232223', N'kia hal hain', NULL, N'i am fine buddy')
INSERT [dbo].[contactus] ([id], [Name], [EMAIL], [PHONE], [MESSAGES], [sender], [replay]) VALUES (3046, N'ALI', N'ali@gmail.com', N'03182232223', N'sir please help us on recharge', NULL, NULL)
INSERT [dbo].[contactus] ([id], [Name], [EMAIL], [PHONE], [MESSAGES], [sender], [replay]) VALUES (3047, N'ALI', N'ali@gmail.com', N'03182232223', N'i like your website', NULL, N'thankyou buddy')
INSERT [dbo].[contactus] ([id], [Name], [EMAIL], [PHONE], [MESSAGES], [sender], [replay]) VALUES (3048, N'ALI', N'ali@gmail.com', N'03182232223', N'miss you sir', NULL, N'thankyou buddy')
INSERT [dbo].[contactus] ([id], [Name], [EMAIL], [PHONE], [MESSAGES], [sender], [replay]) VALUES (3049, N'ALI', N'ali@gmail.com', N'03182232223', N'sir how are you', NULL, N'')
INSERT [dbo].[contactus] ([id], [Name], [EMAIL], [PHONE], [MESSAGES], [sender], [replay]) VALUES (3050, N'idrees', N'idrees@gmail.com', N'03343020624', N'miss you', NULL, N'')
INSERT [dbo].[contactus] ([id], [Name], [EMAIL], [PHONE], [MESSAGES], [sender], [replay]) VALUES (3051, N'idrees', N'idrees@gmail.com', N'03343020625', N'sir how are you', NULL, N'')
INSERT [dbo].[contactus] ([id], [Name], [EMAIL], [PHONE], [MESSAGES], [sender], [replay]) VALUES (3052, N'ALI', N'ali@gmail.com', N'03182232223', N'iashio', NULL, NULL)
INSERT [dbo].[contactus] ([id], [Name], [EMAIL], [PHONE], [MESSAGES], [sender], [replay]) VALUES (3053, N'ALI', N'ali@gmail.com', N'03182232223', N'sir how are you', NULL, NULL)
INSERT [dbo].[contactus] ([id], [Name], [EMAIL], [PHONE], [MESSAGES], [sender], [replay]) VALUES (3054, N'ALI', N'ali@gmail.com', N'03182232223', N'love you', NULL, NULL)
INSERT [dbo].[contactus] ([id], [Name], [EMAIL], [PHONE], [MESSAGES], [sender], [replay]) VALUES (3055, N'ALI', N'ali@gmail.com', N'03182232223', N'miss you', NULL, NULL)
INSERT [dbo].[contactus] ([id], [Name], [EMAIL], [PHONE], [MESSAGES], [sender], [replay]) VALUES (3056, N'ALI', N'ali@gmail.com', N'03182232223', N'sir how are you', NULL, NULL)
SET IDENTITY_INSERT [dbo].[contactus] OFF
SET IDENTITY_INSERT [dbo].[feedback] ON 

INSERT [dbo].[feedback] ([id], [username], [Email], [phone], [rating], [feedback]) VALUES (2039, N'aliraza', N'HASSAN@GMAIL.COM', N'hlk', N'ExcellenT', N'jkjik')
INSERT [dbo].[feedback] ([id], [username], [Email], [phone], [rating], [feedback]) VALUES (2040, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[feedback] ([id], [username], [Email], [phone], [rating], [feedback]) VALUES (2041, N'aliraza', N'ali@gmail.com', N'7657647', N'ExcellenT', N'jkjik')
INSERT [dbo].[feedback] ([id], [username], [Email], [phone], [rating], [feedback]) VALUES (2042, N'aliraza', N'ali@gmail.com', N'7657647', N'ExcellenT', N'jkjik')
SET IDENTITY_INSERT [dbo].[feedback] OFF
INSERT [dbo].[loginfo] ([username], [Account_No], [Email], [password], [confirm_password], [Address], [mpin], [image_locations], [Balance], [Transaction_Name], [Type], [mpincheck], [amount], [date], [time], [offer/recharge/consumer_numbers], [paymentmethod], [operators], [accountno]) VALUES (N'aliraza', N'03182232223', N'ali@gmail.com', N'PAKISTAN', NULL, N'B26', N'1122', NULL, 2000, NULL, NULL, N'', NULL, NULL, NULL, NULL, N'RECHARGE.COM', NULL, N'')
INSERT [dbo].[loginfo] ([username], [Account_No], [Email], [password], [confirm_password], [Address], [mpin], [image_locations], [Balance], [Transaction_Name], [Type], [mpincheck], [amount], [date], [time], [offer/recharge/consumer_numbers], [paymentmethod], [operators], [accountno]) VALUES (N'idrees', N'03343020625', N'idrees@gmail.com', N'PAKISTAN', NULL, N'b26 block 10', N'6789', NULL, 120, NULL, NULL, N'', NULL, NULL, NULL, NULL, NULL, NULL, N'')
INSERT [dbo].[offer] ([Transaction_id], [Transaction_Name], [Type], [Account_No], [mpin], [amount], [date], [time], [offer/recharge/consumernumber], [paymentmethod], [operator], [offercode], [offer_type], [offer_description], [offer_price]) VALUES (1, NULL, NULL, N'', N'', N'', NULL, NULL, NULL, N'JAZZ CASH', NULL, N'1001', N'FULL TALK TIME', N'10 AM TO 10 PM', N'JUST RS = 99')
INSERT [dbo].[offer] ([Transaction_id], [Transaction_Name], [Type], [Account_No], [mpin], [amount], [date], [time], [offer/recharge/consumernumber], [paymentmethod], [operator], [offercode], [offer_type], [offer_description], [offer_price]) VALUES (2, NULL, NULL, N'', N'', N'', NULL, NULL, NULL, N'JAZZ CASH', NULL, N'1002', N'FULL TALK TIME', N'6PM TO 9PM', N'JUST RS = 29')
INSERT [dbo].[offer] ([Transaction_id], [Transaction_Name], [Type], [Account_No], [mpin], [amount], [date], [time], [offer/recharge/consumernumber], [paymentmethod], [operator], [offercode], [offer_type], [offer_description], [offer_price]) VALUES (3, NULL, NULL, N'', N'', N'', NULL, NULL, NULL, N'RECHARGE.COM', NULL, N'1003', N'GPRS', N'2GB FOR 7 DAYS', N'JUST RS = 120')
INSERT [dbo].[offer] ([Transaction_id], [Transaction_Name], [Type], [Account_No], [mpin], [amount], [date], [time], [offer/recharge/consumernumber], [paymentmethod], [operator], [offercode], [offer_type], [offer_description], [offer_price]) VALUES (4, NULL, NULL, N'786786', NULL, N'100', NULL, NULL, NULL, N'debit card', NULL, N'1004', N'SMS', N'1000 SMS', N'JUST RS  = 25')
INSERT [dbo].[offer] ([Transaction_id], [Transaction_Name], [Type], [Account_No], [mpin], [amount], [date], [time], [offer/recharge/consumernumber], [paymentmethod], [operator], [offercode], [offer_type], [offer_description], [offer_price]) VALUES (5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'1005', N'GPRS', N'1024 MB FOR 1 DAY', N'JUST RS = 10 ')
INSERT [dbo].[offer] ([Transaction_id], [Transaction_Name], [Type], [Account_No], [mpin], [amount], [date], [time], [offer/recharge/consumernumber], [paymentmethod], [operator], [offercode], [offer_type], [offer_description], [offer_price]) VALUES (6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'1006', N'FULL TALK TIME', N'1000MINS FOR 3 DAYS', N'JUST RS = 120')
INSERT [dbo].[offer] ([Transaction_id], [Transaction_Name], [Type], [Account_No], [mpin], [amount], [date], [time], [offer/recharge/consumernumber], [paymentmethod], [operator], [offercode], [offer_type], [offer_description], [offer_price]) VALUES (7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'1007', N'TALK TIME', N'100 MINS ALL NETWORKS', N'JUST RS =200')
INSERT [dbo].[offer] ([Transaction_id], [Transaction_Name], [Type], [Account_No], [mpin], [amount], [date], [time], [offer/recharge/consumernumber], [paymentmethod], [operator], [offercode], [offer_type], [offer_description], [offer_price]) VALUES (8, NULL, NULL, N'', N'', N'', NULL, NULL, NULL, N'RECHARGE.COM', NULL, N'1008', N'SMS', N'5000 FOR 30 DAYS', N'JUST RS = 50')
INSERT [dbo].[offer] ([Transaction_id], [Transaction_Name], [Type], [Account_No], [mpin], [amount], [date], [time], [offer/recharge/consumernumber], [paymentmethod], [operator], [offercode], [offer_type], [offer_description], [offer_price]) VALUES (9, NULL, NULL, N'1123456788090', NULL, N'99', NULL, NULL, NULL, N'debit card', NULL, N'1009', N'GPRS', N'10GB FOR 7 DAYS', N'JUST RS =270')
INSERT [dbo].[offer] ([Transaction_id], [Transaction_Name], [Type], [Account_No], [mpin], [amount], [date], [time], [offer/recharge/consumernumber], [paymentmethod], [operator], [offercode], [offer_type], [offer_description], [offer_price]) VALUES (10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'1010', N'GPRS', N'2.5 GB NIGHT', N'JUST RS =6')
INSERT [dbo].[offer] ([Transaction_id], [Transaction_Name], [Type], [Account_No], [mpin], [amount], [date], [time], [offer/recharge/consumernumber], [paymentmethod], [operator], [offercode], [offer_type], [offer_description], [offer_price]) VALUES (11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'1011', N'SMS', N'600 FOR 1 DAY', N'JUST RS = 12')
SET IDENTITY_INSERT [dbo].[offers] ON 

INSERT [dbo].[offers] ([ID], [Type], [Network], [Description_], [Price], [Transaction_name], [Payment_Methods], [account_no], [amount], [Reciever_Mobile_No]) VALUES (14, N'TELENOR', N'TELENOR', N'INTERNET 2 GB PAKAGES', N'RS=200', N'', N'', N'', N'', N'')
INSERT [dbo].[offers] ([ID], [Type], [Network], [Description_], [Price], [Transaction_name], [Payment_Methods], [account_no], [amount], [Reciever_Mobile_No]) VALUES (15, N'JAZZ', N'JAZZ', N'INTERNET 6 GB PAKAGES', N'RS=1000', N'', N'', N'', N'', N'')
INSERT [dbo].[offers] ([ID], [Type], [Network], [Description_], [Price], [Transaction_name], [Payment_Methods], [account_no], [amount], [Reciever_Mobile_No]) VALUES (16, N'TELENOR', N'TELENOR', N'INTERNET 2 GB PAKAGES', N'RS=200', N'', N'', N'', N'', N'')
INSERT [dbo].[offers] ([ID], [Type], [Network], [Description_], [Price], [Transaction_name], [Payment_Methods], [account_no], [amount], [Reciever_Mobile_No]) VALUES (17, N'TELENOR', N'TELENOR', N'INTERNET 2 GB PAKAGES', N'RS=200', N'', N'', N'', N'', N'')
INSERT [dbo].[offers] ([ID], [Type], [Network], [Description_], [Price], [Transaction_name], [Payment_Methods], [account_no], [amount], [Reciever_Mobile_No]) VALUES (18, N'SPECIAL OFFERS', N'ZONG', N'INTERNET 2 GB PAKAGES', N'RS=200', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[offers] ([ID], [Type], [Network], [Description_], [Price], [Transaction_name], [Payment_Methods], [account_no], [amount], [Reciever_Mobile_No]) VALUES (19, N'maximumoffer', N'TELENOR', N'INTERNET 6 GB PAKAGES', N'RS=1000', NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[offers] OFF
SET IDENTITY_INSERT [dbo].[roletable] ON 

INSERT [dbo].[roletable] ([RoleId], [user_id], [Role]) VALUES (3019, N'03182232223', N'User')
INSERT [dbo].[roletable] ([RoleId], [user_id], [Role]) VALUES (3020, N'03343020625', N'User')
SET IDENTITY_INSERT [dbo].[roletable] OFF
SET IDENTITY_INSERT [dbo].[transaction_table] ON 

INSERT [dbo].[transaction_table] ([Transaction_id], [Transaction_Name], [Type], [Account_No], [mpin], [amount], [date], [time], [offer/recharge/consumer_numbers], [paymentmethod], [operators_]) VALUES (1193193, N'Cash Depost', N'Deposit', N'03182232223', N'1122', 1000, N'3/9/2020', N'3:09 PM', N'03182232223', N'RECHARGE.COM', N'DEPOSIT THROUGH RECHARE.CO')
INSERT [dbo].[transaction_table] ([Transaction_id], [Transaction_Name], [Type], [Account_No], [mpin], [amount], [date], [time], [offer/recharge/consumer_numbers], [paymentmethod], [operators_]) VALUES (1194194, N'Online Recharge', N'Recharge', N'03182232223', N'1122', 1000, N'3/9/2020', N'3:11 PM', N'03152703001', N'RECHARGE.COM', N'ZONG')
INSERT [dbo].[transaction_table] ([Transaction_id], [Transaction_Name], [Type], [Account_No], [mpin], [amount], [date], [time], [offer/recharge/consumer_numbers], [paymentmethod], [operators_]) VALUES (1195195, N'Online Recharge', N'Recharge', N'03182232223', N'1122', 15, N'3/9/2020', N'3:11 PM', N'03499598239', N'JAZZ CASH', NULL)
INSERT [dbo].[transaction_table] ([Transaction_id], [Transaction_Name], [Type], [Account_No], [mpin], [amount], [date], [time], [offer/recharge/consumer_numbers], [paymentmethod], [operators_]) VALUES (1196196, N'POSTPAIDBILL', N'Postpaid', N'888999', N'2344', 100, N'3/9/2020', N'3:12 PM', N'1001', N'JAZZ CASH', NULL)
INSERT [dbo].[transaction_table] ([Transaction_id], [Transaction_Name], [Type], [Account_No], [mpin], [amount], [date], [time], [offer/recharge/consumer_numbers], [paymentmethod], [operators_]) VALUES (1197197, N'CALLERTUNE', N'SONGS', N'03343020625', NULL, 120, N'3/9/2020', N'3:12 PM', N'22567', N'JAZZ CASH', NULL)
INSERT [dbo].[transaction_table] ([Transaction_id], [Transaction_Name], [Type], [Account_No], [mpin], [amount], [date], [time], [offer/recharge/consumer_numbers], [paymentmethod], [operators_]) VALUES (1198198, N'MONEY TRANSFER', N'BY CNIC', N'03182232223', N'1122', 200, N'3/9/2020', N'3:13 PM', N'42101-25275049', N'RECHARGE.COM', NULL)
INSERT [dbo].[transaction_table] ([Transaction_id], [Transaction_Name], [Type], [Account_No], [mpin], [amount], [date], [time], [offer/recharge/consumer_numbers], [paymentmethod], [operators_]) VALUES (1199199, N'Special Offers', N'TELENOR', N'123445', N'1122', 200, N'3/9/2020', N'3:14 PM', N'03152703001', N'JAZZ CASH', N'TELENOR')
INSERT [dbo].[transaction_table] ([Transaction_id], [Transaction_Name], [Type], [Account_No], [mpin], [amount], [date], [time], [offer/recharge/consumer_numbers], [paymentmethod], [operators_]) VALUES (1200200, N'MONEY TRANSFER', N'BY CNIC', N'03182232223', N'1122', 15, N'3/9/2020', N'3:19 PM', NULL, N'RECHARGE.COM', NULL)
INSERT [dbo].[transaction_table] ([Transaction_id], [Transaction_Name], [Type], [Account_No], [mpin], [amount], [date], [time], [offer/recharge/consumer_numbers], [paymentmethod], [operators_]) VALUES (1201201, N'Online Recharge', N'Recharge', N'03182232223', N'1122', 500, N'3/9/2020', N'4:54 PM', N'03499598239', N'RECHARGE.COM', N'TELENOR')
INSERT [dbo].[transaction_table] ([Transaction_id], [Transaction_Name], [Type], [Account_No], [mpin], [amount], [date], [time], [offer/recharge/consumer_numbers], [paymentmethod], [operators_]) VALUES (1202202, N'Cash Depost', N'Deposit', N'03182232223', N'1122', 50000, N'3/10/2020', N'1:10 PM', N'03182232223', N'RECHARGE.COM', N'DEPOSIT THROUGH RECHARE.CO')
INSERT [dbo].[transaction_table] ([Transaction_id], [Transaction_Name], [Type], [Account_No], [mpin], [amount], [date], [time], [offer/recharge/consumer_numbers], [paymentmethod], [operators_]) VALUES (1203203, N'MONEY TRANSFER', N'BY CNIC', N'03182232223', N'1122', 50085, N'3/10/2020', N'1:11 PM', N'42101-25275049', N'RECHARGE.COM', NULL)
INSERT [dbo].[transaction_table] ([Transaction_id], [Transaction_Name], [Type], [Account_No], [mpin], [amount], [date], [time], [offer/recharge/consumer_numbers], [paymentmethod], [operators_]) VALUES (1204204, N'Cash Depost', N'Deposit', N'03182232223', N'1122', 10000, N'3/10/2020', N'5:03 PM', N'03182232223', N'RECHARGE.COM', N'DEPOSIT THROUGH RECHARE.CO')
INSERT [dbo].[transaction_table] ([Transaction_id], [Transaction_Name], [Type], [Account_No], [mpin], [amount], [date], [time], [offer/recharge/consumer_numbers], [paymentmethod], [operators_]) VALUES (1205205, N'Online Recharge', N'Recharge', N'03182232223', N'1122', 9000, N'3/10/2020', N'5:04 PM', N'03152703001', N'RECHARGE.COM', N'ZONG')
INSERT [dbo].[transaction_table] ([Transaction_id], [Transaction_Name], [Type], [Account_No], [mpin], [amount], [date], [time], [offer/recharge/consumer_numbers], [paymentmethod], [operators_]) VALUES (1206206, N'MONEY TRANSFER', N'BY CNIC', N'03182232223', N'1122', 1000, N'3/10/2020', N'5:05 PM', N'42101-25275049', N'RECHARGE.COM', NULL)
INSERT [dbo].[transaction_table] ([Transaction_id], [Transaction_Name], [Type], [Account_No], [mpin], [amount], [date], [time], [offer/recharge/consumer_numbers], [paymentmethod], [operators_]) VALUES (1207207, N'Cash Depost', N'Deposit', N'03182232223', N'1122', 1000, N'3/10/2020', N'5:11 PM', N'03182232223', N'RECHARGE.COM', N'DEPOSIT THROUGH RECHARE.CO')
INSERT [dbo].[transaction_table] ([Transaction_id], [Transaction_Name], [Type], [Account_No], [mpin], [amount], [date], [time], [offer/recharge/consumer_numbers], [paymentmethod], [operators_]) VALUES (1208208, N'Cash Depost', N'Deposit', N'03003379931', N'6789', 120, N'3/10/2020', N'5:11 PM', N'03003379931', NULL, N'DEPOSIT THROUGH RECHARE.CO')
INSERT [dbo].[transaction_table] ([Transaction_id], [Transaction_Name], [Type], [Account_No], [mpin], [amount], [date], [time], [offer/recharge/consumer_numbers], [paymentmethod], [operators_]) VALUES (1209209, N'Cash Depost', N'Deposit', N'03182232223', N'1122', 1000, N'3/10/2020', N'5:23 PM', N'03182232223', N'RECHARGE.COM', N'DEPOSIT THROUGH RECHARE.CO')
INSERT [dbo].[transaction_table] ([Transaction_id], [Transaction_Name], [Type], [Account_No], [mpin], [amount], [date], [time], [offer/recharge/consumer_numbers], [paymentmethod], [operators_]) VALUES (1210210, N'Cash Depost', N'Deposit', N'03182232223', N'1122', 1000, N'3/11/2020', N'2:34 PM', N'03182232223', N'RECHARGE.COM', N'DEPOSIT THROUGH RECHARE.CO')
INSERT [dbo].[transaction_table] ([Transaction_id], [Transaction_Name], [Type], [Account_No], [mpin], [amount], [date], [time], [offer/recharge/consumer_numbers], [paymentmethod], [operators_]) VALUES (1211211, N'Cash Depost', N'Deposit', N'03182232223', N'1122', 1000, N'3/11/2020', N'2:34 PM', N'03182232223', N'RECHARGE.COM', N'DEPOSIT THROUGH RECHARE.CO')
INSERT [dbo].[transaction_table] ([Transaction_id], [Transaction_Name], [Type], [Account_No], [mpin], [amount], [date], [time], [offer/recharge/consumer_numbers], [paymentmethod], [operators_]) VALUES (1212212, N'Online Recharge', N'Recharge', N'03182232223', N'1122', 3000, N'3/11/2020', N'2:36 PM', N'03152703001', N'RECHARGE.COM', N'ZONG')
INSERT [dbo].[transaction_table] ([Transaction_id], [Transaction_Name], [Type], [Account_No], [mpin], [amount], [date], [time], [offer/recharge/consumer_numbers], [paymentmethod], [operators_]) VALUES (1213213, N'Cash Depost', N'Deposit', N'03182232223', N'1122', 1000, N'3/11/2020', N'2:42 PM', N'03182232223', N'RECHARGE.COM', N'DEPOSIT THROUGH RECHARE.CO')
INSERT [dbo].[transaction_table] ([Transaction_id], [Transaction_Name], [Type], [Account_No], [mpin], [amount], [date], [time], [offer/recharge/consumer_numbers], [paymentmethod], [operators_]) VALUES (1214214, N'Online Recharge', N'Recharge', N'03182232223', N'1122', 200, N'3/11/2020', N'2:42 PM', N'03499598239', N'RECHARGE.COM', N'TELENOR')
INSERT [dbo].[transaction_table] ([Transaction_id], [Transaction_Name], [Type], [Account_No], [mpin], [amount], [date], [time], [offer/recharge/consumer_numbers], [paymentmethod], [operators_]) VALUES (1215215, N'MONEY TRANSFER', N'BY CNIC', N'03182232223', N'1122', 600, N'3/11/2020', N'2:43 PM', N'42101-25275049', N'RECHARGE.COM', NULL)
INSERT [dbo].[transaction_table] ([Transaction_id], [Transaction_Name], [Type], [Account_No], [mpin], [amount], [date], [time], [offer/recharge/consumer_numbers], [paymentmethod], [operators_]) VALUES (1216216, N'Cash Depost', N'Deposit', N'03182232223', N'1122', 1000, N'3/11/2020', N'7:33 PM', N'03182232223', N'RECHARGE.COM', N'DEPOSIT THROUGH RECHARE.CO')
INSERT [dbo].[transaction_table] ([Transaction_id], [Transaction_Name], [Type], [Account_No], [mpin], [amount], [date], [time], [offer/recharge/consumer_numbers], [paymentmethod], [operators_]) VALUES (1217217, N'Online Recharge', N'Recharge', N'03182232223', N'1122', 100, N'3/11/2020', N'7:33 PM', N'03152703001', N'RECHARGE.COM', N'TELENOR')
INSERT [dbo].[transaction_table] ([Transaction_id], [Transaction_Name], [Type], [Account_No], [mpin], [amount], [date], [time], [offer/recharge/consumer_numbers], [paymentmethod], [operators_]) VALUES (1218218, N'Cash Depost', N'Deposit', N'03182232223', N'1122', 900, N'3/12/2020', N'2:53 AM', N'03182232223', N'RECHARGE.COM', N'DEPOSIT THROUGH RECHARE.CO')
SET IDENTITY_INSERT [dbo].[transaction_table] OFF
SET IDENTITY_INSERT [dbo].[userlogin] ON 

INSERT [dbo].[userlogin] ([id], [username], [password], [user id], [balance], [Transaction_Name], [Type], [mpincheck], [amount], [date], [time], [offer/recharge/consumer_numbers], [paymentmethod], [operators], [account_no], [mpin]) VALUES (16, N'aliraza', N'PAKISTAN', N'03182232223', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'03182232223', N'1122')
INSERT [dbo].[userlogin] ([id], [username], [password], [user id], [balance], [Transaction_Name], [Type], [mpincheck], [amount], [date], [time], [offer/recharge/consumer_numbers], [paymentmethod], [operators], [account_no], [mpin]) VALUES (17, N'idrees', N'PAKISTAN', N'03343020625', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'03343020625', N'6789')
SET IDENTITY_INSERT [dbo].[userlogin] OFF
ALTER TABLE [dbo].[cash_deposit]  WITH CHECK ADD  CONSTRAINT [FK_cash_deposit_loginfo] FOREIGN KEY([ACCOUNT_NUMBER])
REFERENCES [dbo].[loginfo] ([Account_No])
GO
ALTER TABLE [dbo].[cash_deposit] CHECK CONSTRAINT [FK_cash_deposit_loginfo]
GO
ALTER TABLE [dbo].[feedback]  WITH CHECK ADD  CONSTRAINT [FK_feedback_feedback] FOREIGN KEY([id])
REFERENCES [dbo].[feedback] ([id])
GO
ALTER TABLE [dbo].[feedback] CHECK CONSTRAINT [FK_feedback_feedback]
GO
ALTER TABLE [dbo].[loginfo]  WITH CHECK ADD  CONSTRAINT [FK_loginfo_loginfo] FOREIGN KEY([Account_No])
REFERENCES [dbo].[loginfo] ([Account_No])
GO
ALTER TABLE [dbo].[loginfo] CHECK CONSTRAINT [FK_loginfo_loginfo]
GO
ALTER TABLE [dbo].[roletable]  WITH CHECK ADD  CONSTRAINT [FK_roletable_loginfo] FOREIGN KEY([user_id])
REFERENCES [dbo].[loginfo] ([Account_No])
GO
ALTER TABLE [dbo].[roletable] CHECK CONSTRAINT [FK_roletable_loginfo]
GO
ALTER TABLE [dbo].[userlogin]  WITH CHECK ADD  CONSTRAINT [FK_userlogin_loginfo] FOREIGN KEY([user id])
REFERENCES [dbo].[loginfo] ([Account_No])
GO
ALTER TABLE [dbo].[userlogin] CHECK CONSTRAINT [FK_userlogin_loginfo]
GO
USE [master]
GO
ALTER DATABASE [rechargefunctions] SET  READ_WRITE 
GO
