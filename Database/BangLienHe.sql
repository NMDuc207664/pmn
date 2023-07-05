USE [QLDatPhongKhachSan]
GO

/****** Object:  Table [dbo].[LienHe]    Script Date: 05/07/2023 7:24:29 CH ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[LienHe](
	[MaTinNhan] [varchar](10) NOT NULL,
	[TenNguoiGui] [nvarchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[SDT] [varchar](15) NOT NULL,
	[ChuDe] [nvarchar](100) NOT NULL,
	[GhiChu] [nvarchar](300) NOT NULL,
 CONSTRAINT [PK_LienHe] PRIMARY KEY CLUSTERED 
(
	[MaTinNhan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


