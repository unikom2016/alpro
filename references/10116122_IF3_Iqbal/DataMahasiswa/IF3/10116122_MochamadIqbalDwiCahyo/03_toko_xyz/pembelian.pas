program Untitled;

uses crt;

var KodeBarang, NamaBarang : string;
var HargaSatuan, JumlahBrg, HargaTotal, SetKodi : integer;
var Diskon, Total, BesarDiskon : real;

begin

    Write('Masukkan kode barang: '); Readln(KodeBarang);
    NamaBarang := 'Pakaian';
    HargaSatuan := 75000;

    SetKodi := 10; // 1/2 kodi

    if ((KodeBarang = 'TS02')) Then
       begin
           NamaBarang := 'Tas';
           HargaSatuan := 65500;
       end;

    { Jumlah yang dibeli }
    Write('Masukkan jumlah barang: '); Readln(JumlahBrg);
    HargaTotal := JumlahBrg * HargaSatuan;
    Diskon := 0;

    { Cek Diskon buat TS02 }
    if ((KodeBarang = 'TS02') and (JumlahBrg > SetKodi)) then
        begin
           Write('Masukkan besaran diskon (%): '); Readln(BesarDiskon);
           Diskon := (BesarDiskon / 100) * HargaTotal;
        end;

    Total := Round(HargaTotal - Diskon);

    { Tampilkan Keluaran }
    // window(2,2,80,24);
    clrscr;
    // Center
    gotoxy(36, 1); Write('TOKO XYZ');
    gotoxy(36, 2); Write('========');


    gotoxy(30, 4);
    Writeln('Kode Barang    : ', KodeBarang);
    gotoxy(30, 5);
    Writeln('Nama Barang    : ', NamaBarang);
    gotoxy(30, 6);
    Writeln('Harga Satuan   : Rp. ', HargaSatuan:6);
    gotoxy(30, 7);
    Writeln('Jumlah Beli    : ', JumlahBrg);
    gotoxy(30, 8);
    Writeln('Harga Total    : Rp. ', HargaTotal:6);
    gotoxy(30, 9);
    Writeln('Diskon         : Rp. ', Diskon:8:1);
    gotoxy(30, 10);
    Writeln('Total Diskon   : Rp. ', Total:8:1);

    // Input(UangBayar)
    // If (UangBayar < TotalBayar)
    // Kembalian?
    Readln();
end.
