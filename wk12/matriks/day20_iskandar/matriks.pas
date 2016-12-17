program Matriks;
{I.S.:user memasukkan matakuliah(1:N), NIM(1:M), dan matriks Nilai Akhir MxN}
{F.S.:menampilkan matriks Indeks Nilai}

uses crt;
{kamus lokal}
const
  maks_baris = 50;
  maks_kolom = 5;
type
    LarikMatkul = array[1..maks_baris] of string;
    LarikNIM    = array[1..maks_kolom] of string;
    Matriks1    = array[1..maks_kolom,1..maks_baris] of integer;
    Matriks2    = array[1..maks_kolom,1..maks_baris] of char;
var
  NIM  : LarikNIM;
  MK   : LarikMatkul;
  NA   : Matriks1;   {NA:Nilai Akhir}
  IDX  : Matriks2;   {IDX:Indeks Nilai}
  M,N  : integer;    {M:banyaknya baris,N:banyaknya kolom}

Procedure PenciptaanData(var M,N:integer);
{I.S.:array NIM(1:M), array matakuliah(1:N) dan matriks nilai akhir
       diberi harga awal*}
{F.S.:menghasilkan array NIM(1:M), array matakuliah(1:N) dan matriks
       nilai akhir yang siap digunakan}
begin
  write('Banyaknya Mahasiswa   : ');readln(M);
  {validasi NIM harus antara 1-20 data
  while((M < 1) or (M > maks_kolom)) do
  begin
    gotoxy(1,3);textcolor(RED);
    write('Data hanya 20');
    gotoxy(1,3);textcolor(15);
    write('Tekan Enter untuk Mengulangi!');
    readln;gotoxy(1,3);clreol;gotoxy(1,4);clreol;
    gotoxy(29,1);clreol;readln(M);
  end;}

  write('Banyaknya Mata Kuliah : ');readln(N);
  {validasi Matakuliah harus antara 1-6 data
  while((N < 1) or (N > maks_baris)) do
  begin
    gotoxy(1,4);textcolor(RED);
    write('Banyaknya data Matakuliah hanya boleh antara 1-6 data,ulangi!');
    gotoxy(1,5);textcolor(15);
    write('Tekan Enter untuk Melanjutkan!');
    readln;gotoxy(1,4);clreol;gotoxy(1,5);clreol;
    gotoxy(29,2);clreol;readln(N);
  end;}
end;

Procedure TampilMahasiswa(N:integer;var NIM:LarikNIM);
{I.S. : Banyaknya data (N) sudah terdefinisi}
{F.S. : menampilkan daftar nilai mahasiswa }
var
  i     : integer;
  NAMA  :integer;
begin
  clrscr;
  gotoxy(9,1);write('Daftar Mahasiswa');
  gotoxy(1,2);
  write('-----------------------------------------');
  gotoxy(1,3);
  write('| NO |   N I M   |    NAMA MAHASISWA    |');
  gotoxy(1,4);
  write('-----------------------------------------');
  for i := 1 to N do
      begin
           gotoxy(1,i+4);
           write('|    |           |                      |');
           gotoxy(3,i+4);write(i);
           gotoxy(9,i+4);write(NIM[i]);
           gotoxy(22,i+4);readln(NAMA);
      end;
  gotoxy(1,i+5);write('-----------------------------------------');
end;

Procedure TampilMatkul(N:integer;var MK:LarikMatkul);
{I.S. : Banyaknya data (N) sudah terdefinisi}
{F.S. : menampilkan daftar nilai mahasiswa }
var
  i     : integer;
  SKS   :integer;
begin
  clrscr;
  gotoxy(16,9);write('Daftar Mata kuliah');
  gotoxy(1,10);
  write('--------------------------------------------------');
  gotoxy(1,11);
  write('| NO | Kode Mata kuliah | Nama Mata kuliah | SKS |');
  gotoxy(1,12);
  write('--------------------------------------------------');
  for i := 1 to N do
      begin
           gotoxy(1,i+12);
           write('|    |                  |                  |     |');
           gotoxy(8,i+12);write(i);
           gotoxy(9,i+12);readln(MK[i]);
           gotoxy(22,i+12);readln(SKS);
           readln();
      end;
  gotoxy(1,i+12);write('--------------------------------------------------');
end;

Function Indeks(Nilai:integer):char;
{I.S.:nilai akhir sudah terdefinisi}
{F.S.:menghasilkan indeks nilai dari nilai akhir}
begin
  case Nilai of
    80..100 : Indeks:='A';
    70..79  : Indeks:='B';
    60..69  : Indeks:='C';
    50..59  : Indeks:='D';
    0..49   : Indeks:='E';
  end;
end;

Procedure PengisianData(M,N:integer;var NIM:LarikNIM;var MK:LarikMatkul;var NA:Matriks1; var IDX:Matriks2);
{I.S.:user memasukkan array NIM(1:M), array matakuliah(1:N) dan
       matriks nilai akhir*}
{F.S.:menghasilkan array NIM(1:M), array matakuliah(1:N) dan matriks
       nilai akhir}
var {kamus lokal}
  brs,klm:integer;
begin
  clrscr;
  gotoxy(27,1);
  write('Pengisian Nilai Mahasiswa');
  gotoxy(27,2);
  write('------------------------');
  gotoxy(1,5);
  write('NIM');
  {mengisi array NIM(1:M)}
  for brs := 1 to M do
      begin
           textcolor(blue);
           gotoxy(1,brs+5);
           readln(NIM[brs]);
      end;

  {mengisi array Matakuliah(1:M)}
  textcolor(15);
  gotoxy(11,4);
  write('Kode Mata kuliah');
  for klm := 1 to N do
      begin
           textcolor(blue);
           gotoxy(klm*11,5);
           readln(MK[klm]);
      end;

  {mengisi matriks Nilai Akhir berordo MxN}
  for brs := 1 to M do
      begin
           for klm := 1 to N do
               begin
                    {gotoxy(klm*12,brs+2);textcolor(15);
                    write('Masukkan Nilai');
                    readln;}
                    gotoxy(klm*12,brs+5);clreol;textcolor(15);
                    readln(NA[brs,klm]);
                    delay(700);
                    IDX[brs,klm] := Indeks(NA[brs,klm]);
                    gotoxy(klm*12,brs+5);clreol;
                    textcolor(RED);
                    write(IDX[brs,klm]);
                    writeln;textcolor(15);
                    write('Tekan Enter Untuk Melanjutkan!');
               end;
      end;
end;

{program utama}
begin
    clrscr;
    PenciptaanData(M,N);
    TampilMahasiswa(N,NIM);
    TampilMatkul(N,MK);
    // PengisianData(M,N,NIM,MK,NA,IDX);
    writeln;
readln();
end.