program menentukan_Hari_jam_Menit_Detik;
uses crt;
var JumlahDetik,Hari,Jam,Menit,Detik,SisaDetik: Integer;
begin
    //membuat jendela untuk data masukkkan
    window(2,2,38,24); textbackground(7);clrscr;
    textcolor(15);
    gotoxy(13,2); write('Data Masukkan');
    gotoxy(13,2); write('=============');
     //membuat jendela untuk data masukkkan
    window(42,2,79,24); textbackground(7);clrscr;
    textcolor(15);
    gotoxy(13,2); write('Data Masukkan');
    gotoxy(13,2); write('=============');

    //memasukkan waktu
    window(2,2,38,24);
    gotoxy(3,5);
    write('Masukkan Waktu (Detik) :'); readln (JumlahDetik);

     //menentukan jumlah hari
    Hari := Jumlah Detik div 86400;

     //menentukan jumlah sisa detik
    SisaDetik := JumlahDetik mod 86400;

     //menentukan jumlah Jam
    jam := SisaDetik div 3600;

     //menentukan jumlah SisaDetik
    SisaDetik := SisaDeti mod 86400;

     //menentuka jumlah Menit
    menit := SisaDetik div div 60;

     //menentukan jumlah Detik
    Detik := sisaDetik div 60;

    //menampilkan jumlah hari,jam,menit, dan detik
    window(42,2,79,24);
    gotoxy(2,5); textcolor(15); write('Detik terdiri dari :')
    gotoxy(2,6); textcolor(red); write(Hari);
    textcolor(15); write('Hari, ');

    textcolor(red); write(Jam);
    textcolor(15); write('Jam, ');

    textcolor(red); write(Menit);
    textcolor(15); write('Menit, ');

    textcolor(red); write(Detik);
    textcolor(15); write('Detik, ');
end.
