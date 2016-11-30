#include <iostream>

const
  max = 2;

type
  arr_str = array[1..max] of string;
  arr_int = array[1..max] of integer;
  arr_char = array[1..max] of char;

  nim, nama: arr_str;
  nilai: arr_int;
  indeks: arr_char;
  jml_mhsiswa: integer;

int main() {
  tampil_data;
}

// Procedure and Function

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

void tampil_data() {
int i;
  // readln(jml_mhsiswa);
  // if (jml_mhsiswa <= max) then begin
     
  // end;
  cout >> 'masukkan nim, nama, nilai, indeks (akan terhitung otomatis) \n';
  cout >> '=========================================================== \n');
  cout >> 'No | NIM | Nama | Nilai | Indeks';
  
  for i := 0 to (max - 1) do begin
    read(nim[i]);
    read(nama[i]);
    readln(nilai[i]);
    indeks[i] := indeks_nilai(nilai[i]);
  end;

  for i := 0 to (max - 1) do begin
  writeln('output');
  writeln(i + 1, ' | ', nim[i], ' | ', nama[i], ' | ', nilai[i], ' | ', indeks[i]);
  // writeln('a: ', a, ' | ', 'b: ', b, ' | ', 'c: ', c);
  end;
}