program Untitled;
{I.S. : user memasukkan kode barang, jumlah yang dibeli dan besarnya diskon}
{F.S. : menampilkan Kode Barang, Nama Barang, Harga Satuan, Jumlah Barang, Harga Total, Diskon dan Total Bayar}
uses crt;
var
   KodeBarang,NamaBarang : string;
   HargaSatuan,Jumlah,HargaTotal : integer;
   Diskon,Total,BesarDiskon : real;

begin
     //memasukkan kode barang
     write('Masukkan Kode Barang = ');readln(KodeBarang);
     NamaBarang := 'Pakaian';
     HargaSatuan := 75000;

     IF (KodeBarang = 'TS02') or (KodeBarang = 'ts02')
        then
        begin
         NamaBarang := 'Tas';
         HargaSatuan := 65500;
        end;

     //memasukkan jumlah yang dibeli
     write ('Masukkan Jumlah Barang = ');readln(Jumlah);
     HargaTotal := Jumlah * HargaSatuan;
     Diskon := 0;             //inisialisasi Diskon

     IF ((KodeBarang = 'TS02') or (KodeBarang = 'ts02')) and (Jumlah >=10)
        then
        begin
            //memasukkan biaya diskon
            Write('Besar Diskon (%) = ');readln(BesarDiskon);
            Diskon := BesarDiskon/100 * HargaTotal;
        end;
     Total := HargaTotal - Diskon;
     clrscr;
     gotoxy(36,1); write('TOKO XYZ');
     gotoxy(36,2); write('---------');
     gotoxy(30,4);
     write('Kode Barang  : ',KodeBarang);
     gotoxy(30,5);
     write('Nama Barang  : ',NamaBarang);
     gotoxy(30,6);
     write('Harga Satuan : Rp. ', HargaSatuan:6);
     gotoxy(30,7);
     write('Jumlah Beli  : ', Jumlah);
     gotoxy(30,8);
     write('Harga Total  : Rp. ', HargaTotal:6);
     gotoxy(30,9);
     write('Diskon       : Rp. ', Diskon:8:1);
     gotoxy(30,10);
     write('Total Bayar  : Rp. ', Total:8:1);
     readln;
end.
