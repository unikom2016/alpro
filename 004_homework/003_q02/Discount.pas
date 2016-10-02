{ Judul }
Program Discount;

{I.S. : User memasukkan total belanja}

{F.S. : Menampilkan harga diskon, dan total belanja setelah dikurangi harga diskon}

{ Kamus }
var Diskon : real;
var TotalBelanjaPembeli, TotalDiskonBelanja, HargaMulaiDiskon, HargaDiskon : longint;

{ Algoritma }
begin
    Diskon := 0.25; // Diskon 25%

{ Input }

    Write('Masukkan Total Belanja : '); Readln(TotalBelanjaPembeli);
    HargaMulaiDiskon := 100000;

    { Proses }
    { Kondisi (Pemilihan) - 1 Kasus}
    If (TotalBelanjaPembeli > HargaMulaiDiskon) Then
            HargaDiskon := Round(TotalBelanjaPembeli * 0.25);
            TotalDiskonBelanja := TotalBelanjaPembeli - HargaDiskon;
            // Writeln('TotalDiskonBelanja : ', TotalDiskonBelanja);

    { Output }
    Writeln('Harga Diskon : ', HargaDiskon);
    Writeln('Total Harga Setelah Diskon : ', TotalDiskonBelanja);
end.