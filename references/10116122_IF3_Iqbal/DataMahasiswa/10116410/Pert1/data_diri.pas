program data_diri;
{
Programmer : Muhammad Dzulfiqar Firdaus
Deskripsi : Mengimput dan menampilkan data diri
}

var
   NIM,Nama,alamat,angk: string;

begin
 write('Masukkan Nama Anda : ');readln(Nama);
 write('Masukkan NIM Anda : ');readln(NIM);
 write('Masukkan Alamat : ');readln(alamat);
 write('Angkatan : ');readln(angk);
 writeln('******************************');
 write('Nama Anda : ');writeln(Nama);
 write('NIM Anda : ');writeln(NIM);
 write('Alamat Anda : ');writeln(alamat);
 write('Angkatan : ');writeln(angk);
 readln;
end.
