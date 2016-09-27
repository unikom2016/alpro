{ Judul }
Program Distances;

{I.S. : User memasukkan jarak dalam centimeter}
{F.S. : Menampilkan jarak dalam bentuk kilometer, meter dan centimeter}

{ Kamus }
var Jarak, SisaJarak, KiloMeter, Meter, CentiMeter : longint;

{ Algoritma }
begin
    { Masukkan }
    writeln('Masukkan Perjalanan sejauh (centimeter) : ');
    readln(Jarak);

    { Proses } 
    KiloMeter := Jarak div 100000; // Hasil bagi konversi CM ke KiloMeter
    SisaJarak := Jarak mod 100000; // Sisa bagi konversi CM ke KM

    Meter := SisaJarak div 1000; // Hasil bagi konversi Sisa CM ke Meter
    SisaJarak := SisaJarak mod 1000; // Sisa bagi konversi CM ke KM

    CentiMeter := SisaJarak;

    { Keluaran }
    writeln(KiloMeter, ' km + ', Meter, ' m + ', CentiMeter, ' cm');

end.