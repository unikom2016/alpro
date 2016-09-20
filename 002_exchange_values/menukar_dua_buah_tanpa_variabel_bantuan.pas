// Judul
program menukar_dua_buah_tanpa_variabel_bantuan;

{I.S. : User masukan dua buah angka}
{F.S. : Menampilkan dua buah angka yang telah bertukar}

// Kamus
var angka1, angka2 : integer;

// Algoritma
begin

  // Input(angka1, angka2)
  write('Masukkan angka1: '); readln(angka1);
  write('Masukkan angka2: '); readln(angka2);

  // angka1 <- angka1 + angka2
  angka1 := angka1 + angka2;

  // angka2 <- angka1 - angka2
  angka2 := angka1 - angka2;

  // angka1 <- angka1 - angka2
  angka1 := angka1 - angka2;

  // Output(angka1, angka2)
  writeln('=== Angka yang telah bertukar ===');
  writeln('Angka1 setelah bertukar yaitu: ', angka1);
  writeln('Angka2 setelah bertukar yaitu: ', angka2);

end.