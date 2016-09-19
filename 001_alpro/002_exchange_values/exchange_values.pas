program exchange_values;

var angka1, angka2 : integer;

begin
  write('Masukkan angka1: '); readln(angka1);
  write('Masukkan angka2: '); readln(angka2);
  writeln('Angka1 saat ini: ', angka1);
  writeln('Angka2 saat ini: ', angka2);
  writeln();
  angka1 := angka1 + angka2;
  angka2 := angka1 - angka2;
  angka1 := angka1 - angka2;
  writeln('Keadaan dua buah angka setelah bertukar!');
  writeln('Angka1 saat ini: ', angka1);
  writeln('Angka2 saat ini: ', angka2);
end.