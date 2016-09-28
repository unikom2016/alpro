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
    Mm := PanjangSatuanMeter * 1000;
    Cm := PanjangSatuanMeter * 100;
    Inchi := Mm / 25.4;
    Kaki := Cm / 30.48;
    Yard := PanjangSatuanMeter / 0.9144;
    
    { Keluaran }
    Writeln('Inchi : ', Inchi:4:2);
    Writeln('Kaki : ', Kaki:4:2);
    Writeln('Yard : ', Yard:4:2);

end.