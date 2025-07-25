USE [db_abb96a_login]
GO
/****** Object:  Table [dbo].[tblChitietdathang]    Script Date: 7/19/2025 1:12:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblChitietdathang](
	[PK_iChitietdathangID] [int] IDENTITY(1,1) NOT NULL,
	[iSoluong] [int] NOT NULL,
	[fGiaban] [decimal](18, 0) NOT NULL,
	[FK_iDathangID] [int] NULL,
	[FK_iSachID] [int] NULL,
	[sTrangthai] [nchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_iChitietdathangID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblDathang]    Script Date: 7/19/2025 1:12:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDathang](
	[PK_iDathangID] [int] IDENTITY(1,1) NOT NULL,
	[dNgaydathang] [datetime] NOT NULL,
	[fTongthanhtien] [decimal](18, 0) NOT NULL,
	[sDiachinhanhang] [nvarchar](255) NOT NULL,
	[sSDTnhanhang] [varchar](20) NOT NULL,
	[FK_iNguoidungID] [int] NULL,
	[sNguoiNhan] [nvarchar](100) NULL,
	[sPhuongThucTT] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_iDathangID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblNguoidung]    Script Date: 7/19/2025 1:12:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblNguoidung](
	[PK_iNguoidungID] [int] IDENTITY(1,1) NOT NULL,
	[sTennguoidung] [nvarchar](100) NOT NULL,
	[sEmail] [varchar](100) NOT NULL,
	[sMatkhau] [varchar](255) NOT NULL,
	[sDiachi] [nvarchar](255) NULL,
	[sSodienthoai] [nvarchar](50) NULL,
	[dNgaydangky] [date] NULL,
	[sQuyen] [varchar](20) NOT NULL,
	[sQueQuan] [nchar](100) NULL,
	[sCCCD] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_iNguoidungID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblNhaxuatban]    Script Date: 7/19/2025 1:12:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblNhaxuatban](
	[PK_iNhaxuatbanID] [int] IDENTITY(1,1) NOT NULL,
	[sTennxb] [nvarchar](200) NOT NULL,
	[sDiachi] [nvarchar](255) NULL,
	[sSodienthoai] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_iNhaxuatbanID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblSach]    Script Date: 7/19/2025 1:12:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSach](
	[PK_iSachID] [int] IDENTITY(1,1) NOT NULL,
	[sTensach] [nvarchar](255) NOT NULL,
	[sMota] [nvarchar](max) NULL,
	[sURLanh] [varchar](255) NULL,
	[fGiabanmoi] [decimal](18, 0) NOT NULL,
	[fGiabancu] [decimal](18, 0) NULL,
	[iSoluong] [int] NOT NULL,
	[FK_iTheloaiID] [int] NULL,
	[FK_iTacgiaID] [int] NULL,
	[FK_iNhaxuatbanID] [int] NULL,
	[truong_moi] [nchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_iSachID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTacgia]    Script Date: 7/19/2025 1:12:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTacgia](
	[PK_iTacgiaID] [int] IDENTITY(1,1) NOT NULL,
	[sTentacgia] [nvarchar](100) NOT NULL,
	[dNgaysinh] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_iTacgiaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTheloai]    Script Date: 7/19/2025 1:12:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTheloai](
	[PK_iTheloaiID] [int] IDENTITY(1,1) NOT NULL,
	[sTentheloai] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_iTheloaiID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblChitietdathang] ON 

INSERT [dbo].[tblChitietdathang] ([PK_iChitietdathangID], [iSoluong], [fGiaban], [FK_iDathangID], [FK_iSachID], [sTrangthai]) VALUES (1, 1, CAST(95000 AS Decimal(18, 0)), 1, 1, N'Đã giao                                                                                             ')
INSERT [dbo].[tblChitietdathang] ([PK_iChitietdathangID], [iSoluong], [fGiaban], [FK_iDathangID], [FK_iSachID], [sTrangthai]) VALUES (2, 1, CAST(120000 AS Decimal(18, 0)), 1, 3, N'Đã hủy                                                                                              ')
INSERT [dbo].[tblChitietdathang] ([PK_iChitietdathangID], [iSoluong], [fGiaban], [FK_iDathangID], [FK_iSachID], [sTrangthai]) VALUES (3, 2, CAST(68000 AS Decimal(18, 0)), 2, 2, N'Đang xử lý                                                                                          ')
INSERT [dbo].[tblChitietdathang] ([PK_iChitietdathangID], [iSoluong], [fGiaban], [FK_iDathangID], [FK_iSachID], [sTrangthai]) VALUES (4, 1, CAST(180000 AS Decimal(18, 0)), 3, 4, N'Đã hủy                                                                                              ')
INSERT [dbo].[tblChitietdathang] ([PK_iChitietdathangID], [iSoluong], [fGiaban], [FK_iDathangID], [FK_iSachID], [sTrangthai]) VALUES (5, 1, CAST(150000 AS Decimal(18, 0)), 3, 5, N'Đang xử lý                                                                                          ')
INSERT [dbo].[tblChitietdathang] ([PK_iChitietdathangID], [iSoluong], [fGiaban], [FK_iDathangID], [FK_iSachID], [sTrangthai]) VALUES (6, 1, CAST(92000 AS Decimal(18, 0)), 4, 8, N'Đang xử lý                                                                                          ')
INSERT [dbo].[tblChitietdathang] ([PK_iChitietdathangID], [iSoluong], [fGiaban], [FK_iDathangID], [FK_iSachID], [sTrangthai]) VALUES (7, 1, CAST(190000 AS Decimal(18, 0)), 5, 10, N'Đang xử lý                                                                                          ')
INSERT [dbo].[tblChitietdathang] ([PK_iChitietdathangID], [iSoluong], [fGiaban], [FK_iDathangID], [FK_iSachID], [sTrangthai]) VALUES (8, 1, CAST(135000 AS Decimal(18, 0)), 5, 11, N'Đang xử lý                                                                                          ')
INSERT [dbo].[tblChitietdathang] ([PK_iChitietdathangID], [iSoluong], [fGiaban], [FK_iDathangID], [FK_iSachID], [sTrangthai]) VALUES (9, 200, CAST(120000 AS Decimal(18, 0)), 6, 3, N'Đang xử lý                                                                                          ')
INSERT [dbo].[tblChitietdathang] ([PK_iChitietdathangID], [iSoluong], [fGiaban], [FK_iDathangID], [FK_iSachID], [sTrangthai]) VALUES (10, 180, CAST(110000 AS Decimal(18, 0)), 7, 9, N'Đang xử lý                                                                                          ')
INSERT [dbo].[tblChitietdathang] ([PK_iChitietdathangID], [iSoluong], [fGiaban], [FK_iDathangID], [FK_iSachID], [sTrangthai]) VALUES (11, 1, CAST(120000 AS Decimal(18, 0)), 8, 3, N'Đang xử lý                                                                                          ')
INSERT [dbo].[tblChitietdathang] ([PK_iChitietdathangID], [iSoluong], [fGiaban], [FK_iDathangID], [FK_iSachID], [sTrangthai]) VALUES (12, 2, CAST(100000 AS Decimal(18, 0)), 1, 5, N'Đang xử lý                                                                                          ')
INSERT [dbo].[tblChitietdathang] ([PK_iChitietdathangID], [iSoluong], [fGiaban], [FK_iDathangID], [FK_iSachID], [sTrangthai]) VALUES (13, 1, CAST(68000 AS Decimal(18, 0)), 9, 2, N'Đang xử lý                                                                                          ')
INSERT [dbo].[tblChitietdathang] ([PK_iChitietdathangID], [iSoluong], [fGiaban], [FK_iDathangID], [FK_iSachID], [sTrangthai]) VALUES (14, 1, CAST(68000 AS Decimal(18, 0)), 10, 2, N'Đang xử lý                                                                                          ')
SET IDENTITY_INSERT [dbo].[tblChitietdathang] OFF
GO
SET IDENTITY_INSERT [dbo].[tblDathang] ON 

INSERT [dbo].[tblDathang] ([PK_iDathangID], [dNgaydathang], [fTongthanhtien], [sDiachinhanhang], [sSDTnhanhang], [FK_iNguoidungID], [sNguoiNhan], [sPhuongThucTT]) VALUES (1, CAST(N'2025-07-01T10:30:00.000' AS DateTime), CAST(215000 AS Decimal(18, 0)), N'123 Đường ABC, Quận 1, TPHCM', N'0901234567', 1, NULL, NULL)
INSERT [dbo].[tblDathang] ([PK_iDathangID], [dNgaydathang], [fTongthanhtien], [sDiachinhanhang], [sSDTnhanhang], [FK_iNguoidungID], [sNguoiNhan], [sPhuongThucTT]) VALUES (2, CAST(N'2025-07-02T14:00:00.000' AS DateTime), CAST(136000 AS Decimal(18, 0)), N'456 Đường XYZ, Quận Ba Đình, Hà Nội', N'0912345678', 2, NULL, NULL)
INSERT [dbo].[tblDathang] ([PK_iDathangID], [dNgaydathang], [fTongthanhtien], [sDiachinhanhang], [sSDTnhanhang], [FK_iNguoidungID], [sNguoiNhan], [sPhuongThucTT]) VALUES (3, CAST(N'2025-07-02T16:45:00.000' AS DateTime), CAST(330000 AS Decimal(18, 0)), N'789 Đường DEF, Quận Hải Châu, Đà Nẵng', N'0923456789', 3, NULL, NULL)
INSERT [dbo].[tblDathang] ([PK_iDathangID], [dNgaydathang], [fTongthanhtien], [sDiachinhanhang], [sSDTnhanhang], [FK_iNguoidungID], [sNguoiNhan], [sPhuongThucTT]) VALUES (4, CAST(N'2025-07-03T09:10:00.000' AS DateTime), CAST(92000 AS Decimal(18, 0)), N'101 Đường GHI, Quận Ninh Kiều, Cần Thơ', N'0934567890', 4, NULL, NULL)
INSERT [dbo].[tblDathang] ([PK_iDathangID], [dNgaydathang], [fTongthanhtien], [sDiachinhanhang], [sSDTnhanhang], [FK_iNguoidungID], [sNguoiNhan], [sPhuongThucTT]) VALUES (5, CAST(N'2025-07-03T11:20:00.000' AS DateTime), CAST(325000 AS Decimal(18, 0)), N'123 Đường ABC, Quận 1, TPHCM', N'0901234567', 1, NULL, NULL)
INSERT [dbo].[tblDathang] ([PK_iDathangID], [dNgaydathang], [fTongthanhtien], [sDiachinhanhang], [sSDTnhanhang], [FK_iNguoidungID], [sNguoiNhan], [sPhuongThucTT]) VALUES (6, CAST(N'2025-07-12T20:27:37.870' AS DateTime), CAST(24000000 AS Decimal(18, 0)), N'123 Đường ABC, Quận 1, TPHCM', N'0901234567', 1, N'Nguyễn Văn An', N'COD')
INSERT [dbo].[tblDathang] ([PK_iDathangID], [dNgaydathang], [fTongthanhtien], [sDiachinhanhang], [sSDTnhanhang], [FK_iNguoidungID], [sNguoiNhan], [sPhuongThucTT]) VALUES (7, CAST(N'2025-07-12T20:29:08.560' AS DateTime), CAST(19800000 AS Decimal(18, 0)), N'123 Đường ABC, Quận 1, TPHCM', N'0901234567', 1, N'Nguyễn Văn An', N'COD')
INSERT [dbo].[tblDathang] ([PK_iDathangID], [dNgaydathang], [fTongthanhtien], [sDiachinhanhang], [sSDTnhanhang], [FK_iNguoidungID], [sNguoiNhan], [sPhuongThucTT]) VALUES (8, CAST(N'2025-07-12T20:31:55.953' AS DateTime), CAST(120000 AS Decimal(18, 0)), N'Trụ sở chính', N'0987654321', 5, N'Quan Tri Vien', N'COD')
INSERT [dbo].[tblDathang] ([PK_iDathangID], [dNgaydathang], [fTongthanhtien], [sDiachinhanhang], [sSDTnhanhang], [FK_iNguoidungID], [sNguoiNhan], [sPhuongThucTT]) VALUES (9, CAST(N'2025-07-12T20:55:06.163' AS DateTime), CAST(68000 AS Decimal(18, 0)), N'Trụ sở chính', N'0987654321', 5, N'Quan Tri Vien', N'COD')
INSERT [dbo].[tblDathang] ([PK_iDathangID], [dNgaydathang], [fTongthanhtien], [sDiachinhanhang], [sSDTnhanhang], [FK_iNguoidungID], [sNguoiNhan], [sPhuongThucTT]) VALUES (10, CAST(N'2025-07-17T13:12:52.223' AS DateTime), CAST(68000 AS Decimal(18, 0)), N'123 Đường ABC, Quận 1, TPHCM', N'0901234567', 1, N'Nguyễn Văn An', N'COD')
SET IDENTITY_INSERT [dbo].[tblDathang] OFF
GO
SET IDENTITY_INSERT [dbo].[tblNguoidung] ON 

INSERT [dbo].[tblNguoidung] ([PK_iNguoidungID], [sTennguoidung], [sEmail], [sMatkhau], [sDiachi], [sSodienthoai], [dNgaydangky], [sQuyen], [sQueQuan], [sCCCD]) VALUES (1, N'Nguyễn Văn An', N'nguyenvana@email.com', N'hashed_password_1', N'123 Đường ABC, Quận 1, TPHCM', N'0901234567', CAST(N'2025-07-05' AS Date), N'USER', NULL, NULL)
INSERT [dbo].[tblNguoidung] ([PK_iNguoidungID], [sTennguoidung], [sEmail], [sMatkhau], [sDiachi], [sSodienthoai], [dNgaydangky], [sQuyen], [sQueQuan], [sCCCD]) VALUES (2, N'Trần Thị Bình', N'tranthibinh@email.com', N'hashed_password_2', N'456 Đường XYZ, Quận Ba Đình, Hà Nội', N'0912345678', CAST(N'2025-07-05' AS Date), N'USER', NULL, NULL)
INSERT [dbo].[tblNguoidung] ([PK_iNguoidungID], [sTennguoidung], [sEmail], [sMatkhau], [sDiachi], [sSodienthoai], [dNgaydangky], [sQuyen], [sQueQuan], [sCCCD]) VALUES (3, N'Lê Văn Cường', N'levancuong@email.com', N'hashed_password_3', N'789 Đường DEF, Quận Hải Châu, Đà Nẵng', N'0923456789', CAST(N'2025-07-05' AS Date), N'USER', NULL, NULL)
INSERT [dbo].[tblNguoidung] ([PK_iNguoidungID], [sTennguoidung], [sEmail], [sMatkhau], [sDiachi], [sSodienthoai], [dNgaydangky], [sQuyen], [sQueQuan], [sCCCD]) VALUES (4, N'Phạm Thị Dung', N'phamthidung@email.com', N'hashed_password_4', N'101 Đường GHI, Quận Ninh Kiều, Cần Thơ', N'0934567890', CAST(N'2025-07-05' AS Date), N'USER', NULL, NULL)
INSERT [dbo].[tblNguoidung] ([PK_iNguoidungID], [sTennguoidung], [sEmail], [sMatkhau], [sDiachi], [sSodienthoai], [dNgaydangky], [sQuyen], [sQueQuan], [sCCCD]) VALUES (5, N'Quan Tri Vien', N'admin@gmail.com', N'admin123456', N'Trụ sở chính', N'0987654321', CAST(N'2025-07-05' AS Date), N'ADMIN', NULL, NULL)
INSERT [dbo].[tblNguoidung] ([PK_iNguoidungID], [sTennguoidung], [sEmail], [sMatkhau], [sDiachi], [sSodienthoai], [dNgaydangky], [sQuyen], [sQueQuan], [sCCCD]) VALUES (12, N'pham khang', N'khang@gmail.com', N'khang18022005', N'62 Nguyễn Thị Minh Khai, Quận 1, TPHCM', N'0789127321', CAST(N'2025-07-10' AS Date), N'ADMIN', NULL, NULL)
INSERT [dbo].[tblNguoidung] ([PK_iNguoidungID], [sTennguoidung], [sEmail], [sMatkhau], [sDiachi], [sSodienthoai], [dNgaydangky], [sQuyen], [sQueQuan], [sCCCD]) VALUES (16, N'Đào  Chiến', N'chiendao123@gmail.com', N'12345678', NULL, N'09354785344', CAST(N'2025-07-10' AS Date), N'USER', NULL, NULL)
INSERT [dbo].[tblNguoidung] ([PK_iNguoidungID], [sTennguoidung], [sEmail], [sMatkhau], [sDiachi], [sSodienthoai], [dNgaydangky], [sQuyen], [sQueQuan], [sCCCD]) VALUES (17, N'Trần  Hoàng', N'hoang@gmail.com', N'123', NULL, N'038513', CAST(N'2025-07-11' AS Date), N'USER', NULL, 1234567891)
INSERT [dbo].[tblNguoidung] ([PK_iNguoidungID], [sTennguoidung], [sEmail], [sMatkhau], [sDiachi], [sSodienthoai], [dNgaydangky], [sQuyen], [sQueQuan], [sCCCD]) VALUES (18, N'dsfgff dfdgdf', N'nguyenvana4@email.com', N'hashed_password_1', NULL, N'1234567890', CAST(N'2025-07-19' AS Date), N'USER', N'ha_noi                                                                                              ', 123456789)
INSERT [dbo].[tblNguoidung] ([PK_iNguoidungID], [sTennguoidung], [sEmail], [sMatkhau], [sDiachi], [sSodienthoai], [dNgaydangky], [sQuyen], [sQueQuan], [sCCCD]) VALUES (19, N'mmmmmm jkashdhas', N'khang2@gmail.com', N'12345678', NULL, N'1234567890', CAST(N'2025-07-19' AS Date), N'USER', N'hai_phong                                                                                           ', 123456789)
INSERT [dbo].[tblNguoidung] ([PK_iNguoidungID], [sTennguoidung], [sEmail], [sMatkhau], [sDiachi], [sSodienthoai], [dNgaydangky], [sQuyen], [sQueQuan], [sCCCD]) VALUES (20, N'hh hhhh', N'nguyenvana7@email.com', N'hashed_password_1', NULL, N'1234567890', CAST(N'2025-07-19' AS Date), N'USER', N'hai_phong                                                                                           ', 123456789)
INSERT [dbo].[tblNguoidung] ([PK_iNguoidungID], [sTennguoidung], [sEmail], [sMatkhau], [sDiachi], [sSodienthoai], [dNgaydangky], [sQuyen], [sQueQuan], [sCCCD]) VALUES (22, N'mmmmmm jkashdhas', N'khang21@gmail.com', N'', NULL, N'1234567890', CAST(N'2025-07-19' AS Date), N'USER', N'hai_phong                                                                                           ', 1234567894)
INSERT [dbo].[tblNguoidung] ([PK_iNguoidungID], [sTennguoidung], [sEmail], [sMatkhau], [sDiachi], [sSodienthoai], [dNgaydangky], [sQuyen], [sQueQuan], [sCCCD]) VALUES (24, N'qqq gggggggg', N'nguyenvana999@email.com', N'hashed_password_1', NULL, N'1234567890', CAST(N'2025-07-19' AS Date), N'USER', N'bac_ninh                                                                                            ', 1234567890)
INSERT [dbo].[tblNguoidung] ([PK_iNguoidungID], [sTennguoidung], [sEmail], [sMatkhau], [sDiachi], [sSodienthoai], [dNgaydangky], [sQuyen], [sQueQuan], [sCCCD]) VALUES (25, N'pham bdddddddd', N'nguyenvana8@email.com', N'admin123456', NULL, N'0123456789', CAST(N'2025-07-19' AS Date), N'USER', N'ha_noi                                                                                              ', 1234567894)
INSERT [dbo].[tblNguoidung] ([PK_iNguoidungID], [sTennguoidung], [sEmail], [sMatkhau], [sDiachi], [sSodienthoai], [dNgaydangky], [sQuyen], [sQueQuan], [sCCCD]) VALUES (26, N'pham bdddddddd', N'nguyenvana11@email.com', N'hashed_password_1', NULL, N'0123456789', CAST(N'2025-07-19' AS Date), N'USER', N'Hà Nội                                                                                              ', 1234567894)
INSERT [dbo].[tblNguoidung] ([PK_iNguoidungID], [sTennguoidung], [sEmail], [sMatkhau], [sDiachi], [sSodienthoai], [dNgaydangky], [sQuyen], [sQueQuan], [sCCCD]) VALUES (27, N'pham bdddddddd', N'nguyenvana6@email.com', N'hashed_password_1', NULL, N'0789127321', CAST(N'2025-07-19' AS Date), N'USER', N'Bắc Ninh                                                                                            ', 123456789)
INSERT [dbo].[tblNguoidung] ([PK_iNguoidungID], [sTennguoidung], [sEmail], [sMatkhau], [sDiachi], [sSodienthoai], [dNgaydangky], [sQuyen], [sQueQuan], [sCCCD]) VALUES (28, N'aaaaaaa aaaaaaaaaa', N'nguyenvana5@email.com', N'hashed_password_1', NULL, N'0987654321', CAST(N'2025-07-19' AS Date), N'USER', N'Bắc Ninh                                                                                            ', 1234567894)
INSERT [dbo].[tblNguoidung] ([PK_iNguoidungID], [sTennguoidung], [sEmail], [sMatkhau], [sDiachi], [sSodienthoai], [dNgaydangky], [sQuyen], [sQueQuan], [sCCCD]) VALUES (29, N'ppppp ppp', N'nguyenvanc1@email.com', N'admin123456', NULL, N'0123456789', CAST(N'2025-07-19' AS Date), N'USER', N'Hà Nội                                                                                              ', 1234567894)
INSERT [dbo].[tblNguoidung] ([PK_iNguoidungID], [sTennguoidung], [sEmail], [sMatkhau], [sDiachi], [sSodienthoai], [dNgaydangky], [sQuyen], [sQueQuan], [sCCCD]) VALUES (30, N'pham bdddddddd', N'nguyenvanaii@email.com', N'hashed_password_1', NULL, N'0789127321', CAST(N'2025-07-19' AS Date), N'USER', N'Hải Phòng                                                                                           ', 1234567894)
SET IDENTITY_INSERT [dbo].[tblNguoidung] OFF
GO
SET IDENTITY_INSERT [dbo].[tblNhaxuatban] ON 

INSERT [dbo].[tblNhaxuatban] ([PK_iNhaxuatbanID], [sTennxb], [sDiachi], [sSodienthoai]) VALUES (1, N'Nhà Xuất Bản Trẻ', N'161B Lý Chính Thắng, Quận 3, TPHCM', N'02839316')
INSERT [dbo].[tblNhaxuatban] ([PK_iNhaxuatbanID], [sTennxb], [sDiachi], [sSodienthoai]) VALUES (2, N'Nhà Xuất Bản Kim Đồng', N'55 Quang Trung, Hà Nội', N'02439434')
INSERT [dbo].[tblNhaxuatban] ([PK_iNhaxuatbanID], [sTennxb], [sDiachi], [sSodienthoai]) VALUES (3, N'Tổng hợp TPHCM', N'62 Nguyễn Thị Minh Khai, Quận 1, TPHCM', N'0283822')
INSERT [dbo].[tblNhaxuatban] ([PK_iNhaxuatbanID], [sTennxb], [sDiachi], [sSodienthoai]) VALUES (4, N'Nhà Xuất Bản Lao Động', N'175 Giảng Võ, Hà Nội', N'02438580')
INSERT [dbo].[tblNhaxuatban] ([PK_iNhaxuatbanID], [sTennxb], [sDiachi], [sSodienthoai]) VALUES (5, N'Nhà Xuất Bản Dân Trí', N'Số 9, ngõ 26, Hoàng Cầu, Hà Nội', N'02435185')
SET IDENTITY_INSERT [dbo].[tblNhaxuatban] OFF
GO
SET IDENTITY_INSERT [dbo].[tblSach] ON 

INSERT [dbo].[tblSach] ([PK_iSachID], [sTensach], [sMota], [sURLanh], [fGiabanmoi], [fGiabancu], [iSoluong], [FK_iTheloaiID], [FK_iTacgiaID], [FK_iNhaxuatbanID], [truong_moi]) VALUES (1, N'Cho tôi xin một vé đi tuổi thơ', N'Cho Tôi Xin Một Vé Đi Tuổi Thơ - Phiên Bản Đặc Biệt

Truyện Cho tôi xin một vé đi tuổi thơ là một trong những tác phẩm bán chạy nhất nhà văn Nguyễn Nhật Ánh. Nhà văn mời người đọc lên chuyến tàu quay ngược trở lại thăm tuổi thơ và tình bạn dễ thương của 4 bạn nhỏ. Những trò chơi dễ thương thời bé, tính cách thật thà, thẳng thắn một cách thông minh và dại dột, những ước mơ tự do trong lòng… khiến cuốn sách có thể làm các bậc phụ huynh lo lắng rồi thở phào. Không chỉ thích hợp với người đọc trẻ, cuốn sách còn có thể hấp dẫn và thực sự có ích cho người lớn trong quan hệ với con mình.

Tác phẩm đạt giải thưởng văn học Asean 2010.

Cho tôi xin một vé đi tuổi thơ đã được chuyển ngữ sang nhiều thứ tiếng như Tiếng Anh, Nhật, Hàn, Thái và phát hành tại nhiều nước thế giới.

“Một câu chuyện ngụ ngôn làm say lòng người lớn và trẻ em. Cho tôi xin một vé đi tuổi thơ sẽ chiếm cảm tình của độc giả Mỹ - Amazon.

Tác phẩm đầy mê hoặc này - gợi nhớ đến Hoàng tử bé của Saint-Exupery – đã khắc họa một cách tài tình sự đa cảm của tuổi thơ đối lập với những phi lý của thế giới người lớn – Publishers Weekly”

Phiên bản đặc biệt kỷ niệm 40 năm ngày thành lập NXB Trẻ được in màu hoàn toàn với những tranh minh họa mới của họa sĩ Đỗ Hoàng Tường.', N'/assets/images/nxbtre_full_22142021_051437.webp', CAST(95000 AS Decimal(18, 0)), CAST(110000 AS Decimal(18, 0)), 0, 2, 1, 1, N'99LL                                                                                                ')
INSERT [dbo].[tblSach] ([PK_iSachID], [sTensach], [sMota], [sURLanh], [fGiabanmoi], [fGiabancu], [iSoluong], [FK_iTheloaiID], [FK_iTacgiaID], [FK_iNhaxuatbanID], [truong_moi]) VALUES (2, N'Dế Mèn phiêu lưu ký', N'Trong hơn nửa thế kỉ, kể từ ngày đầu tiên ra mắt bạn đọc, năm 1941, "Dế Mèn phiêu lưu ký" là một trong những sáng tác tâm đắc nhất của nhà văn Tô Hoài. Tác phẩm đã được tái bản nhiều lần và được dịch ra hơn 20 thứ tiếng trên toàn thế giới và luôn được các thế hệ độc giả nhỏ tuổi đón nhận. Tác phẩm đã được xuất bản với nhiều hình thức khác nhau. Trong đó cuốn "Dế Mèn phiêu lưu ký" gồm 52 trang, trên khổ giấy 21,5x28cm là một ấn phẩm đặc biệt phù hợp với các em nhi đồng vì cách kể gọn, dễ nắm bắt. Các tranh diễn hoạ 4 màu sinh động của hoạ sĩ Trương Qua sẽ khiến các em thấy như đang được xem một cuốn phim về chú Dế Mèn nổi tiếng vậy!', N'/assets/images/image_185968.jpg', CAST(68000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), 98, 1, 2, 2, N'88OOO                                                                                               ')
INSERT [dbo].[tblSach] ([PK_iSachID], [sTensach], [sMota], [sURLanh], [fGiabanmoi], [fGiabancu], [iSoluong], [FK_iTheloaiID], [FK_iTacgiaID], [FK_iNhaxuatbanID], [truong_moi]) VALUES (3, N'Đắc nhân tâm', N'Đắc Nhân Tâm

Đắc nhân tâm (tên tiếng Anh là How to Win Friends and Influence People) là một trong những cuốn sách về chủ đề nghệ thuật ứng xử và giao tiếp thành công nhất, bán chạy nhất và được biết đến nhiều nhất cho đến tận ngày nay, đưa tên tuổi của Dale Carnegie vang danh khắp thế giới.

Dale Carnegie từng nói, việc kiếm được một triệu đô la vẫn dễ hơn thêm một cụm từ vào từ điển tiếng Anh. Vậy mà Đắc nhân tâm đã trở thành một cụm từ như thế: được trích dẫn, diễn giải, tái chế; được sử dụng trong vô số bối cảnh, từ phim hoạt hình, chính trị cho tới tiểu thuyết. Bản thân cuốn sách cũng được dịch sang hầu hết các ngôn ngữ được biết đến trên thế giới. Mỗi thế hệ lại khám phá tác phẩm theo một cách hoàn toàn mới và tìm ra những giá trị vẫn hữu dụng trong thời đại của họ.', N'/assets/images/image_195509_1_36793.webp', CAST(120000 AS Decimal(18, 0)), CAST(150000 AS Decimal(18, 0)), 200, 2, 3, 3, NULL)
INSERT [dbo].[tblSach] ([PK_iSachID], [sTensach], [sMota], [sURLanh], [fGiabanmoi], [fGiabancu], [iSoluong], [FK_iTheloaiID], [FK_iTacgiaID], [FK_iNhaxuatbanID], [truong_moi]) VALUES (4, N'Harry Potter và Hòn đá Phù thủy', N'Tập đầu tiên trong loạt truyện kỳ ảo nổi tiếng của J.K. Rowling.', N'/assets/images/8934974189800.webp', CAST(180000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), 120, 4, 4, 1, NULL)
INSERT [dbo].[tblSach] ([PK_iSachID], [sTensach], [sMota], [sURLanh], [fGiabanmoi], [fGiabancu], [iSoluong], [FK_iTheloaiID], [FK_iTacgiaID], [FK_iNhaxuatbanID], [truong_moi]) VALUES (5, N'Việt Nam sử lược', N'Bộ thông sử đầu tiên của Việt Nam viết bằng chữ quốc ngữ.', N'/assets/images/cate_3.webp', CAST(150000 AS Decimal(18, 0)), CAST(175000 AS Decimal(18, 0)), 78, 3, 5, 5, NULL)
INSERT [dbo].[tblSach] ([PK_iSachID], [sTensach], [sMota], [sURLanh], [fGiabanmoi], [fGiabancu], [iSoluong], [FK_iTheloaiID], [FK_iTacgiaID], [FK_iNhaxuatbanID], [truong_moi]) VALUES (6, N'Mắt biếc', N'Câu chuyện tình yêu lãng mạn và buồn của Ngạn dành cho Hà Lan.', N'/assets/images/8934974178637.jpg', CAST(88000 AS Decimal(18, 0)), CAST(100000 AS Decimal(18, 0)), 60, 4, 1, 1, NULL)
INSERT [dbo].[tblSach] ([PK_iSachID], [sTensach], [sMota], [sURLanh], [fGiabanmoi], [fGiabancu], [iSoluong], [FK_iTheloaiID], [FK_iTacgiaID], [FK_iNhaxuatbanID], [truong_moi]) VALUES (7, N'Nhà giả kim', N'Hành trình theo đuổi vận mệnh của chàng chăn cừu Santiago.', N'/assets/images/image_195509_1_36793.webp', CAST(79000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), 150, 2, 3, 3, NULL)
INSERT [dbo].[tblSach] ([PK_iSachID], [sTensach], [sMota], [sURLanh], [fGiabanmoi], [fGiabancu], [iSoluong], [FK_iTheloaiID], [FK_iTacgiaID], [FK_iNhaxuatbanID], [truong_moi]) VALUES (8, N'Tôi thấy hoa vàng trên cỏ xanh', N'Những câu chuyện tuổi thơ trong sáng tại một làng quê nghèo.', N'/assets/images/nna-hvtcx.jpg', CAST(92000 AS Decimal(18, 0)), CAST(105000 AS Decimal(18, 0)), 70, 1, 1, 1, NULL)
INSERT [dbo].[tblSach] ([PK_iSachID], [sTensach], [sMota], [sURLanh], [fGiabanmoi], [fGiabancu], [iSoluong], [FK_iTheloaiID], [FK_iTacgiaID], [FK_iNhaxuatbanID], [truong_moi]) VALUES (9, N'Quẳng gánh lo đi và vui sống  - 2', N'Những lời khuyên giúp bạn vượt qua lo lắng, căng thẳng trong cuộc sống.', N'/assets/images/8935236435468.webp', CAST(110000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), 180, 2, 3, 4, NULL)
INSERT [dbo].[tblSach] ([PK_iSachID], [sTensach], [sMota], [sURLanh], [fGiabanmoi], [fGiabancu], [iSoluong], [FK_iTheloaiID], [FK_iTacgiaID], [FK_iNhaxuatbanID], [truong_moi]) VALUES (10, N'Harry Potter và Phòng chứa Bí mật', N'Phần hai của cuộc phiêu lưu tại trường Hogwarts.', N'/assets/images/8934974182290.webp', CAST(190000 AS Decimal(18, 0)), CAST(210000 AS Decimal(18, 0)), 110, 4, 4, 1, NULL)
INSERT [dbo].[tblSach] ([PK_iSachID], [sTensach], [sMota], [sURLanh], [fGiabanmoi], [fGiabancu], [iSoluong], [FK_iTheloaiID], [FK_iTacgiaID], [FK_iNhaxuatbanID], [truong_moi]) VALUES (11, N'Nho giáo', N'Nghiên cứu về lịch sử và các triết lý của Nho giáo tại Việt Nam.', N'/assets/images/8935236434591.jpg', CAST(135000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), 40, 3, 5, 5, NULL)
INSERT [dbo].[tblSach] ([PK_iSachID], [sTensach], [sMota], [sURLanh], [fGiabanmoi], [fGiabancu], [iSoluong], [FK_iTheloaiID], [FK_iTacgiaID], [FK_iNhaxuatbanID], [truong_moi]) VALUES (12, N'Bảy bước tới mùa hè', N'Câu chuyện mùa hè trong trẻo và đầy ắp kỷ niệm.', N'/assets/images/8934974178309.webp', CAST(85000 AS Decimal(18, 0)), CAST(95000 AS Decimal(18, 0)), 90, 1, 1, 1, NULL)
INSERT [dbo].[tblSach] ([PK_iSachID], [sTensach], [sMota], [sURLanh], [fGiabanmoi], [fGiabancu], [iSoluong], [FK_iTheloaiID], [FK_iTacgiaID], [FK_iNhaxuatbanID], [truong_moi]) VALUES (13, N'Vợ chồng A Phủ', N'Truyện ngắn phản ánh cuộc sống của người dân miền núi Tây Bắc.', N'/assets/images/8935235230583.jpg', CAST(45000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), 130, 4, 2, 2, NULL)
INSERT [dbo].[tblSach] ([PK_iSachID], [sTensach], [sMota], [sURLanh], [fGiabanmoi], [fGiabancu], [iSoluong], [FK_iTheloaiID], [FK_iTacgiaID], [FK_iNhaxuatbanID], [truong_moi]) VALUES (14, N'Khởi nghiệp bán lẻ', N'Cẩm nang dành cho những ai muốn bắt đầu kinh doanh trong ngành bán lẻ.', N'/assets/images/9786048429867.jpg', CAST(145000 AS Decimal(18, 0)), CAST(160000 AS Decimal(18, 0)), 55, 5, 3, 4, NULL)
INSERT [dbo].[tblSach] ([PK_iSachID], [sTensach], [sMota], [sURLanh], [fGiabanmoi], [fGiabancu], [iSoluong], [FK_iTheloaiID], [FK_iTacgiaID], [FK_iNhaxuatbanID], [truong_moi]) VALUES (15, N'Làm bạn với bầu trời - 2', N'Một câu chuyện cảm động về nghị lực sống phi thường.', N'/assets/images/untitled-1_71_1.webp', CAST(89000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), 65, 1, 1, 1, NULL)
INSERT [dbo].[tblSach] ([PK_iSachID], [sTensach], [sMota], [sURLanh], [fGiabanmoi], [fGiabancu], [iSoluong], [FK_iTheloaiID], [FK_iTacgiaID], [FK_iNhaxuatbanID], [truong_moi]) VALUES (21, N'Clean Code', N'Clean Code

Mã sạch và con đường trở thành lập trình viên giỏi

Hiện nay, lập trình viên là một trong những nghề nghiệp được nhiều người lựa chọn theo đuổi và gắn bó. Đây là công việc đòi hỏi sự tỉ mỉ, nhiều công sức nhưng mang lại giá trị cao và một tương lai công việc hứa hẹn. Là một trong số những chuyên gia giàu kinh nghiệm, điêu luyện và lành nghề trong ngành, tác giả đã đúc rút từ kinh nghiệm của mình, viết về những tình huống trong thực tế, đôi khi có thể trái ngược với lý thuyết để xây dựng nên cuốn cẩm nang này, nhằm hỗ trợ những người đang muốn trở thành một lập trình viên chuyên nghiệp.

Cuốn sách được nhiều lập trình viên đánh giá là quyển sách giá trị nhất mà họ từng đọc trong sự nghiệp của mình. Cuốn sách hướng dẫn cách để viết những đoạn mã có thể hoạt động tốt, cũng như truyền tải được ý định của người viết nên chúng.

Cuốn sách được chia thành ba phần lớn. Phần đầu tiên mô tả các nguyên tắc, mô hình và cách thực hành viết mã sạch. Phần thứ hai gồm nhiều tình huống điển hình với mức độ phức tạp gia tang không ngừng. Mỗi tình huống là một bài tập giúp làm sạch mã, chuyển đổi mã có nhiều vấn đề thành mã có ít vấn đề hơn. Và phần cuối là tuyển tập rất nhiều những dấu hiệu của mã có vấn đề, những tìm tòi, suy nghiệm từ thực tiễn được đúc rút qua cách tình huống điển hình.', N'/assets/images/8936107813361.webp', CAST(210000 AS Decimal(18, 0)), CAST(339000 AS Decimal(18, 0)), 10, 10, 1, 5, NULL)
INSERT [dbo].[tblSach] ([PK_iSachID], [sTensach], [sMota], [sURLanh], [fGiabanmoi], [fGiabancu], [iSoluong], [FK_iTheloaiID], [FK_iTacgiaID], [FK_iNhaxuatbanID], [truong_moi]) VALUES (22, N'Putin - Logic của quyền lực', N'a', N'/assets/images/putin_logic-cua-quyen-luc.jpg', CAST(123000 AS Decimal(18, 0)), CAST(340000 AS Decimal(18, 0)), 5, 5, 4, 5, NULL)
INSERT [dbo].[tblSach] ([PK_iSachID], [sTensach], [sMota], [sURLanh], [fGiabanmoi], [fGiabancu], [iSoluong], [FK_iTheloaiID], [FK_iTacgiaID], [FK_iNhaxuatbanID], [truong_moi]) VALUES (23, N'Đừng Lựa Chọn An Nhàn Khi Còn Trẻ (Tái Bản 2021)', N'Đừng Lựa Chọn An Nhàn Khi Còn Trẻ

Trong độ xuân xanh phơi phới ngày ấy, bạn không dám mạo hiểm, không dám nỗ lực để kiếm học bổng, không chịu tìm tòi những thử thách trong công việc, không phấn đấu hướng đến ước mơ của mình. Bạn mơ mộng rằng làm việc xong sẽ vào làm ở một công ty nổi tiếng, làm một thời gian sẽ thăng quan tiến chức. Mơ mộng rằng khởi nghiệp xong sẽ lập tức nhận được tiền đầu tư, cầm được tiền đầu tư là sẽ niêm yết trên sàn chứng khoán. Mơ mộng rằng muốn gì sẽ có đó, không thiếu tiền cũng chẳng thiếu tình, an hưởng những năm tháng êm đềm trong cuộc đời mình.

Nhưng vì sao bạn lại nghĩ rằng bạn chẳng cần bỏ ra chút công sức nào, cuộc sống sẽ dâng đến tận miệng những thứ bạn muốn? Bạn cần phải hiểu rằng: Hấp tấp muốn mau chóng thành công rất dễ khiến chúng ta đi vào mê lộ. Thanh xuân là khoảng thời gian đẹp đẽ nhất trong đời, cũng là những năm tháng then chốt có thể quyết định tương lai của một người. Nếu bạn lựa chọn an nhàn trong 10 năm, tương lai sẽ buộc bạn phải vất vả trong 50 năm để bù đắp lại. Nếu bạn bươn chải vất vả trong 10 năm, thứ mà bạn chắc chắn có được là 50 năm hạnh phúc. Điều quý giá nhất không phải là tiền mà là tiền bạc.

Thế nên, bạn à, đừng lựa chọn an nhàn khi còn trẻ.', N'/assets/images/dung-lua-chon-an-nhan-khi-con-tre-_tai-ban_.webp', CAST(299000 AS Decimal(18, 0)), CAST(489000 AS Decimal(18, 0)), 30, 2, 5, 1, NULL)
INSERT [dbo].[tblSach] ([PK_iSachID], [sTensach], [sMota], [sURLanh], [fGiabanmoi], [fGiabancu], [iSoluong], [FK_iTheloaiID], [FK_iTacgiaID], [FK_iNhaxuatbanID], [truong_moi]) VALUES (24, N'Destination B1 - Grammar And Vocabulary With Answer Key (Tái Bản 2024)', N'Destination B1 - Grammar And Vocabulary With Answer Key (Tái Bản 2024)

Destination B1 – Grammar & Vocabulary With Answer Key là cuốn sách tự học và luyện thi lấy chứng chỉ B1 uy tín nhất hiện nay. Destination B1 rất cần thiết cho mọi lứa tuổi vì hiện tại tiếng Anh B1 là một chứng chỉ đã khá phổ biến khi nó là điều kiện cần có của không những thạc sĩ, tiến sĩ mà cả sinh viên của một số trường Đại học.

Giới thiệu cuốn sách Destination B1

Cuốn Destination B1 – Grammar & Vocabulary được xây dựng dành cho những bạn chuẩn bị thi B1 – FCE (tương đương với 3.5 IELTS trở lên).

Destination B1 do Công ty Cổ phần sách MCBooks giữ bản quyền xuất bản tại Việt Nam theo Hợp đồng chuyển giao bản quyền với Nhà xuất bản Macmillan. Bộ sách cung cấp từ vựng và ngữ pháp tiếng Anh cần thiết nhất dành cho người học đang có ý định thi các kỳ thi ở Level B1 theo khung tham chiếu châu Âu và mong muốn cải thiện năng lực tiếng Anh của bản thân.

Nội dung cuốn sách Destination B1 – Grammar & Vocabulary With Answer Key

Cuốn sách Destination B1 – Grammar & Vocabulary mang đến những kiến thức ngữ pháp & từ vựng tiếng Anh thường bắt gặp trong bài thi B1. Phù hợp cho những bạn ở trình độ Intermediate.

Nguồn tài liệu được đưa vào trong sách được dựa theo mức trình độ B1 chuẩn khung châu Âu. Bao gồm 42 bài học, 14 bài review và 2 bài Progress Test để bạn luyện tập.

Bài học sẽ được thiết kế đan xen, cứ sau 2 bài ngữ pháp sẽ có 1 bài từ vựng đi kèm. Và sau mỗi 3 bài sẽ có 1 bài review, giúp bạn hệ thống lại kiến thức đã học, ghi nhớ kiến thức lâu hơn.

+ Phần ngữ pháp : Phần ngữ pháp sẽ cung cấp các kiến thức cơ bản về ngữ pháp kèm theo cách dùng, một số lưu ý và ví dụ cụ thể để các bạn hiểu thêm về chủ điểm ngữ pháp đó.

+ Phần từ vựng: Sách Destination B1 sẽ chia từ vựng trong mỗi bài học thành 5 loại khác nhau: Các từ vựng chung chủ đề (topic vocabulary), cụm động từ (phrasal verb), cụm giới từ (prepositional phrases), hình thành từ (word formation), mẫu từ (word patterns) để sử dụng kèm với các từ vựng được giới thiệu.

Tuy nhiên từ vựng sẽ không có phần phiên âm và nghĩa cũng như ví dụ kèm theo nên các bạn cần sử dụng thêm từ điển và note book để tra nghĩa của từ cũng như ôn lại, đặt ví dụ với từ để nhớ được từ vựng.

Phần bài tập trong mục từ vựng: Rất đa dạng các loại bài tập như điền từ vựng vào ô chữ, chọn từ vựng còn thiếu để điền vào chỗ trống, chọn đáp án đúng…

Bài tập về từ vựng cũng được phân thành từng mục giống như các mục từ vựng được giới thiệu ở đầu mỗi bài học (cụm động từ (phrasal verb), cụm giới từ (prepositional phrases), hình thành từ (word formation), mẫu từ (word patterns)).

Sau mỗi 2 bài học về ngữ pháp và 1 bài học về từ vựng thì sẽ có 1 bài “Review” để tổng hợp lại toàn bộ kiến thức trong 2 bài ngữ pháp và 1 bài từ vựng đã học đó.

Bên cạnh đó, sách còn mang đến cho bạn phần tài liệu tham khảo vô cùng hữu ích về cụm động từ, cụm từ, các mẫu bài làm… Việc cấu trúc như trên sẽ giúp sĩ tử xây dựng được một ngân hàng từ vựng phong phú và nắm vững kiến thức ngữ pháp để áp dụng vào các bài thi.

Điểm đặc biệt của cuốn sách Destination B1 – Grammar & Vocabulary

- Cuốn B1 này sẽ giúp các bạn phân biệt khi nào dùng “the”, khi nào có “s”, People/ a few people/ a number of thì chia động từ số ít hay nhiều, hãy nghiên cứu phần Grammar vì sách giải thích rất chi tiết ngữ pháp và có bài tập áp dụng đi kèm để nhớ ngay kiến thức đó.

- Bên cạnh đó, từ vựng trong sách có tính ứng dụng cực cao trong bài thi IELTS Writing và Speaking.

- Không chỉ dừng ở việc cho từ vựng theo chủ để như những quyển sách thông thường, Destination B1 cung cấp cả collocations, phrasal verb – cụm động từ rất hay ở level cơ bản.

Kiến thức đạt được sau lộ trình học với bộ sách Destination:

- Nắm được khối lượng kiến thức và lộ trình ôn thi chứng chỉ tiếng Anh B1.

- Làm quen với đề thi để luyện tập và đạt kết quả cao trong kỳ thi thực tế.

Hãy nhanh tay đặt mua ngay cuốn sáchDestination B1để việc học và ôn thi của các chứng chỉ tiếng Anh B1 trở nên nhanh chóng và hiệu quả hơn nhé!

Chúc các bạn sẽ học tập tốt cùng cuốn sách này!', N'/assets/images/8935246945001.webp', CAST(120000 AS Decimal(18, 0)), CAST(189000 AS Decimal(18, 0)), 30, 11, 2, 3, NULL)
INSERT [dbo].[tblSach] ([PK_iSachID], [sTensach], [sMota], [sURLanh], [fGiabanmoi], [fGiabancu], [iSoluong], [FK_iTheloaiID], [FK_iTacgiaID], [FK_iNhaxuatbanID], [truong_moi]) VALUES (25, N'Ready For VSTEP B2 - Chiến Thuật Làm Bài VSTEP Đạt Điểm Cao', N'Ready For VSTEP B2 - Chiến Thuật Làm Bài VSTEP Đạt Điểm Cao

Trong thời đại hội nhập quốc tế, tiếng Anh đã trở thành một công cụ không thể thiếu, mở ra nhiều cơ hội học tập và làm việc cho người Việt Nam. Một trong những chứng chỉ tiếng Anh được nhiều người lựa chọn hiện nay là VSTEP (Vietnamese Standardized Test of English Proficiency) – một kỳ thi tiếng Anh do Việt Nam phát triển và tổ chức. Chứng chỉ này không chỉ giúp người Việt chứng minh năng lực tiếng Anh mà còn mang lại nhiều lợi ích thực tiễn như mở rộng cơ hội việc làm, nâng cao trình độ tiếng Anh và tăng cường sự tự tin trong giao tiếp.

Hiểu được tầm quan trọng của chứng chỉ VSTEP đối với người Việt,MCBooksđã hợp tác cùng đội ngũ giảng viên tiếng Anh của Trường Đại học Ngoại ngữ – Đại học Quốc gia Hà Nội để biên soạn và xuất bản cuốn sách “Ready for VSTEP – Chiến thuật làm bài VSTEP B2”. Cuốn sách này là một tài liệu quý giá dành cho học sinh, sinh viên và những ai đang có nhu cầu ôn luyện và thi lấy chứng chỉ VSTEP trình độ B2.

Nội dung quyển sách Ready for VSTEP – Chiến thuật làm bài VSTEP B2
Bố cục rõ ràng và khoa học

“Ready for VSTEP – Chiến thuật làm bài VSTEP B2” được thiết kế với bố cục rõ ràng, chia thành các phần riêng biệt theo từng kỹ năng và từng dạng bài trong bài thi VSTEP. Điều này giúp người học dễ dàng nắm bắt và tập trung ôn luyện từng phần một cách hiệu quả. Mỗi chương sách đều bắt đầu bằng phần giới thiệu về dạng bài, tiếp theo là các chiến thuật và phương pháp làm bài, cuối cùng là phần bài tập thực hành phong phú.

Chiến thuật và mẹo làm bài hiệu quả

Một trong những điểm đặc biệt của cuốn sách là cung cấp các chiến thuật và mẹo làm bài giúp người học đột phá điểm số. Những chiến thuật này được đúc kết từ kinh nghiệm giảng dạy và nghiên cứu của các giảng viên uy tín, đảm bảo tính ứng dụng cao và dễ hiểu. Việc áp dụng những chiến thuật này không chỉ giúp người học làm bài nhanh chóng mà còn chính xác hơn, tiết kiệm thời gian và công sức.

Phát triển toàn diện bốn kỹ năng: Nghe – Nói – Đọc – Viết

Cuốn sách tập trung phát triển toàn diện bốn kỹ năng Nghe – Nói – Đọc – Viết, đảm bảo người học có thể tự tin vượt qua kỳ thi VSTEP B2. Mỗi kỹ năng đều được trình bày chi tiết với các bài tập từ cơ bản đến nâng cao, giúp người học dễ dàng theo dõi hành trình học của mình. Ngoài ra, sách còn cung cấp các bài mẫu và hướng dẫn chi tiết cách làm bài, giúp người học hiểu rõ hơn về cấu trúc đề thi và cách thức chấm điểm.

Bài tập thực hành phong phú và đa dạng

Để đảm bảo người học có thể luyện tập một cách toàn diện, “Ready for VSTEP – Chiến thuật làm bài VSTEP B2” cung cấp nhiều bài tập thực hành phong phú và đa dạng. Những bài tập này được thiết kế theo chuẩn đề thi VSTEP, giúp người học làm quen với định dạng đề thi thực tế và rèn luyện kỹ năng làm bài. Điều này không chỉ giúp bạn cải thiện kỹ năng mà còn tăng cường sự tự tin khi bước vào phòng thi.

Đội ngũ tác giả uy tín

Cuốn sách được biên soạn bởi đội ngũ giảng viên tiếng Anh giàu kinh nghiệm từ Trường Đại học Ngoại ngữ – Đại học Quốc gia Hà Nội. Đây là những chuyên gia có nhiều năm kinh nghiệm trong việc giảng dạy và nghiên cứu về tiếng Anh, đảm bảo mang đến cho người học những kiến thức chính xác và cập nhật nhất. Sự kết hợp giữa lý thuyết và thực tiễn trong cách biên soạn giúp người học dễ dàng áp dụng vào quá trình ôn luyện của mình

Chúc các bạn học và thi thật tốt!', N'/assets/images/8935246942932.webp', CAST(99000 AS Decimal(18, 0)), CAST(150000 AS Decimal(18, 0)), 99, 11, 4, 1, NULL)
INSERT [dbo].[tblSach] ([PK_iSachID], [sTensach], [sMota], [sURLanh], [fGiabanmoi], [fGiabancu], [iSoluong], [FK_iTheloaiID], [FK_iTacgiaID], [FK_iNhaxuatbanID], [truong_moi]) VALUES (26, N'Chinh Phục Toàn Diện Ngữ Pháp Tiếng Anh Bằng Infographic - Tập 1', N'Chinh Phục Toàn Diện Ngữ Pháp Tiếng Anh Bằng Infographic - Tập 1

Chinh phục toàn diện ngữ pháp Tiếng Anh bằng Infographic“ là một tài liệu phong phú hỗ trợ toàn diện và nâng cao trình độ Ngữ pháp Tiếng Anh từ cơ bản đến nâng cao, giúp các bạn tự tin chinh phục Tiếng Anh chỉ trong vòng 3 tháng.

Tiếng Anh là ngôn ngữ ngày càng phổ biến trong xã hội đang hội nhập ngày một sâu và rộng. Việc trau dồi vốn từ vựng, ngữ pháp tiếng Anh đóng vai trò cốt lõi trong việc phát triển toàn diện các kỹ năng từ nghe, nói, đến đọc, viết.

Liệu bạn có đang gặp phải những vấn đề dưới đây:

- Quá nhiều cấu trúc ngữ pháp tiếng anh, không biết học bao nhiêu mới đủ, học bao giờ mới hết.

- Nội dung quá khô khan, khó nuốt, học trước quên sau.

- Cố gắng nhồi nhét, học thuộc hết cấu trúc ngữ pháp rồi lại không biết vận dụng như thế nào cho đúng.

- Mắc đi mắc lại những lỗi sai nhỏ, không đáng có.

- Tốn rất nhiều tiền bạc và thời gian cho các khóa học nhưng vẫn không hiệu quả, thường bỏ ngang giữa chừng.

Tất cả những vấn đề trên chỉ là chuyện nhỏ nếu bạn có trong tay bộ giải pháp Chinh phục toàn diện ngữ pháp tiếng Anh bằng Infographic. Bộ giải pháp mang đến cho bạn:

- Phương pháp trình bày bằng Infographic: kết hợp nội dung, hình ảnh kích thích cả hai bán cầu não giúp các vấn đề phức tạp trở nên dễ tiếp cận hơn, gần gũi hơn, qua đó việc học trở nên dễ dàng, hứng thú và tăng khả năng ghi nhớ nhanh lên đến 10.000 lần.

+ Ưu điểm nổi bật nhất của "Chinh phục toàn diện Ngữ pháp tiếng Anh bằng Infographic- tập 1" là toàn bộ kiến thức trong sách đều được trình bày dưới dạng Infographic - phương pháp biểu hiện thông tin bằng hình ảnh.

+ Đây là phương pháp trình bày kiến thức giúp nâng cao tối đa khả năng tiếp thu của não bộ.

+ Với thiết kế đẹp mắt, minh họa ấn tượng, đảm bảo tính logic, súc tích, ngắn gọn, các vấn đề phức tạp sẽ trở nên dễ tiếp cận, hấp dẫn hơn, từ đó đánh thứ sự thích thú của người đọc.

+ Hệ thống các chuyên đề ngữ pháp tiếng Anh được phân chia khoa học, logic, dễ nhớ.

+ Mỗi chuyên đề được phân chia rõ ràng thành hai phần cơ bản và nâng cao giúp bạn học dễ dàng, đi từ dễ đến khó, phục vụ được nhu cầu của nhiều bạn đọc ở các trình độ khác nhau.

Bên cạnh đó hệ thống bài tập tự luyện cũng được chia thành hai mức độ cơ bản- nâng cao để người đọc dễ ghi nhớ, củng cố kiến thức.

- Hệ thống đáp án, giải thích chi tiết ngữ pháp tiếng Anh và dịch nghĩa rõ ràng đến từng câu, từng ý, từng từ.

Ở cuối sách Chinh phục toàn diện Ngữ pháp tiếng Anh bằng Infographic có phần hệ thống đáp án, giải thích chi tiết và dịch nghĩa nhằm tạo điều kiện cho bạn đọc tự đánh giá và hiểu rõ thêm những phần còn vướng mắc trong câu hỏi. Bài tập trong sách đều có đáp án, dịch nghĩa cụ thể để người học dễ dàng ghi nhớ, đánh giá kết quả bản thân

- Tích hợp nhiều hình thức học: sách, video bài giảng, nhóm hỗ trợ giải đáp thắc mắc 24/7 giúp bạn học tập chủ động, đa dạng hình thức học để nâng cao hiệu quả.', N'/assets/images/8935246935996_1.webp', CAST(189000 AS Decimal(18, 0)), CAST(99999 AS Decimal(18, 0)), 11, 11, 5, 2, NULL)
INSERT [dbo].[tblSach] ([PK_iSachID], [sTensach], [sMota], [sURLanh], [fGiabanmoi], [fGiabancu], [iSoluong], [FK_iTheloaiID], [FK_iTacgiaID], [FK_iNhaxuatbanID], [truong_moi]) VALUES (29, N'Nếu Biết Trăm Năm Là Hữu Hạn - Ấn Bản Kỉ Niệm 10 Năm Xuất Bản (Tái Bản 2024)', N'NẾU BIẾT TRĂM NĂM LÀ HỮU HẠN - LÁ THƯ GỬI NHỮNG NGƯỜI TRẺ ĐANG LẠC LỐI
Bạn đã bao giờ tự hỏi: Nếu biết trước cuộc đời là hữu hạn, bạn sẽ sống khác đi chứ? 

Chúng ta luôn nghĩ mình có nhiều thời gian, nhưng thực tế, mọi khoảnh khắc đều đang trôi qua mãi mãi.
Vì sao bạn không nên bỏ lỡ cuốn sách này?
Nếu bạn từng trì hoãn hạnh phúc của mình cho một ngày "đủ đầy" trong tương lai.

Nếu bạn từng loay hoay giữa những lựa chọn, sợ hãi mình sẽ hối tiếc.

Nếu bạn muốn sống một cuộc đời mà không phải quay đầu nhìn lại với tiếc nuối.

Cuốn sách giúp bạn nhận ra điều gì?
Nếu Biết Trăm Năm Là Hữu Hạn là một lời nhắc nhở nhẹ nhàng nhưng đầy ám ảnh, giúp bạn nhận ra:

Hạnh phúc không nằm ở tương lai xa vời mà ngay trong hiện tại.
Cuộc sống hữu hạn, đừng chờ đến khi quá muộn mới nhận ra điều gì đáng giá.
Những gì nhỏ bé hôm nay có thể trở thành những kỷ niệm lớn nhất mai sau.', N'/assets/images/8932000134749_1.webp', CAST(199000 AS Decimal(18, 0)), CAST(234000 AS Decimal(18, 0)), 23, 1, 1, 3, NULL)
INSERT [dbo].[tblSach] ([PK_iSachID], [sTensach], [sMota], [sURLanh], [fGiabanmoi], [fGiabancu], [iSoluong], [FK_iTheloaiID], [FK_iTacgiaID], [FK_iNhaxuatbanID], [truong_moi]) VALUES (30, N'Cất Cho Tôi Những Ngày Xanh Nắng Hạ', N'“Cất cho tôi những ngày xanh nắng hạ” là một tập truyện gồm 15 truyện ngắn về tuổi đôi mươi chập chững của tuổi trẻ. Tập truyện là nơi cất giữ chân dung của những chàng trai, những cô gái trong những ngày tháng ấy, để sau này trước những cơn bão mới, họ sẽ lại cảm thấy an nhiên. Hệt như trong lòng có một cái ôm lâu.

Họ sẽ tiếp tục yêu và được yêu, để biết chấp nhận quá khứ và trân trọng những gì mình đang có. Họ sẽ tìm ra những con đường khác, bớt khắc nghiệt hơn cho chính mình và những người xung quanh, để không ai phải chịu thương tổn.

Và sau những ngày nắng hạ xanh cháy rực trên đầu, những người trẻ sẽ tìm được chính mình, khỏe mạnh, vững vàng và rực rỡ hơn từ những vết sẹo trong câu chuyện ngày xưa.', N'/assets/images/bia_cat-cho-toi-nhung-ngay-xanh-nang-ha.webp', CAST(78000 AS Decimal(18, 0)), CAST(155000 AS Decimal(18, 0)), 35, 1, 5, 5, NULL)
INSERT [dbo].[tblSach] ([PK_iSachID], [sTensach], [sMota], [sURLanh], [fGiabanmoi], [fGiabancu], [iSoluong], [FK_iTheloaiID], [FK_iTacgiaID], [FK_iNhaxuatbanID], [truong_moi]) VALUES (31, N'Harry Potter và Hòn đá Phù thủy', N'Khi một lá thư được gởi đến cho cậu bé Harry Potter bình thường và bất hạnh, cậu khám phá ra một bí mật đã được che giấu suốt cả một thập kỉ. Cha mẹ cậu chính là phù thủy và cả hai đã bị lời nguyền của Chúa tể Hắc ám giết hại khi Harry mới chỉ là một đứa trẻ, và bằng cách nào đó, cậu đã giữ được mạng sống của mình. Thoát khỏi những người giám hộ Muggle không thể chịu đựng nổi để nhập học vào trường Hogwarts, một trường đào tạo phù thủy với những bóng ma và phép thuật, Harry tình cờ dấn thân vào một cuộc phiêu lưu đầy gai góc khi cậu phát hiện ra một con chó ba đầu đang canh giữ một căn phòng trên tầng ba. Rồi Harry nghe nói đến một viên đá bị mất tích sở hữu những sức mạnh lạ kì, rất quí giá, vô cùng nguy hiểm, mà cũng có thể là mang cả hai đặc điểm trên.', N'/assets/images/8934974179672.webp', CAST(180000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), 120, 4, 4, 1, NULL)
INSERT [dbo].[tblSach] ([PK_iSachID], [sTensach], [sMota], [sURLanh], [fGiabanmoi], [fGiabancu], [iSoluong], [FK_iTheloaiID], [FK_iTacgiaID], [FK_iNhaxuatbanID], [truong_moi]) VALUES (32, N'Quẳng gánh lo đi và vui sống', N'Những lời khuyên giúp bạn vượt qua lo lắng, căng thẳng trong cuộc sống.', N'/assets/images/qu_ng-g_nh-lo-_i-v_-vui-s_ng_2.webp', CAST(110000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), 180, 2, 3, 4, NULL)
INSERT [dbo].[tblSach] ([PK_iSachID], [sTensach], [sMota], [sURLanh], [fGiabanmoi], [fGiabancu], [iSoluong], [FK_iTheloaiID], [FK_iTacgiaID], [FK_iNhaxuatbanID], [truong_moi]) VALUES (33, N'Làm bạn với bầu trời', N'Một câu chuyện cảm động về nghị lực sống phi thường.', N'/assets/images/untitled-2_44.webp', CAST(89000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), 65, 1, 1, 1, NULL)
INSERT [dbo].[tblSach] ([PK_iSachID], [sTensach], [sMota], [sURLanh], [fGiabanmoi], [fGiabancu], [iSoluong], [FK_iTheloaiID], [FK_iTacgiaID], [FK_iNhaxuatbanID], [truong_moi]) VALUES (34, N'Chat GPT Thực Chiến', N'Cuốn sách ChatGPT thực chiến xoay quanh việc học và sử dụng các công cụ AI, cũng như cách vận hành thực tế những ứng dụng AI trong các lĩnh vực khác nhau. Cuốn sách cung cấp những kiến thức cô đọng và thực tiễn nhất để nâng cao toàn diện những nhận thức, nguyên tắc sử dụng và các thao tác liên quan đến công cụ AI.

Đây là thời đại mà tất cả chúng ta đều phải chạy đua, với điểm đích của cuộc đua chính là làm chủ công cụ AI. Nắm chắc nó, đồng thời sử dụng nó tạo ra thành tích là thử thách mà mỗi chúng ta đều phải đối mặt. Hãy cùng nhau bắt đầu tiến vào thời đại mới, nơi AI và con người cộng sinh!

Các nội dung chính của cuốn sách:

Chương 1: Nhập môn ChatGPT

Chương 2: Làm chủ công cụ viết AI

Chương 3: Nhập môn Midjourney AI

Chương 4: ChatGPT và tạo âm thanh

Chương 5: ChatGPT và sản xuất video

Chương 6: ChatGPT và digital human

Chương 7: ChatGPT nâng cao hiệu quả học tập

Chương 8: ChatGPT nâng cao hiệu suất tại nơi làm việc: hỗ trợ thực hiện báo cáo, tóm tắt cuộc họp, viết nội dung, tối ưu hóa sơ yếu lý lịch và mô phỏng phỏng vẫn

Chương 9: Xu hướng của lĩnh vực trí tuệ nhân tạo', N'/assets/images/8936066698344.webp', CAST(229000 AS Decimal(18, 0)), CAST(329000 AS Decimal(18, 0)), 33, 10, 5, 5, NULL)
INSERT [dbo].[tblSach] ([PK_iSachID], [sTensach], [sMota], [sURLanh], [fGiabanmoi], [fGiabancu], [iSoluong], [FK_iTheloaiID], [FK_iTacgiaID], [FK_iNhaxuatbanID], [truong_moi]) VALUES (35, N' Excel Ứng Dụng Văn Phòng - Từ Cơ Bản Đến Nâng Cao (Tái Bản 2023)', N'Excel Ứng Dụng Văn Phòng - Từ Cơ Bản Đến Nâng Cao

Thành thạo tin học văn phòng trong đó giỏi Excel là một lợi thế rất lớn khi đi làm. Trong hơn 10 năm triển khai đào tạo cho hàng nghìn học viên từ sinh viên đến nhân viên văn phòng các công ty tập đoàn, tôi đã đúc kết lại các kiến thức đang được ứng dụng trong thực tế để cho ra cuốn sách Excel ứng dụng văn phòng từ cơ bản đến nâng cao.

Đặc biệt cuốn sách sẽ có kèm theo tài liệu bài tập thực hành để bạn có thể tự học theo lộ trình của cuốn sách giúp đạt hiệu quả và trải nghiệm tốt hơn khi tự học tại nhà.

Với khát vọng mong muốn giúp cho hàng triệu người Việt Nam có thể dễ dàng tiếp cận các kiến thức hữu ích, nâng cao năng lực sử dụng Excel của bản thân từ đó giúp cho công việc tốt lên và cơ hội phát triển thăng tiến trong sự nghiệp.', N'/assets/images/9786043854558_1.webp', CAST(122000 AS Decimal(18, 0)), CAST(435000 AS Decimal(18, 0)), 32, 10, 5, 4, NULL)
INSERT [dbo].[tblSach] ([PK_iSachID], [sTensach], [sMota], [sURLanh], [fGiabanmoi], [fGiabancu], [iSoluong], [FK_iTheloaiID], [FK_iTacgiaID], [FK_iNhaxuatbanID], [truong_moi]) VALUES (36, N'Con Gái Học Cách Lập Trình - Không Khó Khi Có Bí Quyết Trong Tay!', N'Con Gái Học Cách Lập Trình - Không Khó Khi Có Bí Quyết Trong Tay!

Hóa ra, bạn có thể học giỏi lập trình!

Bạn có thể làm nên những điều đáng kinh ngạc!

Và chắc chắn bạn sẽ rất vui khi làm điều đó!

Đặc biệt hơn, hóa ra, người tiên phong trong lĩnh vực khoa học máy tính là một phụ nữ. Đúng vậy, nhiều phụ nữ đã và đang có những đóng góp quan trọng trong ngành công nghệ thông tin, một ngành mà người ta thường nghĩ chỉ dành cho nam giới.

Điều quan trọng là bạn cần nắm được các bí quyết!

Bởi thế, trong cuốn sách này, bạn sẽ vừa được biết tất cả các nguyên tắc mã hóa, vừa được nghe những bí quyết từ nhiều người phụ nữ làm công việc lập trình tại Pixar hay NASA. Bạn sẽ càng có thêm động lực để học lập trình khi đọc về các sáng tạo của những bạn trẻ trong chương trình Hội Con Gái Lập Trình: từ trò chơi giúp mọi người nhận thấy vẻ đẹp của mình tới hệ thống ánh sáng nhấp nháy theo nhịp điệu âm nhạc.

Lập trình không khó khi có bí quyết trong tay, bạn nhỉ!', N'/assets/images/nxbtre_full_08532023_045341.webp', CAST(213000 AS Decimal(18, 0)), CAST(453400 AS Decimal(18, 0)), 0, 10, 2, 4, NULL)
INSERT [dbo].[tblSach] ([PK_iSachID], [sTensach], [sMota], [sURLanh], [fGiabanmoi], [fGiabancu], [iSoluong], [FK_iTheloaiID], [FK_iTacgiaID], [FK_iNhaxuatbanID], [truong_moi]) VALUES (37, N'Cho tôi xin một vé đi tuổi thơ', N'Cho Tôi Xin Một Vé Đi Tuổi Thơ - Phiên Bản Đặc Biệt

Truyện Cho tôi xin một vé đi tuổi thơ là một trong những tác phẩm bán chạy nhất nhà văn Nguyễn Nhật Ánh. Nhà văn mời người đọc lên chuyến tàu quay ngược trở lại thăm tuổi thơ và tình bạn dễ thương của 4 bạn nhỏ. Những trò chơi dễ thương thời bé, tính cách thật thà, thẳng thắn một cách thông minh và dại dột, những ước mơ tự do trong lòng… khiến cuốn sách có thể làm các bậc phụ huynh lo lắng rồi thở phào. Không chỉ thích hợp với người đọc trẻ, cuốn sách còn có thể hấp dẫn và thực sự có ích cho người lớn trong quan hệ với con mình.

Tác phẩm đạt giải thưởng văn học Asean 2010.

Cho tôi xin một vé đi tuổi thơ đã được chuyển ngữ sang nhiều thứ tiếng như Tiếng Anh, Nhật, Hàn, Thái và phát hành tại nhiều nước thế giới.

“Một câu chuyện ngụ ngôn làm say lòng người lớn và trẻ em. Cho tôi xin một vé đi tuổi thơ sẽ chiếm cảm tình của độc giả Mỹ - Amazon.

Tác phẩm đầy mê hoặc này - gợi nhớ đến Hoàng tử bé của Saint-Exupery – đã khắc họa một cách tài tình sự đa cảm của tuổi thơ đối lập với những phi lý của thế giới người lớn – Publishers Weekly”

Phiên bản đặc biệt kỷ niệm 40 năm ngày thành lập NXB Trẻ được in màu hoàn toàn với những tranh minh họa mới của họa sĩ Đỗ Hoàng Tường.', N'/assets/images/mac_dinh.jpg', CAST(95000 AS Decimal(18, 0)), CAST(110000 AS Decimal(18, 0)), 0, 2, 1, 1, N'                                                                                                    ')
INSERT [dbo].[tblSach] ([PK_iSachID], [sTensach], [sMota], [sURLanh], [fGiabanmoi], [fGiabancu], [iSoluong], [FK_iTheloaiID], [FK_iTacgiaID], [FK_iNhaxuatbanID], [truong_moi]) VALUES (39, N'bb', N'', N'/assets/images/mac_dinh.jpg', CAST(22 AS Decimal(18, 0)), CAST(22 AS Decimal(18, 0)), 22, 2, 2, 1, N'00AAA                                                                                               ')
INSERT [dbo].[tblSach] ([PK_iSachID], [sTensach], [sMota], [sURLanh], [fGiabanmoi], [fGiabancu], [iSoluong], [FK_iTheloaiID], [FK_iTacgiaID], [FK_iNhaxuatbanID], [truong_moi]) VALUES (40, N'Cho tôi xin một vé đi tuổi thơ', N'Cho Tôi Xin Một Vé Đi Tuổi Thơ - Phiên Bản Đặc Biệt

Truyện Cho tôi xin một vé đi tuổi thơ là một trong những tác phẩm bán chạy nhất nhà văn Nguyễn Nhật Ánh. Nhà văn mời người đọc lên chuyến tàu quay ngược trở lại thăm tuổi thơ và tình bạn dễ thương của 4 bạn nhỏ. Những trò chơi dễ thương thời bé, tính cách thật thà, thẳng thắn một cách thông minh và dại dột, những ước mơ tự do trong lòng… khiến cuốn sách có thể làm các bậc phụ huynh lo lắng rồi thở phào. Không chỉ thích hợp với người đọc trẻ, cuốn sách còn có thể hấp dẫn và thực sự có ích cho người lớn trong quan hệ với con mình.

Tác phẩm đạt giải thưởng văn học Asean 2010.

Cho tôi xin một vé đi tuổi thơ đã được chuyển ngữ sang nhiều thứ tiếng như Tiếng Anh, Nhật, Hàn, Thái và phát hành tại nhiều nước thế giới.

“Một câu chuyện ngụ ngôn làm say lòng người lớn và trẻ em. Cho tôi xin một vé đi tuổi thơ sẽ chiếm cảm tình của độc giả Mỹ - Amazon.

Tác phẩm đầy mê hoặc này - gợi nhớ đến Hoàng tử bé của Saint-Exupery – đã khắc họa một cách tài tình sự đa cảm của tuổi thơ đối lập với những phi lý của thế giới người lớn – Publishers Weekly”

Phiên bản đặc biệt kỷ niệm 40 năm ngày thành lập NXB Trẻ được in màu hoàn toàn với những tranh minh họa mới của họa sĩ Đỗ Hoàng Tường.', N'/assets/images/mac_dinh.jpg', CAST(95000 AS Decimal(18, 0)), CAST(110000 AS Decimal(18, 0)), 0, 2, 1, 1, N'66KKK                                                                                               ')
INSERT [dbo].[tblSach] ([PK_iSachID], [sTensach], [sMota], [sURLanh], [fGiabanmoi], [fGiabancu], [iSoluong], [FK_iTheloaiID], [FK_iTacgiaID], [FK_iNhaxuatbanID], [truong_moi]) VALUES (41, N'Cho tôi xin một vé đi tuổi thơ', N'Cho Tôi Xin Một Vé Đi Tuổi Thơ - Phiên Bản Đặc Biệt

Truyện Cho tôi xin một vé đi tuổi thơ là một trong những tác phẩm bán chạy nhất nhà văn Nguyễn Nhật Ánh. Nhà văn mời người đọc lên chuyến tàu quay ngược trở lại thăm tuổi thơ và tình bạn dễ thương của 4 bạn nhỏ. Những trò chơi dễ thương thời bé, tính cách thật thà, thẳng thắn một cách thông minh và dại dột, những ước mơ tự do trong lòng… khiến cuốn sách có thể làm các bậc phụ huynh lo lắng rồi thở phào. Không chỉ thích hợp với người đọc trẻ, cuốn sách còn có thể hấp dẫn và thực sự có ích cho người lớn trong quan hệ với con mình.

Tác phẩm đạt giải thưởng văn học Asean 2010.

Cho tôi xin một vé đi tuổi thơ đã được chuyển ngữ sang nhiều thứ tiếng như Tiếng Anh, Nhật, Hàn, Thái và phát hành tại nhiều nước thế giới.

“Một câu chuyện ngụ ngôn làm say lòng người lớn và trẻ em. Cho tôi xin một vé đi tuổi thơ sẽ chiếm cảm tình của độc giả Mỹ - Amazon.

Tác phẩm đầy mê hoặc này - gợi nhớ đến Hoàng tử bé của Saint-Exupery – đã khắc họa một cách tài tình sự đa cảm của tuổi thơ đối lập với những phi lý của thế giới người lớn – Publishers Weekly”

Phiên bản đặc biệt kỷ niệm 40 năm ngày thành lập NXB Trẻ được in màu hoàn toàn với những tranh minh họa mới của họa sĩ Đỗ Hoàng Tường.', N'/assets/images/mac_dinh.jpg', CAST(95000 AS Decimal(18, 0)), CAST(110000 AS Decimal(18, 0)), 0, 2, 1, 1, N'19LLL                                                                                               ')
INSERT [dbo].[tblSach] ([PK_iSachID], [sTensach], [sMota], [sURLanh], [fGiabanmoi], [fGiabancu], [iSoluong], [FK_iTheloaiID], [FK_iTacgiaID], [FK_iNhaxuatbanID], [truong_moi]) VALUES (43, N'Cho tôi xin một vé đi tuổi thơ', N'Cho Tôi Xin Một Vé Đi Tuổi Thơ - Phiên Bản Đặc Biệt

Truyện Cho tôi xin một vé đi tuổi thơ là một trong những tác phẩm bán chạy nhất nhà văn Nguyễn Nhật Ánh. Nhà văn mời người đọc lên chuyến tàu quay ngược trở lại thăm tuổi thơ và tình bạn dễ thương của 4 bạn nhỏ. Những trò chơi dễ thương thời bé, tính cách thật thà, thẳng thắn một cách thông minh và dại dột, những ước mơ tự do trong lòng… khiến cuốn sách có thể làm các bậc phụ huynh lo lắng rồi thở phào. Không chỉ thích hợp với người đọc trẻ, cuốn sách còn có thể hấp dẫn và thực sự có ích cho người lớn trong quan hệ với con mình.

Tác phẩm đạt giải thưởng văn học Asean 2010.

Cho tôi xin một vé đi tuổi thơ đã được chuyển ngữ sang nhiều thứ tiếng như Tiếng Anh, Nhật, Hàn, Thái và phát hành tại nhiều nước thế giới.

“Một câu chuyện ngụ ngôn làm say lòng người lớn và trẻ em. Cho tôi xin một vé đi tuổi thơ sẽ chiếm cảm tình của độc giả Mỹ - Amazon.

Tác phẩm đầy mê hoặc này - gợi nhớ đến Hoàng tử bé của Saint-Exupery – đã khắc họa một cách tài tình sự đa cảm của tuổi thơ đối lập với những phi lý của thế giới người lớn – Publishers Weekly”

Phiên bản đặc biệt kỷ niệm 40 năm ngày thành lập NXB Trẻ được in màu hoàn toàn với những tranh minh họa mới của họa sĩ Đỗ Hoàng Tường.', N'/assets/images/mac_dinh.jpg', CAST(95000 AS Decimal(18, 0)), CAST(110000 AS Decimal(18, 0)), 0, 2, 1, 1, N'88KKK                                                                                               ')
INSERT [dbo].[tblSach] ([PK_iSachID], [sTensach], [sMota], [sURLanh], [fGiabanmoi], [fGiabancu], [iSoluong], [FK_iTheloaiID], [FK_iTacgiaID], [FK_iNhaxuatbanID], [truong_moi]) VALUES (44, N'Cho tôi xin một vé đi tuổi thơ', N'Cho Tôi Xin Một Vé Đi Tuổi Thơ - Phiên Bản Đặc Biệt

Truyện Cho tôi xin một vé đi tuổi thơ là một trong những tác phẩm bán chạy nhất nhà văn Nguyễn Nhật Ánh. Nhà văn mời người đọc lên chuyến tàu quay ngược trở lại thăm tuổi thơ và tình bạn dễ thương của 4 bạn nhỏ. Những trò chơi dễ thương thời bé, tính cách thật thà, thẳng thắn một cách thông minh và dại dột, những ước mơ tự do trong lòng… khiến cuốn sách có thể làm các bậc phụ huynh lo lắng rồi thở phào. Không chỉ thích hợp với người đọc trẻ, cuốn sách còn có thể hấp dẫn và thực sự có ích cho người lớn trong quan hệ với con mình.

Tác phẩm đạt giải thưởng văn học Asean 2010.

Cho tôi xin một vé đi tuổi thơ đã được chuyển ngữ sang nhiều thứ tiếng như Tiếng Anh, Nhật, Hàn, Thái và phát hành tại nhiều nước thế giới.

“Một câu chuyện ngụ ngôn làm say lòng người lớn và trẻ em. Cho tôi xin một vé đi tuổi thơ sẽ chiếm cảm tình của độc giả Mỹ - Amazon.

Tác phẩm đầy mê hoặc này - gợi nhớ đến Hoàng tử bé của Saint-Exupery – đã khắc họa một cách tài tình sự đa cảm của tuổi thơ đối lập với những phi lý của thế giới người lớn – Publishers Weekly”

Phiên bản đặc biệt kỷ niệm 40 năm ngày thành lập NXB Trẻ được in màu hoàn toàn với những tranh minh họa mới của họa sĩ Đỗ Hoàng Tường.', N'/assets/images/mac_dinh.jpg', CAST(95000 AS Decimal(18, 0)), CAST(110000 AS Decimal(18, 0)), 0, 2, 1, 1, N'88LLL                                                                                               ')
INSERT [dbo].[tblSach] ([PK_iSachID], [sTensach], [sMota], [sURLanh], [fGiabanmoi], [fGiabancu], [iSoluong], [FK_iTheloaiID], [FK_iTacgiaID], [FK_iNhaxuatbanID], [truong_moi]) VALUES (45, N'Cho tôi xin một vé đi tuổi thơ', N'Cho Tôi Xin Một Vé Đi Tuổi Thơ - Phiên Bản Đặc Biệt

Truyện Cho tôi xin một vé đi tuổi thơ là một trong những tác phẩm bán chạy nhất nhà văn Nguyễn Nhật Ánh. Nhà văn mời người đọc lên chuyến tàu quay ngược trở lại thăm tuổi thơ và tình bạn dễ thương của 4 bạn nhỏ. Những trò chơi dễ thương thời bé, tính cách thật thà, thẳng thắn một cách thông minh và dại dột, những ước mơ tự do trong lòng… khiến cuốn sách có thể làm các bậc phụ huynh lo lắng rồi thở phào. Không chỉ thích hợp với người đọc trẻ, cuốn sách còn có thể hấp dẫn và thực sự có ích cho người lớn trong quan hệ với con mình.

Tác phẩm đạt giải thưởng văn học Asean 2010.

Cho tôi xin một vé đi tuổi thơ đã được chuyển ngữ sang nhiều thứ tiếng như Tiếng Anh, Nhật, Hàn, Thái và phát hành tại nhiều nước thế giới.

“Một câu chuyện ngụ ngôn làm say lòng người lớn và trẻ em. Cho tôi xin một vé đi tuổi thơ sẽ chiếm cảm tình của độc giả Mỹ - Amazon.

Tác phẩm đầy mê hoặc này - gợi nhớ đến Hoàng tử bé của Saint-Exupery – đã khắc họa một cách tài tình sự đa cảm của tuổi thơ đối lập với những phi lý của thế giới người lớn – Publishers Weekly”

Phiên bản đặc biệt kỷ niệm 40 năm ngày thành lập NXB Trẻ được in màu hoàn toàn với những tranh minh họa mới của họa sĩ Đỗ Hoàng Tường.', N'/assets/images/mac_dinh.jpg', CAST(95000 AS Decimal(18, 0)), CAST(110000 AS Decimal(18, 0)), 0, 2, 1, 1, N'19LLL                                                                                               ')
SET IDENTITY_INSERT [dbo].[tblSach] OFF
GO
SET IDENTITY_INSERT [dbo].[tblTacgia] ON 

INSERT [dbo].[tblTacgia] ([PK_iTacgiaID], [sTentacgia], [dNgaysinh]) VALUES (1, N'Nguyễn Nhật Ánh', CAST(N'1955-05-07' AS Date))
INSERT [dbo].[tblTacgia] ([PK_iTacgiaID], [sTentacgia], [dNgaysinh]) VALUES (2, N'Tô Hoài', CAST(N'1920-09-27' AS Date))
INSERT [dbo].[tblTacgia] ([PK_iTacgiaID], [sTentacgia], [dNgaysinh]) VALUES (3, N'Dale Carnegie', CAST(N'1888-11-24' AS Date))
INSERT [dbo].[tblTacgia] ([PK_iTacgiaID], [sTentacgia], [dNgaysinh]) VALUES (4, N'J.K. Rowling', CAST(N'1965-07-31' AS Date))
INSERT [dbo].[tblTacgia] ([PK_iTacgiaID], [sTentacgia], [dNgaysinh]) VALUES (5, N'Trần Trọng Kim', CAST(N'1883-01-01' AS Date))
SET IDENTITY_INSERT [dbo].[tblTacgia] OFF
GO
SET IDENTITY_INSERT [dbo].[tblTheloai] ON 

INSERT [dbo].[tblTheloai] ([PK_iTheloaiID], [sTentheloai]) VALUES (1, N'Văn học')
INSERT [dbo].[tblTheloai] ([PK_iTheloaiID], [sTentheloai]) VALUES (2, N'Kỹ năng sống')
INSERT [dbo].[tblTheloai] ([PK_iTheloaiID], [sTentheloai]) VALUES (3, N'Lịch sử Việt Nam')
INSERT [dbo].[tblTheloai] ([PK_iTheloaiID], [sTentheloai]) VALUES (4, N'Tiểu thuyết')
INSERT [dbo].[tblTheloai] ([PK_iTheloaiID], [sTentheloai]) VALUES (5, N'Kinh tế - Quản lý')
INSERT [dbo].[tblTheloai] ([PK_iTheloaiID], [sTentheloai]) VALUES (10, N'Công nghệ')
INSERT [dbo].[tblTheloai] ([PK_iTheloaiID], [sTentheloai]) VALUES (11, N'Ngoại ngữ')
SET IDENTITY_INSERT [dbo].[tblTheloai] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__tblNguoi__07DACB0897E7542F]    Script Date: 7/19/2025 1:12:53 PM ******/
ALTER TABLE [dbo].[tblNguoidung] ADD UNIQUE NONCLUSTERED 
(
	[sEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblDathang] ADD  DEFAULT (getdate()) FOR [dNgaydathang]
GO
ALTER TABLE [dbo].[tblNguoidung] ADD  DEFAULT (getdate()) FOR [dNgaydangky]
GO
ALTER TABLE [dbo].[tblNguoidung] ADD  DEFAULT ('USER') FOR [sQuyen]
GO
ALTER TABLE [dbo].[tblSach] ADD  DEFAULT ((0)) FOR [iSoluong]
GO
ALTER TABLE [dbo].[tblChitietdathang]  WITH CHECK ADD FOREIGN KEY([FK_iDathangID])
REFERENCES [dbo].[tblDathang] ([PK_iDathangID])
GO
ALTER TABLE [dbo].[tblChitietdathang]  WITH CHECK ADD FOREIGN KEY([FK_iSachID])
REFERENCES [dbo].[tblSach] ([PK_iSachID])
GO
ALTER TABLE [dbo].[tblDathang]  WITH CHECK ADD FOREIGN KEY([FK_iNguoidungID])
REFERENCES [dbo].[tblNguoidung] ([PK_iNguoidungID])
GO
ALTER TABLE [dbo].[tblSach]  WITH CHECK ADD FOREIGN KEY([FK_iNhaxuatbanID])
REFERENCES [dbo].[tblNhaxuatban] ([PK_iNhaxuatbanID])
GO
ALTER TABLE [dbo].[tblSach]  WITH CHECK ADD FOREIGN KEY([FK_iTacgiaID])
REFERENCES [dbo].[tblTacgia] ([PK_iTacgiaID])
GO
ALTER TABLE [dbo].[tblSach]  WITH CHECK ADD FOREIGN KEY([FK_iTheloaiID])
REFERENCES [dbo].[tblTheloai] ([PK_iTheloaiID])
GO
ALTER TABLE [dbo].[tblChitietdathang]  WITH CHECK ADD CHECK  (([iSoluong]>(0)))
GO
ALTER TABLE [dbo].[tblSach]  WITH CHECK ADD CHECK  (([fGiabanmoi]>=(0)))
GO
ALTER TABLE [dbo].[tblSach]  WITH CHECK ADD CHECK  (([iSoluong]>=(0)))
GO
/****** Object:  StoredProcedure [dbo].[spDonhang_Filter]    Script Date: 7/19/2025 1:12:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spDonhang_Filter]
@tensach nvarchar(200) = null,
@tungay datetime = null,
@denngay datetime = null
as
select DISTINCT ctdh.PK_iChitietdathangID, dh.dNgaydathang, (ctdh.fGiaban * ctdh.iSoluong) as fTongthanhtien, dh.sDiachinhanhang, dh.sSDTnhanhang,
 ctdh.sTrangThai, dh.sNguoiNhan, dh.sPhuongThucTT, s.sTensach, nd.sTennguoidung, ctdh.iSoluong, ctdh.fGiaban

from tblChitietdathang ctdh join tblDathang dh on ctdh.FK_iDathangID = dh.PK_iDathangID
							join tblSach s on ctdh.FK_iSachID = s.PK_iSachID
							join tblNguoidung nd on dh.FK_iNguoidungID = nd.PK_iNguoidungID
where 
(@tensach IS NULL OR s.sTensach LIKE '%' + @tensach + '%')
        
        AND (@tungay IS NULL OR dh.dNgaydathang >= @tungay)
        
        AND (@denngay IS NULL OR dh.dNgaydathang < DATEADD(day, 1, @denngay));
GO
/****** Object:  StoredProcedure [dbo].[spNguoidung_GetLichSuMuaHang]    Script Date: 7/19/2025 1:12:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[spNguoidung_GetLichSuMuaHang]
@maNguoiDung int
as
select s.sTensach, ctdh.iSoluong, ctdh.fGiaban, dh.dNgaydathang, dh.sPhuongThucTT, dh.sDiachinhanhang
, dh.sSDTnhanhang
from tblDathang dh join tblChitietdathang ctdh on dh.PK_iDathangID = ctdh.FK_iDathangID
					join tblNguoidung nd on dh.FK_iNguoidungID = nd.PK_iNguoidungID
			, tblSach s
where ctdh.FK_iSachID = s.PK_iSachID and nd.PK_iNguoidungID = @maNguoiDung;
GO
/****** Object:  StoredProcedure [dbo].[spSach_GetByFilter]    Script Date: 7/19/2025 1:12:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spSach_GetByFilter]
    @TheloaiIDs VARCHAR(MAX) = NULL, -- Thay đổi: Nhận chuỗi ID (vd: '1,2,3')
    @NXB_IDs     VARCHAR(MAX) = NULL,
    @SortByPrice VARCHAR(4) = NULL,
    @CurrentPage INT,
    @PageSize   INT
AS
BEGIN
    WITH SachFiltered AS (
        SELECT PK_iSachID, sTensach, sURLanh, fGiabanmoi, fGiabancu
        FROM tblSach
        WHERE
            -- Điều kiện lọc động cho nhiều thể loại
            (@TheloaiIDs IS NULL OR FK_iTheloaiID IN (SELECT value FROM STRING_SPLIT(@TheloaiIDs, ',')))
            AND
            (@NXB_IDs IS NULL OR FK_iNhaxuatbanID IN (SELECT value FROM STRING_SPLIT(@NXB_IDs, ',')))
    )
    SELECT 
        PK_iSachID, sTensach, sURLanh, fGiabanmoi, fGiabancu,
        (SELECT COUNT(*) FROM SachFiltered) AS tongsobanghi
    FROM 
        SachFiltered
    ORDER BY
        CASE WHEN @SortByPrice = 'ASC' THEN fGiabanmoi END ASC,
        CASE WHEN @SortByPrice = 'DESC' THEN fGiabanmoi END DESC,
        CASE WHEN @SortByPrice IS NULL THEN PK_iSachID END ASC
    OFFSET (@CurrentPage - 1) * @PageSize ROWS
    FETCH NEXT @PageSize ROWS ONLY
END
GO
