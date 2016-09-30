program hitung_gaji;
{
Programmer : Muhammad Dzulfiqar Firdaus
Deklarasi : Membuat program hitung gaji karyawan
}
var
gaji_pokok,tunjangan,gaji_kotor: integer;
nama,nip: string;
pajak,gaji_bersih: real;

begin
writeln('Masukkan Nama Anda = ');readln(nama);
writeln('Masukkan NIP Anda = ');readln(nip);
writeln('Masukkan Gaji Pokok Anda = ');readln(gaji_pokok);
writeln('Masukkan Tunjangan Anda = ');readln(tunjangan);
gaji_kotor:=gaji_pokok+tunjangan;
pajak:=0.1*gaji_kotor;
gaji_bersih:=gaji_kotor-pajak;
writeln('Pegawai yang bernama ',nama,' dan NIP ',nip,' Memiliki rincian sebagai berikut = ');
writeln('Gaji Kotor Anda = ',gaji_kotor);
writeln('Pajak Anda = ',pajak:10:2);
writeln('Gaji Bersih Anda = ',gaji_bersih:10:2);
readln;
end.
