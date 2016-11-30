program student_grade;

uses crt;

const
  max = 2;

type
  arr_str = array[1..max] of string;
  arr_int = array[1..max] of integer;
  arr_char = array[1..max] of char;

var
  nim, nama: arr_str;
  nilai: arr_int;
  indeks: arr_char;
  jml_mhsiswa: integer;

function indeks_nilai(nilai: integer): char;
begin
  case (nilai) of
    80..100: indeks_nilai := 'A';
    70..79: indeks_nilai := 'B';
    60..69: indeks_nilai := 'C';
    50..59: indeks_nilai := 'D';
    0..49: indeks_nilai := 'E';
  end;
end;

procedure tampil_data;
var i: integer;
begin
  // readln(jml_mhsiswa);
  // if (jml_mhsiswa <= max) then begin
    
  // end;
  window(2, 2, 79, 29);
  clrscr;
  gotoxy(0, 0);
  writeln('masukkan nim, nama, nilai, indeks (akan terhitung otomatis)');
  writeln('===========================================================================');
  writeln('| No |      NIM      |      Nama      |      Nilai      |      Indeks     |');
  writeln('---------------------------------------------------------------------------');
   
  for i := 0 to (max - 1) do begin
    // gotoxy(x, y)
    write('|'); gotoxy(4, i + 5); write(i + 1, ' | ');
    gotoxy(22, i + 5); write('|');
    gotoxy(39, i + 5); write('|');
    gotoxy(57, i + 5); write('|');
    gotoxy(75, i + 5); write('|');

    gotoxy(11, i + 5); readln(nim[i]);
    gotoxy(28, i + 5); readln(nama[i]);
    gotoxy(45, i + 5); readln(nilai[i]);
    gotoxy(66, i + 5);
    indeks[i] := indeks_nilai(nilai[i]);
    writeln(indeks[i]);
  end;

  // for i := 0 to (max - 1) do begin
  //   writeln( ' | ', nim[i], ' | ', nama[i], ' | ', nilai[i], ' | ', indeks[i]);
  // end;
end;

begin
  tampil_data;
end.