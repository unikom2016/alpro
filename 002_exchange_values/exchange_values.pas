program exchange_values;

uses crt;

var angka1, angka2 : integer;

begin
  writeln('============ Menukar dua buah angka tanpa variabel bantuan ============');
  
  // Proses input(angka1, angka2)
  write('Masukkan angka1: '); readln(angka1);
  write('Masukkan angka2: '); readln(angka2);

  // Periksa nilai awal
  writeln('Angka1 saat ini: ', angka1);
  writeln('Angka2 saat ini: ', angka2);
  
  // Garis baru
  writeln();
  
  // Proses pertukaran
  angka1 := angka1 xor angka2; // decimal to binary, then compute binary xor binary 
  angka2 := angka1 xor angka2;
  angka1 := angka1 xor angka2;
  
  // Proses output(angka1, angka2);
  writeln('Keadaan dua buah angka setelah bertukar!');
  writeln('Angka1 saat ini: ', angka1);
  writeln('Angka2 saat ini: ', angka2);
end.