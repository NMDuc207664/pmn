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
	[SoLuongPhong] [tinyint] NOT NULL,
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
