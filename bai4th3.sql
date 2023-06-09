﻿Use master 
Create database Quanlibanhang
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

