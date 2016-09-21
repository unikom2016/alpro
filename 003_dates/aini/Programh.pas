program Untitled;
uses crt;
var
     jumlah, hari, jam, menit, detik, sisadetik :integer;
begin
     //membuat jendela untuk data masukan
     window(2,2,38,24); textbackground(7); clrscr;
     textcolor(15);
     gotoxy(13,2); write('data masukan');
     gotoxy(13,3); write('============');
     //membuat jendela untuk hasil keluaran
     window(42,2,70,24); textbackground(7); clrscr;
     textcolor(15);
     gotoxy(13,2); write('hasil keluaran');
     gotoxy(13,3); write('============');
     //memasukan waktu
     window(2,2,38,24);
     gotoxy(13,5);
     write('masukan waktu detik) : '); readln(Jumlah);
     //menentukan jumlah hari
     Hari := Jumlah  div 86400;
     //menentukan Sisa Detik
     SisaDetik := Jumlah mod 86400;
     //menentukan jumlah jam
     Jam := SisaDetik div 3600;
     //menentukan jumlah detik
     SisaDetik := SisaDetik div 60;
     //menentukan jumlah menit
     menit := sisadetik mod 60;
     //menentukan jumlah detik
     detik := sisadetik mod 60;

     //menampilkan jumlah hari,jam,menit,dan detik
     window(42,2,79,24);
     gotoxy(2,5); textcolor(red);write(Jumlah);
     textcolor(15); write('jumlahhari,');
     gotoxy(2,6); textcolor(red);write(hari);
     textcolor(15); write('hari,');
     gotoxy(2,5); textcolor(red);write(Jam);
     textcolor(15); write('jam,');
     gotoxy(2,5); textcolor(red);write(menit);
     textcolor(15); write('menit,');
     gotoxy(2,5); textcolor(red);write(detik);
     textcolor(15); write('detik,');
     readln;













end.
