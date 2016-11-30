program student_grade;

uses crt;

const
  max = 50;

type
  arr_str = array[1..max] of string;
  arr_int = array[1..max] of integer;
  arr_char = array[1..max] of char;

var
  nim, nama: arr_str;
  nilai: arr_int;
  indeks: arr_char;
  jml_mhsiswa: integer;

procedure jumlah_data(var jml_mhsiswa: integer);
{ I.S: User memasukkan banyaknya data (jml_mhsiswa) }
{ F.S: menghasilkan banyaknya data (jml_mhsiswa) }
begin
  write('Masukkan banyaknya mahasiswa: '); readln(jml_mhsiswa); // validation
  // validation
  while (jml_mhsiswa < 1) or (jml_mhsiswa > max) do begin
    gotoxy(1, 1);
    write('Banyaknya data hanya antara 1-50');
    gotoxy(1, 1); clreol; readln;
    gotoxy(30, 1); clreol; readln(jml_mhsiswa)
  end;
  clrscr;
end;

function indeks_nilai(nilai: integer): char;
{ I.S.: (nilai) sudah terdefinisi }
{ F.S.: menghasilkan fungsi indeks nilai }
begin
  case (nilai) of
    80..100: indeks_nilai := 'A';
    70..79: indeks_nilai := 'B';
    60..69: indeks_nilai := 'C';
    50..59: indeks_nilai := 'D';
    0..49: indeks_nilai := 'E';
  end;
end;

function rata_rata(total: integer): real;
{ I.S.: banyaknya data(nilai) dan total sudah terdefinisi }
{ F.S.: menghasilkan fungsi rata-rata }
var i: integer;
begin
  rata_rata := total / jml_mhsiswa;
end;

procedure tampil_data;
var 
  total, i: integer;
  // function indeks_nilai(nilai: integer); // prototype 
begin
  if (jml_mhsiswa > 0) or (jml_mhsiswa <= max) then begin
    window(1, 1, 100, 30);
    clrscr;
    gotoxy(39, 1); // dibagi 2
    writeln('DAFTAR NILAI MAHASISWA');
    gotoxy(7, 2);
    writeln('-------------------------------------------------------------------------------------');
    gotoxy(7, 3);
    writeln('| No |      NIM      |      Nama Mahasiswa      |      Nilai      |      Indeks     |');
    gotoxy(7, 4);
    writeln('-------------------------------------------------------------------------------------');
    
    total := 0;

    for i := 0 to (jml_mhsiswa - 1) do begin // array 0
      // gotoxy(x, y)
      gotoxy(7, i + 5); write('|'); gotoxy(11, i + 5); write(i + 1, '|');
      gotoxy(28, i + 5); write('|'); // NIM
      gotoxy(55, i + 5); write('|'); // Nama
      gotoxy(73, i + 5); write('|'); // Nilai
      gotoxy(91, i + 5); write('|'); // Indeks
      // clreol; gotoxy(1, i + 6); write('---------------------------------------------------------------------------'); clreol;

      gotoxy(13, i + 5); readln(nim[1]);
      gotoxy(29, i + 5); readln(nama[i]);
      gotoxy(56, i + 5); readln(nilai[i]);
      indeks[i] := indeks_nilai(nilai[i]);
      gotoxy(74, i + 5); write(indeks[i]);

      total := total + nilai[i];
    end;

    gotoxy(7, i + 6);
    write('-------------------------------------------------------------------------------------');
    gotoxy(7, i + 7);
    writeln('Rata-rata nilai dari ', jml_mhsiswa, ' mahasiswa, yaitu: ', rata_rata(total):0:1);
    // tambahkan fungsi nilai tertinggi dan terendah
  end else
    writeln('Ga bisa nambahin mahasaiswa, karena penuh');
end;

{ Kamus Global }
// procedure tampil_data;

begin
  jumlah_data(jml_mhsiswa);
  tampil_data;

  // tambahkan fungsi nilai tertinggi dan terendah
end.