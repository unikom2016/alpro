{ Judul }
Program BeratBadanIdeal;

{I.S. : User memasukkan Tinggi Badan}
{F.S. : Menampilkan total berat badan ideal}

{ Kamus }
var TinggiBadan, BeratIdeal, BadanIdeal : integer;

{ Algoritma }
begin

    { Masukkan }
    Writeln('Masukkan tinggi badan : '); Readln(TinggiBadan);

    { Proses } 
    BeratIdeal := TinggiBadan - 100; 
    BadanIdeal := BeratIdeal - (Round(BeratIdeal * 0.10));
    

    { Keluaran }
    Writeln('Hasil Perhitungan Berat Badan Ideal, yaitu (Kg) : ', BadanIdeal, 'Kg');

end.