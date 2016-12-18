program tugas_matriks;
uses crt;

const
  maks_baris = 50;
  maks_kolom = 5;

type
  Matkul = record
    KodeMK,NamaMK : string;
    SKS           : integer
  end;
  Mahasiswa = record
    Nim,Nama : string;
    IPK      : real
  end;

  larik1 = array[1..maks_baris] of Mahasiswa;
  larik2 = array[1..maks_kolom] of Matkul;
  matriks1 = array[1..maks_baris, 1..maks_kolom] of integer;
  matriks2 = array[1..maks_baris, 1..maks_kolom] of char;

{ Kamus Global }
var  Mhs: larik1;

  MK : larik2; { Kode mata kuliah }
  nilai: matriks1;
  indeks: matriks2; { Indeks nilai }
  m, n: integer; { banyaknya baris m dan kolom n (User-defined) }

// validasi m <= maks_baris; n <= maks_kolom

procedure jumlah_data(var m, n: integer);
begin
  gotoxy(1, 1); write('Banyaknya mahasiswa  : '); readln(m);
  gotoxy(1, 2); write('Banyaknya mata kuliah: '); readln(n);
end; 

procedure Isi_data (var N,M : integer);
var
  i,j: integer;
begin
  //tabel mahasiswa
  clrscr;
  gotoxy(1,2); writeln('           Daftar Mahasiswa            ');
  gotoxy(1,3); writeln('---------------------------------------');
  gotoxy(1,4); writeln('| NO |   N I M   |   Nama Mahasiswa   |');
  gotoxy(1,5); writeln('---------------------------------------');
  for i:= 1 to M do
  begin
    gotoxy(1,i+5);write('|    |           |                    |');
    gotoxy(3,i+5);write(i);
    gotoxy(8,i+5);readln(Mhs[i].NIM);
    gotoxy(20,i+5);readln(Mhs[i].Nama);
  end;
  gotoxy(1,i+6);write('---------------------------------------');

  //tabel Matakuliah
  gotoxy(1,i+8); writeln('                Daftar Mata Kuliah                ');
  gotoxy(1,i+9); writeln('--------------------------------------------------');
  gotoxy(1,i+10); writeln('| NO | Kode Mata Kuliah | Nama Mata kuliah | SKS |');
  gotoxy(1,i+11); writeln('--------------------------------------------------');
  for j:= 1 to N do
  begin
    gotoxy(1,i+j+11);write('|    |                  |                  |     |');
    gotoxy(3,i+j+11);write(j);
    gotoxy(8,i+j+11);readln(MK[j].KodeMK);
    gotoxy(27,i+j+11);readln(MK[j].NamaMK);
    gotoxy(47,i+j+11);readln(MK[j].SKS);
  end;
  gotoxy(1,i+j+12);writeln('--------------------------------------------------');
  write('Tekan Enter Untuk Melanjutkan !');
  readln;
end;

procedure isi_nilai(N,M:integer);
var
  i,j:integer;
begin
  clrscr;
  gotoxy(1,4);write('NIM');
  gotoxy(10,3);write('Kode Mata Kuliah');
  for j := 1 to N do
  begin
    gotoxy(j * 10, 4); textcolor(yellow);write(MK[j].KodeMK);
  end;
  for i := 1 to M do
  begin
    gotoxy(1, i + 4);textcolor(yellow); write(Mhs[i].NIM);
  end;

  // nilai dan index
  for i := 1 to M do begin
    for j := 1 to N do begin
      gotoxy(j * 10, i + 4);textcolor(white);readln(nilai[i,j]);
    end;
    writeln;
  end;
end;

function Idx(NA:integer):char;
{I.S. : Nilai (NA) Sudah terdefinisi}
{F.S. : menghasilkan fungsi indeks nilai dari nilai}
begin
  case (NA) of
    80..100 : Idx := 'A';
    70..79  : Idx := 'B';
    60..69  : Idx := 'C';
    50..59  : Idx := 'D';
     0..49  : Idx := 'E';
  end;
end;

procedure Tampil_indeks(N,M:integer);
var
  i,j : integer;
begin
  for i := 1 to M do begin
    for j := 1 to N do begin
      indeks[i,j] := idx(nilai[i,j]);
      gotoxy(j * 10, i + 4);delay(300);write('   ');
      gotoxy(j * 10, i + 4);textcolor(red);delay(300);writeln(indeks[i,j]);
    end;
  end;
  textcolor(white);write('Tekan Enter Untuk Melanjutkan !');
  readln;
end;

function bobot(idx:char):integer;
{I.S. : Nilai (NA) Sudah terdefinisi}
{F.S. : menghasilkan fungsi indeks nilai dari nilai}
begin
   case (idx) of
    'A': bobot:= 4;
    'B': bobot:= 3;
    'C': bobot:= 2;
    'D': bobot:= 1;
    'E': bobot:= 0;
   end;
end;

procedure tampil_data(N,M:integer;Mhs:larik1;MK:larik2);
var
   i,j,total,total_sks: integer;
begin
  clrscr;
  for i := 1 to M do begin
    total := 0;
    total_sks := 0;
    gotoxy(1,i+4);writeln('NIM:', mhs[i].nim);
    gotoxy(1,i+5);writeln('Nama:', mhs[i].nama);
    gotoxy(1,i+7); writeln('--------------------------------------------------');
    gotoxy(1,i+8); writeln('| NO | Kode Mata Kuliah | Nama Mata kuliah | SKS |');
    gotoxy(1,i+9); writeln('--------------------------------------------------');
    for j := 1 to N do begin
      total:= total + (bobot(indeks[i,j])*MK[j].SKS);
      total_sks:= total_sks + MK[J].SKS;
    gotoxy(1,i+j+9);write('|    |                  |                  |     |');
    gotoxy(3,i+j+9);write(j);
    gotoxy(8,i+j+9);write(MK[j].KodeMK);
    gotoxy(27,i+j+9);write(MK[j].NamaMK);
    gotoxy(47,i+j+9);write(MK[j].SKS);
    gotoxy(1,i+J+10); writeln('--------------------------------------------------');
    end;

    mhs[i].ipk := Total/total_sks;
    gotoxy(1,i+j+12);writeln('IPK:', Mhs[i].ipk:0:1);
  end;
  // tabel

end;

{ Alogritma Utama }
begin
  jumlah_data(m, n);
  isi_data(N,M);
  isi_nilai(N,M);
  tampil_indeks(N,M);
  tampil_data(N,M,mhs,mk);
  readln;
end.
