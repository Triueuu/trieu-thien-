Use master 
create database Quanlibanhang
USE Quanlibanhang

create table Sanpham
(
masp Nchar(10) not null,
mahangsx Nchar(10) not null,
tensp nvarchar(20) not null,
soluong int not null,
mausac nvarchar(20) not null,
giaban money not null,
donvitinh Nchar(10) not null,
mota nvarchar(max) not null,
Primary key (masp)
)

create table Hangsx
(
Mahangsx Nchar(10) not null,
Tenhang Nvarchar(30) not null,
Diachi Nvarchar(30) not null,
Sodt nvarchar(20) not null,
email nvarchar(30) not null,
primary key (Mahangsx) 
)

create table Nhanvien
(
Manv Nchar(10)  not null,
Tennv nvarchar(20) not null,
Gioitinh Nchar(10) not null,
Diachi nvarchar(30) not null,
Sodt nvarchar(20) not null,
email nvarchar(30) not null,
Phong nvarchar(30) not null,
primary key (Manv)
)

create table Nhap
(
Sohdn Nchar(10) not null,
Masp Nchar(10) not null,
Manv Nchar(10) not null,
Ngaynhap date not null,
soluongN int not null,
dongiaN money not null, 
unique(Sohdn,Masp)
)



create table Xuat 
(
Sohdx Nchar(10) not null,
Masp Nchar(10) not null,
Manv Nchar(10) not null,
Ngayxuat date not null,
soluongX int 
unique (Sohdx,Masp)
)

ALTER TABLE Sanpham
ADD CONSTRAINT FK_Sanpham_mahangsx
FOREIGN KEY (mahangsx)
REFERENCES Hangsx (Mahangsx)


ALTER TABLE Nhap
ADD CONSTRAINT FK_Nhap_masp
FOREIGN KEY (masp)
REFERENCES Sanpham (masp)


ALTER TABLE Nhap
ADD CONSTRAINT FK_Nhap_Manv
FOREIGN KEY (Manv)
REFERENCES Nhanvien (Manv)

ALTER TABLE Xuat
ADD CONSTRAINT FK_Xuat_masp
FOREIGN KEY (masp)
REFERENCES Sanpham (masp)

ALTER TABLE Xuat
ADD CONSTRAINT FK_Xuat_Manv
FOREIGN KEY (Manv)
REFERENCES Nhanvien (Manv)

ALTER TABLE Nhap
ADD
CONSTRAINT PK_Nhap PRIMARY KEY (sohdn,masp)

ALTER TABLE Xuat
ADD
CONSTRAINT PK_Xuat PRIMARY KEY (sohdx,masp)
select * from Hangsx
insert into Hangsx 
values ('H01','Samsung','korea','011-08271717','ss@gmail.com.kr')
insert into Hangsx 
values ('H02','oppo','china','081-08626262','oppo@gmail.com.cn')
insert into Hangsx 
values ('H03','Vinphone','Vn','084-098262626','vf@gmail.com.vn')

INSERT INTO Nhanvien
VALUES ('NV01', 'Nguyễn Thị Thu', 'Nữ', 'Hà Nội', '0982626521', 'thu@gmail.com', 'Kế toán')
INSERT INTO Nhanvien
VALUES ('NV02', 'Lê Văn Nam', 'Nam', 'Bắc Ninh', '0972525252', 'nam@gmail.com', 'Vật tư')
INSERT INTO Nhanvien
VALUES ('NV03', 'Trần Hòa Bình', 'Nữ', 'Hà Nội', '0328388388', 'hb@gmail.com', 'Kế toán')

INSERT INTO Sanpham VALUES
('SP01', 'H02', 'F1 Plus', '100', 'Xám', '7000000', 'Chiếc', 'Hàng cận cao cấp')
INSERT INTO Sanpham VALUES
('SP02', 'H01', 'Galaxy Note11', '50', 'Đỏ', '19000000', 'Chiếc', 'Hàng cao cấp')
INSERT INTO Sanpham VALUES
('SP03', 'H02', 'F3 Lite', '200', 'Nâu', '3000000', 'Chiếc', 'Hàng phổ thông')
INSERT INTO Sanpham VALUES
('SP04', 'H03', 'Vjoy3', '200', 'Xám', '1500000', 'Chiếc', 'Hàng phổ thông')
INSERT INTO Sanpham VALUES
('SP05', 'H01', 'Galaxy', '50', 'Nâu', '8000000', 'Chiếc', 'Hàng cận cao cấp')

INSERT INTO Nhap VALUES
('N01', 'SP02', 'NV01', '02-05-2019', 10, 17000000)
INSERT INTO Nhap VALUES
('N02', 'SP01','NV02','04-07-2020',30,6000000)
INSERT INTO Nhap VALUES
('N03', 'SP04','NV02','05-17-2020',20,1200000)
INSERT INTO Nhap VALUES
('N04', 'SP01','NV03','03-22-2020',10,6200000)
INSERT INTO Nhap VALUES
('N05', 'SP05','NV01','07-07-2020',20,7000000)
INSERT INTO Xuat VALUES
('X01', 'SP03', 'NV02', '06-14-2020', 5)
INSERT INTO Xuat VALUES
('X02', 'SP01', 'NV03', '03-05-2019', 3)
INSERT INTO Xuat VALUES
('X03', 'SP02', 'NV01', '12-12-2020', 1)
INSERT INTO Xuat VALUES
('X04', 'SP03', 'NV02', '06-02-2020', 2)
INSERT INTO Xuat VALUES
('X05', 'SP05', 'NV01', '05-18-2020', 1)


BACKUP DATABASE [Quanlibanhang] TO DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Quanlibanhang.bak'
RESTORE DATABASE [Quanlibanhang] FROM DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Quanlibanhang.bak'
/*lap 2.2 */ 

/* cau 1 * / select *from Quanlibanhang.INFORMATION_SCHEMA.tables  
/* cau 2 */ 
SELECT Sanpham.Masp, Sanpham.Tensp, Hangsx.Tenhang, Sanpham.Soluong, Sanpham.Masp, Sanpham.Mausac, Sanpham.Giaban, Sanpham.Donvitinh, Sanpham.Mota
FROM Sanpham
INNER JOIN Hangsx ON Sanpham.Mahangsx = Hangsx.Mahangsx
ORDER BY Sanpham.Giaban DESC
/* cau 3 * / 
SELECT Sanpham.tensp AS N'Tên sảm phẩm của hãng samsung '
	FROM Sanpham,Hangsx
	WHERE Hangsx.Tenhang  = 'samsung' 
/* cau 4 */
SELECT Nhanvien.Manv , Nhanvien.Tennv, Nhanvien.Gioitinh , Nhanvien.Diachi,Nhanvien.Sodt,Nhanvien.email ,Nhanvien.Phong 
	FROM Nhanvien
	WHERE Nhanvien.Phong = 'Kế toán' and Nhanvien.Gioitinh = 'Nữ'
/* cau 7 */
Select Nhap.Sohdn,Nhap.masp,Sanpham.tensp,Nhap.soluongN,Nhap.dongiaN,Nhap.ngaynhap,Nhanvien.tennv,Nhanvien.
phong
from Nhap,Nhanvien,Sanpham
where 
/ * câu 5 * /
SELECT Nhap.Sohdn, Sanpham.Masp, Sanpham.Tensp, Hangsx.Tenhang, Nhap.SoluongN, Nhap.DongiaN, Nhap.SoluongN*Nhap.DongiaN AS tiennhap, Sanpham.Mausac, Sanpham.Donvitinh, Nhap.Ngaynhap, Nhanvien.Tennv, Nhanvien.Phong
FROM Nhap
JOIN Sanpham ON Nhap.Masp = Sanpham.Masp
JOIN Hangsx ON Sanpham.Mahangsx= Hangsx.Mahangsx
JOIN Nhanvien ON Nhap.Manv = Nhanvien.Manv
ORDER BY Nhap.Sohdn ASC;
/* câu 6 */

SELECT Xuat.SoHDX, Xuat.MaSP, SanPham.TenSP, HangSX.TenHang, Xuat.SoLuongX,SanPham.GiaBan,Xuat.SoLuongX*SanPham.GiaBan AS TienXuat, SanPham.MauSac, SanPham.DonViTinh, Xuat.NgayXuat, NhanVien.TenNV, NhanVien.Phong
FROM Xuat
INNER JOIN SanPham ON Xuat.MaSP = SanPham.MaSP
INNER JOIN HangSX ON SanPham.MaHangSX = HangSX.MaHangSX
INNER JOIN NhanVien ON Xuat.MaNV = NhanVien.MaNV
WHERE MONTH(Xuat.ngayxuat) = 10 AND YEAR(Xuat.ngayxuat) = 2018
ORDER BY Xuat.SoHDX ASC

/* câu 7 */ 
Select sohdn,Sanpham.masp,tensp,soluongn,dongiaN,ngaynhap,tennv,phong
From Nhap
Join Sanpham on Nhap.masp = Hangsx.mahangsx 
join Hangsx on sanpham.mahangsx = hangsx.mahangsx 
join nhanvien on nhap.manv = nhap.manv
where hangsx.tenhang = 'Samsung' and Year (ngay nhap) = 2017 
/* câu 8 */
Select Top 10 Xuat.sohdx , Sanpham.tensp,Xuat.soluongX
from Xuat 
Inner join Sanpham on Xuat.masp = Sanpham.masp
where Year(Xuat.ngayxuat) = '2023'
order by Xuat.soluongX DESC ;
/ * câu 9 * /
SELECT TOP(10) tenSP, giaBan
FROM SanPham
ORDER BY giaBan DESC;
/* câu 10 * /
SELECT *
FROM Sanpham
JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
WHERE Hangsx.tenhang = 'Samsung' AND Sanpham.giaban >= 100000 AND Sanpham.giaban <= 500000

/* LAP 3 */
câu 1
SELECT Hangsx.tenhang, COUNT(Sanpham.masp) AS so_luong_sp
FROM Hangsx
JOIN Sanpham ON Hangsx.mahangsx = Sanpham.mahangsx
GROUP BY Hangsx.tenhang
--2--
SELECT masp, SUM(soluongN * dongiaN) AS TongTienNhap
FROM Nhap
WHERE YEAR(ngaynhap) = 2020
GROUP BY masp;
--3--
SELECT Sanpham.masp, Sanpham.tensp, SUM(Xuat.soluongX) as tong_soluong_xuat
FROM Sanpham
JOIN Xuat ON Sanpham.masp = Xuat.masp
JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
WHERE YEAR(Xuat.ngayxuat) = 2018 AND Hangsx.tenhang = 'Samsung'
GROUP BY Sanpham.masp, Sanpham.tensp
HAVING SUM(Xuat.soluongX) > 10000;
--4--
SELECT phong, COUNT(*) AS SoLuongNam
FROM Nhanvien
WHERE gioitinh = 'Nam'
GROUP BY phong
--5--
SELECT Hangsx.tenhang, SUM(Nhap.soluongN) as TongSoLuongNhap
FROM Nhap
JOIN Sanpham ON Nhap.masp = Sanpham.masp
JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
WHERE YEAR(Nhap.ngaynhap) = 2020
GROUP BY Hangsx.tenhang
--6--
SELECT Nhanvien.tennv ,Nhanvien.manv ,SUM(Xuat.soluongX*Sanpham.giaban) as TongtienXuat
FROM Xuat
JOIN Sanpham ON Xuat.masp = Sanpham.masp
JOIN Nhanvien ON Xuat.manv = Nhanvien.manv
WHERE YEAR(Xuat.ngayxuat) = 2019
GROUP BY Nhanvien.tennv,Nhanvien.manv 
--7--
SELECT Nhanvien.tennv ,Nhanvien.manv ,SUM(Nhap.soluongN*Sanpham.giaban) as Tongtiennhap
from Nhap 
JOIN Sanpham ON Nhap.masp = Sanpham.masp
JOIN Nhanvien ON Nhap.manv = Nhanvien.manv
WHERE YEAR(Nhap.ngaynhap) = 2020 and Month(Nhap.ngaynhap) = 07 
GROUP BY Nhanvien.manv,Nhanvien.tennv 
having SUM(Nhap.soluongN*Sanpham.giaban)  > 100000
--4--
SELECT phong, COUNT(*) AS SoLuongNam
FROM Nhanvien
WHERE gioitinh = 'Nam'
GROUP BY phong
--5--
SELECT Hangsx.tenhang, SUM(Nhap.soluongN) as TongSoLuongNhap
FROM Nhap
JOIN Sanpham ON Nhap.masp = Sanpham.masp
JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
WHERE YEAR(Nhap.ngaynhap) = 2020
GROUP BY Hangsx.tenhang
--6--
SELECT Nhanvien.tennv ,Nhanvien.manv ,SUM(Xuat.soluongX*Sanpham.giaban) as TongtienXuat
FROM Xuat
JOIN Sanpham ON Xuat.masp = Sanpham.masp
JOIN Nhanvien ON Xuat.manv = Nhanvien.manv
WHERE YEAR(Xuat.ngayxuat) = 2019
GROUP BY Nhanvien.tennv,Nhanvien.manv 
--7--
SELECT Nhanvien.tennv ,Nhanvien.manv ,SUM(Nhap.soluongN*Sanpham.giaban) as Tongtiennhap
from Nhap 
JOIN Sanpham ON Nhap.masp = Sanpham.masp
JOIN Nhanvien ON Nhap.manv = Nhanvien.manv
WHERE YEAR(Nhap.ngaynhap) = 2020 and Month(Nhap.ngaynhap) = 07 
GROUP BY Nhanvien.manv,Nhanvien.tennv 
having SUM(Nhap.soluongN*Sanpham.giaban)  > 100000
--- 8---
SELECT SP.masp, SP.tensp
FROM Sanpham SP
LEFT JOIN Nhap N ON SP.masp = N.Masp
LEFT JOIN xuat X ON SP.masp = X.Masp
WHERE soluongN IS NOT NULL AND X.Masp IS NULL
GROUP BY SP.masp, SP.tensp
--- 9. ĐƯA RA DANH SÁCH CÁC SẨN PHẨM ĐÃ NHẬP NĂM 2018 VÀ XUẤT NĂM 2018*/
SELECT SP.mahangsx, SP.tensp
FROM SANPHAM SP
LEFT JOIN Nhap N ON SP.mahangsx = N.Masp
LEFT JOIN Xuat X ON SP.mahangsx = X.Manv
WHERE YEAR(Ngaynhap) = 2020 AND YEAR(Ngayxuat) = 2020
GROUP BY SP.mahangsx, SP.tensp
--- 10. ĐƯA RA DANH SÁCH CÁC NHÂN VIÊN VỪA NHẬP VỪA XUẤT
SELECT NV.Manv, Tennv
FROM Nhanvien NV
LEFT JOIN Nhap N ON NV.Manv = N.Manv
LEFT JOIN Xuat X ON NV.Manv = X.Manv
WHERE soluongN IS NOT NULL AND soluongX IS NOT NULL
GROUP BY NV.Manv, NV.Tennv
--- 11. ĐƯA RA DANH SÁCH CÁC NHÂN VIÊN KHÔNG THAM GIA VIỆC NHẬP XUẤT*/
SELECT NV.Manv, Tennv
FROM Nhanvien NV
LEFT JOIN Nhap N ON NV.Manv = N.Manv
LEFT JOIN Xuat X ON NV.Manv = X.Manv
WHERE soluongN IS NULL AND soluongX IS NULL
GROUP BY NV.Manv, NV.Tennv
-- lap 4 --

--c2th2--
Create View view1  as 
SELECT Top 100 Percent Sanpham.Masp, Sanpham.Tensp, Hangsx.Tenhang, Sanpham.Soluong, Sanpham.Masp, Sanpham.Mausac, Sanpham.Giaban, Sanpham.Donvitinh, Sanpham.Mota
FROM Sanpham
INNER JOIN Hangsx ON Sanpham.Mahangsx = Hangsx.Mahangsx
ORDER BY Sanpham.Giaban DESC
--c3th2--
Create View view2  as 
SELECT Sanpham.tensp AS N'Tên sảm phẩm của hãng samsung '
	FROM Sanpham,Hangsx
	WHERE Hangsx.Tenhang  = 'samsung' 
--c4th2--
Create View view3  as 
SELECT Nhanvien.Manv , Nhanvien.Tennv, Nhanvien.Gioitinh , Nhanvien.Diachi,Nhanvien.Sodt,Nhanvien.email ,Nhanvien.Phong 
	FROM Nhanvien
	WHERE Nhanvien.Phong = 'Kế toán' and Nhanvien.Gioitinh = 'Nữ'
	--c5th2--
	Create View view4  as 
	SELECT Nhap.Sohdn, Sanpham.Masp, Sanpham.Tensp, Hangsx.Tenhang, Nhap.SoluongN, Nhap.DongiaN, Nhap.SoluongN*Nhap.DongiaN AS tiennhap, Sanpham.Mausac, Sanpham.Donvitinh, Nhap.Ngaynhap, Nhanvien.Tennv, Nhanvien.Phong
FROM Nhap
JOIN Sanpham ON Nhap.Masp = Sanpham.Masp
JOIN Hangsx ON Sanpham.Mahangsx= Hangsx.Mahangsx
JOIN Nhanvien ON Nhap.Manv = Nhanvien.Manv
ORDER BY Nhap.Sohdn ASC;

--c6th2--
Create View view5  as 

SELECT Xuat.SoHDX, Xuat.MaSP, SanPham.TenSP, HangSX.TenHang, Xuat.SoLuongX,SanPham.GiaBan,Xuat.SoLuongX*SanPham.GiaBan AS TienXuat, SanPham.MauSac, SanPham.DonViTinh, Xuat.NgayXuat, NhanVien.TenNV, NhanVien.Phong
FROM Xuat
INNER JOIN SanPham ON Xuat.MaSP = SanPham.MaSP
INNER JOIN HangSX ON SanPham.MaHangSX = HangSX.MaHangSX
INNER JOIN NhanVien ON Xuat.MaNV = NhanVien.MaNV
WHERE MONTH(Xuat.ngayxuat) = 10 AND YEAR(Xuat.ngayxuat) = 2018
ORDER BY Xuat.SoHDX ASC
--c7th2--
Create View view5  as 
SELECT Sohdn,Sanpham.masp,tensp,soluongN,dongiaN, Ngaynhap,Tennv,Phong
FROM Nhap
JOIN Sanpham ON Nhap.Masp =Sanpham.masp
JOIN Hangsx ON Sanpham.mahangsx = Hangsx.Mahangsx
JOIN Nhanvien ON.Nhap.Manv = Nhanvien.Manv
WHERE Hangsx.Tenhang = 'Samsung' AND YEAR(Ngaynhap)=2017
--c8th2--
Create View view6  as 
Select Top 10 Xuat.sohdx , Sanpham.tensp,Xuat.soluongX
from Xuat 
Inner join Sanpham on Xuat.masp = Sanpham.masp
where Year(Xuat.ngayxuat) = '2023'
order by Xuat.soluongX DESC ;
--c9th2--
Create View view7 as 
SELECT TOP(10) tenSP, giaBan
FROM SanPham
ORDER BY giaBan DESC;
--c10th2--
Create View view9 as 
SELECT  top 100 percent Hangsx.tenhang, Sanpham.giaban,Sanpham.mahangsx
FROM Sanpham
JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
WHERE Hangsx.tenhang = 'Samsung' AND Sanpham.giaban >= 100000 AND Sanpham.giaban <= 500000

--c1th3--
Create View view10 as 
SELECT Hangsx.tenhang, COUNT(Sanpham.masp) AS so_luong_sp
FROM Hangsx
JOIN Sanpham ON Hangsx.mahangsx = Sanpham.mahangsx
GROUP BY Hangsx.tenhang
--c2th3--
Create View view11 as 
SELECT masp, SUM(soluongN * dongiaN) AS TongTienNhap
FROM Nhap
WHERE YEAR(ngaynhap) = 2020
GROUP BY masp;
--c2th3--
Create View view12 as 
SELECT Sanpham.masp, Sanpham.tensp, SUM(Xuat.soluongX) as tong_soluong_xuat
FROM Sanpham
JOIN Xuat ON Sanpham.masp = Xuat.masp
JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
WHERE YEAR(Xuat.ngayxuat) = 2018 AND Hangsx.tenhang = 'Samsung'
GROUP BY Sanpham.masp, Sanpham.tensp
HAVING SUM(Xuat.soluongX) > 10000;
--3--
Create View view13 as 
SELECT Sanpham.masp, Sanpham.tensp, SUM(Xuat.soluongX) as tong_soluong_xuat
FROM Sanpham
JOIN Xuat ON Sanpham.masp = Xuat.masp
JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
WHERE YEAR(Xuat.ngayxuat) = 2018 AND Hangsx.tenhang = 'Samsung'
GROUP BY Sanpham.masp, Sanpham.tensp
HAVING SUM(Xuat.soluongX) > 10000;
--4--
Create View view14 as
SELECT phong, COUNT(*) AS SoLuongNam
FROM Nhanvien
WHERE gioitinh = 'Nam'
GROUP BY phong
--5--
Create View view15 as
SELECT Hangsx.tenhang, SUM(Nhap.soluongN) as TongSoLuongNhap
FROM Nhap
JOIN Sanpham ON Nhap.masp = Sanpham.masp
JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
WHERE YEAR(Nhap.ngaynhap) = 2020
GROUP BY Hangsx.tenhang
--6--
Create View view16 as
SELECT Nhanvien.tennv ,Nhanvien.manv ,SUM(Xuat.soluongX*Sanpham.giaban) as TongtienXuat
FROM Xuat
JOIN Sanpham ON Xuat.masp = Sanpham.masp
JOIN Nhanvien ON Xuat.manv = Nhanvien.manv
WHERE YEAR(Xuat.ngayxuat) = 2019
GROUP BY Nhanvien.tennv,Nhanvien.manv 
--7--
Create View view17 as
SELECT Nhanvien.tennv ,Nhanvien.manv ,SUM(Nhap.soluongN*Sanpham.giaban) as Tongtiennhap
from Nhap 
JOIN Sanpham ON Nhap.masp = Sanpham.masp
JOIN Nhanvien ON Nhap.manv = Nhanvien.manv
WHERE YEAR(Nhap.ngaynhap) = 2020 and Month(Nhap.ngaynhap) = 07 
GROUP BY Nhanvien.manv,Nhanvien.tennv 
having SUM(Nhap.soluongN*Sanpham.giaban)  > 100000
--- 8---
Create View view18 as
SELECT SP.masp, SP.tensp
FROM Sanpham SP
LEFT JOIN Nhap N ON SP.masp = N.Masp
LEFT JOIN xuat X ON SP.masp = X.Masp
WHERE soluongN IS NOT NULL AND X.Masp IS NULL
GROUP BY SP.masp, SP.tensp
--- 9. ĐƯA RA DANH SÁCH CÁC SẨN PHẨM ĐÃ NHẬP NĂM 2018 VÀ XUẤT NĂM 2018*/
Create View view19 as
SELECT SP.mahangsx, SP.tensp
FROM SANPHAM SP
LEFT JOIN Nhap N ON SP.mahangsx = N.Masp
LEFT JOIN Xuat X ON SP.mahangsx = X.Manv
WHERE YEAR(Ngaynhap) = 2020 AND YEAR(Ngayxuat) = 2020
GROUP BY SP.mahangsx, SP.tensp
--- 10. ĐƯA RA DANH SÁCH CÁC NHÂN VIÊN VỪA NHẬP VỪA XUẤT
Create View view20 as
SELECT NV.Manv, Tennv
FROM Nhanvien NV
LEFT JOIN Nhap N ON NV.Manv = N.Manv
LEFT JOIN Xuat X ON NV.Manv = X.Manv
WHERE soluongN IS NOT NULL AND soluongX IS NOT NULL
GROUP BY NV.Manv, NV.Tennv
--- 11. ĐƯA RA DANH SÁCH CÁC NHÂN VIÊN KHÔNG THAM GIA VIỆC NHẬP XUẤT*/
Create View view21 as
SELECT NV.Manv, Tennv
FROM Nhanvien NV
LEFT JOIN Nhap N ON NV.Manv = N.Manv
LEFT JOIN Xuat X ON NV.Manv = X.Manv
WHERE soluongN IS NULL AND soluongX IS NULL
GROUP BY NV.Manv, NV.Tennv
/* lap 5 */ 
--cau 1--
create function fn_Timhang(@masp nvarchar(10))
returns nvarchar(20)
as
begin
declare @ten nvarchar(20)
set @ten = (select tenhang from hangsx inner join sanpham
on hangsx.mahangsx = sanpham.mahangsx
where masp = @masp)
return @ten
end

--cau 2--
create function fn_thongkenhaptheonam(@x int,@y int)
returns int
as
begin
declare @tongtien int
select @tongtien = sum(soluongN*dongiaN)
from nhap
where year(ngaynhap) between @x and @y
return @tongtien
end
-- cau 3-- 
CREATE FUNCTION ThongKeSoLuongNhapXuat(@tenSP NVARCHAR(50), @nam INT)
RETURNS INT
AS
BEGIN
    DECLARE @soLuongNhapXuat INT

    SELECT @soLuongNhapXuat = SUM(COALESCE(n.SoluongN, 0) - COALESCE(x.SoluongX, 0))
    FROM SanPham sp
    LEFT JOIN Nhap n ON Sanpham.masp = Nhap.MaSP
    LEFT JOIN Xuat x ON Sanpham.masp = Xuat.MaSP AND YEAR(Xuat.NgayXuat) = @nam
    WHERE Sanpham.tensp = @tenSP AND YEAR(Nhap.NgayNhap) = @nam

    RETURN @soLuongNhapXuat
END

--cau 4--
create function fn_thongkenhaptheongay(@x int,@y int)
returns int
as
begin
declare @tongtien int
select @tongtien = sum(soluongN*dongiaN)
from nhap
where day(ngaynhap) between @x and @y
return @tongtien
end
-- cau 5
CREATE FUNCTION fn_TongGiaTriXuat(@tenHang NVARCHAR(20), @nam INT)
RETURNS MONEY
AS
BEGIN
  DECLARE @tongGiaTriXuat MONEY;
  SELECT @tongGiaTriXuat = SUM(S.giaban * X.soluongX)
  FROM Xuat X
  JOIN Sanpham S ON X.masp = S.masp
  JOIN Hangsx H ON S.mahangsx = H.mahangsx
  WHERE H.tenhang = @tenHang AND YEAR(X.ngayxuat) = @nam;
  RETURN @tongGiaTriXuat;
END;

--cau 6
CREATE FUNCTION fn_ThongKeNhanVienTheoPhong (@tenPhong NVARCHAR(30))
RETURNS TABLE
AS
RETURN
    SELECT phong, COUNT(manv) AS soLuongNhanVien
    FROM Nhanvien
    WHERE phong = @tenPhong
    GROUP BY phong;
-- cau 7
CREATE FUNCTION sp_xuat_trong_ngay(@ten_sp NVARCHAR(20), @ngay_xuat DATE)
RETURNS INT
AS
BEGIN
  DECLARE @so_luong_xuat INT
  SELECT @so_luong_xuat = SUM(soluongX)
  FROM Xuat x JOIN Sanpham sp ON x.masp = sp.masp
  WHERE sp.tensp = @ten_sp AND x.ngayxuat = @ngay_xuat
  RETURN @so_luong_xuat
END
-- cau 8
CREATE FUNCTION SoDienThoaiNV (@InvoiceNumber NCHAR(10))
RETURNS NVARCHAR(20)
AS
BEGIN
  DECLARE @EmployeePhone NVARCHAR(20)
  SELECT @EmployeePhone = Nhanvien.sodt
  FROM Nhanvien
  INNER JOIN Xuat ON Nhanvien.manv = Xuat.manv
  WHERE Xuat.sohdx = @InvoiceNumber
  RETURN @EmployeePhone
END
-- cau 9
CREATE FUNCTION ThongKeSoLuongThayDoi(@tenSP NVARCHAR(20), @nam INT)
RETURNS INT
AS
BEGIN
  DECLARE @tongNhapXuat INT;
  SET @tongNhapXuat = (
SELECT COALESCE(SUM(nhap.soluongN), 0) + COALESCE(SUM(xuat.soluongX), 0) AS tongSoLuong
    FROM Sanpham sp
    LEFT JOIN Nhap nhap ON sp.masp = nhap.masp
    LEFT JOIN Xuat xuat ON sp.masp = xuat.masp
    WHERE sp.tensp = @tenSP AND YEAR(nhap.ngaynhap) = @nam AND YEAR(xuat.ngayxuat) = @nam
  );
  RETURN @tongNhapXuat;
END;


-- cau 10--
CREATE FUNCTION ThongkeSoluongSanphamHangsx(@tenhang NVARCHAR(20))
RETURNS INT
AS
BEGIN
    DECLARE @soluong INT;

    SELECT @soluong = SUM(soluong)
    FROM Sanpham sp JOIN Hangsx hs ON sp.mahangsx = hs.mahangsx
    WHERE hs.tenhang = @tenhang;

    RETURN @soluong;
END;
select * from dbo.ThongkeSoluongSanphamHangsx('Samsung','Oppo')

-- lap 6 -- 
--Câu 1--
CREATE FUNCTION DanhSachSanPhamTheoHangSX (@tenHangSX varchar(50))
RETURNS TABLE
AS
RETURN
    SELECT SanPham.MaSP, SanPham.TenSP, SanPham.SoLuong, SanPham.MauSac, SanPham.GiaBan, SanPham.DonViTinh, SanPham.MoTa, HangSX.TenHang
    FROM SanPham
    INNER JOIN HangSX ON SanPham.MaHangSX = HangSX.MaHangSX
    WHERE HangSX.TenHang = @tenHangSX
SELECT * FROM DanhSachSanPhamTheoHangSX('SamSung')
--Câu 2--
DanhSachSanPhamNhap(@ngayX date, @ngayY date)
RETURNS TABLE
AS
RETURN
    SELECT sp.tensp, hs.tenhang, n.ngaynhap
    FROM Sanpham sp
    JOIN Hangsx hs ON sp.mahangsx = hs.mahangsx
    JOIN Nhap n ON sp.masp = n.masp
    WHERE n.ngaynhap >= @ngayX AND n.ngaynhap <= @ngayY
GO
SELECT * FROM DanhSachSanPhamNhap('2019-05-02', '2020-07-04')

--câu 3--
CREATE FUNCTION LuaChon(@luachon int)
RETURNS @bang TABLE (tensp nvarchar(20), masp nvarchar(10),tenhang nvarchar(20), Soluong int)
AS
BEGIN
	IF @luachon = 0
	BEGIN
		INSERT INTO @bang 
			SELECT tensp, Sanpham.masp, tenhang, Soluong FROM Sanpham INNER JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
			WHERE soluong < 0
	END
	IF @luachon = 1
	BEGIN
		INSERT INTO @bang
			SELECT tensp, Sanpham.masp, tenhang, Soluong FROM Sanpham INNER JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
			WHERE soluong > 0
	END
	RETURN
END
SElect * from LuaChon(100)
--câu 4--
CREATE FUNCTION ThongTinNV (@Phong nvarchar(30))
RETURNS TABLE RETURN
SELECT Tennv FROM Nhanvien
WHERE Nhanvien.Phong = @Phong
GO
-- cau 5 --
CREATE FUNCTION dbo.fn_DanhSachHangSXTheoDiaChi
    (@dia_chi NVARCHAR(30))
RETURNS TABLE
AS
RETURN
    SELECT mahangsx,Tenhang,Diachi
    FROM Hangsx
    WHERE Diachi LIKE '%' + @dia_chi + '%';

SELECT *FROM ThongTinNV ('Vat tu')
--câu 6--
CREATE FUNCTION DSXuat (@x int, @y int)
RETURNS TABLE RETURN
SELECT Tenhang, tensp, soluongX
FROM Xuat INNER JOIN Sanpham ON Xuat.Masp = Sanpham.masp INNER JOIN Hangsx ON Sanpham.mahangsx = Hangsx.Mahangsx
WHERE YEAR(Ngayxuat) BETWEEN @x AND @y
GO
SELECT * FROM DSXuat(2019, 2020)
-- câu 7 -- 
CREATE FUNCTION DANHSACHSANPHAM1 (@MAHANGSX NCHAR(10), @LUACHON INT)
RETURNS TABLE
AS
RETURN 
(
    SELECT SP.MASP, SP.TENSP, SP.MAUSAC, SP.GIABAN, SP.DONVITINH,
        CASE 
            WHEN @LUACHON = 0 THEN BN.NGAYNHAP
            WHEN @LUACHON = 1 THEN BX.NGAYXUAT
        END AS 'NGAYNHAPXUAT'
    FROM SANPHAM SP
    LEFT JOIN NHAP BN ON SP.MASP = BN.MASP
    LEFT JOIN XUAT BX ON SP.MASP = BX.MASP
    WHERE SP.MAHANGSX = @MAHANGSX AND (@LUACHON = 0 OR @LUACHON = 1)
)
select * from DANHSACHSANPHAM1(N'H01',1)

--câu 8--
CREATE FUNCTION NVNhap (@x int)
RETURNS TABLE RETURN
SELECT Nhanvien.Manv, Tennv, Phong
FROM Nhanvien INNER JOIN Nhap ON Nhanvien.Manv = Nhap.Manv
WHERE DAY(Ngaynhap) = @x
GO
SELECT * FROM NVNhap (22)
-- câu 9 -- 
CREATE FUNCTION DanhSachSanPham(
    @x FLOAT,
    @y FLOAT,
    @z NVARCHAR(50)
)
RETURNS TABLE
AS
RETURN
SELECT sp.masp, sp.tensp, sp.giaban, hs.tenhang
FROM Sanpham sp
INNER JOIN Hangsx hs ON sp.mahangsx = hs.mahangsx
WHERE sp.giaban >= @x AND sp.giaban <= @y AND hs.tenhang LIKE '%' + @z + '%'
SELECT * FROM DanhSachSanPham(1500000, 8000000, 'SamSung')
 --cau 10 --
CREATE FUNCTION danhsachcacsanphamvahangsanxuat()
RETURNS TABLE
AS
RETURN (
  SELECT SANPHAM.TENSP, HANGSX.TENHANG
  FROM SANPHAM
  JOIN HANGSX ON SANPHAM.MAHANGSX = HANGSX.MAHANGSX
)
SELECT * FROM danhsachcacsanphamvahangsanxuat()
-- LAp 7 --
-- cau 1 --
CREATE PROCEDURE sp_InsertHangSX
    @mahangsx VARCHAR(50),
    @tenhang VARCHAR(50),
    @diachi VARCHAR(100),
    @sodt VARCHAR(20),
    @email VARCHAR(50)
AS
BEGIN
    IF EXISTS (SELECT * FROM HangSX WHERE tenhang = @tenhang)
    BEGIN
        PRINT N'Tên hãng đã tồn tại, không thể thêm mới!'
        RETURN
    END

    INSERT INTO HangSX(mahangsx, tenhang, diachi, sodt, email)
    VALUES(@mahangsx, @tenhang, @diachi, @sodt, @email)

    PRINT N'Thêm mới thành công!'
END

EXEC sp_InsertHangSX 'HSX01', 'Iphone', 'Hà Nội', '0123456709', 'iphone@gmail.com'

---cau2

CREATE PROCEDURE sp_NhapSanPham
    @masp varchar(10),
    @tenhangsx varchar(50),
    @tensp varchar(50),
    @soluong int,
    @mausac varchar(20),
    @giaban decimal(18,2),
    @donvitinh varchar(10),
    @mota varchar(200)
AS
BEGIN
    IF EXISTS (SELECT * FROM Sanpham WHERE masp = @masp)
    BEGIN
        UPDATE Sanpham
        SET mahangsx = (SELECT mahangsx FROM Hangsx WHERE tenhang = @tenhangsx),
            tensp = @tensp,
            soluong = @soluong,
            mausac = @mausac,
            giaban = @giaban,
            donvitinh = @donvitinh,
            mota = @mota
        WHERE masp = @masp
    END
    ELSE
    BEGIN
        INSERT INTO Sanpham(masp, mahangsx, tensp, soluong, mausac, giaban, donvitinh, mota)
        VALUES (@masp, (SELECT mahangsx FROM Hangsx WHERE tenhang = @tenhangsx), @tensp, @soluong, @mausac, @giaban, @donvitinh, @mota)
    END
END

EXEC sp_NhapSanPham @masp = 'SP001', @tenhangsx = 'Samsung', @tensp = 'Galaxy S21', @soluong = 100, @mausac = 'Xanh', @giaban = 20000000, @donvitinh = 'Cái', @mota = N'Điện thoại thông minh Samsung Galaxy S21'


---cau3
CREATE PROCEDURE DeleteHangsx
    @tenhang nvarchar(50)
AS
BEGIN
    SET NOCOUNT ON;
    
    -- Kiểm tra hãng sản xuất có tồn tại hay không
    IF NOT EXISTS (SELECT * FROM Hangsx WHERE tenhang = @tenhang)
    BEGIN
        PRINT N'Hãng sản xuất không tồn tại!'
    END
    ELSE
    BEGIN
        -- Xóa các sản phẩm liên quan đến hãng sản xuất
        DELETE FROM Sanpham WHERE mahangsx = (SELECT mahangsx FROM Hangsx WHERE tenhang = @tenhang)
        
        -- Xóa hãng sản xuất
        DELETE FROM Hangsx WHERE tenhang = @tenhang
        
        PRINT N'Đã xóa hãng sản xuất ' + @tenhang + N' và các sản phẩm liên quan!'
    END
END

EXEC DeleteHangsx 'tenhang'
---câu4
CREATE PROCEDURE sp_NhapNhanVien
	@manv INT,
	@tennv NVARCHAR(50),
	@gioitinh NVARCHAR(10),
	@diachi NVARCHAR(100),
	@sodt NVARCHAR(15),
	@email NVARCHAR(50),
	@phong NVARCHAR(50),
	@flag INT
AS
BEGIN
	IF (@flag = 0)
	BEGIN
		UPDATE Nhanvien
		SET tennv = @tennv,
			gioitinh = @gioitinh,
			diachi = @diachi,
			sodt = @sodt,
			email = @email,
			phong = @phong
		WHERE manv = @manv
	END
	ELSE
	BEGIN
		INSERT INTO Nhanvien(manv, tennv, gioitinh, diachi, sodt, email, phong)
		VALUES (@manv, @tennv, @gioitinh, @diachi, @sodt, @email, @phong)
	END
END

EXEC sp_NhapNhanVien @manv = 1, @tennv = N'Nguyen Van A', @gioitinh = N'Nam', @diachi = N'Ha Noi', @sodt = N'0987654521', @email = N'abc@gmail.com', 
	@phong = N'Kinh doanh', @flag = 1

	--cau5--
CREATE PROCEDURE SP_INSERT_BANGNHAP
(
    @SOHDN NCHAR(10),
    @MASP NCHAR(10),
    @MANV NCHAR(10),
    @NGAYNHAP DATE,
    @SOLUONGN INT,
    @DONGIAN MONEY
)
AS
BEGIN
    SET NOCOUNT ON;
    
    IF NOT EXISTS(SELECT * FROM SANPHAM WHERE MASP = @MASP)
    BEGIN
        RAISERROR ('Mã sản phẩm không tồn tại trong bảng SANPHAM!', 16, 1);
        RETURN;
    END
    
    IF NOT EXISTS(SELECT * FROM NHANVIEN WHERE MANV = @MANV)
    BEGIN
        RAISERROR ('Mã nhân viên không tồn tại trong bảng NHANVIEN!', 16, 1);
        RETURN;
    END
  
    IF EXISTS(SELECT * FROM BANGNHAP WHERE SOHDN = @SOHDN)
    BEGIN
        UPDATE BANGNHAP
        SET MASP = @MASP,
            MANV = @MANV,
            NGAYNHAP = @NGAYNHAP,
            SOLUONGN = @SOLUONGN,
            DONGIAN = @DONGIAN
        WHERE SOHDN = @SOHDN
    END
    ELSE
    BEGIN
        INSERT INTO BANGNHAP (SOHDN, MASP, MANV, NGAYNHAP, SOLUONGN, DONGIAN)
        VALUES (@SOHDN, @MASP, @MANV, @NGAYNHAP, @SOLUONGN, @DONGIAN)
    END
END
--kt
EXECUTE SP_INSERT_BANGNHAP N'HD001', N'SP001', N'NV001', '2023-04-11', 10, 100000
--cau6
CREATE PROCEDURE sp_ThemXuatHang (
    @SOHD nchar(10),
    @MASP nchar(10),
    @MANV nchar(10),
    @NGAYXUAT date,
    @SOLUONGX int
)
AS
BEGIN
    SET NOCOUNT ON;
    

    IF NOT EXISTS(SELECT MASP FROM SANPHAM WHERE MASP = @MASP)
    BEGIN
        RAISERROR('MASP không tồn tại trong bảng SANPAHM.', 16, 1);
        RETURN;
    END
    

    IF NOT EXISTS(SELECT MANV FROM NHANVIEN WHERE MANV = @MANV)
    BEGIN
        RAISERROR('MANV không tồn tại trong bảng NHANVIEN.', 16, 1);
        RETURN;
    END
    

    IF (SELECT SOLUONG FROM SANPHAM WHERE MASP = @MASP) < @SOLUONGX
    BEGIN
        RAISERROR('SOLUONGX lớn hơn SOLUONG trong bảng SANPHAM.', 16, 1);
        RETURN;
    END
    

    IF EXISTS(SELECT SOHDN FROM BANGNHAP WHERE SOHDN = @SOHD)
    BEGIN

        UPDATE BANGNHAP 
        SET MANV = @MANV, NGAYNHAP = @NGAYXUAT, SOLUONGN = @SOLUONGX, DONGIAN = (SELECT GIABAN FROM SANPHAM WHERE MASP = @MASP)
        WHERE SOHDN = @SOHD AND MASP = @MASP;
    END
    ELSE
    BEGIN

        INSERT INTO BANGXUAT (SOHDX, MASP, MANV, NGAYXUAT, SOLUONGX)
        VALUES (@SOHD, @MASP, @MANV, @NGAYXUAT, @SOLUONGX);
    END
END
--cau7
CREATE PROCEDURE DeleteNhanVien
    @MANV NCHAR(10)
AS
BEGIN
    SET NOCOUNT ON;
    
    IF NOT EXISTS (SELECT * FROM NHANVIEN WHERE MANV = @MANV)
    BEGIN
        PRINT 'Không tồn tại nhân viên có MANV là ' + @MANV + '.'
        RETURN;
    END
    

    DELETE FROM BANGNHAP WHERE MANV = @MANV;
    DELETE FROM BANGXUAT WHERE MANV = @MANV;
    

    DELETE FROM NHANVIEN WHERE MANV = @MANV;
    
    PRINT 'Đã xoá thành công nhân viên có MANV là ' + @MANV + '.';
END
--kt
EXEC DeleteNhanVien N'NV05';
--cau8
CREATE PROCEDURE DeleteSanPham
    @masp NCHAR(10)
AS
BEGIN

    IF NOT EXISTS(SELECT * FROM SANPHAM WHERE masp = @masp)
    BEGIN
        RAISERROR('MASP does not exist in SANPHAM table', 16, 1)
        RETURN
    END

    DELETE FROM NHAP WHERE masp = @masp
    

    DELETE FROM XUAT WHERE masp = @masp
    

    DELETE FROM SANPHAM WHERE masp = @masp
    
END
--kt
EXEC DeleteSanPham 'SP01';