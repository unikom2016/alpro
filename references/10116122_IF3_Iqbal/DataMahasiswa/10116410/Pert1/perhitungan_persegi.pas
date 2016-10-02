program perhitungan_persegi;
{
Programmer : Muhammad Dzulfiqar Firdaus
Deskripsi : Membuat program perhitungan luar dan keliling persegi panjang
}
var
   panjang,lebar,luas,keliling: integer;
begin
     writeln('==========PROGRAM PERHITUNGAN LUAS DAN KELILING PERSEGI PANJANG===========');
     write('Masukkan Panjang : ');readln(panjang);
     write('Masukkan Lebar : ');readln(lebar);
     luas:=panjang*lebar;
     keliling:=2*(panjang+lebar);
     writeln('Luasnya adalah : ',luas);
     writeln('Kelilingnya adalah : ',keliling);
     readln;
end.
