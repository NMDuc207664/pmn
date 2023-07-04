USE [QLDatPhongKhachSan]
GO

/****** Object:  Table [dbo].[DichVu]    Script Date: 27/06/2023 10:46:05 CH ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DichVu](
	[MaDichVu] [varchar](5) NOT NULL,
	[TenDichVu] [varchar](50) NOT NULL,
	[GiaDichVu] [int] NOT NULL,
 CONSTRAINT [PK_DichVu] PRIMARY KEY CLUSTERED 
(
	[MaDichVu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


CREATE TABLE [dbo].[LoaiPhong](
	[MaLoaiPhong] [varchar](5) NOT NULL,
	[TenLoaiPhong] [varchar](50) NOT NULL,
	[SoNguoiToiDa] [tinyint] NOT NULL,
	[GiaPhong] [int] NOT NULL,
	[ThongTinPhong] [varchar](2000) NOT NULL,
 CONSTRAINT [PK_Loại Phòng] PRIMARY KEY CLUSTERED 
(
	[MaLoaiPhong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[PhongChoThue](
	[MaPhong] [varchar](5) NOT NULL,
	[TenPhong] [varchar](3) NOT NULL,
	[MaLoaiPhong] [varchar](5) NOT NULL,
	[TinhTrang] [tinyint] NOT NULL,
	[MaPhieu] [varchar](10) NULL,
 CONSTRAINT [PK_Phòng cho thuê] PRIMARY KEY CLUSTERED 
(
	[MaPhong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[PhongChoThue]  WITH CHECK ADD  CONSTRAINT [FK_PhongChoThue_LoaiPhong1] FOREIGN KEY([MaLoaiPhong])
REFERENCES [dbo].[LoaiPhong] ([MaLoaiPhong])
GO

ALTER TABLE [dbo].[PhongChoThue] CHECK CONSTRAINT [FK_PhongChoThue_LoaiPhong1]
GO

ALTER TABLE [dbo].[PhongChoThue]  WITH CHECK ADD  CONSTRAINT [FK_PhongChoThue_PhieuDatPhong] FOREIGN KEY([MaPhieu])
REFERENCES [dbo].[PhieuDatPhong] ([MaPhieu])
GO

ALTER TABLE [dbo].[PhongChoThue] CHECK CONSTRAINT [FK_PhongChoThue_PhieuDatPhong]
GO

CREATE TABLE [dbo].[PhieuDatPhong](
	[MaPhieu] [varchar](10) NOT NULL,
	[TenKhachHang] [nvarchar](50) NOT NULL,
	[SDT] [varchar](15) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[DiaChi] [nvarchar](200) NOT NULL,
	[SoNguoiLon] [tinyint] NOT NULL,
	[SoTreEm] [tinyint] NOT NULL,
	[NgayDenNhan] [date] NOT NULL,
	[NgayTra] [date] NOT NULL,
	[MaLoaiPhong] [varchar](5) NOT NULL,
	[MaDichVu] [varchar](5) NULL,
	[GhiChu] [nvarchar](300) NULL,
 CONSTRAINT [PK_Khách Hàng] PRIMARY KEY CLUSTERED 
(
	[MaPhieu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[PhieuDatPhong]  WITH CHECK ADD  CONSTRAINT [FK_PhieuDatPhong_DichVu] FOREIGN KEY([MaDichVu])
REFERENCES [dbo].[DichVu] ([MaDichVu])
GO

ALTER TABLE [dbo].[PhieuDatPhong] CHECK CONSTRAINT [FK_PhieuDatPhong_DichVu]
GO

ALTER TABLE [dbo].[PhieuDatPhong]  WITH CHECK ADD  CONSTRAINT [FK_PhieuDatPhong_LoaiPhong] FOREIGN KEY([MaLoaiPhong])
REFERENCES [dbo].[LoaiPhong] ([MaLoaiPhong])
GO

ALTER TABLE [dbo].[PhieuDatPhong] CHECK CONSTRAINT [FK_PhieuDatPhong_LoaiPhong]
GO

CREATE TABLE [dbo].[HoaDon](
	[MaHoaDon] [varchar](10) NOT NULL,
	[MaPhieu] [varchar](10) NOT NULL,
	[SoThe] [varchar](20) NOT NULL,
	[TenThe] [nvarchar](50) NOT NULL,
	[GiaDatCoc] [int] NOT NULL,
	[NgayLap] [date] NOT NULL,
	[NguoiLap] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Hóa Đơn] PRIMARY KEY CLUSTERED 
(
	[MaHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_PhieuDatPhong] FOREIGN KEY([MaPhieu])
REFERENCES [dbo].[PhieuDatPhong] ([MaPhieu])
GO

ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_PhieuDatPhong]
GO

insert into DichVu(MaDichVu,TenDichVu,GiaDichVu)
values	('S0001', 'At-room Meal Service', 50000),
		('S0002', 'Laundry', 150000),
		('S0003', 'Special Celebration', 80000),
		('S0004', 'Tour Guide', 120000),
		('S0005', 'Car Rental', 100000),
		('S0006', 'Combo tour', 300000)

insert into LoaiPhong(MaLoaiPhong,TenLoaiPhong,SoNguoiToiDa,GiaPhong,ThongTinPhong)
values	('T0001', 'Single Room', 2, 400000, N'Size : 18m2 , 1 double bed. Recieve/ Return between 12h to 14h, no pet or smoking allow'),
		('T0002', 'Twin Room', 2, 500000, N'Size : 20m2 , 2 single bed. Recieve/ Return between 12h to 14h, no pet or smoking allow'),
		('T0003', 'Double Room', 4, 600000, N'Size : 20m2 , 2 double bed. Recieve/ Return between 12h to 14h, no pet or smoking allow'),
		('T0004', 'Sea View Room', 2, 500000, N'Size : 20m2 , 1 double bed. Recieve/ Return between 12h to 14h, no pet or smoking allow, have a sea-view balcony'),
		('T0005', 'Deluxe Sea View Room', 4, 700000, N'Size : 22m2 , 2 double bed. Recieve/ Return between 12h to 14h, no pet or smoking allow, have a sea-view balcony'),
		('T0006', 'Queen Size Room', 2, 900000, N'Size : 25m2 , 2 single bed. Recieve/ Return between 12h to 13h, no pet or smoking allow , have bathtub, workdesk and sofa  '),
		('T0007', 'King Size Room', 4, 1100000, N'Size : 30m2 , 2 double bed. Recieve/ Return between 12h to 13h, no pet or smoking allow, have a sea-view balcony , have bathtub, workdesk and sofa  ')

insert into PhieuDatPhong(MaPhieu,TenKhachHang,SDT,Email,DiaChi,SoNguoiLon,SoTreEm,NgayDenNhan,NgayTra,MaLoaiPhong,MaDichVu,GhiChu)
values	('57123', N'Hoàng Anh Lan', '0934562123', 'hoaphanlan@gmail.com', N'15 Phố Yên Phụ, Yên Phụ, Tây Hồ, Hà Nội', 2, 3,'2020-07-10', '2020-07-12', 'T0007', NULL, N'Chọn phòng gần mặt đất'),
		('57167', N'Robinho', '0823786492', 'hawaiLinh111@gmail.com', N'16 Hàng Bài, Tràng Tiền, Hoàn Kiếm, Hà Nội ', 4, 5,'2020-07-29', '2020-08-01', 'T0005', 'S0006', NULL),
		('57231', N'Trần Tấn Tài', '0867447424', 'tranLike123@gmail.com', N'4 Thụy Khuê, Thuỵ Khuê, Tây Hồ, Hà Nội', 1, 0,'2020-07-24', '2020-07-28', 'T0004', 'S0001', N'Phòng trên tầng cao cho cảnh nhìn đẹp nhưng không quá tầng 7'),
		('57456', N'Nguyễn Trường Sơn', '0932367864', 'laphan0909@gmail.com', N'45 ngõ 107 Xã Đàn, Đống Đa, Hà Nội', 2, 2,'2020-06-24', '2020-06-27', 'T0003', 'S0002', NULL),
		('57543', N'Nguyễn Vũ Phong', '0978654512', 'nguyencv1911@gmail.com', N'16 láng, đống đa , hà nội', 1, 1,'2020-07-16', '2020-07-18', 'T0004', NULL, NULL),
		('57623', N'Trần Gia Huy', '0857434109', 'huyDutCan@gmail.com', N'90 Đường Cầu Giấy, Đống Đa, Hà Nội', 6, 0,'2020-07-01', '2020-07-04', 'T0005', 'S0005', NULL),
		('57864', N'Phan Hồng Hoa', '0945453443', 'hoaphan1234@gmail.com', N'23 ngõ 6 Hồ Đắc Di, Đống Đa, Hà Nội', 1, 0,'2020-06-23', '2020-06-27', 'T0001', NULL, NULL),
		('58093', N'Hadian', '0857055653', 'arknightRef@gmail.com', N'Ngõ 8 Ngọc Hồi, Hoàng Liệt, Hoàng Mai, Hà Nội', 2, 0,'2020-07-27', '2020-08-05', 'T0006', 'S0003', NULL),
		('58234', N'Phạm Thành Giang', '0932487139', 'phamtg203@gmail.com', N'13 ngõ 10 giảng phóng , đống đa ', 3, 0,'2020-07-14', '2023-07-18', 'T0007', 'S0006', NULL)

insert into PhongChoThue(MaPhong,TenPhong,MaLoaiPhong,TinhTrang,MaPhieu)
values  ('R0001', '301', 'T0004', 0, NULL),
		('R0003', '303', 'T0004', 2, '57231'),
		('R0004', '304', 'T0003', 1, '57456'),
		('R0010', '310', 'T0001', 1, '57864'),
		('R0012', '312', 'T0006', 3, NULL),
		('R0015', '315', 'T0006', 3, NULL),
		('R0018', '402', 'T0005', 2, '57623'),
		('R0021', '405', 'T0002', 0, NULL),
		('R0024', '408', 'T0007', 2, '58234'),
		('R0033', '501', 'T0005', 2, '57167'),
		('R0036', '504', 'T0007', 0, NULL),
		('R0039', '507', 'T0007', 2, '58093')

insert into HoaDon(MaHoaDon,MaPhieu,SoThe,TenThe,GiaDatCoc,NgayLap ,NguoiLap)
values	('HD09845677','57167', '7647621095231',N'Trần Lan Anh', 1000000, '2020-07-26', N'Hoàn Vương Tạ'),
		('HD13124144','57123', '4636547709123',N'Nguyễn Vũ Phan', 550000, '2020-07-08', N'Hoàng Lan Anh'),
		('HD21434234','57456', '8352682565109',N'Nguyễn Trường Sơn', 450000, '2020-06-20', N'Hoàn Vương Tạ'),
		('HD32848238','57231', '4864369915283',N'Trần Tấn Tài', 300000, '2020-07-23', N'Trần Lam'),
		('HD34567887','57623', '3413413431906',N'Trần Gia Huy', 800000, '2020-06-27', N'Trần Lam'),
		('HD42454452','58093', '0963827391947',N'Schwarz', 530000, '2020-07-25', N'Trần Lam'),
		('HD43245142','58234', '2136464146742',N'Phạm Thành Giang', 850000, '2020-07-02', N'Trần Lam'),
		('HD48527942','57543', '7546854753643',N'Nguyễn Vũ Phong', 250000, '2020-07-15', N'Hoàng Lan Anh'),
		('HD76318373','57864', '8741740952876',N'Phan Hồng Hoa', 200000, '2020-06-18', N'Trần Lam')