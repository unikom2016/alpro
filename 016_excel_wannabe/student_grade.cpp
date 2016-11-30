#include <iostream>

char indeks_nilai();
void tampil(); // prototype atau header

// Algoritma Utama
int main() {
  tampil_data;
}

// Procedure and Function

char indeks_nilai() {
  // asdlfja;ksd
}

void tampil() {
  // definisi 
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