{ Judul }
Program KonversiMeter;

{I.S. : User memasukkan jarak dalam centimeter}
{F.S. : Menampilkan jarak dalam bentuk kilometer, meter dan centimeter}

{ Kamus }
var PanjangSatuanMeter, Inchi, Kaki, Yard, Mm, Cm : real;

{ Algoritma }
begin

    { Masukkan }
    Write('Masukkan Panjang Satuan Benda (meter) : '); Readln(PanjangSatuanMeter);

    { Proses } 
    Mm := PanjangSatuanMeter * 1000; // Meter ke milimeter
    Cm := PanjangSatuanMeter * 100; // Meter ke centimeter 
    Inchi := Mm / 25.4; // Milimeter ke Inchi
    Kaki := Cm / 30.48; // Centimeter ke Kaki
    Yard := PanjangSatuanMeter / 0.9144; // Meter ke Yard
    
    { Keluaran }
    Writeln('Hasil setelah satuan (meter) dikonversi: ');
    Writeln('Inchi : ', Inchi);
    Writeln('Kaki : ', Kaki);
    Writeln('Yard : ', Yard);

end.