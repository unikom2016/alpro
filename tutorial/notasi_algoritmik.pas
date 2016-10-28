{ Judul }
program notasi_algoritmik;
{ I.S.: User memasukkan nama}
{ F.S.: Memunculkan nama yang telah terdefinisi dari user}

{ Kamus }
    { nama: String }
var nama: string;

{ Algoritma }
begin
    { Input(nama) }
    write('Masukkan nama kamu: ');
    readln(nama);

    { Output(nama) }
    writeln('Halo, ', nama, '!');
end.