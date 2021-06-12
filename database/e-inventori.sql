-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 12, 2021 at 01:13 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `e-inventori`
--

-- --------------------------------------------------------

--
-- Table structure for table `e_detail_faktur`
--

CREATE TABLE `e_detail_faktur` (
  `id_detail_faktur` int(11) NOT NULL,
  `id_faktur` int(11) NOT NULL,
  `id_inventori` int(11) NOT NULL,
  `jumlah_inventori` int(11) NOT NULL,
  `harga_pokok` int(11) DEFAULT NULL,
  `harga_jual` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `e_faktur`
--

CREATE TABLE `e_faktur` (
  `id_faktur` int(11) NOT NULL,
  `catatan_faktur` varchar(250) NOT NULL,
  `kategori_faktur` enum('in','out') NOT NULL,
  `status_approval` enum('pending','accept','reject') NOT NULL DEFAULT 'pending',
  `created_by` int(11) NOT NULL,
  `created_time` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `approval_by` int(11) DEFAULT NULL,
  `approval_time` datetime DEFAULT NULL,
  `qrcode_faktur` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `e_hak_akses`
--

CREATE TABLE `e_hak_akses` (
  `id_hak_akses` int(11) NOT NULL,
  `nama_hak_akses` varchar(225) NOT NULL,
  `modul_akses` text NOT NULL,
  `parent_modul_akses` text DEFAULT NULL,
  `created_time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `e_hak_akses`
--

INSERT INTO `e_hak_akses` (`id_hak_akses`, `nama_hak_akses`, `modul_akses`, `parent_modul_akses`, `created_time`) VALUES
(1, 'superuser', '{\n    \"modul\": [\n        \"pengguna\",\n        \"createPengguna\",\n        \"updatePengguna\",\n        \"deletePengguna\",\n        \"hakAkses\",\n        \"createHakAkses\",\n        \"updateHakAkses\",\n        \"deleteHakAkses\",\n        \"listInventori\",\n        \"createInventori\",\n        \"updateInventori\",\n        \"deleteInventori\",\n        \"kategori\",\n        \"createKategori\",\n        \"updateKategori\",\n        \"deleteKategori\",\n        \"satuan\",\n        \"createSatuan\",\n        \"updateSatuan\",\n        \"deleteSatuan\",\n        \"logistikMasuk\",\n        \"createLogistikMasuk\",\n        \"updateLogistikMasuk\",\n        \"deleteLogistikMasuk\",\n        \"approveLogistikMasuk\",\n        \"logistikKeluar\",\n        \"createLogistikKeluar\",\n        \"updateLogistikKeluar\",\n        \"deleteLogistikKeluar\",\n        \"approveLogistikKeluar\",\n        \"detailInventori\",\n        \"detailLogistikMasuk\",\n        \"detailLogistikKeluar\",\n        \"rejectLogistkMasuk\",\n        \"rejectLogistikKeluar\",\n        \"identitasAplikasi\",\n        \"daftarModul\"\n    ]\n}', '{\n    \"parent_modul\": [\n        \"Dashboard\",\n        \"MasterData\",\n        \"Inventori\",\n        \"Pengaturan\"\n    ]\n}', '2021-06-10 09:21:01');

-- --------------------------------------------------------

--
-- Table structure for table `e_identitas`
--

CREATE TABLE `e_identitas` (
  `id_profile` int(11) NOT NULL,
  `apps_name` varchar(225) NOT NULL,
  `apps_version` varchar(225) NOT NULL,
  `apps_code` varchar(5) DEFAULT NULL,
  `agency` varchar(225) DEFAULT NULL,
  `address` varchar(225) DEFAULT NULL,
  `city` varchar(225) DEFAULT NULL,
  `telephon` varchar(225) DEFAULT NULL,
  `fax` varchar(225) DEFAULT NULL,
  `website` varchar(225) DEFAULT NULL,
  `header` varchar(225) DEFAULT NULL,
  `footer` varchar(225) DEFAULT NULL,
  `keyword` text DEFAULT NULL,
  `logo` varchar(225) DEFAULT 'NULL',
  `icon` varchar(225) DEFAULT NULL,
  `sidebar_login` varchar(225) DEFAULT NULL,
  `about_us` text DEFAULT NULL,
  `email` varchar(225) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `e_identitas`
--

INSERT INTO `e_identitas` (`id_profile`, `apps_name`, `apps_version`, `apps_code`, `agency`, `address`, `city`, `telephon`, `fax`, `website`, `header`, `footer`, `keyword`, `logo`, `icon`, `sidebar_login`, `about_us`, `email`) VALUES
(1, 'e-inventaris', '1.0', 'eis', '| EIS', '', '', '', '', '', '', '', '', 'assets/img/logotubes.png', 'assets/img/logotubes.ico', 'assets/img/Jenis-Gudang-Harmony.jpg', '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `e_inventori`
--

CREATE TABLE `e_inventori` (
  `id_inventori` int(11) NOT NULL,
  `nama_inventori` varchar(250) NOT NULL,
  `satuan_inventori` int(11) NOT NULL,
  `harga_pokok` int(11) DEFAULT NULL,
  `harga_jual` int(11) NOT NULL,
  `kategori_inventori` int(11) NOT NULL,
  `jumlah_inventori` int(11) DEFAULT NULL,
  `qrcode` varchar(250) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_time` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `e_kategori_inventori`
--

CREATE TABLE `e_kategori_inventori` (
  `id_kategori` int(11) NOT NULL,
  `nama_kategori` varchar(250) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_time` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `e_kategori_inventori`
--

INSERT INTO `e_kategori_inventori` (`id_kategori`, `nama_kategori`, `created_by`, `created_time`, `updated_by`, `updated_time`) VALUES
(1, 'Barang Non Produksi', 1, '2021-06-11 08:59:20', 1, '2021-06-11 09:02:18'),
(2, 'Barang Produksi', 1, '2021-06-11 15:06:23', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `e_modul`
--

CREATE TABLE `e_modul` (
  `id_modul` int(11) NOT NULL,
  `controller_modul` varchar(225) NOT NULL,
  `nama_modul` varchar(225) NOT NULL,
  `link_modul` varchar(225) NOT NULL,
  `type_modul` varchar(20) NOT NULL,
  `class_parent_modul` varchar(225) DEFAULT NULL,
  `created_time` datetime NOT NULL DEFAULT current_timestamp(),
  `tampil_sidebar` enum('Y','N') NOT NULL,
  `child_module` enum('Y','N') NOT NULL DEFAULT 'N',
  `induk_child_modul` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `e_modul`
--

INSERT INTO `e_modul` (`id_modul`, `controller_modul`, `nama_modul`, `link_modul`, `type_modul`, `class_parent_modul`, `created_time`, `tampil_sidebar`, `child_module`, `induk_child_modul`) VALUES
(1, 'pengguna', 'Daftar Pengguna', 'panel/masterdata/pengguna', 'R', 'MasterData', '2021-06-10 07:59:17', 'Y', 'N', NULL),
(2, 'createPengguna', 'Tambah Pengguna', 'panel/masterdata/createPengguna', 'C', 'MasterData', '2021-06-10 08:00:06', 'N', 'N', NULL),
(3, 'updatePengguna', 'Update Pengguna', 'panel/masterdata/updatePengguna', 'U', 'MasterData', '2021-06-10 08:00:37', 'N', 'N', NULL),
(4, 'deletePengguna', 'Delete Pengguna', 'panel/masterdata/deletePengguna', 'D', 'MasterData', '2021-06-10 08:01:06', 'N', 'N', NULL),
(5, 'hakAkses', 'Daftar Hak Akses', 'panel/masterdata/hakAkses', 'R', 'MasterData', '2021-06-10 08:01:37', 'Y', 'N', NULL),
(6, 'createHakAkses', 'Tambah Hak Akses', 'panel/masterdata/createHakAkses', 'C', 'MasterData', '2021-06-10 08:02:11', 'N', 'N', NULL),
(7, 'updateHakAkses', 'Update Hak Akses', 'panel/masterdata/updateHakAkses', 'U', 'MasterData', '2021-06-10 08:02:33', 'N', 'N', NULL),
(8, 'deleteHakAkses', 'Delete Hak Akses', 'panel/masterdata/deleteHakAkses', 'D', 'MasterData', '2021-06-10 08:02:57', 'N', 'N', NULL),
(9, 'listInventori', 'Daftar Inventori', 'panel/inventori/listInventori', 'R', 'Inventori', '2021-06-10 08:03:50', 'Y', 'N', NULL),
(10, 'createInventori', 'Tambah Inventori', 'panel/inventori/createInventori', 'C', 'Inventori', '2021-06-10 08:04:10', 'N', 'N', NULL),
(11, 'updateInventori', 'Update Inventori', 'panel/inventori/updateInventori', 'U', 'Inventori', '2021-06-10 08:04:31', 'N', 'N', NULL),
(12, 'deleteInventori', 'Delete Inventori', 'panel/inventori/deleteInventori', 'D', 'Inventori', '2021-06-10 08:04:56', 'N', 'N', NULL),
(13, 'kategori', 'Daftar Kategori Inventori', 'panel/inventori/kategori', 'R', 'Inventori', '2021-06-10 08:05:36', 'Y', 'N', NULL),
(14, 'createKategori', 'Tambah Kategori Inventori', 'panel/inventori/createKategori', 'C', 'Inventori', '2021-06-10 08:06:02', 'N', 'N', NULL),
(15, 'updateKategori', 'Update Kategori', 'panel/inventori/updateKategori', 'U', 'Inventori', '2021-06-10 08:06:21', 'N', 'N', NULL),
(16, 'deleteKategori', 'Delete Kategori Inventori', 'panel/inventori/deleteKategori', 'D', 'Inventori', '2021-06-10 08:06:40', 'N', 'N', NULL),
(17, 'satuan', 'Daftar Satuan Inventori', 'panel/inventori/satuan', 'R', 'Inventori', '2021-06-10 08:07:01', 'Y', 'N', NULL),
(18, 'createSatuan', 'Tambah Satuan Inventori', 'panel/inventori/satuan', 'C', 'Inventori', '2021-06-10 08:07:21', 'N', 'N', NULL),
(19, 'updateSatuan', 'Update Satuan Inventori', 'panel/inventori/updateSatuan', 'U', 'Inventori', '2021-06-10 08:07:38', 'N', 'N', NULL),
(20, 'deleteSatuan', 'Delete Satuan Inventori', 'panel/inventori/deleteSatuan', 'D', 'Inventori', '2021-06-10 08:17:24', 'N', 'N', NULL),
(21, 'logistikMasuk', 'Daftar Logistik Masuk', 'panel/inventori/logistikMasuk', 'R', 'Inventori', '2021-06-10 08:18:01', 'Y', 'N', NULL),
(22, 'createLogistikMasuk', 'Tambah Logistik Masuk', 'panel/inventori/createLogistikMasuk', 'C', 'Inventori', '2021-06-10 08:29:24', 'N', 'N', NULL),
(23, 'updateLogistikMasuk', 'Update Logistik Masuk', 'panel/inventori/updateLogistikMasuk', 'U', 'Inventori', '2021-06-10 08:29:50', 'N', 'N', NULL),
(24, 'deleteLogistikMasuk', 'Delete Logistik Masuk', 'panel/inventori/deleteLogistikMasuk', 'D', 'Inventori', '2021-06-10 08:30:09', 'N', 'N', NULL),
(25, 'approveLogistikMasuk', 'Approve Logistik Masuk', 'panel/inventori/approveLogistikMasuk', 'U', 'Inventori', '2021-06-10 08:30:49', 'N', 'N', NULL),
(26, 'logistikKeluar', 'Daftar Logistik Keluar', 'panel/inventori/logistikKeluar', 'R', 'Inventori', '2021-06-10 08:31:16', 'Y', 'N', NULL),
(27, 'createLogistikKeluar', 'Tambah Logistik Keluar', 'panel/inventori/createLogistikKeluar', 'C', 'Inventori', '2021-06-10 08:31:38', 'N', 'N', NULL),
(28, 'updateLogistikKeluar', 'Update Logistik Keluar', 'panel/inventori/updateLogistikKeluar', 'U', 'Inventori', '2021-06-10 08:31:58', 'N', 'N', NULL),
(29, 'deleteLogistikKeluar', 'Delete Logistik Keluar', 'panel/inventori/deleteLogistikKeluar', 'D', 'Inventori', '2021-06-10 08:32:20', 'N', 'N', NULL),
(30, 'approveLogistikKeluar', 'Approve Logistik Keluar', 'panel/inventori/approveLogistikKeluar', 'U', 'Inventori', '2021-06-10 08:32:46', 'N', 'N', NULL),
(31, 'identitasAplikasi', 'Identitas Aplikasi', 'panel/pengaturan/identitasAplikasi', 'U', 'Pengaturan', '2021-06-10 08:33:19', 'Y', 'N', NULL),
(32, 'daftarModul', 'Daftar Modul', 'panel/pengaturan/daftarModul', 'R', 'Pengaturan', '2021-06-10 08:33:43', 'Y', 'N', NULL),
(33, 'detailInventori', 'Detail inventori', 'panel/inventori/detailInventori', 'R', 'Inventori', '2021-06-11 23:51:22', 'N', 'N', NULL),
(34, 'detailLogistikMasuk', 'Detail Logistik Masuk', 'panel/inventori/detailLogistikMasuk', 'R', 'Inventori', '2021-06-12 11:24:29', 'N', 'N', NULL),
(35, 'detailLogistikKeluar', 'Detail Logistik Keluar', 'panel/inventori/detailLogistikKeluar', 'R', 'Inventori', '2021-06-12 11:24:57', 'N', 'N', NULL),
(36, 'rejectLogistkMasuk', 'Reject Logistik Masuk', 'panel/inventori/rejectLogistikKeluar', 'U', 'Inventori', '2021-06-12 11:49:06', 'N', 'N', NULL),
(37, 'rejectLogistikKeluar', 'Reject Logistik Keluar', 'panel/inventori/rejectLogistikKeluar', 'U', 'Inventori', '2021-06-12 11:49:32', 'N', 'N', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `e_parent_modul`
--

CREATE TABLE `e_parent_modul` (
  `id_parent_modul` int(11) NOT NULL,
  `class` varchar(225) DEFAULT NULL,
  `nama_parent_modul` varchar(225) NOT NULL,
  `urutan` int(11) NOT NULL,
  `icon` varchar(225) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `child_module` enum('Y','N') NOT NULL,
  `link` varchar(225) NOT NULL,
  `tampil_sidebar_parent` enum('Y','N') NOT NULL DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `e_parent_modul`
--

INSERT INTO `e_parent_modul` (`id_parent_modul`, `class`, `nama_parent_modul`, `urutan`, `icon`, `created_time`, `child_module`, `link`, `tampil_sidebar_parent`) VALUES
(1, 'Dashboard', 'Dashboard', 1, 'fa fa-dashboard', '2021-06-10 00:57:29', 'N', 'panel/dashboard', 'Y'),
(2, 'MasterData', 'Master Data', 2, 'fa fa-desktop', '2021-06-10 00:57:59', 'Y', '#', 'Y'),
(3, 'Inventori', 'Inventori', 3, 'fa fa-list', '2021-06-10 00:58:18', 'Y', '#', 'Y'),
(4, 'Pengaturan', 'Pengaturan', 4, 'fa fa-cog', '2021-06-10 00:58:35', 'Y', '#', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `e_pengguna`
--

CREATE TABLE `e_pengguna` (
  `id_pengguna` int(11) NOT NULL,
  `username` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `email` varchar(250) NOT NULL,
  `hak_akses` varchar(250) NOT NULL,
  `nama_lengkap` varchar(250) NOT NULL,
  `foto_pengguna` varchar(250) DEFAULT NULL,
  `jenkel` enum('L','P') DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `alamat` varchar(250) DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `last_logout` datetime DEFAULT NULL,
  `created_time` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `e_pengguna`
--

INSERT INTO `e_pengguna` (`id_pengguna`, `username`, `password`, `email`, `hak_akses`, `nama_lengkap`, `foto_pengguna`, `jenkel`, `tgl_lahir`, `alamat`, `last_login`, `last_logout`, `created_time`, `created_by`, `updated_time`, `updated_by`) VALUES
(1, 'superuser', '72d8f949d00e431239b993f14b70d80d5313efc9', 'test@mail.com', 'superuser', 'superuser', 'assets/img/pengguna/logo_disdik.png', 'L', NULL, NULL, '2021-06-12 15:30:35', '2021-06-12 00:23:59', '2021-06-10 09:32:44', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `e_satuan_inventori`
--

CREATE TABLE `e_satuan_inventori` (
  `id_satuan` int(11) NOT NULL,
  `nama_satuan` varchar(250) NOT NULL,
  `singkatan_satuan` varchar(20) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_time` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `e_satuan_inventori`
--

INSERT INTO `e_satuan_inventori` (`id_satuan`, `nama_satuan`, `singkatan_satuan`, `created_by`, `created_time`, `updated_by`, `updated_time`) VALUES
(1, 'Kilogram', 'Kg', 1, '2021-06-11 09:16:36', NULL, NULL);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_detail_inventori`
-- (See below for the actual view)
--
CREATE TABLE `v_detail_inventori` (
`id_inventori` int(11)
,`nama_inventori` varchar(250)
,`satuan_inventori` int(11)
,`harga_pokok` int(11)
,`harga_jual` int(11)
,`kategori_inventori` int(11)
,`jumlah_inventori` int(11)
,`created_by` int(11)
,`created_time` datetime
,`updated_by` int(11)
,`updated_time` datetime
,`id_faktur` int(11)
,`jumlah_inventori_faktur` int(11)
,`singkatan_satuan` varchar(20)
,`harga_pokok_faktur` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_faktur`
-- (See below for the actual view)
--
CREATE TABLE `v_faktur` (
`id_faktur` int(11)
,`catatan_faktur` varchar(250)
,`kategori_faktur` enum('in','out')
,`status_approval` enum('pending','accept','reject')
,`created_by` int(11)
,`created_time` datetime
,`updated_by` int(11)
,`updated_time` datetime
,`approval_time` datetime
,`qrcode_faktur` varchar(250)
,`total_belanja` decimal(42,0)
,`pembuat_faktur` varchar(250)
,`pengaprove_faktur` varchar(250)
,`total_penjualan` decimal(42,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_inventori`
-- (See below for the actual view)
--
CREATE TABLE `v_inventori` (
`qrcode` varchar(250)
,`id_inventori` int(11)
,`nama_inventori` varchar(250)
,`satuan_inventori` int(11)
,`harga_pokok` int(11)
,`harga_jual` int(11)
,`kategori_inventori` int(11)
,`jumlah_inventori` int(11)
,`created_by` int(11)
,`created_time` datetime
,`updated_by` int(11)
,`updated_time` datetime
,`nama_kategori` varchar(250)
,`nama_satuan` varchar(250)
,`singkatan_satuan` varchar(20)
);

-- --------------------------------------------------------

--
-- Structure for view `v_detail_inventori`
--
DROP TABLE IF EXISTS `v_detail_inventori`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_detail_inventori`  AS SELECT `ei`.`id_inventori` AS `id_inventori`, `ei`.`nama_inventori` AS `nama_inventori`, `ei`.`satuan_inventori` AS `satuan_inventori`, `ei`.`harga_pokok` AS `harga_pokok`, `ei`.`harga_jual` AS `harga_jual`, `ei`.`kategori_inventori` AS `kategori_inventori`, `ei`.`jumlah_inventori` AS `jumlah_inventori`, `ei`.`created_by` AS `created_by`, `ei`.`created_time` AS `created_time`, `ei`.`updated_by` AS `updated_by`, `ei`.`updated_time` AS `updated_time`, `df`.`id_faktur` AS `id_faktur`, `df`.`jumlah_inventori` AS `jumlah_inventori_faktur`, `s`.`singkatan_satuan` AS `singkatan_satuan`, `df`.`harga_pokok` AS `harga_pokok_faktur` FROM (((`e_detail_faktur` `df` join `e_inventori` `ei` on(`df`.`id_inventori` = `ei`.`id_inventori`)) join `e_satuan_inventori` `s` on(`s`.`id_satuan` = `ei`.`satuan_inventori`)) join `e_faktur` `f` on(`f`.`id_faktur` = `df`.`id_faktur`)) ;

-- --------------------------------------------------------

--
-- Structure for view `v_faktur`
--
DROP TABLE IF EXISTS `v_faktur`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_faktur`  AS SELECT `f`.`id_faktur` AS `id_faktur`, `f`.`catatan_faktur` AS `catatan_faktur`, `f`.`kategori_faktur` AS `kategori_faktur`, `f`.`status_approval` AS `status_approval`, `f`.`created_by` AS `created_by`, `f`.`created_time` AS `created_time`, `f`.`updated_by` AS `updated_by`, `f`.`updated_time` AS `updated_time`, `f`.`approval_time` AS `approval_time`, `f`.`qrcode_faktur` AS `qrcode_faktur`, sum(`df`.`harga_pokok` * `df`.`jumlah_inventori`) AS `total_belanja`, `p`.`nama_lengkap` AS `pembuat_faktur`, `p2`.`nama_lengkap` AS `pengaprove_faktur`, sum(`df`.`harga_jual` * `df`.`jumlah_inventori`) AS `total_penjualan` FROM (((`e_faktur` `f` join `e_detail_faktur` `df` on(`f`.`id_faktur` = `df`.`id_faktur`)) join `e_pengguna` `p` on(`p`.`id_pengguna` = `f`.`created_by`)) left join `e_pengguna` `p2` on(`p2`.`id_pengguna` = `f`.`approval_by`)) GROUP BY `df`.`id_faktur` ;

-- --------------------------------------------------------

--
-- Structure for view `v_inventori`
--
DROP TABLE IF EXISTS `v_inventori`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_inventori`  AS SELECT `ei`.`qrcode` AS `qrcode`, `ei`.`id_inventori` AS `id_inventori`, `ei`.`nama_inventori` AS `nama_inventori`, `ei`.`satuan_inventori` AS `satuan_inventori`, `ei`.`harga_pokok` AS `harga_pokok`, `ei`.`harga_jual` AS `harga_jual`, `ei`.`kategori_inventori` AS `kategori_inventori`, `ei`.`jumlah_inventori` AS `jumlah_inventori`, `ei`.`created_by` AS `created_by`, `ei`.`created_time` AS `created_time`, `ei`.`updated_by` AS `updated_by`, `ei`.`updated_time` AS `updated_time`, `eki`.`nama_kategori` AS `nama_kategori`, `esi`.`nama_satuan` AS `nama_satuan`, `esi`.`singkatan_satuan` AS `singkatan_satuan` FROM ((`e_inventori` `ei` join `e_kategori_inventori` `eki` on(`ei`.`kategori_inventori` = `eki`.`id_kategori`)) join `e_satuan_inventori` `esi` on(`ei`.`satuan_inventori` = `esi`.`id_satuan`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `e_detail_faktur`
--
ALTER TABLE `e_detail_faktur`
  ADD PRIMARY KEY (`id_detail_faktur`),
  ADD KEY `FK_detail_faktur_id_faktur` (`id_faktur`),
  ADD KEY `FK_detail_faktur_id_inventori` (`id_inventori`);

--
-- Indexes for table `e_faktur`
--
ALTER TABLE `e_faktur`
  ADD PRIMARY KEY (`id_faktur`),
  ADD KEY `FK_faktur_created` (`created_by`),
  ADD KEY `FK_faktur_updated` (`updated_by`),
  ADD KEY `FK_e_faktur_e_pengguna` (`approval_by`);

--
-- Indexes for table `e_hak_akses`
--
ALTER TABLE `e_hak_akses`
  ADD PRIMARY KEY (`id_hak_akses`),
  ADD UNIQUE KEY `nama_hak_akses` (`nama_hak_akses`);

--
-- Indexes for table `e_identitas`
--
ALTER TABLE `e_identitas`
  ADD PRIMARY KEY (`id_profile`);

--
-- Indexes for table `e_inventori`
--
ALTER TABLE `e_inventori`
  ADD PRIMARY KEY (`id_inventori`),
  ADD KEY `FK_inventori_created` (`created_by`),
  ADD KEY `FK_inventori_updated` (`updated_by`);

--
-- Indexes for table `e_kategori_inventori`
--
ALTER TABLE `e_kategori_inventori`
  ADD PRIMARY KEY (`id_kategori`),
  ADD KEY `FK_created_kategori` (`created_by`),
  ADD KEY `FK_updated_kategori` (`updated_by`);

--
-- Indexes for table `e_modul`
--
ALTER TABLE `e_modul`
  ADD PRIMARY KEY (`id_modul`),
  ADD UNIQUE KEY `controller_modul` (`controller_modul`),
  ADD KEY `class_parent_modul` (`class_parent_modul`),
  ADD KEY `induk_child_modul` (`induk_child_modul`);

--
-- Indexes for table `e_parent_modul`
--
ALTER TABLE `e_parent_modul`
  ADD PRIMARY KEY (`id_parent_modul`),
  ADD UNIQUE KEY `class` (`class`);

--
-- Indexes for table `e_pengguna`
--
ALTER TABLE `e_pengguna`
  ADD PRIMARY KEY (`id_pengguna`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `FK_hak_akses` (`hak_akses`);

--
-- Indexes for table `e_satuan_inventori`
--
ALTER TABLE `e_satuan_inventori`
  ADD PRIMARY KEY (`id_satuan`),
  ADD KEY `FK_created_satuan` (`created_by`),
  ADD KEY `FK_updated_satuan` (`updated_by`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `e_detail_faktur`
--
ALTER TABLE `e_detail_faktur`
  MODIFY `id_detail_faktur` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `e_faktur`
--
ALTER TABLE `e_faktur`
  MODIFY `id_faktur` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `e_hak_akses`
--
ALTER TABLE `e_hak_akses`
  MODIFY `id_hak_akses` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `e_identitas`
--
ALTER TABLE `e_identitas`
  MODIFY `id_profile` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `e_inventori`
--
ALTER TABLE `e_inventori`
  MODIFY `id_inventori` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `e_kategori_inventori`
--
ALTER TABLE `e_kategori_inventori`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `e_modul`
--
ALTER TABLE `e_modul`
  MODIFY `id_modul` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `e_parent_modul`
--
ALTER TABLE `e_parent_modul`
  MODIFY `id_parent_modul` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `e_pengguna`
--
ALTER TABLE `e_pengguna`
  MODIFY `id_pengguna` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `e_satuan_inventori`
--
ALTER TABLE `e_satuan_inventori`
  MODIFY `id_satuan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `e_detail_faktur`
--
ALTER TABLE `e_detail_faktur`
  ADD CONSTRAINT `FK_detail_faktur_id_faktur` FOREIGN KEY (`id_faktur`) REFERENCES `e_faktur` (`id_faktur`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_detail_faktur_id_inventori` FOREIGN KEY (`id_inventori`) REFERENCES `e_inventori` (`id_inventori`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `e_faktur`
--
ALTER TABLE `e_faktur`
  ADD CONSTRAINT `FK_e_faktur_e_pengguna` FOREIGN KEY (`approval_by`) REFERENCES `e_pengguna` (`id_pengguna`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_faktur_created` FOREIGN KEY (`created_by`) REFERENCES `e_pengguna` (`id_pengguna`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_faktur_updated` FOREIGN KEY (`updated_by`) REFERENCES `e_pengguna` (`id_pengguna`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `e_inventori`
--
ALTER TABLE `e_inventori`
  ADD CONSTRAINT `FK_inventori_created` FOREIGN KEY (`created_by`) REFERENCES `e_pengguna` (`id_pengguna`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_inventori_updated` FOREIGN KEY (`updated_by`) REFERENCES `e_pengguna` (`id_pengguna`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `e_kategori_inventori`
--
ALTER TABLE `e_kategori_inventori`
  ADD CONSTRAINT `FK_created_kategori` FOREIGN KEY (`created_by`) REFERENCES `e_pengguna` (`id_pengguna`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_updated_kategori` FOREIGN KEY (`updated_by`) REFERENCES `e_pengguna` (`id_pengguna`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `e_modul`
--
ALTER TABLE `e_modul`
  ADD CONSTRAINT `class_parent_modul` FOREIGN KEY (`class_parent_modul`) REFERENCES `e_parent_modul` (`class`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `induk_child_modul` FOREIGN KEY (`induk_child_modul`) REFERENCES `e_modul` (`controller_modul`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `e_pengguna`
--
ALTER TABLE `e_pengguna`
  ADD CONSTRAINT `FK_hak_akses` FOREIGN KEY (`hak_akses`) REFERENCES `e_hak_akses` (`nama_hak_akses`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `e_satuan_inventori`
--
ALTER TABLE `e_satuan_inventori`
  ADD CONSTRAINT `FK_created_satuan` FOREIGN KEY (`created_by`) REFERENCES `e_pengguna` (`id_pengguna`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_updated_satuan` FOREIGN KEY (`updated_by`) REFERENCES `e_pengguna` (`id_pengguna`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
