program Untitled;
uses crt;
var
   KodeBarang,NamaBarang : string;
   HaragaSatuan,Jumlah,HargaTotal : Integer;
   Diskon,Total,BesarDiskon :real;
begin
     //memasukkan kode barang
      write ('Kode Barang = ') ;readln(kodeBarang);
      Namabarang := 'Pakaian';
      HargaBarang := 75000;
      writeln();


      if (KodeBarang := 'TS02')
         then
         begin
             NamaBarang := 'Tas';
             HargaSatuan := 65500;
         end

         //memasukkan jumlah yang dibeli
         write ('Jumlah Barang : ') ; readln(Jumlah);
         HargaTotal := Jumlah*HargaSatuan;
         Diskon := 0;

         if (KodeBarang = 'TS02') and Jumlah >=10)
       then
       begin
        //memasukkan besarnya diskon
        write ('Besarnya Diskon (%) : ') ; readln(BesarDiskon);
        Diskon := BesarDiskon/100 * hargaTotal;
        end;

        Total := HargaTotal - Diskon;
        clrscr;
        gotoxy(36,1); write('Toko XYZ');
        gotoxy(36,2); write('--------');
        gotoxy(36,4);
        write('Kode Barang' : ',KodeBarang);
        gotoxy(36,5);
        write('Nama Barang' : ',NamaBarang);
        gotoxy(36,6);
        write('harga Satuan' : ',HargaSatuan:6);
        gotoxy(36,7);
        write('Jumlah Beli' : ',JumlahBeli);
        gotoxy(36,8);
        write('harga Total' : Rp. ',HargaTotal:6);
        gotoxy(36,9);
        write('Diskon'      : Rp. ',Diskon:8:1);
        gotoxy(36,10);
        write('Total Bayar' : Rp. ',Total:8;1);
        readln;



end.
