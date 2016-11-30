program student_grade;

uses crt;

const
  max = 50;

type
  arr_str = array[0..max] of string;
  arr_int = array[0..max] of integer;
  arr_char = array[0..max] of char;

var
  nim, nama: arr_str;
  nilai: arr_int;
  i, jml_mhsiswa: integer;

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
  rata_rata := total / jml_mhsiswa;
end;

function nilai_min(nilai1, nilai2: integer): integer;
{ I.S.: data(nilai) sudah terdefinisi }
{ F.S.: menghasilkan fungsi nilai terendah }
begin
  nilai_min := nilai1;
  if nilai2 < nilai_min then
    nilai_min := nilai2;
end;

function nilai_max(nilai1, nilai2: integer): integer;
{ I.S.: data(nilai) sudah terdefinisi }
{ F.S.: menghasilkan fungsi nilai tertinggi }
begin
  nilai_max := nilai1;
  if nilai2 > nilai_max then
    nilai_max := nilai2;
end;

procedure tampil_data;
var 
  total, n_min, n_max: integer;
  // function idx(nilai: integer); // prototype 
begin
  if (jml_mhsiswa > 0) or (jml_mhsiswa <= max) then begin
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

    for i := 0 to (jml_mhsiswa - 1) do begin // array 0
      // gotoxy(x, y)
      gotoxy(7, i + 5); write('|'); gotoxy(11, i + 5); write(i + 1, '|');
      gotoxy(28, i + 5); write('|'); // NIM
      gotoxy(55, i + 5); write('|'); // Nama
      gotoxy(73, i + 5); write('|'); // Nilai
      gotoxy(91, i + 5); write('|'); // Indeks
      // clreol; gotoxy(1, i + 6); write('---------------------------------------------------------------------------'); clreol;

      gotoxy(13, i + 5); readln(nim[i]); // input NIM
      gotoxy(29, i + 5); readln(nama[i]); // input Nama
      gotoxy(56, i + 5); readln(nilai[i]); // input Nilai
      gotoxy(74, i + 5); write(idx(nilai[i])); // input Indeks

      total := total + nilai[i];
      if i = (jml_mhsiswa - 1) then begin 
        n_min := nilai_min(nilai[i], nilai[i - 1]);
        n_max := nilai_max(nilai[i], nilai[i - 1]); 
      end;
    end;

    gotoxy(7, i + 6);
    write('-------------------------------------------------------------------------------------');
    gotoxy(7, i + 7);
    writeln('Rata-rata nilai dari ', jml_mhsiswa, ' mahasiswa, yaitu: ', rata_rata(total):0:1);
    // tambahkan fungsi nilai tertinggi dan terendah
    gotoxy(7, i + 8);
    writeln('Nilai terendah dari ', jml_mhsiswa, ' mahasiswa, yaitu: ', n_min);
    gotoxy(7, i + 9);
    writeln('Nilai tertinggi dari ', jml_mhsiswa, ' mahasiswa, yaitu: ', n_max);
  end else
    writeln('Ga bisa nambahin mahasaiswa, karena penuh');
end;

begin
  jumlah_data(jml_mhsiswa);
  tampil_data;
end.