{ Judul }
Program PesanBeratIdeal;

{I.S. : User memasukkan berat badan dan tinggi badan}

{F.S. : Menampilkan keterangan berat badan ideal dan tidak ideal}

{ Kamus }
var BeratBadan, TinggiBadan, BeratIdeal : integer;
var Pesan : string;

{ Algoritma }
begin

    { Input }
    Write('Masukkan berat badan : '); Readln(BeratBadan);
    Write('Masukkan tinggi badan : '); Readln(TinggiBadan);
    Pesan := 'Tidak Ideal, Semangat Olahraga!!!!';
    
    { Proses }
    BeratIdeal := TinggiBadan - 100;
    BeratIdeal := BeratIdeal - (Round(BeratIdeal * 0.10));

    { Kondisi (Pemilihan) }
    If ((BeratBadan - BeratIdeal) <= 2)
        Then
            Pesan := 'Ideal, ^_^';

    { Output }
    Writeln('Berat badan kamu : ', Pesan);

end.