program Yard_Kaki_Inch_Ke_Meter;
uses crt;
{I.S.   : User memasukkan panjang dlam satuan yard, kaki dan inch}
{I.F.   : Menampilkan Panjang dalam satuan meter}
var
   Yard, Kaki, Inch, Meter : real;
begin
//membuat jendela untuk layar masukkan
window(2,2,25,24); textbackground(blue); clrscr;
textcolor(15);
gotoxy(6,2); write('Data Masukkan');
gotoxy(6,3); write('=============');

//membuat jendela untuk layar keluaran
window(27,2,78,24); textbackground(blue); clrscr;
textcolor(15);
gotoxy(20,2); write('Data Masukkan');
gotoxy(20,3); write('=============');

    {memasukkan yard, kaki dan inch}
    write('masukkan Yard : '); readln(Yard);
    write('masukkan Kaki : '); readln(Kaki);
    write('masukkan Inch : '); readln(Inch);

    {mengubah satuan yarad, kaki dan inch menjadi meter}
    Meter := 0.9144* Yard + 0.348 * Kaki + 0.0254 * Inch;

    {menampilkan panjang dalam satuan meter}
    window(27,2,78,24);
    gotoxy(3,5);
    textcolor(red); write(Yard:0:1);
    textcolor(15); write(' Yard ');
    textcolor(red); write(Kaki:0:1);
    textcolor(15); write(' Kaki ');
    textcolor(red); write(Inch:0:1);
    textcolor(15); write(' Inch ');
    textcolor(red); write(Meter:0:4);
    textcolor(15); write(' Meter ');
    readln;
end.
