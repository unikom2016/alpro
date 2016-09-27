{ Judul }
Program ExchangeThreeValues;

{I.S. : User memasukkan tiga buah bilangan bulat}
{F.S. : Menampilkan bilangan bulat bang telah bertukar}

{ Kamus }
var temp, a, b, c : integer;

{ Algoritma }
begin
    { Masukkan }
    Write('Masukkan nilai a : '); Readln(a);
    Write('Masukkan nilai b : '); Readln(b);
    Write('Masukkan nilai c : '); Readln(c);

    { Proses }
    // Swap a, b
    temp := a;
    a := b;
    b := c;
    c := temp;

    { Keluaran }
    Writeln('Nilai bilangan setelah bertukar : ', a, ', ', b, ', ', c);

end.