uses crt;
var
  npm: string[7];
  nama: string[25];
  nilai_absen: real;
  nilai_tugas: real;
  nilai_uts: real;
  nilai_uas: real;
  nilai_akhir: real;
  nilai_mutu: char;
  nilai_IP: integer;
  jumlah_nilai: integer;
  lagi: char;
begin
clrscr;
  lagi:='y';
  while upcase(lagi)='Y' do
  begin
  clrscr;
     gotoxy(32,2)  ; write('DATA NILAI MAHASISWA');
     gotoxy(3,3)   ; write('___________________________________________________________________________');
     gotoxy(27,5)  ; write('NPM            : '); readln(npm);
     gotoxy(27,7)  ; write('Nama Mahasiswa : '); readln(nama);
     gotoxy(3,9)   ; write('MK Pengantar Teknologi Informasi');
     gotoxy(6,11)  ; write('Nilai Absen  : '); readln(nilai_absen);
     gotoxy(6,13)  ; write('Nilai Tugas  : '); readln(nilai_tugas);
     gotoxy(6,15)  ; write('Nilai UTS    : '); readln(nilai_uts);
     gotoxy(6,17)  ; write('Nilai UAS    : '); readln(nilai_uas);
        nilai_akhir:=(nilai_absen+2*nilai_tugas+3*nilai_uts+4*nilai_uas)/10;
     gotoxy(6,19) ; write('Nilai Akhir  : ',nilai_akhir:1:0);
        if nilai_akhir >= 85 then
           begin
              nilai_mutu:='A';
              nilai_IP:=4;
           end
        else
        if nilai_akhir > 70 then
           begin
              nilai_mutu:='B';
              nilai_akhir:=3;
           end
        else
        if nilai_akhir > 55 then
           begin
              nilai_mutu:='C';
              nilai_IP:=2;
           end
        else
        if nilai_akhir > 45 then
           begin
              nilai_mutu:='D';
              nilai_IP:=1;
           end
        else
        if nilai_akhir < 45 then
            begin
              nilai_mutu:='E';
              nilai_IP:=0;
            end;
     gotoxy(6,21)  ; write('Nilai Mutu   : ',nilai_mutu);
     gotoxy(6,23)  ; write('Nilai IP     : ',nilai_IP);
        jumlah_nilai:=nilai_IP*2;
     gotoxy(6,25)  ; write('Jumlah Nilai : ',jumlah_nilai);

     gotoxy(3,27)  ; write('MK Bahasa Inggris');
     gotoxy(6,29)  ; write('Nilai Absen  : '); readln(nilai_absen);
     gotoxy(6,31)  ; write('Nilai Tugas  : '); readln(nilai_tugas);
     gotoxy(6,33)  ; write('Nilai UTS    : '); readln(nilai_uts);
     gotoxy(6,35)  ; write('Nilai UAS    : '); readln(nilai_uas);
        nilai_akhir:=(nilai_absen+2*nilai_tugas+3*nilai_uts+4*nilai_uas)/10;
     gotoxy(6,37)  ; write('Nilai Akhir  : ',nilai_akhir:1:0);
        if nilai_akhir >= 85 then
           begin
              nilai_mutu:='A';
              nilai_IP:=4;
           end
        else
        if nilai_akhir > 70 then
           begin
              nilai_mutu:='B';
              nilai_akhir:=3;
           end
        else
        if nilai_akhir > 55 then
           begin
              nilai_mutu:='C';
              nilai_IP:=2;
           end
        else
        if nilai_akhir > 45 then
           begin
              nilai_mutu:='D';
              nilai_IP:=1;
           end
        else
        if nilai_akhir < 45 then
            begin
              nilai_mutu:='E';
              nilai_IP:=0;
            end;