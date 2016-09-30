program Untitled;

uses crt;

var DETIK_PER_HARI, DETIK_PER_JAM, DETIK_PER_MENIT,
Hari, Jam, Menit, JumlahDetik, SisaDetik : integer;

begin
     DETIK_PER_HARI := 86400;
     DETIK_PER_JAM := 3600;
     DETIK_PER_MENIT := 60;

     // Jendela Masukkan
     window(2, 2, 38, 24); textbackground(7); clrscr();
     textcolor(15);
     gotoxy(13,2); write('Data Masukkan');
     gotoxy(13,3); write('=============');

     // Masukkan Data
     window(2, 2, 38, 24);
     gotoxy(3,5);
     write('Masukkan Waktu (Detik) : '); readln(JumlahDetik);

     // Proses Hari
     Hari := JumlahDetik div DETIK_PER_HARI;
     SisaDetik := JumlahDetik mod DETIK_PER_HARI;

     // Proses Jam
     Jam := SisaDetik div DETIK_PER_JAM;
     SisaDetik := SisaDetik mod DETIK_PER_JAM;

     // Proses Menit
     Menit := SisaDetik div DETIK_PER_MENIT;
     SisaDetik := SisaDetik mod DETIK_PER_MENIT;

     // Jendela Keluaran
     window(42, 2, 79, 24); textbackground(7); clrscr();
     textcolor(15);
     gotoxy(13,2); write('Hasil Keluaran');
     gotoxy(13,3); write('=============');

     // Menampilkan Jumlah Hari, Jam, Menit dan Detik
     window(42, 2, 79, 24);

     gotoxy(2, 5); textcolor(red); write(JumlahDetik);
     textcolor(15); write(' detik terdiri dari : ');

     gotoxy(2, 6); textcolor(red); write(Hari);
     textcolor(15); write(' Hari, ');

     textcolor(red); write(Jam);
     textcolor(15); write(' Jam, ');

     textcolor(red); write(Menit);
     textcolor(15); write(' Menit, ');

     textcolor(red); write(SisaDetik);
     textcolor(15); write(' Detik');

     readln();
end.
