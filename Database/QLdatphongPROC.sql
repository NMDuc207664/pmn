use QLDatPhongKhachSan;
GO
----Ứng với mỗi bảng trong CSDL, 4 Stored Procedure ứng với 4 công việc Insert/Update/Delete/Select. 
----Trong đó Stored Procedure Update và Delete lấy khóa chính làm tham số.

----Bang DichVu
CREATE PROC INSERT_DichVu
@MaDichVu VARCHAR(5),
@TenDichVu VARCHAR(50),
@GiaDichVu int,
@RESULT NVARCHAR(100) output
AS
BEGIN
	DECLARE @COUNTS INT = 0;
	DECLARE @error INT;
	DECLARE @id INT;
	SELECT @COUNTS = COUNT(*) FROM DichVu A WHERE A.MaDichVu=@MaDichVu;
	IF @COUNTS >= 1
		SET @RESULT = N'Tồn tại loại dịch vụ ' + @MaDichVu;
	ELSE
		BEGIN
			INSERT INTO DichVu VALUES (@MaDichVu,@TenDichVu,@GiaDichVu);
			SELECT @error = @@ERROR, @id = SCOPE_IDENTITY(); 
			IF @error = 0
				SET @RESULT = N'Đã tạo dữ liệu cho mã dịch vụ là: '+@MaDichVu;
			ELSE
				SET @RESULT = N'Đã xảy ra lỗi với mã lỗi: '+@id;
		END;
END;
DECLARE @RESULT NVARCHAR(100);
EXEC INSERT_DichVu '',N'','','',@RESULT OUTPUT;
SELECT @RESULT AS MESSAGES_RESULT;

CREATE PROC UPDATE_DichVu
@KEY VARCHAR(5),
@TenDichVu VARCHAR(50),
@GiaDichVu int,
@RESULT NVARCHAR(100) output
AS
BEGIN
	DECLARE @COUNTS INT = 0;
	DECLARE @error INT;
	DECLARE @id INT;
	SELECT @COUNTS = COUNT(*) FROM DichVu A WHERE A.MaDichVu = @KEY;
	IF @COUNTS = 0
		SET @RESULT = N'Không tìm thấy mã dịch vụ: '+@KEY;
	ELSE
		BEGIN
			UPDATE DichVu SET TenDichVu=@TenDichVu , GiaDichVu=@GiaDichVu WHERE MaDichVu = @KEY;
			SELECT @error = @@ERROR, @id = SCOPE_IDENTITY(); 
			IF @error = 0
				SET @RESULT = N'Đã cập nhật thông tin với mã dịch vụ: '+@KEY;
			ELSE
				SET @RESULT = N'Đã xảy ra lỗi cập nhật';
		END;
END;
DECLARE @RESULT NVARCHAR(100);
EXEC UPDATE_DichVu '',N'','','',@RESULT OUTPUT;
SELECT @RESULT AS MESSAGES_RESULT;

CREATE PROC DELETE_DichVu
@KEY VARCHAR(5),
@RESULT NVARCHAR(100) output
AS
BEGIN
	DECLARE @COUNTS INT = 0;
	DECLARE @error INT;
	SELECT @COUNTS = COUNT(*) FROM DichVu A WHERE A.MaDichVu = @KEY;
	IF @COUNTS = 0
		SET @RESULT = N'Không tìm thấy mã dịch vụ: '+@KEY;
	ELSE
		BEGIN
			DELETE FROM DichVu WHERE MaDichVu = @KEY;
			SELECT @error = @@ERROR; 
			IF @error = 0
				SET @RESULT = N'Đã xóa mã dịch vụ: '+@KEY;
			ELSE
				PRINT 'Đã xảy ra lỗi khi xóa mã dịch vụ: '+@KEY;
		END;
END;
DECLARE @RESULT NVARCHAR(100);
EXEC DELETE_DichVu '',@RESULT OUTPUT;
SELECT @RESULT AS MESSAGES_RESULT;

CREATE PROC SELECT_DichVu
@KEY VARCHAR(5),
@RESULT NVARCHAR(100) output
AS
BEGIN
	DECLARE @COUNTS INT = 0;
	DECLARE @error INT;
	SELECT @COUNTS = COUNT(*) FROM DichVu A WHERE A.MaDichVu = @KEY;
	IF @COUNTS = 0
		SET @RESULT = N'Không tìm thấy dịch vụ: '+@KEY;
	ELSE
		BEGIN
			SELECT * FROM DichVu A WHERE A.MaDichVu = @KEY;
			SET @RESULT =N'Tìm thấy được'+CAST(@COUNTS AS NVARCHAR(100))+' bản ghi';
		END
END;
DECLARE @RESULT NVARCHAR(100);
EXEC SELECT_DichVu '',@RESULT OUTPUT;
SELECT @RESULT AS MESSAGES_RESULT;


--Bang HoaDon
CREATE PROC INSERT_HoaDon
@MaHoaDon VARCHAR(10),
@MaPhieu VARCHAR(10),
@SoThe VARCHAR(20),
@TenThe NVARCHAR(50),
@GiaDatCoc int,
@NgayLap date,
@NguoiLap NVARCHAR(50),
@RESULT NVARCHAR(100) output
AS
BEGIN
	DECLARE @COUNTS INT = 0;
	DECLARE @COUNTS1 INT = 0;
	DECLARE @error INT;
	DECLARE @id INT;
	SELECT @COUNTS = COUNT(*) FROM HoaDon A WHERE A.MaHoaDon=@MaHoaDon;
	SELECT @COUNTS1 = COUNT(*) FROM PhieuDatPhong P WHERE P.MaPhieu=@MaPhieu;
	IF @COUNTS >= 1
		SET @RESULT = N'Đã tồn tại hóa đơn '+@MaHoaDon;
	ELSE IF @COUNTS1 < 1
		SET @RESULT = N'Không tồn tại mã phiếu '+@MaPhieu;
	ELSE
		BEGIN
			INSERT INTO HoaDon VALUES (@MaHoaDon,@MaPhieu,@SoThe,@TenThe,@GiaDatCoc,@NgayLap ,@NguoiLap);
			SELECT @error = @@ERROR, @id = SCOPE_IDENTITY(); 
			IF @error = 0
				SET @RESULT = N'Đã tạo dữ liệu cho mã hóa đơn là: '+@MaHoaDon;
			ELSE
				SET @RESULT = N'Đã xảy ra lỗi với mã lỗi: '+@id;
		END;
END;
DECLARE @RESULT NVARCHAR(100);
EXEC INSERT_HoaDon '',N'',N'',@RESULT OUTPUT;
SELECT @RESULT AS MESSAGES_RESULT;

CREATE PROC UPDATE_HoaDon
@KEY VARCHAR(10),
@MaPhieu VARCHAR(10),
@SoThe VARCHAR(20),
@TenThe NVARCHAR(50),
@GiaDatCoc int,
@NgayLap date,
@NguoiLap NVARCHAR(50),
@RESULT NVARCHAR(100) output
AS
BEGIN
	DECLARE @COUNTS INT = 0;
	DECLARE @COUNTS1 INT = 0;
	DECLARE @error INT;
	DECLARE @id INT;
	SELECT @COUNTS = COUNT(*) FROM HoaDon A WHERE A.MaHoaDon=@KEY;
	SELECT @COUNTS1 = COUNT(*) FROM PhieuDatPhong A WHERE A.MaPhieu=@MaPhieu;
	IF @COUNTS = 0
		SET @RESULT = N'Không tìm thấy mã hóa đơn: '+@KEY;
	ELSE IF @COUNTS1 < 1
		SET @RESULT = N'Không tồn tại mã phiếu '+@MaPhieu;
	ELSE
		BEGIN
			UPDATE HoaDon SET MaPhieu=@MaPhieu, SoThe=@SoThe, TenThe=@TenThe, GiaDatCoc=@GiaDatCoc, NgayLap=@NgayLap, NguoiLap=@NguoiLap WHERE MaHoaDon = @KEY;
			SELECT @error = @@ERROR, @id = SCOPE_IDENTITY(); 
			IF @error = 0
				SET @RESULT = N'Đã cập nhật thông tin với mã hóa đơn: '+@KEY;
			ELSE
				SET @RESULT = N'Đã xảy ra lỗi cập nhật';
		END;
END;
DECLARE @RESULT NVARCHAR(100);
EXEC UPDATE_HoaDon '',N'',N'',@RESULT OUTPUT;
SELECT @RESULT AS MESSAGES_RESULT;

CREATE PROC DELETE_HoaDon
@KEY VARCHAR(10),
@RESULT NVARCHAR(100) output
AS
BEGIN
	DECLARE @COUNTS INT = 0;
	DECLARE @error INT;
	SELECT @COUNTS = COUNT(*) FROM HoaDon A WHERE A.MaHoaDon = @KEY;
	IF @COUNTS = 0
		SET @RESULT = N'Không tìm thấy mã hóa đơn: '+@KEY;
	ELSE
		BEGIN
			DELETE FROM HoaDon WHERE MaHoaDon = @KEY;
			SELECT @error = @@ERROR; 
			IF @error = 0
				SET @RESULT = N'Đã xóa mã hóa đơn: '+@KEY;
			ELSE
				PRINT 'Đã xảy ra lỗi khi xóa mã hóa đơn: '+@KEY;
		END
END;
DECLARE @RESULT NVARCHAR(100);
EXEC DELETE_HoaDon '',@RESULT OUTPUT;
SELECT @RESULT AS MESSAGES_RESULT;

CREATE PROC SELECT_HoaDon
@KEY VARCHAR(10),
@RESULT NVARCHAR(100) output
AS
BEGIN
	DECLARE @COUNTS INT = 0;
	DECLARE @error INT;
	SELECT @COUNTS = COUNT(*) FROM HoaDon A WHERE A.MaHoaDon = @KEY;
	IF @COUNTS = 0
		SET @RESULT = N'Không tìm thấy hóa đơn: '+@KEY;
	ELSE
		BEGIN
			SELECT * FROM HoaDon A WHERE A.MaHoaDon=@KEY;
			SET @RESULT =N'Tìm thấy được'+CAST(@COUNTS AS NVARCHAR(100))+' bản ghi';
		END
END;
DECLARE @RESULT NVARCHAR(100);
EXEC SELECT_HoaDon '',@RESULT OUTPUT;
SELECT @RESULT AS MESSAGES_RESULT;


--Bang LoaiPhong
CREATE PROC INSERT_LoaiPhong
@MaLoaiPhong VARCHAR(5),
@TenLoaiPhong VARCHAR(50),
@SoNguoiToiDa tinyint,
@GiaPhong int,
@ThongTinPhong VARCHAR(2000),
@RESULT NVARCHAR(100) output
AS
BEGIN
	DECLARE @COUNTS INT = 0;
	DECLARE @error INT;
	DECLARE @id INT;
	SELECT @COUNTS = COUNT(*) FROM LoaiPhong A WHERE A.MaLoaiPhong=@MaLoaiPhong;
	IF @COUNTS >= 1
		SET @RESULT = N'Tồn tại mã loại phòng '+ @MaLoaiPhong;
	ELSE
		BEGIN
			INSERT INTO LoaiPhong VALUES (@MaLoaiPhong,@TenLoaiPhong,@SoNguoiToiDa,@GiaPhong,@ThongTinPhong);
			SELECT @error = @@ERROR, @id = SCOPE_IDENTITY(); 
			IF @error = 0
				SET @RESULT = N'Đã tạo dữ liệu cho mã loại phòng là: '+@MaLoaiPhong;
			ELSE
				SET @RESULT = N'Đã xảy ra lỗi với mã lỗi: '+@id;
		END;
END;
DECLARE @RESULT NVARCHAR(100);
EXEC INSERT_LoaiPhong '',N'',@RESULT OUTPUT;
SELECT @RESULT AS MESSAGES_RESULT;

CREATE PROC UPDATE_LoaiPhong
@KEY VARCHAR(5),
@TenLoaiPhong VARCHAR(50),
@SoNguoiToiDa tinyint,
@GiaPhong int,
@ThongTinPhong VARCHAR(2000),
@RESULT NVARCHAR(100) output
AS
BEGIN
	DECLARE @COUNTS INT = 0;
	DECLARE @error INT;
	DECLARE @id INT;
	SELECT @COUNTS = COUNT(*) FROM LoaiPhong A WHERE A.MaLoaiPhong = @KEY;
	IF @COUNTS = 0
		SET @RESULT = N'Không tìm thấy mã loại phòng: '+@KEY;
	ELSE
		BEGIN
			UPDATE LoaiPhong SET TenLoaiPhong=@TenLoaiPhong, SoNguoiToiDa=@SoNguoiToiDa, GiaPhong=@GiaPhong, ThongTinPhong=@ThongTinPhong WHERE MaLoaiPhong = @KEY;
			SELECT @error = @@ERROR, @id = SCOPE_IDENTITY(); 
			IF @error = 0
				SET @RESULT = N'Đã cập nhật thông tin với mã loại phòng: '+@KEY;
			ELSE
				SET @RESULT = N'Đã xảy ra lỗi cập nhật';
		END;
END;
DECLARE @RESULT NVARCHAR(100);
EXEC UPDATE_LoaiPhong '',N'',@RESULT OUTPUT;
SELECT @RESULT AS MESSAGES_RESULT;

CREATE PROC DELETE_LoaiPhong 
@KEY VARCHAR(5),
@RESULT NVARCHAR(100) output
AS
BEGIN
	DECLARE @COUNTS INT = 0;
	DECLARE @error INT;
	SELECT @COUNTS = COUNT(*) FROM LoaiPhong A WHERE A.MaLoaiPhong  = @KEY;
	IF @COUNTS = 0
		SET @RESULT = N'Không tìm thấy mã loại phòng: '+@KEY;
	ELSE
		BEGIN
			DELETE FROM LoaiPhong WHERE MaLoaiPhong = @KEY;
			SELECT @error = @@ERROR; 
			IF @error = 0
				SET @RESULT = N'Đã xóa mã loại phòng: '+@KEY;
			ELSE
				PRINT 'Đã xảy ra lỗi khi xóa mã loại phòng: '+@KEY;
		END
END;
DECLARE @RESULT NVARCHAR(100);
EXEC DELETE_LoaiPhong '',@RESULT OUTPUT;
SELECT @RESULT AS MESSAGES_RESULT;

CREATE PROC SELECT_LoaiPhong 
@KEY VARCHAR(5),
@RESULT NVARCHAR(100) output
AS
BEGIN
	DECLARE @COUNTS INT = 0;
	DECLARE @error INT;
	SELECT @COUNTS = COUNT(*) FROM LoaiPhong A WHERE A.MaLoaiPhong  = @KEY;
	IF @COUNTS = 0
		SET @RESULT = N'Không tìm thấy mã loại phòng: '+@KEY;
	ELSE
		BEGIN
			SELECT * FROM LoaiPhong A WHERE A.MaLoaiPhong =@KEY;
			SET @RESULT =N'Tìm thấy được'+CAST(@COUNTS AS NVARCHAR(100))+' bản ghi';
		END
END;
DECLARE @RESULT NVARCHAR(100);
EXEC SELECT_LoaiPhong '',@RESULT OUTPUT;
SELECT @RESULT AS MESSAGES_RESULT;


--Bang PhongChoThue
CREATE PROC INSERT_PhongChoThue
@MaPhong VARCHAR(5),
@TenPhong VARCHAR(3),
@MaLoaiPhong VARCHAR(5),
@TinhTrang tinyint,
@MaPhieu VARCHAR(10),
@RESULT NVARCHAR(100) output
AS
BEGIN
	DECLARE @COUNTS INT = 0;
	DECLARE @COUNTS1 INT = 0;
	DECLARE @COUNTS2 INT = 0;
	DECLARE @error INT;
	DECLARE @id INT;
	SELECT @COUNTS = COUNT(*) FROM PhongChoThue A WHERE A.MaPhong=@MaPhong;
	SELECT @COUNTS1 = COUNT(*) FROM LoaiPhong L WHERE L.MaLoaiPhong=@MaLoaiPhong;
	SELECT @COUNTS2 = COUNT(*) FROM PhieuDatPhong P WHERE P.MaPhieu=@MaPhieu;
	IF @COUNTS >=1
		SET @RESULT = N'Tồn tại mã mã phòng: '+@MaPhong;
	ELSE IF @COUNTS1 < 1
		SET @RESULT = N'Không tồn tại mã loại phòng '+@MaLoaiPhong;
	ELSE IF @MaPhieu = Null and (@TinhTrang = 1 or @TinhTrang = 2)
		SET @RESULT = N'Xin nhập lại đủ mã phiếu nếu phòng đang đặt hoặc ở  ';
	ELSE IF @COUNTS2 < 1 and @MaPhieu != null
		SET @RESULT = N'Không tồn tại mã phiếu '+@MaPhieu;
	ELSE IF @MaPhieu != Null and (@TinhTrang = 0 or @TinhTrang = 3)
		SET @RESULT = N'Xin kiểm tra lại tình trạng phòng đang đặt hoặc ở  ';
	ELSE
		BEGIN
			INSERT INTO PhongChoThue VALUES (@MaPhong,@TenPhong,@MaLoaiPhong,@TinhTrang,@MaPhieu);
			SELECT @error = @@ERROR, @id = SCOPE_IDENTITY(); 
			IF @error = 0
				SET @RESULT = N'Đã tạo dữ liệu cho mã phòng là: '+@MaPhong;
			ELSE
				SET @RESULT = N'Đã xảy ra lỗi với mã lỗi: '+@id;
		END;
END;
DECLARE @RESULT NVARCHAR(100);
EXEC INSERT_PhongChoThue '',N'',@RESULT OUTPUT;
SELECT @RESULT AS MESSAGES_RESULT;

CREATE PROC UPDATE_PhongChoThue
@KEY VARCHAR(5),
@TenPhong VARCHAR(3),
@MaLoaiPhong VARCHAR(5),
@TinhTrang tinyint,
@MaPhieu VARCHAR(10),
@RESULT NVARCHAR(100) output
AS
BEGIN
	DECLARE @COUNTS INT = 0;
	DECLARE @error INT;
	DECLARE @id INT;
	SELECT @COUNTS = COUNT(*) FROM PhongChoThue A WHERE A.MaPhong = @KEY;
	IF @COUNTS = 0
		SET @RESULT = N'Không tìm thấy mã phòng: '+@KEY;
	ELSE
		BEGIN
			UPDATE PhongChoThue SET TenPhong=@TenPhong, MaLoaiPhong=@MaLoaiPhong, TinhTrang=@TinhTrang, MaPhieu=@MaPhieu WHERE MaPhong = @KEY;
			SELECT @error = @@ERROR, @id = SCOPE_IDENTITY(); 
			IF @error = 0
				SET @RESULT = N'Đã cập nhật thông tin với mã phòng: '+@KEY;
			ELSE
				SET @RESULT = N'Đã xảy ra lỗi cập nhật';
		END;
END;
DECLARE @RESULT NVARCHAR(100);
EXEC UPDATE_PhongChoThue '',N'',@RESULT OUTPUT;
SELECT @RESULT AS MESSAGES_RESULT;

CREATE PROC DELETE_PhongChoThue
@KEY VARCHAR(5),
@RESULT NVARCHAR(100) output
AS
BEGIN
	DECLARE @COUNTS INT = 0;
	DECLARE @error INT;
	SELECT @COUNTS = COUNT(*) FROM PhongChoThue A WHERE A.MaPhong = @KEY;
	IF @COUNTS = 0
		SET @RESULT = N'Không tìm thấy mã phòng: '+@KEY;
	ELSE
		BEGIN
			DELETE FROM PhongChoThue WHERE MaPhong = @KEY;
			SELECT @error = @@ERROR; 
			IF @error = 0
				SET @RESULT = N'Đã xóa mã phòng: '+@KEY;
			ELSE
				PRINT 'Đã xảy ra lỗi khi xóa mã phòng: '+@KEY;
		END
END;
DECLARE @RESULT NVARCHAR(100);
EXEC DELETE_PhongChoThue '',@RESULT OUTPUT;
SELECT @RESULT AS MESSAGES_RESULT;

CREATE PROC SELECT_PhongChoThue
@KEY VARCHAR(5),
@RESULT NVARCHAR(100) output
AS
BEGIN
	DECLARE @COUNTS INT = 0;
	DECLARE @error INT;
	SELECT @COUNTS = COUNT(*) FROM PhongChoThue A WHERE A.MaPhong = @KEY;
	IF @COUNTS = 0
		SET @RESULT = N'Không tìm thấy mã phòng: '+@KEY;
	ELSE
		BEGIN
			SELECT * FROM PhongChoThue A WHERE A.MaPhong=@KEY;
			SET @RESULT =N'Tìm thấy được'+CAST(@COUNTS AS NVARCHAR(100))+' bản ghi';
		END
END;
DECLARE @RESULT NVARCHAR(100);
EXEC SELECT_PhongChoThue '',@RESULT OUTPUT;
SELECT @RESULT AS MESSAGES_RESULT;


--Bang PhieuDatPhong
CREATE PROC INSERT_PhieuDatPhong
@MaPhieu VARCHAR(10),
@TenKhachHang NVARCHAR(50),
@SDT VARCHAR(15),
@Email VARCHAR(50),
@DiaChi NVARCHAR(200),
@SoNguoiLon tinyint,
@SoTreEm tinyint,
@NgayDenNhan date,
@NgayTra date,
@MaLoaiPhong VARCHAR(5),
@MaDichVu VARCHAR(5),
@GhiChu NVARCHAR(300),
@RESULT NVARCHAR(100) output
AS
BEGIN
	DECLARE @COUNTS INT = 0;
	DECLARE @COUNTS1 INT = 0;
	DECLARE @COUNTS2 INT = 0;
	DECLARE @error INT;
	DECLARE @id INT;
	SELECT @COUNTS = COUNT(*) FROM PhieuDatPhong P WHERE P.MaPhieu=@MaPhieu;
	SELECT @COUNTS1 = COUNT(*) FROM LoaiPhong L WHERE L.MaLoaiPhong=@MaLoaiPhong;
	SELECT @COUNTS2 = COUNT(*) FROM DichVu D WHERE D.MaDichVu=@MaDichVu;
	IF @COUNTS >=1
		SET @RESULT = N'Tồn tại mã mã phiếu: '+@MaPhieu;
	ELSE IF @COUNTS1 < 1
		SET @RESULT = N'Không tồn tại mã loại phòng '+@MaLoaiPhong;
	ELSE IF @COUNTS2 < 1 and @MaDichVu != null
		SET @RESULT = N'Không tồn tại mã dịch vụ '+@MaDichVu;
	ELSE
		BEGIN
			INSERT INTO PhieuDatPhong VALUES (@MaPhieu,@TenKhachHang,@SDT,@Email,@DiaChi,@SoNguoiLon,@SoTreEm,@NgayDenNhan,@NgayTra,@MaLoaiPhong,@MaDichVu,@GhiChu);
			SELECT @error = @@ERROR, @id = SCOPE_IDENTITY(); 
			IF @error = 0
				SET @RESULT = N'Đã tạo dữ liệu cho mã phiếu là: '+@MaPhieu;
			ELSE
				SET @RESULT = N'Đã xảy ra lỗi với mã lỗi: '+@id;
		END;
END;
DECLARE @RESULT NVARCHAR(100);
EXEC INSERT_PhieuDatPhong '',N'',@RESULT OUTPUT;
SELECT @RESULT AS MESSAGES_RESULT;

CREATE PROC UPDATE_PhieuDatPhong
@KEY VARCHAR(10),
@TenKhachHang NVARCHAR(50),
@SDT VARCHAR(15),
@Email VARCHAR(50),
@DiaChi NVARCHAR(200),
@SoNguoiLon tinyint,
@SoTreEm tinyint,
@NgayDenNhan date,
@NgayTra date,
@MaLoaiPhong VARCHAR(5),
@MaDichVu VARCHAR(5),
@GhiChu NVARCHAR(300),
@RESULT NVARCHAR(100) output
AS
BEGIN
	DECLARE @COUNTS INT = 0;
	DECLARE @COUNTS1 INT = 0;
	DECLARE @COUNTS2 INT = 0;
	DECLARE @error INT;
	DECLARE @id INT;
 SELECT @COUNTS = COUNT(*) FROM PhieuDatPhong P WHERE P.MaPhieu=@KEY;
	SELECT @COUNTS1 = COUNT(*) FROM LoaiPhong L WHERE L.MaLoaiPhong=@MaLoaiPhong;
	SELECT @COUNTS2 = COUNT(*) FROM DichVu D WHERE D.MaDichVu=@MaDichVu;
	IF @COUNTS = 0
		SET @RESULT = N'Không tìm thấy mã phiếu: '+@KEY;
	ELSE IF @COUNTS1 < 1
		SET @RESULT = N'Không tồn tại mã loại phòng '+@MaLoaiPhong;
	ELSE IF @COUNTS2 < 1 and @MaDichVu != null
		SET @RESULT = N'Không tồn tại mã dịch vụ '+@MaDichVu;
	ELSE
		BEGIN
			UPDATE PhieuDatPhong SET TenKhachHang=@TenKhachHang, SDT=@SDT, Email=@Email, DiaChi=@DiaChi, 
								SoNguoiLon=@SoNguoiLon, SoTreEm=@SoTreEm, NgayDenNhan=@NgayDenNhan, NgayTra=@NgayTra,
								MaLoaiPhong=@MaLoaiPhong, MaDichVu=@MaDichVu, GhiChu=@GhiChu WHERE MaPhieu = @KEY;
			SELECT @error = @@ERROR, @id = SCOPE_IDENTITY(); 
			IF @error = 0
				SET @RESULT = N'Đã cập nhật thông tin với mã phiếu: '+@KEY;
			ELSE
				SET @RESULT = N'Đã xảy ra lỗi cập nhật';
		END;
END;
DECLARE @RESULT NVARCHAR(100);
EXEC UPDATE_PhieuDatPhong '',N'',@RESULT OUTPUT;
SELECT @RESULT AS MESSAGES_RESULT;

CREATE PROC DELETE_PhieuDatPhong
@KEY VARCHAR(10),
@RESULT NVARCHAR(100) output
AS
BEGIN
	DECLARE @COUNTS INT = 0;
	DECLARE @error INT;
	SELECT @COUNTS = COUNT(*) FROM PhieuDatPhong A WHERE A.MaPhieu = @KEY;
	IF @COUNTS = 0
		SET @RESULT = N'Không tìm thấy mã phiếu: '+@KEY;
	ELSE
		BEGIN
			DELETE FROM PhieuDatPhong where MaPhieu = @KEY;
			SELECT @error = @@ERROR; 
			IF @error = 0
				SET @RESULT = N'Đã xóa mã phiếu: '+@KEY;
			ELSE
				PRINT 'Đã xảy ra lỗi khi xóa mã phiếu: '+@KEY;
		END
END;
DECLARE @RESULT NVARCHAR(100);
EXEC DELETE_PhieuDatPhong '',@RESULT OUTPUT;
SELECT @RESULT AS MESSAGES_RESULT;

CREATE PROC SELECT_PhieuDatPhong
@KEY VARCHAR(10),
@RESULT NVARCHAR(100) output
AS
BEGIN
	DECLARE @COUNTS INT = 0;
	DECLARE @error INT;
	SELECT @COUNTS = COUNT(*) FROM PhieuDatPhong A WHERE A.MaPhieu = @KEY;
	IF @COUNTS = 0
		SET @RESULT = N'Không tìm thấy mã phiếu: '+@KEY;
	ELSE
		BEGIN
			SELECT * FROM PhieuDatPhong A WHERE A.MaPhieu = @KEY;
			SET @RESULT =N'Tìm thấy được'+CAST(@COUNTS AS NVARCHAR(100))+' bản ghi';
		END
END;
DECLARE @RESULT NVARCHAR(100);
EXEC SELECT_PhieuDatPhong '',@RESULT OUTPUT;
SELECT @RESULT AS MESSAGES_RESULT;