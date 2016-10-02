program Untitled;
uses crt;
var JumlahDetik,Hari,Jam,Menit,Detik,SisaDetik: Integer;
begin
    write('masukkan waktu (Detik) : ', JumlahDetik);
    readln(JumlahDetik);
    Hari := JumlahDetik div 86400;
    SisaDetik := JumlahDetik mod 86400;
    jam := SisaDetik div 3600;
    SisaDetik := SisaDetik mod 3600;
    Menit := SisaDetik div 60;
    Detik := SisaDetik mod 60;
    writeln();
    writeln(JumlahDetik, ' detik terdiri dari :');
    writeln(Hari, 'hari', jam, 'jam', menit,'menit',detik,'detik');
    readln;
end.
