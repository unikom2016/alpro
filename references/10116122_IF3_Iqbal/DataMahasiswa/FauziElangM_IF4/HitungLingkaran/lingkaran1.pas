program menghitung_volume_dan_luas_bola ;
uses crt;
const
	phi =3.14;

var
	Diameter ,  Volume , Luas : real;

Begin
	//membuat jendela untuk data masukkan
window(2,2,38,24); textbackground(7); clrscr;
textcolor(15);
gotoxy(13,2); write ('data masukkan');
gotoxy(13,3); write ('============');

//membuat jendela untuk hasil keluaran
window(42,2,78,24); textbackground(7); clrscr;
textcolor(15);
gotoxy(13,2); write ('Hasil keluaran');
gotoxy(13,3); write ('============');

//memasukkan diameter bola pada layar masukkan
window(2,2,38,24);
gotoxy(6,5); 
write ('diameter bola (cm) '); readln(diameter);

//menghitung volume bola
volume := 1/6 * phi * sqr(diameter) * diameter;

//menghitung luas permukaan bola
luas := Phi * sqr(diameter);

//menampilkan volume dan luas permukaan bola
window(42,2,78,24); 
gotoxy(5,5); write ('volume bola	:');
textcolor(red); write(volume:0:2);
textcolor(15);write(' cm3');

gotoxy(4,6); write ('Luas Permukaan Bola :');
textcolor(red); write(luas:0:2);
textcolor(15);write(' cm2');

	readln;
end.
