CREATE DATABASE Bandara_Horizon_Air;
CREATE TABLE `bagasi` (
  `ID_Bagasi` int NOT NULL,
  `Berat` int NOT NULL,
  `Ukuran` varchar(5) NOT NULL,
  `Warna` varchar(255) NOT NULL,
  `Jenis` varchar(255) NOT NULL
) 

CREATE TABLE `bandara` (
  `ID_Bandara` int NOT NULL,
  `Nama` varchar(255) NOT NULL,
  `Kota` varchar(255) NOT NULL,
  `Negara` varchar(255) NOT NULL,
  `Kode_IATA` char(3) NOT NULL
) 

CREATE TABLE `bandara_penerbangan` (
  `Bandara_ID` int NOT NULL,
  `Penerbangan_ID` char(6) NOT NULL
) 

CREATE TABLE `maskapai` (
  `ID_Maskapai` char(6) NOT NULL,
  `Nama` varchar(255) NOT NULL,
  `Negara_Asal` varchar(255) NOT NULL
) 

CREATE TABLE `penerbangan` (
  `ID_Penerbangan` char(6) NOT NULL,
  `Waktu_Keberangkatan` datetime NOT NULL,
  `Waktu_Sampai` datetime NOT NULL,
  `Status_Penerbangan` varchar(50) NOT NULL,
  `ID_Pesawat` char(6) NOT NULL
) 

CREATE TABLE `penumpang` (
  `NIK` char(16) NOT NULL,
  `Nama` varchar(255) NOT NULL,
  `Tanggal_Lahir` date NOT NULL,
  `Alamat` varchar(255) NOT NULL,
  `No_Telepon` varchar(13) NOT NULL,
  `Jenis_Kelamin` char(1) NOT NULL,
  `Kewarganegaraan` varchar(255) NOT NULL,
  `ID_Bagasi` int NOT NULL
) 

CREATE TABLE `pesawat` (
  `ID_Pesawat` char(6) NOT NULL,
  `Model` varchar(255) NOT NULL,
  `Kapasitas` int NOT NULL,
  `Tahun_Produksi` char(4) NOT NULL,
  `Status_Pesawat` varchar(50) NOT NULL,
  `ID_Maskapai` char(6) NOT NULL
) 

CREATE TABLE `tiket` (
  `ID_Tiket` char(6) NOT NULL,
  `Nomor_Kursi` char(3) NOT NULL,
  `Harga` int NOT NULL,
  `Waktu_Pembelian` datetime NOT NULL,
  `Kelas_Penerbangan` varchar(50) NOT NULL,
  `NIK_Penumpang` char(16) NOT NULL,
  `ID_Penerbangan` char(6) NOT NULL
) 

ALTER TABLE `bagasi`
  ADD PRIMARY KEY (`ID_Bagasi`);

ALTER TABLE `bandara`
  ADD PRIMARY KEY (`ID_Bandara`);

ALTER TABLE `bandara_penerbangan`
  ADD PRIMARY KEY `Bandara_ID`,`Penerbangan_ID`,
  ADD KEY `Penerbangan_ID` (`Penerbangan_ID`);

ALTER TABLE `maskapai`
  ADD PRIMARY KEY (`ID_Maskapai`);

ALTER TABLE `penerbangan`
  ADD PRIMARY KEY (`ID_Penerbangan`),
  ADD KEY `ID_Pesawat` (`ID_Pesawat`);

ALTER TABLE `penumpang`
  ADD PRIMARY KEY (`NIK`),
  ADD KEY `ID_Bagasi` (`ID_Bagasi`);

ALTER TABLE `pesawat`
  ADD PRIMARY KEY (`ID_Pesawat`),
  ADD KEY `ID_Maskapai` (`ID_Maskapai`);

ALTER TABLE `tiket`
  ADD PRIMARY KEY (`ID_Tiket`),
  ADD KEY `NIK_Penumpang` (`NIK_Penumpang`),
  ADD KEY `ID_Penerbangan` (`ID_Penerbangan`);

ALTER TABLE `bandara_penerbangan`
  ADD CONSTRAINT `bandara_penerbangan_ibfk_1` FOREIGN KEY (`Bandara_ID`) REFERENCES `bandara` (`ID_Bandara`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bandara_penerbangan_ibfk_2` FOREIGN KEY (`Penerbangan_ID`) REFERENCES `penerbangan` (`ID_Penerbangan`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `penerbangan`
  ADD CONSTRAINT `penerbangan_ibfk_1` FOREIGN KEY (`ID_Pesawat`) REFERENCES `pesawat` (`ID_Pesawat`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `penumpang`
  ADD CONSTRAINT `penumpang_ibfk_1` FOREIGN KEY (`ID_Bagasi`) REFERENCES `bagasi` (`ID_Bagasi`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `pesawat`
  ADD CONSTRAINT `pesawat_ibfk_1` FOREIGN KEY (`ID_Maskapai`) REFERENCES `maskapai` (`ID_Maskapai`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `tiket`
  ADD CONSTRAINT `tiket_ibfk_1` FOREIGN KEY (`NIK_Penumpang`) REFERENCES `penumpang` (`NIK`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tiket_ibfk_2` FOREIGN KEY (`ID_Penerbangan`) REFERENCES `penerbangan` (`ID_Penerbangan`) ON DELETE CASCADE ON UPDATE CASCADE;


