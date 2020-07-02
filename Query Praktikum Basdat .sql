No. 1

DDL

Create table Laporan_Kas(
Kode_kas number,
ID_Jurnal varchar(30),
Keterangan_laporan varchar(50),
Debit_laporan number,
Kredit_laporan number,
Tanggal_laporan number,
constraint pk_Kode_kas primary key(Kode_kas)
) ;

Create table Jurnal_Umum(
id_jurnal varchar(30),
Kode_Pengeluaran number,
Kode_kas number,
Nomer_refrensi number,
Keterangan_jurnal varchar(50),
Debit_jurnal number,
Kredit_jurnal number,
Tanggal_jurnal number,
constraint pk_id_jurnal primary key(id_jurnal)
) ;

Create table Pengeluaran(
Kode_Pengeluaran number,
No_Fakture number,
Quantity_Pengeluaran number,
constraint pk_Kode_Pengeluaran primary key(Kode_Pengeluaran)
) ;

Create table Rekening(
Kode_Rekening number,
Kode_Pengeluaran number,
Tanggal_Transaksi number,
Bukti_Transaksi number,
Nama_Rekening varchar(20),
No_Rekening number,
constraint pk_Kode_Rekening primary key(Kode_Rekening)
) ;

Create table Penerimaan(
Kode_Penerimaan number,
Kode_Rekening number,
id_jurnal varchar(30),
Harga number,
Quantity_Penerimaan number,
Nota_Fakture varchar(11),
constraint pk_Kode_Penerimaan primary key(Kode_Penerimaan)
) ;

QUERY RENAME
RENAME Jurnal_Umum To Jurnal_Umum1;

QUERY ALTER
ALTER TABLE Jurnal_Umum1 
MODIFY Kode_kas NOT NULL;

DROP QUERY
DROP TABLE Jurnal_Umum1

DML

INSERT TABEL LAPORAN KAS
INSERT INTO Laporan_Kas
VALUES ('1234','2222','pinjam uang','1200000','24','10');
INSERT INTO Laporan_Kas
VALUES ('12345','22224','Telah Meminjam Uang','1300000','25','10');
INSERT INTO Laporan_Kas
VALUES ('123455','222245','menabung Uang','1400000','25','11');

INSERT TABEL JURNAL UMUM
INSERT INTO Jurnal_Umum1
VALUES ('JUR1','321','1','11','Mengambil Uang','1000','4','2');
INSERT INTO Jurnal_Umum1
VALUES ('JUR2','322','2','12','Meminjam Uang','2000','5','3');
INSERT INTO Jurnal_Umum1
VALUES ('JUR3','323','3','13','mengambil Uang','3000','6','4');

INSERT TABEL PENGELUARAN
INSERT INTO Pengeluaran
VALUES ('001','111','10000');
INSERT INTO Pengeluaran
VALUES ('002','112','20000');
INSERT INTO Pengeluaran
VALUES ('003','113','30000');

INSERT TABEL REKENING
INSERT INTO Rekening
VALUES ('0111','0001','11','1112','ADIT','1122331');
INSERT INTO Rekening
VALUES ('01112','0002','12','1113','NANA','1122332');
INSERT INTO Rekening
VALUES ('01113','0003','13','1114','BUDI','1122333');

INSERT TABEL PENERIMAAN
INSERT INTO Penerimaan
VALUES ('1122','11112222','AB','2000','11','baru');
INSERT INTO Penerimaan
VALUES ('1123','11112233','AC','3000','12','lama');
INSERT INTO Penerimaan
VALUES ('1124','11112244','AD','4000','13','lama');

QUERY SELECT TABEL

SELECT * FROM Laporan_Kas;
SELECT * FROM Jurnal_Umum;
SELECT * FROM Pengeluaran;
SELECT * FROM Rekening;
SELECT * FROM Penerimaan;

QUERY UPDATE 

UPDATE Laporan_Kas
SET Debit_Laporan = '1600000'
WHERE Kode_Kas = '1234';

QUERY DELETE

DELETE FROM Laporan_Kas 
WHERE Debit_Laporan= '1200000';

No.2

ORDER BY
 select * from Rekening order by Kode_Rekening;
GROUP BY
 select Nama_Rekening, (select count(Kode_Penerimaan) from Penerimaan where Penerimaan.Kode_Rekening = Rekening.Kode_Rekening) from Rekening;
CROSS JOIN
 select Penerimaan.id_jurnal, Penerimaan.Nota_Fakture, Rekening.Nama_Rekening from Penerimaan cross join Rekening;
SELECT
 select * from Rekening;
 select * from Penerimaan;



Sqlplus
System

CREATE TABLESPACE LaporanKas
  2  datafile 'D:\PRAKTIKUM 1\Laporan kas\Ubaidillah Al Ahmad\06.2018.1.06959.dbf'
  3  size 30M;
CREATE USER Ubaid_06959
  2  IDENTIFIED BY Ubaid
  3  DEFAULT TABLESPACE LaporanKas
  4  QUOTA 30M ON LaporanKas;
Create table Laporan_Kas(
Kode_kas numb,
ID_Jurnal varchar(30),
Keterangan_laporan varchar(50),
Debit_laporan number,
Kredit_laporan number,
Tanggal_laporan number,
constraint pk_Kode_kas primary key(Kode_kas)
) ;
Create table Jurnal_Umum(
id_jurnal varchar(30),
Kode_Pengeluaran number,
Kode_kas number,
Nomer_refrensi number,
Keterangan_jurnal varchar(50),
Debit_jurnal number,
Kredit_jurnal number,
Tanggal_jurnal number,
constraint pk_id_jurnal primary key(id_jurnal)
) ;
Create table Pengeluaran(
Kode_Pengeluaran number,
No_Fakture number,
Quantity_Pengeluaran number,
constraint pk_Kode_Pengeluaran primary key(Kode_Pengeluaran)
) ;
Create table Rekening(
Kode_Rekening number,
Kode_Pengeluaran number,
Tanggal_Transakasi number,
Bukti_Transaksi number,
Nama_Rekening varchar(20),
No_Rekening number,
constraint pk_Kode_Rekening primary key(Kode_Rekening)
) ;
Create table Penerimaan(
Kode_Penerimaan number,
Kode_Rekening number,
id_jurnal varchar(30),
Harga number,
Quantity_Penerimaan number,
ALTER TABLE JurnalUmum
2 MODIFY Kode_Kas NOT NULL;

CREATE SEQUENCE Peng_luaran
2 start with 100
3 increment by 1
4 nochace
5 nocycle;

SQL> ALTER TABLE LaporanKas rename column ID_JURNAL to NO_IDENTITAS;
SQL> ALTER TABLE Jurnal_Umum
  2  ADD constraint pk_unique_const
  3  UNIQUE (DEBIT_JURNAL);

SQL> alter table JurnalUmum modify DEBIT_JURNAL varchar2(40);



SQL> insert into Laporan_Kas
  2  (kode_Kas,Keterangan_Laporan,Debit_Laporan)
  3  Values (001,’simpan_uang’,40000)
  4  ;

SQL> insert into Laporan_Kas
  2  (kode_Kas,Keterangan_Laporan,Debit_Laporan)
  3  Values (002,’ambil_uang’,70000)
  4  ;

SQL> insert all
  2  into pengeluaran (Kode_Pengeluaran,No_Fakture,Quantity_Pengeluaran) values (0011,2,00123456)
  3  into pengeluaran (Kode_Pengeluaran,No_Fakture,Quantity_Pengeluaran) values (0012,3,001234567)
  4  into pengeluaran (Kode_Pengeluaran,No_Fakture,Quantity_Pengeluaran) values (0013,4,0012345678)
  5  select 1 from dual;


SQL> insert all
  2  into Laporan_Kas (Kode_Kas,Keterangan_Laporan,Debit_Laporan) values (1112,’Member Baru’,0000)
  3  select 1 from dual;
SQL> insert into Laporan_Kas
  2  (kode_Kas,Keterangan_Laporan,Debit_Laporan)
  3  Values (001,’simpan_uang’,40000)
  4  ;

SQL> insert into Laporan_Kas
  2  (kode_Kas,Keterangan_Laporan,Debit_Laporan)
  3  Values (002,’ambil_uang’,70000)
  4  ;

SQL> insert all
  2  into pengeluaran (Kode_Pengeluaran,No_Fakture,Quantity_Pengeluaran) values (0011,2,00123456)
  3  into pengeluaran (Kode_Pengeluaran,No_Fakture,Quantity_Pengeluaran) values (0012,3,001234567)
  4  into pengeluaran (Kode_Pengeluaran,No_Fakture,Quantity_Pengeluaran) values (0013,4,0012345678)
  5  select 1 from dual;


SQL> insert all
  2  into Laporan_Kas (Kode_Kas,Keterangan_Laporan,Debit_Laporan) values (1112,’Member Baru’,0000)
  3  select 1 from dual;
SQL> insert into Laporan_Kas
  2  (kode_Kas,Keterangan_Laporan,Debit_Laporan)
  3  Values (001,’simpan_uang’,40000)
  4  ;

SQL> insert into Laporan_Kas
  2  (kode_Kas,Keterangan_Laporan,Debit_Laporan)
  3  Values (002,’ambil_uang’,70000)
  4  ;

SQL> insert all
  2  into pengeluaran (Kode_Pengeluaran,No_Fakture,Quantity_Pengeluaran) values (0011,2,00123456)
  3  into pengeluaran (Kode_Pengeluaran,No_Fakture,Quantity_Pengeluaran) values (0012,3,001234567)
  4  into pengeluaran (Kode_Pengeluaran,No_Fakture,Quantity_Pengeluaran) values (0013,4,0012345678)
  5  select 1 from dual;


SQL> insert all
  2  into Laporan_Kas (Kode_Kas,Keterangan_Laporan,Debit_Laporan) values (1112,’Member Baru’,0000)
  3  select 1 from dual;
SQL> insert into Laporan_Kas
  2  (kode_Kas,Keterangan_Laporan,Debit_Laporan)
  3  Values (001,’simpan_uang’,40000)
  4  ;

SQL> insert into Laporan_Kas
  2  (kode_Kas,Keterangan_Laporan,Debit_Laporan)
  3  Values (002,’ambil_uang’,70000)
  4  ;

SQL> insert all
  2  into pengeluaran (Kode_Pengeluaran,No_Fakture,Quantity_Pengeluaran) values (0011,2,00123456)
  3  into pengeluaran (Kode_Pengeluaran,No_Fakture,Quantity_Pengeluaran) values (0012,3,001234567)
  4  into pengeluaran (Kode_Pengeluaran,No_Fakture,Quantity_Pengeluaran) values (0013,4,0012345678)
  5  select 1 from dual;


SQL> insert all
  2  into Laporan_Kas (Kode_Kas,Keterangan_Laporan,Debit_Laporan) values (1112,’Member Baru’,0000)
  3  select 1 from dual;

SQL> update Laporan_Kas set id_jurnal ='2222', Keterangan_Laporan ='pinjam uang' where id_jurnal <4 and Keterangan_Laporan like '%p%' or Keterangan_Laporan like '%m%';

SQL> update Laporan_Kas set id_jurnal ='22224', Keterangan_Laporan ='Telah meminjam uang' where id_jurnal >3 and Keterangan_Laporan like '%t%' or Keterangan_Laporan like '%u%';

SQL> update Rekening set Bukti_Transaksi='1112' where Kode_Rekening >1 or No_Rekening >2 and Nama_Rekening like 'Adit';
SQL> delete Laporan_Kas where Kode_Kas like '1234' or id_jurnal like '2' and Keterangan_Laporan >3;
SQL> savepoint memory;

SQL> commit;

SQL> rollback;
Order BY

select * from Rekening order by Kode_Rekening;

Group BY

select Nama_Rekening, (select count(Kode_Penerimaan) from Penerimaan where Penerimaan.Kode_Rekening = Rekening.Kode_Rekening) from Rekening;

SQL> insert all
  2  into Laporan_Kas (Kode_Kas,ID_Jurnal,Keterangan_Laporan,Debit_Laporan,Kredit_Laporan,Tanggal_Laporan) values (2,22225,'Ambil Uang',50000,2000,1)
  3  into Laporan_Kas (Kode_Kas,ID_Jurnal,Keterangan_Laporan,Debit_Laporan,Kredit_Laporan,Tanggal_Laporan) values (3,22226,'Naruh Uang',60000,3000,2)
  4  into Laporan_Kas (Kode_Kas,ID_Jurnal,Keterangan_Laporan,Debit_Laporan,Kredit_Laporan,Tanggal_Laporan) values (4,22227,'Ganda Uang',70000,100,3)
  5  into 
Laporan_Kas(Kode_Kas,ID_Jurnal,Keterangan_Laporan,Debit_Laporan,Kredit_Laporan,Tanggal_Laporan) values (5,22228,'Ambil Uang',80000,1000,4)
  6  into Laporan_Kas (Kode_Kas,ID_Jurnal,Keterangan_Laporan,Debit_Laporan,Kredit_Laporan,Tanggal_Laporan) values (6,22229,'Kosong',0000,000,5)
  7  select 1 from dual;
SQL> insert all
  2  into Jurnal_Umum (ID_Jurnal,Kode_Pengeluaran,Kode_Kas,Nomer_Refrensi,Keterangan_Jurnal,Debit_Jurnal,Kredit_Jurnal,Tanggal_Jurnal) values ('JUR5',325,5,15,'Masih',5000,8,6)
  3  into Jurnal_Umum (ID_Jurnal,Kode_Pengeluaran,Kode_Kas,Nomer_Refrensi,Keterangan_Jurnal,Debit_Jurnal,Kredit_Jurnal,Tanggal_Jurnal) values ('JUR6',326,6,16,'Baru',6000,9,7)
  4  into Jurnal_Umum (ID_Jurnal,Kode_Pengeluaran,Kode_Kas,Nomer_Refrensi,Keterangan_Jurnal,Debit_Jurnal,Kredit_Jurnal,Tanggal_Jurnal) values ('JUR7',327,7,17,'Lama',7000,10,8)
  5  into Jurnal_Umum (ID_Jurnal,Kode_Pengeluaran,Kode_Kas,Nomer_Refrensi,Keterangan_Jurnal,Debit_Jurnal,Kredit_Jurnal,Tanggal_Jurnal) values ('JUR8',328,8,18,'Baru',8000,11,9)
  6  into Jurnal_Umum (ID_Jurnal,Kode_Pengeluaran,Kode_Kas,Nomer_Refrensi,Keterangan_Jurnal,Debit_Jurnal,Kredit_Jurnal,Tanggal_Jurnal) values ('JUR9',329,9,19,'Lama',9000,12,10)
  7  select 1 from dual;
SQL> insert all
  2  into Penerimaan (Kode_Penerimaan,Kode_Rekening,ID_Jurnal,Harga,Quantity_Penerimaan,Nota_Fakture) values (1127,1111246,'AE',6000,15,'baru')
  3  into Penerimaan (Kode_Penerimaan,Kode_Rekening,ID_Jurnal,Harga,Quantity_Penerimaan,Nota_Fakture) values (1128,1111247,'AS',7000,16,'lama')
4  into Penerimaan (Kode_Penerimaan,Kode_Rekening,ID_Jurnal,Harga,Quantity_Penerimaan,Nota_Fakture) values (1129,1111248,'AQ',8000,17,'baru')
  5  into Penerimaan (Kode_Penerimaan,Kode_Rekening,ID_Jurnal,Harga,Quantity_Penerimaan,Nota_Fakture) values (1130,1111249,'AW',9000,18,'baru')
  6  into Penerimaan (Kode_Penerimaan,Kode_Rekening,ID_Jurnal,Harga,Quantity_Penerimaan,Nota_Fakture) values (1131,1111250,'AR',10000,19,'lama')
  7  select 1 from dual;
SQL> insert all
  2  into Pengeluaran (Kode_Pengeluaran,No_Fakture,Quantity_Pengeluaran) values (14,5,0001)
  3  into Pengeluaran (Kode_Pengeluaran,No_Fakture,Quantity_Pengeluaran) values (15,6,0002)
  4  into Pengeluaran (Kode_Pengeluaran,No_Fakture,Quantity_Pengeluaran) values (16,7,0003)
  5  into Pengeluaran (Kode_Pengeluaran,No_Fakture,Quantity_Pengeluaran) values (17,8,0004)
  6  into Pengeluaran (Kode_Pengeluaran,No_Fakture,Quantity_Pengeluaran) values (18,9,0005)
  7  select 1 from dual;
SQL> insert all
  2  into Rekening (Kode_Rekening,Kode_Pengeluaran,Tanggal_Transaksi,Bukti_Transaksi,Nama_Rekening,No_Rekening) values (001,110,1,0111,'Madun',112344)
  3  into Rekening (Kode_Rekening,Kode_Pengeluaran,Tanggal_Transaksi,Bukti_Transaksi,Nama_Rekening,No_Rekening) values (002,111,2,0112,'Adam',112345)
  4  into Rekening (Kode_Rekening,Kode_Pengeluaran,Tanggal_Transaksi,Bukti_Transaksi,Nama_Rekening,No_Rekening) values (003,112,3,0113,'Agam',112346)
  5  into Rekening (Kode_Rekening,Kode_Pengeluaran,Tanggal_Transaksi,Bukti_Transaksi,Nama_Rekening,No_Rekening
SQL> select max(Tanggal_Laporan) as max_Tanggal_nya from Laporan_Kas;

MAX_TANGGAL_NYA
---------------
              5

SQL> select min(Tanggal_Laporan) as min_Tanggal_nya from Laporan_Kas;

MIN_TANGGAL_NYA
---------------
              1

SQL> select Kode_Rekening, count(Kode_Rekening) as Nama_Pemilik
  2  from Rekening where Kode_Rekening = 111 group by Kode_Rekening;

KODE_REKENING NAMA_PEMILIK
------------- ------------
          111            1

SQL> select Kode_Rekening, sum(Tanggal_Transaksi) as Jatuh_Tempo from Rekening
  2  where Kode_Rekening = 111 group by Kode_Rekening;

KODE_REKENING JATUH_TEMPO
------------- -----------
          111          11

SQL> select avg(Kode_Rekening) as kode_bukti_transaksi from Rekening;

KODE_BUKTI_TRANSAKSI
--------------------
                 385
SQL> select Kode_Rekening, sum (Tanggal_Transaksi) as TGL_Pemakaian, avg (Tanggal_Transaksi) as Terpakai from Rekening where Kode_Rekening like '%1%' group by Kode_Rekening;

SQL> select Kode_Rekening, max(Kode_Pengeluaran) as Kode_keluar
  2  , min (Nama_Rekening) as Nama , avg (No_Rekening) as terdata, count (Kode_Pengeluaran) as rata_rata from Rekening where Tanggal_Transaksi like '%1%' or Tanggal_Transaksi <9 group by Kode_Rekening;

SQL> select count(rata_rata) as jumlah_data
  2  from(select avg(Kode_Rekening) as rata_rata
  3  from(select sum(No_Rekening) as jatuh_tempo
  4  from(select max(Tanggal_Transaksi) as terbesar, min(Nama_Rekening) as nama from Rekening where Kode_Rekening <6 or Kode_Rekening = any (select Kode_Rekening from Pengeluaran group by Kode_Rekening))));

SQL> select Kode_Rekening, sum (Tanggal_Transaksi) as TGL_Pemakaian, avg (Tanggal_Transaksi) as Terpakai from Rekening where Kode_Rekening like '%1%' group by Kode_Rekening;

SQL> select Kode_Rekening, max(Kode_Pengeluaran) as Kode_keluar
  2  , min (Nama_Rekening) as Nama , avg (No_Rekening) as terdata, count (Kode_Pengeluaran) as rata_rata from Rekening where Tanggal_Transaksi like '%1%' or Tanggal_Transaksi <9 group by Kode_Rekening;

SQL> select count(rata_rata) as jumlah_data
  2  from(select avg(Kode_Rekening) as rata_rata
  3  from(select sum(No_Rekening) as jatuh_tempo
  4  from(select max(Tanggal_Transaksi) as terbesar, min(Nama_Rekening) as nama from Rekening where Kode_Rekening <6 or Kode_Rekening = any (select Kode_Rekening from Pengeluaran group by Kode_Rekening))));
package database;

/**
 *
 * @author Ubaidillah
 */

import java.sql.Statement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Koneksi {

   private Connection connect;
    private Statement db;
    private String database = "oraceljava";
    
   public Koneksi(){
try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            System.out.println("Class Driver Ditemukan !");
            
            try {
                
                connect = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","Ubaidillah16","ubedubed");
                System.out.println("Koneksi Database Sukses !");
                
            } catch (SQLException ex) {
                
                System.out.println("Koneksi Database Gagal : "+ex);
                
            }
            
        } catch (ClassNotFoundException e) {
            
            System.out.println("Class Driver Tidak Ditemukan, Terjadi Kesalahan Pada : "+e);
        }
        
    }
    
    public ResultSet getData(String sql){
        try {
            
            db = connect.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
            return db.executeQuery(sql);
            
        } catch (SQLException e) {
            
            return null;
            
        }
    }
public int ManipulasiData(String sql){
        try {
            
            db = connect.createStatement();
            return db.executeUpdate(sql);
            
        } catch (SQLException e) {
            
            return 0;
        }
    }
    
}
package Controller;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.text.*;
import Nama_Tabel.*;
import Database.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Ubaidillah
 */
public class Controller {
    
    Koneksi koneksi;
    ArrayList<Rekening> arrRekening;
    ArrayList<Pengeluaran> Pengeluaran;
    ArrayList<Laporan_Kas> arrLaporan_Kas;
    ArrayList<Jurnal_Umum> arrJurnal_Umum;
    ArrayList<Penerimaan> arrPenerimaan;

public Controller() throws SQLException {
        this.koneksi = new Koneksi();
        this.arrRekening = new ArrayList<>();
        this.arrLaporan_Kas = new ArrayList<>();