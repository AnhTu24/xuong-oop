-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 03, 2024 at 12:57 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `asm-php2`
--

-- --------------------------------------------------------

--
-- Table structure for table `binhluan`
--

CREATE TABLE `binhluan` (
  `idBinhLuan` int NOT NULL,
  `nguoiDungId` int NOT NULL,
  `noiDung` text COLLATE utf8mb4_vi_0900_as_cs NOT NULL,
  `tinTucId` int NOT NULL,
  `ngayBinhLuan` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `kichHoat` tinyint NOT NULL DEFAULT '1' COMMENT '0:Chưa kích hoạt\r\n1:Đã kích hoạt'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vi_0900_as_cs;

-- --------------------------------------------------------

--
-- Table structure for table `danhmuctintuc`
--

CREATE TABLE `danhmuctintuc` (
  `idDanhMuc` int NOT NULL,
  `tenDanhMuc` varchar(255) COLLATE utf8mb4_vi_0900_as_cs NOT NULL,
  `kichHoat` tinyint NOT NULL DEFAULT '1' COMMENT '0:Chưa kích hoạt\r\n1:Đã kích hoạt\r\n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vi_0900_as_cs;

-- --------------------------------------------------------

--
-- Table structure for table `taikhoan`
--

CREATE TABLE `taikhoan` (
  `idNguoiDung` int NOT NULL,
  `tenDangNhap` varchar(255) COLLATE utf8mb4_vi_0900_as_cs NOT NULL,
  `matKhau` varchar(255) COLLATE utf8mb4_vi_0900_as_cs NOT NULL,
  `ho` varchar(50) COLLATE utf8mb4_vi_0900_as_cs NOT NULL,
  `ten` varchar(50) COLLATE utf8mb4_vi_0900_as_cs NOT NULL,
  `soDienThoai` int NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_vi_0900_as_cs NOT NULL,
  `hinhAnh` varchar(255) COLLATE utf8mb4_vi_0900_as_cs DEFAULT NULL,
  `ngayDangKy` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `vaiTro` tinyint NOT NULL DEFAULT '0' COMMENT '0:Admin\r\n1:Tác giả\r\n2:Người dùng',
  `kichHoat` tinyint NOT NULL DEFAULT '1' COMMENT '0:Chưa kích hoạt\r\n1:Đã kích hoạt'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vi_0900_as_cs;

-- --------------------------------------------------------

--
-- Table structure for table `tintuc`
--

CREATE TABLE `tintuc` (
  `idTinTuc` int NOT NULL,
  `tieuDe` varchar(255) COLLATE utf8mb4_vi_0900_as_cs NOT NULL,
  `moTa` varchar(100) COLLATE utf8mb4_vi_0900_as_cs NOT NULL,
  `hinhAnh` varchar(255) COLLATE utf8mb4_vi_0900_as_cs NOT NULL,
  `noiDung` text COLLATE utf8mb4_vi_0900_as_cs NOT NULL,
  `nguoiDungId` int NOT NULL,
  `ngayDang` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `danhMucId` int NOT NULL,
  `luotDoc` int NOT NULL,
  `trangThaiId` int NOT NULL COMMENT '0:Tạm ẩn\r\n1:Hiển thị',
  `kichHoat` tinyint NOT NULL DEFAULT '1' COMMENT '0:Chưa kích hoạt\r\n1:Đã kích hoạt'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vi_0900_as_cs;

-- --------------------------------------------------------

--
-- Table structure for table `trangthaitintuc`
--

CREATE TABLE `trangthaitintuc` (
  `idTrangThai` int NOT NULL,
  `tenTrangThai` varchar(100) COLLATE utf8mb4_vi_0900_as_cs NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vi_0900_as_cs;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `binhluan`
--
ALTER TABLE `binhluan`
  ADD PRIMARY KEY (`idBinhLuan`),
  ADD KEY `BinhLuan-TaiKhoan` (`nguoiDungId`),
  ADD KEY `BinhLuan-TinTuc` (`tinTucId`);

--
-- Indexes for table `danhmuctintuc`
--
ALTER TABLE `danhmuctintuc`
  ADD PRIMARY KEY (`idDanhMuc`);

--
-- Indexes for table `taikhoan`
--
ALTER TABLE `taikhoan`
  ADD PRIMARY KEY (`idNguoiDung`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `tintuc`
--
ALTER TABLE `tintuc`
  ADD PRIMARY KEY (`idTinTuc`),
  ADD KEY `TinTuc-DanhMuc` (`danhMucId`),
  ADD KEY `TinTuc-TrangThai` (`trangThaiId`),
  ADD KEY `TinTuc-TaiKhoan` (`nguoiDungId`);

--
-- Indexes for table `trangthaitintuc`
--
ALTER TABLE `trangthaitintuc`
  ADD PRIMARY KEY (`idTrangThai`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `binhluan`
--
ALTER TABLE `binhluan`
  MODIFY `idBinhLuan` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `danhmuctintuc`
--
ALTER TABLE `danhmuctintuc`
  MODIFY `idDanhMuc` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `taikhoan`
--
ALTER TABLE `taikhoan`
  MODIFY `idNguoiDung` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tintuc`
--
ALTER TABLE `tintuc`
  MODIFY `idTinTuc` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `trangthaitintuc`
--
ALTER TABLE `trangthaitintuc`
  MODIFY `idTrangThai` int NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `binhluan`
--
ALTER TABLE `binhluan`
  ADD CONSTRAINT `BinhLuan-TaiKhoan` FOREIGN KEY (`nguoiDungId`) REFERENCES `taikhoan` (`idNguoiDung`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `BinhLuan-TinTuc` FOREIGN KEY (`tinTucId`) REFERENCES `tintuc` (`idTinTuc`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `tintuc`
--
ALTER TABLE `tintuc`
  ADD CONSTRAINT `TinTuc-DanhMuc` FOREIGN KEY (`danhMucId`) REFERENCES `danhmuctintuc` (`idDanhMuc`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `TinTuc-TaiKhoan` FOREIGN KEY (`nguoiDungId`) REFERENCES `taikhoan` (`idNguoiDung`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `TinTuc-TrangThai` FOREIGN KEY (`trangThaiId`) REFERENCES `trangthaitintuc` (`idTrangThai`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
