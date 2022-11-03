USE [Webmoviedb]
GO
/****** Object:  Table [dbo].[Banner]    Script Date: 11/3/2022 10:31:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Banner](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Img] [nvarchar](max) NULL,
	[IDPhim] [int] NULL,
 CONSTRAINT [PK_Banner] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CTTapPhim]    Script Date: 11/3/2022 10:31:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTTapPhim](
	[IDPhim] [int] IDENTITY(1,1) NOT NULL,
	[TapPhim] [int] NULL,
	[ID] [int] NULL,
	[Link] [nvarchar](max) NULL,
 CONSTRAINT [PK_CTTapPhim] PRIMARY KEY CLUSTERED 
(
	[IDPhim] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DSPhimBo]    Script Date: 11/3/2022 10:31:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DSPhimBo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TenPhim] [nvarchar](max) NULL,
	[NoiDung] [nvarchar](max) NULL,
	[NamPhatHanh] [int] NULL,
	[IDTheLoai] [int] NULL,
	[ThoiLuong] [nvarchar](15) NULL,
	[Img] [nvarchar](max) NULL,
	[MaQG] [int] NULL,
	[LuotXem] [int] NULL,
 CONSTRAINT [PK_DSPhim1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DSPhimLe]    Script Date: 11/3/2022 10:31:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DSPhimLe](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TenPhim] [nvarchar](max) NULL,
	[NoiDung] [nvarchar](max) NULL,
	[NamPhatHanh] [int] NULL,
	[IDTheLoai] [int] NULL,
	[ThoiLuong] [nvarchar](15) NULL,
	[Img] [nvarchar](max) NULL,
	[MaQG] [int] NULL,
	[LuotXem] [int] NULL,
	[Link] [nvarchar](max) NULL,
 CONSTRAINT [PK_DSPhimLe] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[gioithieu]    Script Date: 11/3/2022 10:31:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[gioithieu](
	[idgioitin] [int] IDENTITY(1,1) NOT NULL,
	[noidung] [nvarchar](max) NULL,
	[sdtlien] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HopPhim]    Script Date: 11/3/2022 10:31:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HopPhim](
	[TenDN] [varchar](50) NOT NULL,
	[IDPhim] [int] NOT NULL,
 CONSTRAINT [PK_HopPhim1] PRIMARY KEY CLUSTERED 
(
	[TenDN] ASC,
	[IDPhim] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LichSu]    Script Date: 11/3/2022 10:31:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LichSu](
	[TenDN] [varchar](50) NOT NULL,
	[IDPhim] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TenDN] ASC,
	[IDPhim] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Nam]    Script Date: 11/3/2022 10:31:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nam](
	[MaNam] [int] IDENTITY(1,1) NOT NULL,
	[TenNam] [int] NULL,
 CONSTRAINT [PK_Nam] PRIMARY KEY CLUSTERED 
(
	[MaNam] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuocGia]    Script Date: 11/3/2022 10:31:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuocGia](
	[MaQG] [int] IDENTITY(1,1) NOT NULL,
	[TenQG] [nvarchar](50) NULL,
 CONSTRAINT [PK_Quốc Gia] PRIMARY KEY CLUSTERED 
(
	[MaQG] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 11/3/2022 10:31:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[TenDN] [varchar](50) NOT NULL,
	[MatKhau] [varchar](50) NULL,
	[Quyen] [bit] NULL,
	[Email] [varchar](50) NULL,
 CONSTRAINT [PK_TaiKhoan] PRIMARY KEY CLUSTERED 
(
	[TenDN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TheLoai]    Script Date: 11/3/2022 10:31:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TheLoai](
	[IDTheLoai] [int] IDENTITY(1,1) NOT NULL,
	[TenTheLoai] [nvarchar](50) NULL,
 CONSTRAINT [PK_TheLoai] PRIMARY KEY CLUSTERED 
(
	[IDTheLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tintucphim]    Script Date: 11/3/2022 10:31:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tintucphim](
	[idtintuc] [int] IDENTITY(1,1) NOT NULL,
	[tieude] [nvarchar](max) NULL,
	[tomtat] [nvarchar](max) NULL,
	[noidung] [nvarchar](max) NULL,
	[hinhanh] [nvarchar](max) NULL,
	[ngaycapnhat] [date] NULL,
	[luotxem] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idtintuc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Banner] ON 

INSERT [dbo].[Banner] ([ID], [Img], [IDPhim]) VALUES (1, N'đấu-la-đại-lục.jpg', 1)
INSERT [dbo].[Banner] ([ID], [Img], [IDPhim]) VALUES (2, N'banner2.jpg', 2)
INSERT [dbo].[Banner] ([ID], [Img], [IDPhim]) VALUES (3, N'banner3.jpg', 5)
SET IDENTITY_INSERT [dbo].[Banner] OFF
GO
SET IDENTITY_INSERT [dbo].[CTTapPhim] ON 

INSERT [dbo].[CTTapPhim] ([IDPhim], [TapPhim], [ID], [Link]) VALUES (1, 1, 1, N'https://www.aa.com/embed/zjYO1d1P-PQ')
INSERT [dbo].[CTTapPhim] ([IDPhim], [TapPhim], [ID], [Link]) VALUES (2, 2, 1, N'https://www.youtube.com/embed/zjYO1d1P-PQ')
INSERT [dbo].[CTTapPhim] ([IDPhim], [TapPhim], [ID], [Link]) VALUES (3, 3, 1, N'https://www.youtube.com/embed/zjYO1d1P-PQ')
INSERT [dbo].[CTTapPhim] ([IDPhim], [TapPhim], [ID], [Link]) VALUES (4, 4, 1, N'https://www.youtube.com/embed/-wUYs6fEHEs')
INSERT [dbo].[CTTapPhim] ([IDPhim], [TapPhim], [ID], [Link]) VALUES (5, 5, 1, N'https://www.youtube.com/embed/g3kLI71iOys')
INSERT [dbo].[CTTapPhim] ([IDPhim], [TapPhim], [ID], [Link]) VALUES (6, 6, 1, N'https://www.youtube.com/embed/AI3Dtx2gTYQ')
INSERT [dbo].[CTTapPhim] ([IDPhim], [TapPhim], [ID], [Link]) VALUES (7, 7, 1, N'https://www.youtube.com/embed/t4zllH148OQ')
INSERT [dbo].[CTTapPhim] ([IDPhim], [TapPhim], [ID], [Link]) VALUES (8, 8, 1, N'https://www.youtube.com/embed/lUPBrrokBw8')
INSERT [dbo].[CTTapPhim] ([IDPhim], [TapPhim], [ID], [Link]) VALUES (9, 9, 1, N'https://www.youtube.com/embed/_JqOyFQ6gDI')
INSERT [dbo].[CTTapPhim] ([IDPhim], [TapPhim], [ID], [Link]) VALUES (10, 10, 1, N'https://youtu.be/embed/fuZRRKmZ12U')
INSERT [dbo].[CTTapPhim] ([IDPhim], [TapPhim], [ID], [Link]) VALUES (11, 11, 1, N'https://youtu.be/embed/YiMNVT_wAnw')
INSERT [dbo].[CTTapPhim] ([IDPhim], [TapPhim], [ID], [Link]) VALUES (12, 12, 1, N'https://youtu.be/embed/ooVYs7xfcag')
INSERT [dbo].[CTTapPhim] ([IDPhim], [TapPhim], [ID], [Link]) VALUES (13, 13, 1, N'https://youtu.be/embed/TIk8CGgzLjs')
INSERT [dbo].[CTTapPhim] ([IDPhim], [TapPhim], [ID], [Link]) VALUES (14, 14, 1, N'https://youtu.be/embed/ZPqZJ7fX00g')
INSERT [dbo].[CTTapPhim] ([IDPhim], [TapPhim], [ID], [Link]) VALUES (15, 15, 1, N'https://youtu.be/embed/H_IGjZ1caEA')
INSERT [dbo].[CTTapPhim] ([IDPhim], [TapPhim], [ID], [Link]) VALUES (16, 16, 1, N'https://youtu.be/embed/qcze4hMPav0')
INSERT [dbo].[CTTapPhim] ([IDPhim], [TapPhim], [ID], [Link]) VALUES (17, 17, 1, N'https://youtu.be/embed/UFspLl1K9eQ')
INSERT [dbo].[CTTapPhim] ([IDPhim], [TapPhim], [ID], [Link]) VALUES (18, 18, 1, N'https://youtu.be/embed/jjQce0y7NcA')
INSERT [dbo].[CTTapPhim] ([IDPhim], [TapPhim], [ID], [Link]) VALUES (19, 19, 1, N'https://youtu.be/embed/h-nAzP6_l98')
INSERT [dbo].[CTTapPhim] ([IDPhim], [TapPhim], [ID], [Link]) VALUES (20, 20, 1, N'https://youtu.be/embed/FknG1ChWFd4')
INSERT [dbo].[CTTapPhim] ([IDPhim], [TapPhim], [ID], [Link]) VALUES (21, 1, 5, N'https://www.youtube.com/embed/13bC7DS44nY')
INSERT [dbo].[CTTapPhim] ([IDPhim], [TapPhim], [ID], [Link]) VALUES (28, 1, 16, N'https://www.youtube.com/embed/13bC7DS44nY')
INSERT [dbo].[CTTapPhim] ([IDPhim], [TapPhim], [ID], [Link]) VALUES (29, 1, 17, N'https://www.youtube.com/embed/puCbbITNhT8')
INSERT [dbo].[CTTapPhim] ([IDPhim], [TapPhim], [ID], [Link]) VALUES (31, 1, 2, N'https://www.youtube.com/embed/nvrrePT-uVY?list=RDMMnvrrePT-uVY')
INSERT [dbo].[CTTapPhim] ([IDPhim], [TapPhim], [ID], [Link]) VALUES (32, 1, 10, N'https://www.youtube.com/embed/13bC7DS44nY')
INSERT [dbo].[CTTapPhim] ([IDPhim], [TapPhim], [ID], [Link]) VALUES (33, 1, 9, N'https://www.youtube.com/embed/13bC7DS44nY')
INSERT [dbo].[CTTapPhim] ([IDPhim], [TapPhim], [ID], [Link]) VALUES (34, 1, 6, N'https://www.youtube.com/embed/13bC7DS44nY')
INSERT [dbo].[CTTapPhim] ([IDPhim], [TapPhim], [ID], [Link]) VALUES (35, 1, 7, N'https://www.youtube.com/embed/13bC7DS44nY')
SET IDENTITY_INSERT [dbo].[CTTapPhim] OFF
GO
SET IDENTITY_INSERT [dbo].[DSPhimBo] ON 

INSERT [dbo].[DSPhimBo] ([ID], [TenPhim], [NoiDung], [NamPhatHanh], [IDTheLoai], [ThoiLuong], [Img], [MaQG], [LuotXem]) VALUES (1, N'Đấu La Đại Lục', N'Một đại lục không hề yên bình, một cuộc sống đầy hiểm nguy, phiêu lưu nhưng cũng không kém phần lãng mạn. tình yêu, thù hận, trách nhiệm… Tiếp bước những tiền bối đi trước, Hoắc Vũ Hạo và đời sau sử lai khắc thất quái, bằng niềm tin nhiệt huyết tuổi trẻ đã gây dựng lại đường môn tái lập những huy hoàng xưa kia của các tiền bối đi trước…', 1, 1, N'12 Tập', N'daula.jpg ', 2, 25)
INSERT [dbo].[DSPhimBo] ([ID], [TenPhim], [NoiDung], [NamPhatHanh], [IDTheLoai], [ThoiLuong], [Img], [MaQG], [LuotXem]) VALUES (2, N'Sword Art Online', N'Con đường sống duy nhất là đánh bại mọi kẻ thù. Cái chết trong game đồng nghĩa với cái chết ngoài đời thực---- Bằng Nerve Gear, mười ngàn con người lao đầu vào một trò chơi bí ẩn ''Sword Art Online'', để rồi bị giam cầm trong đó, buộc phải dấn thân vào một đấu trường sinh tử. Anh main của chúng ta, Kirito, một trong số các game thủ, đã nhận ra được ''sự thật'' khủng khiếp này. Anh đơn thương độc mã, chiến đấu trong một lâu đài bay khổng lồ --- mang tên ''Aincrad'' Để có thể hoàn thành trò chơi và trở về với thực tại, anh phải vượt qua đủ 100 thử thách. Liệu anh có thể làm được hay anh sẽ về với cát bụi? Cứ xem thì biết', 1, 1, N'24 Tập', N'10.jpg    ', 2, 2)
INSERT [dbo].[DSPhimBo] ([ID], [TenPhim], [NoiDung], [NamPhatHanh], [IDTheLoai], [ThoiLuong], [Img], [MaQG], [LuotXem]) VALUES (3, N'Assassin''s Pride', N'Trong thế giới mà chỉ những quý tộc mới có sức mạnh chống lại lũ quái vật-mana. Một thanh niên tên Kufa được cử đi làm gia sư để kiểm tra tài năng của Melida, một cô gái rắc rối sinh ra trong gia đình công tước. Nếu như không có tài năng thì phải ám sát cô ta ngay lập tức—đó chính là mặt tối của nhiệm vụ này.', 1, 1, N'12 Tập', N'11.jpg    ', 2, 3)
INSERT [dbo].[DSPhimBo] ([ID], [TenPhim], [NoiDung], [NamPhatHanh], [IDTheLoai], [ThoiLuong], [Img], [MaQG], [LuotXem]) VALUES (4, N'Vinland Saga', N'Một nghìn năm trước, thời đại xưng bá khắp nơi của các Viking đã thống trị Âu Châu và đến cả bờ đông của Châu Mỹ ngày nay. Thorfinn, con trai của chiến binh Viking vĩ đại nhất, đã phải xung trận từ bé và mài dũa để nối bước cha mình. Ước mơ của họ là đặt chân đến được miền đất hứa phía bên kia Đại Tây Dương, vùng đất Vinland.', 5, 1, N'25 Tập', N'1.jpg     ', 2, 4)
INSERT [dbo].[DSPhimBo] ([ID], [TenPhim], [NoiDung], [NamPhatHanh], [IDTheLoai], [ThoiLuong], [Img], [MaQG], [LuotXem]) VALUES (5, N'Black Clover', N'Asta và Yuno đã bị bỏ rơi cùng nhau tại cùng một nhà thờ và đã không thể tách rời kể từ đó. Khi còn trẻ, họ hứa sẽ cạnh tranh với nhau để xem ai sẽ trở thành Hoàng đế Magus tiếp theo. Tuy nhiên, khi chúng lớn lên, một số khác biệt giữa chúng trở nên đơn giản. Yuno là một thiên tài với ma thuật, với sức mạnh và khả năng kiểm soát tuyệt vời, trong khi Asta không thể sử dụng ma thuật chút nào, và cố gắng bù đắp cho sự thiếu hụt của mình bằng cách luyện tập thể chất. Khi họ nhận được Grimoa của họ ở tuổi 15, Yuno đã có một cuốn sách ngoạn mục với cỏ ba lá bốn lá (hầu hết mọi người đều có một cây cỏ ba lá), trong khi Asta không nhận được gì cả. Tuy nhiên, khi Yuno bị đe dọa, sự thật về sức mạnh của Asta đã được tiết lộ, anh đã nhận được một cây cỏ ba lá Grimoire, một "cỏ ba lá đen"! Bây giờ hai người bạn đang hướng tới trên thế giới, cả hai đều mong muốn cùng một mục tiêu!', 5, 1, N'24 Tập', N'Black_Clover.jpg', 2, 26)
INSERT [dbo].[DSPhimBo] ([ID], [TenPhim], [NoiDung], [NamPhatHanh], [IDTheLoai], [ThoiLuong], [Img], [MaQG], [LuotXem]) VALUES (6, N'Vạn Giới Tiên Tung', N'Mỗi bông hoa là 1 thế giới,  Phàm thế chỉ là một hạt cát bé nhỏ trong tay tiên ma  Tiên ma nhất niệm, nhân thế vạn năm  Sông núi vạn dặm cũng chỉ là kính hoa thủy nguyệt  Con người có 3 hồn 7 phách, sau khi chết hồn sẽ quay về bầu trời sao vạn giới  Nơi sâu của trời sao, chính là đàn tràng của tiên ma trong truyền thuyết', 4, 1, N'12 Tập', N'van-gioi-tien-tung.jpg', 3, 3)
INSERT [dbo].[DSPhimBo] ([ID], [TenPhim], [NoiDung], [NamPhatHanh], [IDTheLoai], [ThoiLuong], [Img], [MaQG], [LuotXem]) VALUES (7, N'The K2', N'The K2 xoay quanh câu chuyện của Kim Je Ha, còn được gọi là K2, một người lính yêu nước bị chính Tổ quốc và đồng nghiệp phản bội. Giờ đây, anh ta được thuê làm vệ sĩ riêng cho Choi Yoo Jin, vợ của ứng cử viên Tổng thống đồng thời là ái nữ của một gia đình tài phiệt.  Go Ahn Na, cô con gái riêng của vị ứng cử viên Tổng thống. Những tổn thương thời thơ ấu khiến Go Ahn Na trở nên cô lập và ít giao tiếp với thế giới. Đối với cô, tình yêu chỉ là công cụ để trả thù. Đây là người sẽ khiến trái tim Kim Je Ha phải rung động?', 2, 2, N'16 Tập', N'k2.jpg', 1, 6)
INSERT [dbo].[DSPhimBo] ([ID], [TenPhim], [NoiDung], [NamPhatHanh], [IDTheLoai], [ThoiLuong], [Img], [MaQG], [LuotXem]) VALUES (8, N'Vạn Giới Thần Chủ', N'Diệp Thần từ thế giới hiện đại xuyên không qua Nam Châu, thành chủ nhân Di Hồng Viện, trước khi lên đường tiến về phía bắc, nhận lời hỗ trợ thánh nữ Tuyết Ảnh tộc thoát khỏi khốn cảnh, lại không nghĩ rằng...', 1, 1, N'12 Tập', N'vangioithanchu.jpg', 3, 10)
INSERT [dbo].[DSPhimBo] ([ID], [TenPhim], [NoiDung], [NamPhatHanh], [IDTheLoai], [ThoiLuong], [Img], [MaQG], [LuotXem]) VALUES (9, N'Linh Kiếm Tôn', N'Cường giả bị tập kích, phản lão hoàn đồng, trở thành thiếu chủ phế vật. Kẻ thù từ đời trước kiếp này, quyết không bỏ qua. Sai lầm kiếp trước, kiếp này quyết tâm bù đắp.  Linh Kiếm trường khiếu, thiên địa tam giới, ngã vi chí tôn!', 2, 1, N'12 Tập', N'linhkiemton.jpg', 3, 7)
INSERT [dbo].[DSPhimBo] ([ID], [TenPhim], [NoiDung], [NamPhatHanh], [IDTheLoai], [ThoiLuong], [Img], [MaQG], [LuotXem]) VALUES (10, N'Thiếu Niên Ca Hành', N'Sau khi Vong Ưu đại sư của Hàn Thủy Tự tọa hóa, một cỗ quan tài vàng thần bí nhập thế, vén lên phân tranh trong giang hồ. Thế lực các nơi đối chọi gay gắt, Lôi Vô Kiệt, Tiêu Sắt, Đường Liên, Tư Không Thiên Lạc, Thiên Nữ Nhụy lần lượt rơi vào phân tranh. Sách mã giang hồ mộng, ỷ kiếm đạp ca hành. Câu chuyện về bí mật của quan tài vàng dần dần được hé mở…', 4, 1, N'12 Tập', N'thieu-nien-ca-hanh.jpg', 3, 16)
INSERT [dbo].[DSPhimBo] ([ID], [TenPhim], [NoiDung], [NamPhatHanh], [IDTheLoai], [ThoiLuong], [Img], [MaQG], [LuotXem]) VALUES (16, N'Bokutachi wa Benkyou ga Dekinai S2', N'Phần 2 của bộ phim Bokutachi wa Benkyou ga Dekinai. Cuốc sống sa hoa', 5, 1, N'12 tập', N'bokutachi-wa-benkyou-ga-dekinai-2-thumbnail.jpg', 2, 45)
INSERT [dbo].[DSPhimBo] ([ID], [TenPhim], [NoiDung], [NamPhatHanh], [IDTheLoai], [ThoiLuong], [Img], [MaQG], [LuotXem]) VALUES (17, N'MMV- Imanbek – RosesRemix', N'CHIẾN CÔNG LỊCH SỬ CỦA 24 AE VIỆT NAM - RAID TOANG NHÀ PHILIPPINES !!! - SCUM Server Việt Nam', 1, 7, N'99 phút', N'1.jpg', 7, 10)
SET IDENTITY_INSERT [dbo].[DSPhimBo] OFF
GO
SET IDENTITY_INSERT [dbo].[DSPhimLe] ON 

INSERT [dbo].[DSPhimLe] ([ID], [TenPhim], [NoiDung], [NamPhatHanh], [IDTheLoai], [ThoiLuong], [Img], [MaQG], [LuotXem], [Link]) VALUES (3, N'Chim ưng cất cánh', N'Bộ phim kể về cuộc đời của Black Widow Natasha Romanoff sau sự ra đi của Iron Man – người phụ nữ mạnh mẽ của team Avengers. Cô ấy đã hy sinh để đổi lấy viên đá linh hồn.  Phim Marvel quay ngược lại quá khứ của Natasha với những chuyến phiêu lưu và những trận đấu nảy lửa của cô trước khi gia nhập S.H.I.E.L.D để trở thành nữ chiến binh xuất sắc nhất Avengers. ', 6, 7, N'145 phút', N'7.jpg', 1, 3, N'https://www.youtube.com/embed/13bC7DS44nY')
INSERT [dbo].[DSPhimLe] ([ID], [TenPhim], [NoiDung], [NamPhatHanh], [IDTheLoai], [ThoiLuong], [Img], [MaQG], [LuotXem], [Link]) VALUES (4, N'Trái đát xoay vòng', N'Godzilla vs. Kong là bộ phim kể về Godzilla và King Kong – những Titan cuối cùng còn hoạt động trên bề mặt Trái Đất. Trận chiến giữa hai phe đối lập Godzilla và Kong.. Khi đã quen dần với con người, Kong được dẫn đến Hollow Earth để tạo lập các tuyến phòng thủ, ngăn chặn sự tấn công của những sinh vật bí ẩn trong tương lai.  Tuy nhiên, hành trình của họ đã bị gián đoạn vì sự xuất hiện của Godzilla. Một trận chiến kinh hoàng đã diễn ra giữa 2 vị chúa tể khổng lồ này để chiếm đoạt Trái Đất rỗng và mong muốn tìm nguồn năng lượng mới.', 6, 1, N'20 phút', N'6.jpg', 4, 1, N'https://www.youtube.com/embed/13bC7DS44nY')
INSERT [dbo].[DSPhimLe] ([ID], [TenPhim], [NoiDung], [NamPhatHanh], [IDTheLoai], [ThoiLuong], [Img], [MaQG], [LuotXem], [Link]) VALUES (5, N'Tận thế', N'Fast & Furious 9 kể về tay đua xe chuyên nghiệp Dominic (do Vin Diesel đóng) quyết định nghỉ hưu để sống một cuộc sống hạnh phúc bên vợ và con trai anh.  Tuy nhiên, Jacob xuất hiện làm phá tan sự yên bình trong cuộc sống của gia đình Dominic khiến gia đình anh phải chiến đấu với thế lực thù địch Cipher. ', 6, 2, N'140 phút', N'67327788_917046421975818_8421098014549999616_n.jpg', 1, 1, N'https://www.youtube.com/embed/13bC7DS44nY')
INSERT [dbo].[DSPhimLe] ([ID], [TenPhim], [NoiDung], [NamPhatHanh], [IDTheLoai], [ThoiLuong], [Img], [MaQG], [LuotXem], [Link]) VALUES (6, N'Mật danh', N'Bộ phim kể về cuộc đời của Black Widow Natasha Romanoff sau sự ra đi của Iron Man – người phụ nữ mạnh mẽ của team Avengers. Cô ấy đã hy sinh để đổi lấy viên đá linh hồn.  Phim Marvel quay ngược lại quá khứ của Natasha với những chuyến phiêu lưu và những trận đấu nảy lửa của cô trước khi gia nhập S.H.I.E.L.D để trở thành nữ chiến binh xuất sắc nhất Avengers. ', 5, 5, N'145 phút', N'10.jpg', 1, 1, N'https://www.youtube.com/embed/13bC7DS44nY')
SET IDENTITY_INSERT [dbo].[DSPhimLe] OFF
GO
SET IDENTITY_INSERT [dbo].[gioithieu] ON 

INSERT [dbo].[gioithieu] ([idgioitin], [noidung], [sdtlien]) VALUES (1, N'Trương Kim Nam', N'0867165862')
INSERT [dbo].[gioithieu] ([idgioitin], [noidung], [sdtlien]) VALUES (2, N'Phạm Tài Lộc', N'123')
INSERT [dbo].[gioithieu] ([idgioitin], [noidung], [sdtlien]) VALUES (3, N'NTHN', N'1121')
SET IDENTITY_INSERT [dbo].[gioithieu] OFF
GO
SET IDENTITY_INSERT [dbo].[Nam] ON 

INSERT [dbo].[Nam] ([MaNam], [TenNam]) VALUES (1, 2015)
INSERT [dbo].[Nam] ([MaNam], [TenNam]) VALUES (2, 2016)
INSERT [dbo].[Nam] ([MaNam], [TenNam]) VALUES (3, 2017)
INSERT [dbo].[Nam] ([MaNam], [TenNam]) VALUES (4, 2018)
INSERT [dbo].[Nam] ([MaNam], [TenNam]) VALUES (5, 2019)
INSERT [dbo].[Nam] ([MaNam], [TenNam]) VALUES (6, 2020)
INSERT [dbo].[Nam] ([MaNam], [TenNam]) VALUES (7, 2021)
INSERT [dbo].[Nam] ([MaNam], [TenNam]) VALUES (8, 2022)
SET IDENTITY_INSERT [dbo].[Nam] OFF
GO
SET IDENTITY_INSERT [dbo].[QuocGia] ON 

INSERT [dbo].[QuocGia] ([MaQG], [TenQG]) VALUES (1, N'Hàn Quốc')
INSERT [dbo].[QuocGia] ([MaQG], [TenQG]) VALUES (2, N'Nhật Bản ')
INSERT [dbo].[QuocGia] ([MaQG], [TenQG]) VALUES (3, N'Trung Quốc')
INSERT [dbo].[QuocGia] ([MaQG], [TenQG]) VALUES (4, N'Mỹ')
INSERT [dbo].[QuocGia] ([MaQG], [TenQG]) VALUES (5, N'Pháp')
INSERT [dbo].[QuocGia] ([MaQG], [TenQG]) VALUES (6, N'Thái Lan')
INSERT [dbo].[QuocGia] ([MaQG], [TenQG]) VALUES (7, N'Quốc gia khác')
INSERT [dbo].[QuocGia] ([MaQG], [TenQG]) VALUES (8, N'Việt Nam')
SET IDENTITY_INSERT [dbo].[QuocGia] OFF
GO
INSERT [dbo].[TaiKhoan] ([TenDN], [MatKhau], [Quyen], [Email]) VALUES (N'admin', N'd033e22ae348aeb5660fc2140aec35850c4da997', 1, N'admin@gmail.com')
INSERT [dbo].[TaiKhoan] ([TenDN], [MatKhau], [Quyen], [Email]) VALUES (N'kimnam123', N'7c4a8d09ca3762af61e59520943dc26494f8941b', 0, N'kimnam123@gmail.com')
INSERT [dbo].[TaiKhoan] ([TenDN], [MatKhau], [Quyen], [Email]) VALUES (N'tailoc123', N'7c4a8d09ca3762af61e59520943dc26494f8941b', 0, N'tailoc123@gmail.com')
GO
SET IDENTITY_INSERT [dbo].[TheLoai] ON 

INSERT [dbo].[TheLoai] ([IDTheLoai], [TenTheLoai]) VALUES (1, N'Anime')
INSERT [dbo].[TheLoai] ([IDTheLoai], [TenTheLoai]) VALUES (2, N'Hành Động')
INSERT [dbo].[TheLoai] ([IDTheLoai], [TenTheLoai]) VALUES (3, N'Hài hước')
INSERT [dbo].[TheLoai] ([IDTheLoai], [TenTheLoai]) VALUES (4, N'Võ thuật')
INSERT [dbo].[TheLoai] ([IDTheLoai], [TenTheLoai]) VALUES (5, N'Học đường')
INSERT [dbo].[TheLoai] ([IDTheLoai], [TenTheLoai]) VALUES (6, N'Thần thoại')
INSERT [dbo].[TheLoai] ([IDTheLoai], [TenTheLoai]) VALUES (7, N'Phép thuật')
SET IDENTITY_INSERT [dbo].[TheLoai] OFF
GO
SET IDENTITY_INSERT [dbo].[tintucphim] ON 

INSERT [dbo].[tintucphim] ([idtintuc], [tieude], [tomtat], [noidung], [hinhanh], [ngaycapnhat], [luotxem]) VALUES (8, N'CHIẾN CÔNG LỊCH SỬ CỦA 24 AE VIỆT NAM - RAID TOANG NHÀ PHILIPPINES !!! - SCUM Server VN', N'CHIẾN CÔNG LỊCH SỬ CỦA 24 AE VIỆT NAM - RAID TOANG NHÀ PHILIPPINES !!! - SCUM Server VN', N'CHIẾN CÔNG LỊCH SỬ CỦA 24 AE VIỆT NAM - RAID TOANG NHÀ PHILIPPINES !!! - SCUM Server VN', N'faraz-shanyar-img-3900.jpg', CAST(N'1999-07-07' AS Date), 5)
INSERT [dbo].[tintucphim] ([idtintuc], [tieude], [tomtat], [noidung], [hinhanh], [ngaycapnhat], [luotxem]) VALUES (12, N'Test', N'fileName', N'fileName', N'72596273_p5.jpg', CAST(N'1999-07-07' AS Date), 3)
INSERT [dbo].[tintucphim] ([idtintuc], [tieude], [tomtat], [noidung], [hinhanh], [ngaycapnhat], [luotxem]) VALUES (14, N'CHIẾN CÔNG LỊCH SỬ CỦA 24 AE VIaaaaaaaaaaaaaaaaaaaa', N'CHIẾN CÔNG LỊCH SỬ CỦA 24 AE VIỆT NAM - RAID TOANG NHÀ PHILIPPINES !!! - SCUM Server Việt Nam', N'CHIẾN CÔNG LỊCH SỬ CỦA 24 AE VIỆT NAM - RAID TOANG NHÀ PHILIPPINES !!! - SCUM Server Việt Nam', N'67327788_917046421975818_8421098014549999616_n.jpg', CAST(N'2019-11-26' AS Date), 2)
SET IDENTITY_INSERT [dbo].[tintucphim] OFF
GO
ALTER TABLE [dbo].[Banner]  WITH CHECK ADD  CONSTRAINT [FK_Banner_DSPhimBo] FOREIGN KEY([IDPhim])
REFERENCES [dbo].[DSPhimBo] ([ID])
GO
ALTER TABLE [dbo].[Banner] CHECK CONSTRAINT [FK_Banner_DSPhimBo]
GO
ALTER TABLE [dbo].[CTTapPhim]  WITH CHECK ADD  CONSTRAINT [FK_CTTapPhim_DSPhimBo] FOREIGN KEY([ID])
REFERENCES [dbo].[DSPhimBo] ([ID])
GO
ALTER TABLE [dbo].[CTTapPhim] CHECK CONSTRAINT [FK_CTTapPhim_DSPhimBo]
GO
ALTER TABLE [dbo].[DSPhimBo]  WITH CHECK ADD  CONSTRAINT [FK_DSPhimBo_Nam] FOREIGN KEY([NamPhatHanh])
REFERENCES [dbo].[Nam] ([MaNam])
GO
ALTER TABLE [dbo].[DSPhimBo] CHECK CONSTRAINT [FK_DSPhimBo_Nam]
GO
ALTER TABLE [dbo].[DSPhimBo]  WITH CHECK ADD  CONSTRAINT [FK_DSPhimBo_QuocGia] FOREIGN KEY([MaQG])
REFERENCES [dbo].[QuocGia] ([MaQG])
GO
ALTER TABLE [dbo].[DSPhimBo] CHECK CONSTRAINT [FK_DSPhimBo_QuocGia]
GO
ALTER TABLE [dbo].[DSPhimBo]  WITH CHECK ADD  CONSTRAINT [FK_DSPhimBo_TheLoai] FOREIGN KEY([IDTheLoai])
REFERENCES [dbo].[TheLoai] ([IDTheLoai])
GO
ALTER TABLE [dbo].[DSPhimBo] CHECK CONSTRAINT [FK_DSPhimBo_TheLoai]
GO
ALTER TABLE [dbo].[DSPhimLe]  WITH CHECK ADD  CONSTRAINT [FK_DSPhimLe_Nam] FOREIGN KEY([NamPhatHanh])
REFERENCES [dbo].[Nam] ([MaNam])
GO
ALTER TABLE [dbo].[DSPhimLe] CHECK CONSTRAINT [FK_DSPhimLe_Nam]
GO
ALTER TABLE [dbo].[DSPhimLe]  WITH CHECK ADD  CONSTRAINT [FK_DSPhimLe_QuocGia] FOREIGN KEY([MaQG])
REFERENCES [dbo].[QuocGia] ([MaQG])
GO
ALTER TABLE [dbo].[DSPhimLe] CHECK CONSTRAINT [FK_DSPhimLe_QuocGia]
GO
ALTER TABLE [dbo].[DSPhimLe]  WITH CHECK ADD  CONSTRAINT [FK_DSPhimLe_TheLoai] FOREIGN KEY([IDTheLoai])
REFERENCES [dbo].[TheLoai] ([IDTheLoai])
GO
ALTER TABLE [dbo].[DSPhimLe] CHECK CONSTRAINT [FK_DSPhimLe_TheLoai]
GO
ALTER TABLE [dbo].[HopPhim]  WITH CHECK ADD  CONSTRAINT [FK_HopPhim_DSPhimBo] FOREIGN KEY([IDPhim])
REFERENCES [dbo].[DSPhimBo] ([ID])
GO
ALTER TABLE [dbo].[HopPhim] CHECK CONSTRAINT [FK_HopPhim_DSPhimBo]
GO
ALTER TABLE [dbo].[HopPhim]  WITH CHECK ADD  CONSTRAINT [FK_HopPhim_TaiKhoan] FOREIGN KEY([TenDN])
REFERENCES [dbo].[TaiKhoan] ([TenDN])
GO
ALTER TABLE [dbo].[HopPhim] CHECK CONSTRAINT [FK_HopPhim_TaiKhoan]
GO
ALTER TABLE [dbo].[LichSu]  WITH CHECK ADD FOREIGN KEY([IDPhim])
REFERENCES [dbo].[DSPhimBo] ([ID])
GO
ALTER TABLE [dbo].[LichSu]  WITH CHECK ADD FOREIGN KEY([TenDN])
REFERENCES [dbo].[TaiKhoan] ([TenDN])
GO
