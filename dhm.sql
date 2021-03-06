USE [master]
GO
/****** Object:  Database [DHMRice]    Script Date: 10/29/2017 12:37:39 AM ******/
CREATE DATABASE [DHMRice]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DHMRice', FILENAME = N'E:\Softwares\sql server\MSSQL12.MSSQLSERVER\MSSQL\DATA\DHMRice.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DHMRice_log', FILENAME = N'E:\Softwares\sql server\MSSQL12.MSSQLSERVER\MSSQL\DATA\DHMRice_log.ldf' , SIZE = 560KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DHMRice] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DHMRice].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DHMRice] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DHMRice] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DHMRice] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DHMRice] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DHMRice] SET ARITHABORT OFF 
GO
ALTER DATABASE [DHMRice] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DHMRice] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DHMRice] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DHMRice] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DHMRice] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DHMRice] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DHMRice] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DHMRice] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DHMRice] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DHMRice] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DHMRice] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DHMRice] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DHMRice] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DHMRice] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DHMRice] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DHMRice] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [DHMRice] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DHMRice] SET RECOVERY FULL 
GO
ALTER DATABASE [DHMRice] SET  MULTI_USER 
GO
ALTER DATABASE [DHMRice] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DHMRice] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DHMRice] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DHMRice] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [DHMRice] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'DHMRice', N'ON'
GO
USE [DHMRice]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 10/29/2017 12:37:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 10/29/2017 12:37:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 10/29/2017 12:37:39 AM ******/
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
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 10/29/2017 12:37:39 AM ******/
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
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 10/29/2017 12:37:39 AM ******/
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
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 10/29/2017 12:37:39 AM ******/
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
	[MobileNo] [nvarchar](max) NULL,
	[User_Cnic] [nvarchar](max) NULL,
	[User_Adress] [nvarchar](max) NULL,
	[ShopCrendital] [bit] NOT NULL DEFAULT ((0)),
	[FactroryCrendital] [bit] NOT NULL DEFAULT ((0)),
	[Status] [bit] NOT NULL DEFAULT ((0)),
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201710281743102_User Module', N'DHMRice.Migrations.Configuration', 0x1F8B0800000000000400DD5C5B6FE3B6127E2F70FE83A0A7738AD4CAE5EC624F606F913AC9D9A09B0BD6D9C5795BD012ED082B51AA44A5098AFEB23EF427F52F9CA144C9E24D175BB19D628145440EBF190E87E47038F45F7FFC39FEF1290CAC479CA47E4426F6D1E8D0B6307123CF27CB899DD1C50FEFEC1FDFFFE3BBF185173E595F4ABA1346072D493AB11F288D4F1D27751F7088D251E8BB4994460B3A72A3D0415EE41C1F1EFEC7393A723040D8806559E34F19A17E88F30FF89C46C4C531CD50701D7938487939D4CC7254EB0685388D918B27F6F987EB4FBE8B4705A56D9D053E0229663858D8162224A288828CA79F533CA3494496B3180A5070FF1C63A05BA020C55CF6D31579D76E1C1EB36E38AB8625949BA5340A7B021E9D70BD3872F3B5B46B577A03CD5D8086E933EB75AEBD897DE5E1BCE8531480026486A7D32061C413FBBA627196C637988ECA86A302F23201B85FA3E4DBA88E7860756E7750D9D1F1E890FD3BB0A65940B3044F08CE68828203EB2E9B07BEFB337EBE8FBE613239399A2F4EDEBD798BBC93B7FFC6276FEA3D85BE029D500045774914E30464C38BAAFFB6E588ED1CB961D5ACD6A6D00AD8124C09DBBA464F1F3159D207982CC7EF6CEBD27FC25E59C28DEB33F1610641239A64F0799305019A07B8AA771A79B2FF1BB81EBF793B08D71BF4E82FF3A197F8C3C449605E7DC2415E9B3EF87131BD84F1FECAC92E932864DFA27D15B55F675196B8AC339191E41E254B4C45E9C6CECA783B9934831ADEAC4BD4FD376D26A96ADE5A52D6A1756642C962DBB3A194F765F976B6B8B33886C1CB4D8B69A4C9E0C48D6A24B53CB078FDCA648EBA9A0C81AEFC9D57C08B10F9C1004B60072EE0792CFC24C4552F7F8AC0E010E92DF31D4A535801BC0F287D68101DFE1C40F41976B3040C73465118BF38B7BB8788E09B2C9C337BDF1EAFC186E6FED7E812B9344A2E086BB531DEC7C8FD1665F48278E788E2CFD42D01D9E7BD1F760718449C33D7C5697A09C68CBD69048E75097845E8C9716F38B638EDDA059906C80FF53E88B48C7E2D49577E889E42F1450C643A7FA449D48FD1D227DD442D49CDA21614ADA272B2BEA232B06E92724AB3A03941AB9C05D5601E5E3E42C3BB7839ECFEFB789B6DDEA6B5A0A6C619AC90F8BF98E0049631EF0E518A13B21A812EEBC62E9C857CF818D317DF9B724E5F50900DCD6AADD9902F02C3CF861C76FF67432E26143FFA1EF34A3A1C7C4A6280EF44AF3F53B5CF3949B26D4F07A19BDB66BE9D35C0345DCED23472FD7C1668425E3C6021CA0F3E9CD51EBD287A234740A06360E83EDBF2A004FA66CB46754BCE718029B6CEDC22243845A98B3C558DD021AF8760E58EAA116C15091185FB5EE109968E13D608B143500A33D527549D163E71FD1805AD5A925A76DCC258DF2B1E72CD398E31610C5B35D185B93EF0C104A8F84883D2A6A1B153B3B866433478ADA6316F736157E3AEC423B662932DBEB3C12EB9FFF62286D9ACB12D1867B34ABA08600CE2EDC240F959A5AB01C807977D3350E9C4643050EE526DC540458DEDC0404595BC3A032D8EA85DC75F3AAFEE9B798A07E5ED6FEB8DEADA816D0AFAD833D32C7C4F6843A1054E54F33C9FB34AFC4435873390939FCF52EEEACA26C2C067988A219B95BFABF5439D6610D9889A005786D602CAAFFF14206542F510AE8CE5354AC7BD881EB065DCAD1196AFFD126CCD0654ECFA35688DD07C592A1B67A7D347D5B3CA1A1423EF7458A8E1680C425EBCC48E77508A292EAB2AA68B2FDCC71BAE758C0F4683825A3C578392CACE0CAEA5D234DBB5A473C8FAB8641B6949729F0C5A2A3B33B896B88DB62B49E314F4700B365291B8850F34D9CA4847B5DB547563A7C88CE20563C7904235BE4671EC93652DA58A9758B3229F6AFAC3AC7FB2515860386EAAC939AAA4AD38D128414B2CD5026B90F4D24F527A8E289A2316E7997AA142A6DD5B0DCB7FC9B2BE7DAA8358EE032535FBBB68215DDA0BFBACEA88F0F697D0BB90793379085D33F6FAE6164B6F43014A3451FB69146421313B57E6D6C5DD5DBD7D51A2228C1D497EC5795234A5B8B8A2DA3B0D8A3A210618A0CA6F597F90CC102655975E675DD9264FD48C5206A6EA28A660D5CE06CDE4C0741E28D92FEC3F4EAD082F339F78324A1D8017F5C4A8E5332860B5BAEEA862CA491D53ACE98E28E595D421A5AA1E52D6B3470421EB156BE11934AAA7E8CE41CD17A9A3ABB5DD9135992375684DF51AD81A99E5BAEEA89AE4923AB0A6BA3BF62AD3445E40F778C7329E56D6DAB28AC3EC667B9601E36556C361B6BCDA9D7D1DA856DC138BDFCA2B60BC7C2F2DC978A25BCB928AF8C5669664C030AF38C24DB7B8E0345ECF9B3185EB6B61516FBABE37E3F5B3D717B50AE530279354DCAB439D74781BF38354FB2319E5645590D856A946D8D09F538AC3112318CD7E09A6818FD9F25D125C23E22F704A8B940DFBF8F0E8587A6BB33FEF5E9C34F502CD41D4F4F8451CB32D645F914794B80F2851732136781BB20255C2CC57C4C34F13FBB7BCD5691EB1607FE5C507D655FA99F8BF6450719F64D8FA5DCDED1C2657BEF960B5A72F1BBA6BF5EA7F5F8BA607D66D0233E6D43A9474B9CE088BEF1D7A495334DD409AB55F41BCDE09253C35D0A24A1362FD9705739F0EF2AAA094F29F217AFA575FD1B42F073642D4BC0E180A6F10159AB2FFD7C13266FE7BF049F3CCFF7E9DD5BF04584734E32B009FF40793DF00745F86CA963BDC6A34E7A16D2C49B99E5B73A8374AA8DCF5DEA4A45A6F34D1D574EA1E701BA44CAF6119AF2CDB78B0DD51934C3C18F62E4DFBC53388F725697895CEB1DB5CE16DA607375C05FDADB282F7208F4D9397B3FBDCDF6DDB9A2986BBE70994FD327CF7CCD878B6D6EEF378B76D6CA630EF9E1B5BAF6CDD3DB3B55DED9F3BB6B4CE5BE8CE736FD53422C35D8C2E16DC965B5B04CEE1843F8FC0080A8FB27812A94FE66A4A446D61B8223133356791C98C9589A3F055289AD9F6EB2BDFF01B3BCB699AD91A722F9B78F3F5BF9137A769E66DC868DC4556B036A75097A9DDB28E35253EBDA62C60A1272D49E76D3E6BE3C5FA6B4AFA1D4429C2EC31DC11BF9E1CDF415432E4D4E991D3AB5EF7C2DE59FBE544D8BF537FB98260BFA348B02BEC9A15CD155944E5E62D49549248119A6B4C91075BEA5942FD05722954B31873FEA63B8FDBB19B8E39F6AEC86D46E38C429771380F84801773029AF8E789CBA2CCE3DB38FF799221BA0062FA2C367F4B7ECAFCC0ABE4BED4C4840C10CCBBE0115D369694457697CF15D24D443A0271F5554ED13D0EE300C0D25B32438F781DD9C0FC3EE225729F5711401348FB40886A1F9FFB6899A030E518ABF6F00936EC854FEFFF0F686A618040540000, N'6.1.3-40302')
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201710281745168_User Module Update', N'DHMRice.Migrations.Configuration', 0x1F8B0800000000000400DD5C596FE4B8117E0F90FF20E82909BC2D1F99C1C4E8DE85B76D678D8C0F4C7B167933D812BB2D8C44F54A94D746B0BF6C1FF293F2175294A883978E6EF5E1C5028B69B2F855B158248BA52AFFEFF7FF8E7F780D03EB05C7891F91897D323AB62D4CDCC8F3C97262A774F1DD27FB87EFFFFCA7F19517BE5A3F1774678C0E469264623F53BA3A779CC47DC6214A46A1EFC651122DE8C88D42077991737A7CFC0FE7E4C4C100610396658DBFA484FA21CE7EC0CF69445CBCA2290A6E230F07096F879E59866ADDA110272BE4E2897DF9D3ED17DFC5A39CD2B62E021F8114331C2C6C0B1112514441C6F3AF099ED13822CBD90A1A50F0F8B6C240B7404182B9ECE71579D7691C9FB26938D5C002CA4D131A853D014FCEB85E1C79F85ADAB54BBD81E6AE40C3F48DCD3AD3DEC4BEF170D6F4250A400132C3F3691033E2897D5BB2B8485677988E8A81A31CF23A06B85FA3F8DBA88E7864751E7754DAD1E9E898FD77644DD380A6319E109CD2180547D6433A0F7CF75FF8ED31FA86C9E4EC64BE38FBF4E123F2CE3EFE1D9F7DA8CF14E60A744203343DC4D10AC7201B5E94F3B72D471CE7C803CB61B531B956C096604BD8D62D7AFD8CC9923EC36639FD645BD7FE2BF68A166E5C5F890F3B0806D138859F776910A07980CB7EA79127FB7F03D7D30F1F07E17A875EFC65B6F4127FD83831ECAB2F38C87A93677F956F2F61BD9F38D9751C85ECB7685F79EFD32C4A63974D2632923CA27889A928DDD8A98CB7934933A8E1CDBA403D7CD36692AAE6AD2565135A6727142C76BD1B0A79B7CBB7B3C55DAC56B0789969318D34199C78518DA4914716EFAF4CE6A4ABC91098CA1FF904BC0A911F0C70043673B98DE67E80EFA20646F0CF0118B1E57E9AC288DD70BAF0629C245BE7357B8E56D31813CFA7A85CAC1F23D8AE88F45EF16BE482AF16BF0D063883DD98269BA2648608CEE9C28F43EC6D8AF68092042E09EF27943C6F7F79B09BC670768122C2D5D6B93D3C4704DFA5E19C1D89BBE335D8D23CFE1A31138CE22BC2466D8CF73972BF4529BD22DE25A2F82B2DB73EFBF9E887DD010611E7C275E148B80663C6DE3482B757017843E8D9696F3876CCECDB4B9D06C80FF56EAA74D33E15A495ABAAA750DC550399CE656D12F573B4F44937510B52B3A83945ABA89CACAFA80CAC9BA49CD22C6846D02A674E35D823205BA1E15F0119ECE13F0336F3EF4C67414D8D333821F13F31C1311C63DE03A214C7A45A812EE7C63EFCC96CF918D3ADDF4D19A79F51900ECD6AADDD901D02C3EF860CF6F07743262634BFF81EF34A3ABC8D0B6280EF44AF7F76B7EF3949B25D6F07619ABB66BE9B33C0B45D2E922472FD6C1768A2A23CA625CA0F3E9CD51EE0CA672307C9606260E83EBBF2A005E666CB46754F2E718029B62EDC3C6A3C45898B3C558D3021AF8760C58DAA11AC0A9689C2FD4DE109968E633608B14750023BD52754DD163E71FD150A5AB5248DEC7885B1B9973CE49E4BBC820723306CD54417E6FAD81813A0E4232D4A9B86C64ECDE29A0DD1E0B59AD6BCCD85ADD65D0959EDC4265B7C67835D72FF6D2B86D9ACB11D1867B34ABA08608CF3EEC340F95BA5AB01C80F97433350E9C5643050EE52EDC440458DEDC1404595BC3B03CD9FA85DD75F7AAF1E9A798A0FE5DD5FEB8DEADA836D0AFA3830D3CC7D4F184361048E55F3BC9CB34EFC4A358F339093BFCF12EEEACA26C2C067988A219BCADFD5FAA14E33886C444D8095A1B580F22FC40A90B2A17A0857C4F21AA5E35E440FD822EED608CBCF7E09B666032A76FD4B798DD0FC3D5D36CE4EAF8F7266A5352846DEE9B150C3D118847C788913EFA014535C56554C175FB88F375C9B185F8C0605B578AE06251593195C4B8569B66B49E790F571C936D292E43E19B4544C66702D711B6D5792C629E8E1166CA422F10A1F68B315918EF2B629FBC64E9E3CC71BC68E21CB6E7C8B562B9F2C6B5977BCC59AE52977D3EF66FDF3D1C21CC371134D5A5A296DC98946315A62A9175883A4D77E9CD04B44D11CB138CFD40B1532EDDD6A38FE0B96F5EB535DC4E21E28A8D9BFF311525E8770CFAA8E081F7F0DB30B99379385D0356BAF1F6EB10C4814A05813B59F46411A12B373651E9D7FBBAB8FCF5B5484B123C9AF384F8AA6141757547BA7455137C4000B54FA2DEB2F9219C2A4EAC2EBAC2BDBE4899A518AC0541DC514ACDADBA2991C98CE0B25FB85FDD7A915613BFB89E72BD5017853778C2A1BA90E53B57647AAA51BC956C79B7B621509450A5AD1D11D4F4A1AAA234A5DDD3135B943755C4D770F79791A9120286FEB691FB55C15C5506A7DDD51C574A23AA6D8D363B662CE903069B1AB8794F5CC2041C87AC75A78068DEA29BA73507381EAE86A6F77644D56501D5AD3BD06B64666B9AF3BAA2671A80EACE9EE77B6A89E48D57A30179BE69937903B92072A36F3470C18DBB9E98671676AF91875A05A734F2C9E71A180F1F683B424E36B7D2D4BCA63539B599201C37CE208590CE281D3987A61C61452138443BD2935C38CD7CF5EB76A15CA435D2629B9970F76E9613EE68FE4F61A39E5D59C93D856A146B8D0DF128AC3112318CD7E09A6818FD9F15D10DC22E22F7042F3741CFBF4F8E4542AB53B9CB2372749BC40136430D5BE896BB683CC3AF28262F719C56A9ECB06A56115A8F209E18678F87562FF271B759E45A3D8BFB2E623EB26F94AFC5F52E8788C536CFDA6E6ED0E532AD3FC683ED0C2A6EE5ABDF9F7533EF4C8BA8F61C79C5BC7922ED75961B1DCA99734F9D00DA459BB08EAFD6E28A1D2488B2A6D88750A8B0ADCBF84E8F5AF7DC194E2A1CDD1C402A18DF0B44540739F0E5700B40E9858FCB30E82BEF0671D245DD1CF662AD715F66C84A829DE190A6F10159A8A73D6C13216E678F093668539FD26AB2FD459473463918E4FFA83C9253ADD6F9262E41EBD05CD937617B74AA6E7D612878DF29DF7ED5E2895101B6D74B5DAA107DC06150D6B58C63B2B0618CCC1D1E4FA0F86BD4FD3DE7A82FFA1E4F457D956FB4DE5DF65F67EC397DA3F54D2FE01A4996AD2E6F69F9ABF6B5B3385E10F3CBFB95F02FE81191B4FA6DC7F9AFDAE8DCD14A93F7063EB954C7F60B6B6AFFB73CF96D6F90ADD7B6ABC9AE567F89CA60BE7B7A5BEE7DF3EE0853F6711B9DCA3CC2B96F5B9964D79E22D0C2B1233537392A7CC58D9380A5F85A2996DBFB9F20BBF71B29CA699AD2135BA89373FFF1B79739A66DE8684E37D24ED6B537E7585142DE758535EE27B4AD21766D25213D2E6B336E646BCA79CFC419422EC1EC367FEF793823F884A86DC3A3D52EED52FF67077D6FEF62DDCDF89BFAC20D85FC225D8156ECD92E6862CA2E2F296242A48E42F5198220FAED48B98FA0BE452E86631E6EC4F2E64713BF6A5638EBD1B729FD2554A61CA389C0742C08B39014DFCB3BA0251E6F1FD2AFBEB41434C01C4F4596CFE9EFC98FA8157CA7DAD890919209877C123BA6C2D298BEC2EDF4AA4BB887404E2EA2B9DA2471CAE02004BEEC90CBDE0756403F3FB8C97C87DAB22802690F68510D53EBEF4D1324661C231AAF1F0136CD80B5FBFFF3FE8A95E08025A0000, N'6.1.3-40302')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'1', N'Admin')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'3', N'Factory')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'2', N'Shop')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'6a853add-56a6-49db-9c26-b3881049e71b', N'1')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'cec3fe66-a10e-4cdf-8de3-3588818e0a3d', N'3')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [MobileNo], [User_Cnic], [User_Adress], [ShopCrendital], [FactroryCrendital], [Status]) VALUES (N'6a853add-56a6-49db-9c26-b3881049e71b', N'muhammad.waleed.010@gmail.com', 0, N'ANPjwOTm4Yh5lJ3/0YBnj/FrqIphEhlQUfU2ClgUuo+NQQjPzNAG/8Zb0n5wNaonsQ==', N'7260f725-d0a9-49e5-ab64-eaae9955f2a4', NULL, 0, 0, NULL, 1, 0, N'Muhammad waleed', N'03224340604', N'3520106117699', N'21-c shalamar link road opposite shalamar hospital lahore', 1, 1, 1)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [MobileNo], [User_Cnic], [User_Adress], [ShopCrendital], [FactroryCrendital], [Status]) VALUES (N'cec3fe66-a10e-4cdf-8de3-3588818e0a3d', N'shiningstar8444@gmail.com', 0, N'ACOMmSBcRM2J9ViXFDBgqni8/aCglWY8382JsiH72Ec2tK4RmqBt2jUkTHRER3Q2Uw==', N'92f288ac-add0-4522-8df6-636719b25058', NULL, 0, 0, NULL, 1, 0, N'waleed', N'03241488970', N'3520106117699', N'testing', 0, 1, 1)
SET ANSI_PADDING ON

GO
/****** Object:  Index [RoleNameIndex]    Script Date: 10/29/2017 12:37:39 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 10/29/2017 12:37:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 10/29/2017 12:37:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_RoleId]    Script Date: 10/29/2017 12:37:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 10/29/2017 12:37:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UserNameIndex]    Script Date: 10/29/2017 12:37:39 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
USE [master]
GO
ALTER DATABASE [DHMRice] SET  READ_WRITE 
GO
