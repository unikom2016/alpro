program membuat_matriks_a;

uses crt;

const
  maks_baris = 50;
  maks_kolom = 5;

type
  larik1 = array[1..maks_baris] of string;
  larik2 = array[1..maks_kolom] of string;
  matriks1 = array[1..maks_baris, 1..maks_kolom] of integer;
  matriks2 = array[1..maks_baris, 1..maks_kolom] of char;

{ Kamus Global }
var
  nim: larik1;
  mk: larik2; { Kode mata kuliah }
  nilai: matriks1;
  indeks: matriks2; { Indeks nilai }
  m, n: integer; { banyaknya baris m dan kolom n (User-defined) }

// validasi m <= maks_baris; n <= maks_kolom

procedure jumlah_data(var m, n: integer);
begin
  clrscr;
  window(1, 1, 80, 30);
  gotoxy(1, 1); write('Banyaknya mahasiswa: '); readln(m);
  gotoxy(1, 2); write('Banyaknya mata kuliah: '); readln(n);
end; 

procedure isi_data;
var i, j: integer;
begin
  gotoxy(10, 3); write('Kode Mata Kuliah');
  gotoxy(1, 4); write('NIM');
  // tampilan
  for j := 1 to n do begin
    gotoxy(j * 5, 4); write(j);
  end; 
  for i := 1 to m do begin
    gotoxy(1, i + 4); write(i);
  end;

  // nilai dan index
  for i := 1 to m do begin
    for j := 1 to n do begin
      gotoxy(j * 5, i + 4); write(i);
    end;
    writeln;
  end;
end;

procedure tampil_data;
var i, j: integer;
begin
  for j := 1 to n do begin
    gotoxy(j+4, j+5); write(mk[j]);
    // writeln('tampil');
  end; 
  // for i := 1 to m do begin
  //   gotoxy(j*3, i+5); read(mk[i]);
  // end;
  writeln;
end;

{ Alogritma Utama }
begin
  jumlah_data(m, n);
  isi_data;
  // tampil_data;
end.