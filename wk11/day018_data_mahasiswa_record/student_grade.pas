program student_grade;

uses crt;

const
  max = 50;

type
  mhs = record
    nim, nama: string;
    nilai: integer;
    indeks: char;
  end;
  
  arr_mhs = array[0..max] of mhs;

var
  mahasiswa: arr_mhs;
  i, jml_mhs: integer;

procedure jumlah_data(var jml_mhs: integer);
{ I.S: User memasukkan banyaknya data (jml_mhs) }
{ F.S: menghasilkan banyaknya data (jml_mhs) }
begin
  write('Masukkan banyaknya mahasiswa: '); readln(jml_mhs); // validation
  // validation
  while (jml_mhs < 1) or (jml_mhs > max) do begin
    gotoxy(1, 1);
    write('Banyaknya data hanya antara 1-50');
    gotoxy(1, 1); clreol; readln;
    gotoxy(30, 1); clreol; readln(jml_mhs)
  end;
  clrscr;
end;

function idx(nilai: integer): char;
{ I.S.: (nilai) sudah terdefinisi }
{ F.S.: menghasilkan fungsi indeks nilai }
begin
  case (nilai) of
    80..100: idx := 'A';
    70..79: idx := 'B';
    60..69: idx := 'C';
    50..59: idx := 'D';
    0..49: idx := 'E';
  end;
end;

function rata_rata(total: integer): real;
{ I.S.: banyaknya data(nilai) dan total sudah terdefinisi }
{ F.S.: menghasilkan fungsi rata-rata }
begin
  rata_rata := total / jml_mhs;
end;

function nilai_min(mahasiswa: arr_mhs): integer;
{ I.S.: data(nilai) sudah terdefinisi }
{ F.S.: menghasilkan fungsi nilai terendah }
var i: integer;
begin
  nilai_min := mahasiswa[0].nilai;

  for i := 1 to (jml_mhs - 1) do begin
    if (mahasiswa[i].nilai < nilai_min) then begin
      nilai_min := mahasiswa[i].nilai;
    end;
  end;
end;

function nilai_max(mahasiswa: arr_mhs): integer;
{ I.S.: data(nilai) sudah terdefinisi }
{ F.S.: menghasilkan fungsi nilai tertinggi }
var i: integer;
begin
  nilai_max := mahasiswa[0].nilai;

  for i := 1 to (jml_mhs - 1) do begin
    if (mahasiswa[i].nilai > nilai_max) then begin
      nilai_max := mahasiswa[i].nilai;
    end;
  end;
end;

procedure tampil_data;
var 
  total: integer;
  // function idx(nilai: integer); // prototype 
begin
  if (jml_mhs > 0) and (jml_mhs <= max) then begin
    window(1, 1, 100, 30);
    clrscr;
    gotoxy(39, 1); // dibagi 2
    write('DAFTAR NILAI MAHASISWA');
    gotoxy(7, 2);
    write('-------------------------------------------------------------------------------------');
    gotoxy(7, 3);
    write('| No |      NIM      |      Nama Mahasiswa      |      Nilai      |      Indeks     |');
    gotoxy(7, 4);
    write('-------------------------------------------------------------------------------------');
    
    total := 0;

    for i := 0 to (jml_mhs - 1) do begin // array 0
      // gotoxy(x, y)
      gotoxy(7, i + 5); write('|'); gotoxy(11, i + 5); write(i + 1, '|');
      gotoxy(28, i + 5); write('|'); // NIM
      gotoxy(55, i + 5); write('|'); // Nama
      gotoxy(73, i + 5); write('|'); // Nilai
      gotoxy(91, i + 5); write('|'); // Indeks
      // clreol; gotoxy(1, i + 6); write('---------------------------------------------------------------------------'); clreol;

      gotoxy(13, i + 5); readln(mahasiswa[i].nim); // input NIM
      gotoxy(29, i + 5); readln(mahasiswa[i].nama); // input Nama
      gotoxy(56, i + 5); readln(mahasiswa[i].nilai); // input Nilai
      gotoxy(74, i + 5); write(idx(mahasiswa[i].nilai)); // input Indeks

      total := total + mahasiswa[i].nilai;
    end;

    gotoxy(7, i + 6);
    write('-------------------------------------------------------------------------------------');
    gotoxy(7, i + 7);
    write('Rata-rata nilai dari ', jml_mhs, ' mahasiswa, yaitu: ', rata_rata(total):0:1);
    // tambahkan fungsi nilai tertinggi dan terendah
    gotoxy(7, i + 8);
    write('Nilai terendah dari ', jml_mhs, ' mahasiswa, yaitu: ', nilai_min(mahasiswa));
    gotoxy(7, i + 9);
    writeln('Nilai tertinggi dari ', jml_mhs, ' mahasiswa, yaitu: ', nilai_max(mahasiswa));
  end else
    writeln('Ga bisa nambahin mahasaiswa, karena penuh');
end;

begin
  jumlah_data(jml_mhs);
  tampil_data;
end.