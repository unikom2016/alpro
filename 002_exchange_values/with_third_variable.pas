// Judul
program menukar_dua_buah_angka_dengan_bantuan_variabel;

{I.S. : }
{F.S. : }

// Kamus
var angka1, angka2, angkasementara : integer;

// Algoritma
begin
    
    // Input(angka1, angka2)
    write('Masukkan angka1 : '); readln(angka1);
    write('Masukkan angka2 : '); readln(angka2);

    // angkasementara <- angka1
    angkasementara := angka1;

    // angka1 <- angka2
    angka1 := angka2;

    // angka2 <- angkasementara
    angka2 := angkasementara;

    // Output(angka1, angka2)
    writeln('=== Keadaan kedua angka setelah bertukar ===');
    writeln('Kondisi angka1: ', angka1);
    writeln('Kondisi angka2: ', angka2);

end.