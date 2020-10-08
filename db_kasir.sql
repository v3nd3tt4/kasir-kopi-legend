/*
SQLyog Ultimate v12.5.1 (64 bit)
MySQL - 10.4.13-MariaDB : Database - db_kasir
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_kasir` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `db_kasir`;

/*Table structure for table `tb_barang` */

DROP TABLE IF EXISTS `tb_barang`;

CREATE TABLE `tb_barang` (
  `id_barang` int(11) NOT NULL AUTO_INCREMENT,
  `kode_barang` varchar(255) NOT NULL,
  `nama_barang` varchar(255) NOT NULL,
  `tanggal` date NOT NULL,
  `nomor_faktur` varchar(255) NOT NULL,
  `jumlah_unit` varchar(255) DEFAULT NULL,
  `id_satuan` int(11) NOT NULL,
  `harga_beli` int(11) NOT NULL,
  `harga_jual` int(11) NOT NULL,
  `sum_jumlah_beli` int(11) NOT NULL,
  `sum_jumlah_jual` int(11) NOT NULL,
  PRIMARY KEY (`id_barang`),
  KEY `id_satuan` (`id_satuan`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tb_barang` */

insert  into `tb_barang`(`id_barang`,`kode_barang`,`nama_barang`,`tanggal`,`nomor_faktur`,`jumlah_unit`,`id_satuan`,`harga_beli`,`harga_jual`,`sum_jumlah_beli`,`sum_jumlah_jual`) values 
(2,'brg01','Paracetamol','2020-03-25','001/sjsjj','250',1,980000,1000000,245000000,250000000);

/*Table structure for table `tb_dokter` */

DROP TABLE IF EXISTS `tb_dokter`;

CREATE TABLE `tb_dokter` (
  `id_dokter` int(11) NOT NULL AUTO_INCREMENT,
  `nama_dokter` varchar(255) NOT NULL,
  `keterangan` text NOT NULL,
  PRIMARY KEY (`id_dokter`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tb_dokter` */

insert  into `tb_dokter`(`id_dokter`,`nama_dokter`,`keterangan`) values 
(2,'Linus Torvalds, SP. oG','Spesialis A'),
(3,'Lia','Spesialis A'),
(4,'dr. Fery, S.pA','Spesialis Anak'),
(5,'dr. Marina, S.pD','Spesialis penyakit dalam');

/*Table structure for table `tb_obat` */

DROP TABLE IF EXISTS `tb_obat`;

CREATE TABLE `tb_obat` (
  `id_obat` int(11) NOT NULL AUTO_INCREMENT,
  `kode_obat` varchar(255) NOT NULL,
  `nama_obat` varchar(255) NOT NULL,
  `id_unit` int(11) NOT NULL,
  `harga` varchar(255) NOT NULL,
  PRIMARY KEY (`id_obat`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tb_obat` */

insert  into `tb_obat`(`id_obat`,`kode_obat`,`nama_obat`,`id_unit`,`harga`) values 
(8,'kopi001','Kopi Matcha',8,'25000'),
(9,'mkn001','Pisang Keju',7,'15000'),
(10,'mkn002','Tahu Krispi',7,'12500'),
(11,'MKN003','Keju',7,'32000');

/*Table structure for table `tb_pasien` */

DROP TABLE IF EXISTS `tb_pasien`;

CREATE TABLE `tb_pasien` (
  `id_pasien` int(11) NOT NULL AUTO_INCREMENT,
  `nik` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `foto` varchar(255) NOT NULL,
  `jk` varchar(255) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `agama` varchar(255) NOT NULL,
  `rt` varchar(255) NOT NULL,
  `rw` varchar(255) NOT NULL,
  `kelurahan` varchar(255) NOT NULL,
  `alamat` text NOT NULL,
  `jenis` enum('umum','pasien jaminan') NOT NULL DEFAULT 'umum',
  PRIMARY KEY (`id_pasien`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tb_pasien` */

insert  into `tb_pasien`(`id_pasien`,`nik`,`nama`,`foto`,`jk`,`tgl_lahir`,`agama`,`rt`,`rw`,`kelurahan`,`alamat`,`jenis`) values 
(1,'92282','Okta Pilopa','20200323134243.png','Pria','2020-03-02','Islam','003','001','kakaka','kaak','umum'),
(3,'636373','Rifky','20200323135426.png','Pria','2020-03-23','Islam','001','002','Sukarame','sukarame aja','umum'),
(4,'46473722','ega ','20200405112411.png','Pria','2020-04-05','Kristen Protestan','001','002','hsh sjsjs','sukarame','pasien jaminan'),
(5,'8766','rendy','20200409054131.jpg','Pria','2020-04-09','Islam','001','002','kakaja','ii','pasien jaminan'),
(6,'6462727','putro','20200409060519.jpg','Pria','2020-04-09','Islam','001','002','kakaja','iikj','umum'),
(7,'098765456712345678765466','Indah','20200425041834.jpg','Wanita','2020-04-25','Islam','001','007','kakaja','test','pasien jaminan');

/*Table structure for table `tb_pbf` */

DROP TABLE IF EXISTS `tb_pbf`;

CREATE TABLE `tb_pbf` (
  `id_pbf` int(11) NOT NULL AUTO_INCREMENT,
  `nama_pbf` varchar(255) NOT NULL,
  PRIMARY KEY (`id_pbf`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tb_pbf` */

insert  into `tb_pbf`(`id_pbf`,`nama_pbf`) values 
(1,'K24'),
(2,'Kimia Farma');

/*Table structure for table `tb_resep` */

DROP TABLE IF EXISTS `tb_resep`;

CREATE TABLE `tb_resep` (
  `id_resep` int(11) NOT NULL AUTO_INCREMENT,
  `kode_resep` varchar(255) DEFAULT NULL,
  `id_unit` int(11) DEFAULT NULL,
  `id_dokter` int(11) DEFAULT NULL,
  `id_pasien` int(11) DEFAULT NULL,
  `id_kasir` int(11) DEFAULT NULL,
  `nomor_rekam_medis` varchar(255) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `status` enum('dibuat','diberikan','dibayar','selesai') DEFAULT NULL,
  `tanggal_bayar` date DEFAULT NULL,
  `tanggal_diberikan` date DEFAULT NULL,
  `uang_dibayarkan` varchar(255) DEFAULT NULL,
  `pemesan` varchar(255) DEFAULT NULL,
  `keterangan` text DEFAULT NULL,
  PRIMARY KEY (`id_resep`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tb_resep` */

insert  into `tb_resep`(`id_resep`,`kode_resep`,`id_unit`,`id_dokter`,`id_pasien`,`id_kasir`,`nomor_rekam_medis`,`tanggal`,`status`,`tanggal_bayar`,`tanggal_diberikan`,`uang_dibayarkan`,`pemesan`,`keterangan`) values 
(1,'20201004073015',4,NULL,NULL,3,NULL,'2020-10-04','dibayar','2020-10-04',NULL,'50000',NULL,NULL),
(2,'20201004082025',6,NULL,NULL,3,NULL,'2020-10-04','dibayar','2020-10-04',NULL,'45000',NULL,NULL),
(3,'20201004083306',6,NULL,NULL,3,NULL,'2020-10-04','dibayar','2020-10-07',NULL,'200000',NULL,NULL),
(4,'20201007162842',6,NULL,NULL,3,NULL,'2020-10-07','dibayar','2020-10-07',NULL,'200000',NULL,NULL),
(5,'20201008040451',6,NULL,NULL,3,NULL,'2020-10-08','dibayar','2020-10-08',NULL,'200000','Okta Pilopa','meja 4');

/*Table structure for table `tb_resep_detail` */

DROP TABLE IF EXISTS `tb_resep_detail`;

CREATE TABLE `tb_resep_detail` (
  `id_resep_detail` int(11) NOT NULL AUTO_INCREMENT,
  `id_resep` int(11) NOT NULL,
  `id_obat` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `harga_beli` int(11) NOT NULL,
  `harga_jual` int(11) NOT NULL,
  `sum_harga_beli` int(11) NOT NULL,
  `sum_harga_jual` int(11) NOT NULL,
  PRIMARY KEY (`id_resep_detail`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tb_resep_detail` */

insert  into `tb_resep_detail`(`id_resep_detail`,`id_resep`,`id_obat`,`jumlah`,`harga_beli`,`harga_jual`,`sum_harga_beli`,`sum_harga_jual`) values 
(1,1,8,3,0,25000,0,75000),
(2,1,9,6,0,15000,0,90000),
(3,2,10,8,0,12500,0,100000),
(4,2,9,4,0,15000,0,60000),
(5,2,8,6,0,25000,0,150000),
(6,3,8,7,0,25000,0,175000),
(7,4,9,2,0,15000,0,30000),
(8,4,10,3,0,12500,0,37500),
(9,4,8,5,0,25000,0,125000),
(10,5,8,2,0,25000,0,50000),
(11,5,9,5,0,15000,0,75000),
(12,5,10,2,0,12500,0,25000);

/*Table structure for table `tb_satuan` */

DROP TABLE IF EXISTS `tb_satuan`;

CREATE TABLE `tb_satuan` (
  `id_satuan` int(11) NOT NULL AUTO_INCREMENT,
  `nama_satuan` varchar(255) NOT NULL,
  PRIMARY KEY (`id_satuan`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tb_satuan` */

insert  into `tb_satuan`(`id_satuan`,`nama_satuan`) values 
(1,'Sachet'),
(2,'Botol');

/*Table structure for table `tb_stok` */

DROP TABLE IF EXISTS `tb_stok`;

CREATE TABLE `tb_stok` (
  `id_stok` int(11) NOT NULL AUTO_INCREMENT,
  `id_obat` int(11) NOT NULL,
  `tanggal_transaksi` date NOT NULL,
  `tanggal_kadaluarsa` date DEFAULT NULL,
  `tanggal_jatuh_tempo` date DEFAULT NULL,
  `id_pbf` int(11) NOT NULL,
  `nomor_faktur` varchar(255) NOT NULL,
  `jumlah_unit` int(11) NOT NULL,
  `id_satuan` int(11) NOT NULL,
  `harga_beli` int(11) NOT NULL,
  `harga_jual` int(11) NOT NULL,
  `sum_harga_beli` int(11) NOT NULL,
  `sum_harga_jual` int(11) NOT NULL,
  `status` enum('stok awal','pembelian','penggunaan') NOT NULL,
  `terpakai` int(11) NOT NULL,
  `no_batch` varchar(255) NOT NULL,
  PRIMARY KEY (`id_stok`),
  KEY `id_obat` (`id_obat`),
  KEY `tb_satuan` (`id_satuan`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tb_stok` */

insert  into `tb_stok`(`id_stok`,`id_obat`,`tanggal_transaksi`,`tanggal_kadaluarsa`,`tanggal_jatuh_tempo`,`id_pbf`,`nomor_faktur`,`jumlah_unit`,`id_satuan`,`harga_beli`,`harga_jual`,`sum_harga_beli`,`sum_harga_jual`,`status`,`terpakai`,`no_batch`) values 
(1,8,'2020-10-04',NULL,NULL,0,'',80,0,0,0,0,0,'stok awal',0,''),
(2,9,'2020-10-04',NULL,NULL,0,'',55,0,0,0,0,0,'stok awal',0,''),
(3,10,'2020-10-04',NULL,NULL,0,'',30,0,0,0,0,0,'stok awal',0,''),
(4,8,'2020-10-04',NULL,NULL,0,'20201004073015',3,0,0,25000,0,75000,'penggunaan',0,''),
(5,9,'2020-10-04',NULL,NULL,0,'20201004073015',6,0,0,15000,0,90000,'penggunaan',0,''),
(6,10,'2020-10-04',NULL,NULL,0,'20201004082025',8,0,0,12500,0,100000,'penggunaan',0,''),
(7,9,'2020-10-04',NULL,NULL,0,'20201004082025',4,0,0,15000,0,60000,'penggunaan',0,''),
(8,8,'2020-10-04',NULL,NULL,0,'20201004082025',6,0,0,25000,0,150000,'penggunaan',0,''),
(9,8,'2020-10-04',NULL,NULL,0,'20201004083306',7,0,0,25000,0,175000,'penggunaan',0,''),
(10,9,'2020-10-07',NULL,NULL,0,'20201007162842',2,0,0,15000,0,30000,'penggunaan',0,''),
(11,10,'2020-10-07',NULL,NULL,0,'20201007162842',3,0,0,12500,0,37500,'penggunaan',0,''),
(12,8,'2020-10-07',NULL,NULL,0,'20201007162842',5,0,0,25000,0,125000,'penggunaan',0,''),
(13,8,'2020-10-08',NULL,NULL,0,'20201008040451',2,0,0,25000,0,50000,'penggunaan',0,''),
(14,9,'2020-10-08',NULL,NULL,0,'20201008040451',5,0,0,15000,0,75000,'penggunaan',0,''),
(15,10,'2020-10-08',NULL,NULL,0,'20201008040451',2,0,0,12500,0,25000,'penggunaan',0,'');

/*Table structure for table `tb_unit` */

DROP TABLE IF EXISTS `tb_unit`;

CREATE TABLE `tb_unit` (
  `id_unit` int(11) NOT NULL AUTO_INCREMENT,
  `nama_unit` varchar(255) NOT NULL,
  PRIMARY KEY (`id_unit`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tb_unit` */

insert  into `tb_unit`(`id_unit`,`nama_unit`) values 
(7,'Makanan'),
(8,'Minuman');

/*Table structure for table `tb_user` */

DROP TABLE IF EXISTS `tb_user`;

CREATE TABLE `tb_user` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `nama_user` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `unit` int(11) DEFAULT NULL,
  `level` varchar(255) NOT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tb_user` */

insert  into `tb_user`(`id_user`,`nama_user`,`username`,`password`,`unit`,`level`) values 
(1,'Zuckerberg','fb','fb',1,'Admin'),
(2,'Linuz Torvalds','linuz','linuz',4,'Operator'),
(3,'Guido Van Rosum','guido','guido',6,'Kasir'),
(4,'Okta Pilopa','vendetta','goldroger27',NULL,'Admin');

/*Table structure for table `view_total_stok` */

DROP TABLE IF EXISTS `view_total_stok`;

/*!50001 DROP VIEW IF EXISTS `view_total_stok` */;
/*!50001 DROP TABLE IF EXISTS `view_total_stok` */;

/*!50001 CREATE TABLE  `view_total_stok`(
 `id_obat` int(11) ,
 `kode_obat` varchar(255) ,
 `nama_obat` varchar(255) ,
 `stok_awal` decimal(32,0) ,
 `pembelian` decimal(32,0) ,
 `penggunaan` decimal(32,0) 
)*/;

/*View structure for view view_total_stok */

/*!50001 DROP TABLE IF EXISTS `view_total_stok` */;
/*!50001 DROP VIEW IF EXISTS `view_total_stok` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_total_stok` AS select `t1`.`id_obat` AS `id_obat`,`t1`.`kode_obat` AS `kode_obat`,`t1`.`nama_obat` AS `nama_obat`,(select sum(`t2`.`jumlah_unit`) from `tb_stok` `t2` where `t2`.`id_obat` = `t1`.`id_obat` and `t2`.`status` = 'stok awal') AS `stok_awal`,(select sum(`t3`.`jumlah_unit`) from `tb_stok` `t3` where `t3`.`id_obat` = `t1`.`id_obat` and `t3`.`status` = 'pembelian') AS `pembelian`,(select sum(`t4`.`jumlah_unit`) from `tb_stok` `t4` where `t4`.`id_obat` = `t1`.`id_obat` and `t4`.`status` = 'penggunaan') AS `penggunaan` from `tb_obat` `t1` */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
