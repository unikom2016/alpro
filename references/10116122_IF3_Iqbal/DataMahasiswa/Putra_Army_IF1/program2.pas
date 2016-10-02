program Gaji_Karyawan;
uses crt;
var
nama :string;
g_pokok : integer;
tunjangan,pajak,g_bersih : real;

begin
window(2,2,38,24); textbackground(blue); clrscr;
textcolor(15);
gotoxy(13,2); write('Data Masukukan');
gotoxy(13,3); write('==============');

window(42,2,78,24); textbackground(blue); clrscr;
textcolor(15);
gotoxy(13,2); write('Data keluaran');
gotoxy(13,3); write('=============');

window(2,2,38,24);
gotoxy(3,5) ;write('Nama Karyawan : '); readln(nama);
gotoxy(3,6);write('Gaji pokok : '); readln(g_pokok);
tunjangan:=g_pokok*20/100;
pajak:=g_pokok*15/100;
g_bersih:=g_pokok+tunjangan-pajak;

window(42,2,78,24);
gotoxy(13,4);
textcolor(15); write('nama karyawan  : ');
textcolor(red); writeln(nama);
gotoxy(13,5);textcolor(15); write('gaji pokok     : Rp.');
textcolor(red); write(g_pokok);
textcolor(15); writeln(',-');
gotoxy(13,6);textcolor(15); write('tunjangan      : Rp.');
textcolor(red); write(tunjangan:0:0);
textcolor(15); writeln(',-');
gotoxy(13,7);textcolor(15); write(' pajak         : Rp.');
textcolor(red); write(pajak:0:0);
textcolor(15); writeln(',-');
gotoxy(13,8);textcolor(15); write('gaji bersih    : Rp.');
textcolor(red); write(g_bersih:0:0);
textcolor(15); writeln(',-');

readln;


end.
