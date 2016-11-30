program arraybarang;
uses crt;
//Array
const
     MaksBrg = 3;
type
    Larik1 = array[1..MaksBrg] of string;
    Larik2 = array[1..MaksBrg] of integer;
var
   KdBrg,NmBrg,Status : Larik1;
   Stock,Harga        : Larik2;

//Procedure Masukkan
procedure isiData (var KdBrg:Larik1;var Stock:Larik2);
{I.S. :}
{F.S. :}
var
   i : integer;
begin
     for i := 1 to MaksBrg do
     begin
         Write('Masukkan Kode Barang  :'); readln(KdBrg[i]);
         Write('Masukkan Stock Barang :'); readln(Stock[i]);
     end;
end;

//Function Nama Barang
function NamaBarang (kode : string):string;
{I.S. :}
{F.S. :}
begin
     if (kode = 'Brg01') then
     begin
          NamaBarang := 'Pakaian';
     end
     else if (kode = 'Brg02') then
     begin
          NamaBarang := 'Sepatu';
     end
     else
     begin
          NamaBarang := 'Tas';
     end;
end;

//Function Harga Barang
function HargaBarang (kode : string):integer;
{I.S. :}
{F.S. :}
begin
     if (kode = 'Brg01') then
     begin
          HargaBarang := 67500;
     end
     else if (kode = 'Brg02') then
     begin
          HargaBarang := 118000;
     end
     else
     begin
          HargaBarang := 72500;
     end;
end;

//function Status Barang
function StatusBarang (StockMin : integer):string;
{I.S. :}
{F.S. :}
begin
     if (StockMin >= 20) then
     begin
          StatusBarang := 'Aman';
     end
     else
     begin
          StatusBarang := 'Tidak Aman';
     end;
end;

//Procedure TampilData
procedure TampilData (KdBrg:Larik1;Stock:Larik2);
{I.S. : }
{F.S. : }
var
   i,StockMin : integer;
   kode       : string;
begin
     clrscr;
     writeln('===========================DATA BARANG============================');
     writeln('==================================================================');
     writeln('| No | Kode Barang | Nama Barang | Harga Satuan | Stock | Status |');
     writeln('==================================================================');
     for i := 1 to MaksBrg do
     begin
          NmBrg[i]    := NamaBarang(KdBrg[i]);
          Harga[i]    := HargaBarang(KdBrg[i]);
          Status[i]   := StatusBarang(Stock[i]);
     writeln('| ',i,' | ',KdBrg[i],' | ',NmBrg[i],' | ',Harga[i],' | ',Stock[i],' | ',Status[i],' |');
     end;
     writeln('==================================================================');
end;

//Algoritma Utama
begin
     IsiData(KdBrg,Stock);
     TampilData(KdBrg,Stock);
readln;
end.
