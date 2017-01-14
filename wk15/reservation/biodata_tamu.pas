program biodata_tamu;
uses crt,sysutils;
const
 MaksTamu = 20;
type
 DataTamu = record
 nama, alamat : string;
 ktp, telp, stay : integer;
 check_in,check_out : string ;
end;
 Tamu=array[1..MaksTamu] of DataTamu;
var
YY,MM,DD, hh, nn, ss, cc : Word; // Year, Month, Day, Hour, N -> Minutes, Second, Milisecond
tempDate: TDateTime; // temporary date to converts to int
TM : Tamu;
N,i  : integer;
begin
 {write('Masukkan Jumlah Tamu : '); readln(N);
  clrscr;
  gotoxy(32,1);
  write('BIODATA');
  gotoxy(28,2);
  write('===============');
  gotoxy(1,4);
  write('--------------------------------------------------------------------');
  gotoxy(1,5);
  write('|     Nama     |      Alamat      |     No.Ktp     |    No.Telp    |');
  gotoxy(1,6);
  write('--------------------------------------------------------------------');
  for i := 1 to N do
  begin
    gotoxy(1,i+6);
    write('|              |                  |                |               |');
    gotoxy(3,i+6); readln(TM[i].nama);
    gotoxy(18,i+6); readln(TM[i].alamat);
    gotoxy(37,i+6); readln(TM[i].ktp);
    gotoxy(54,i+6); readln(TM[i].telp);

  end;
  gotoxy(1,i+7);
  write('--------------------------------------------------------------------');}

  // TM[i].check_in := DateTimeToStr(Now);
  TM[1].check_in := FormatDateTime('DD-MM-YYYY hh:nn:ss', Now);
  // gotoxy(1,i+8);write('Jam Check-In : ', format('%d-%d-%d', [DD, MM, YY]), );
  gotoxy(1,i+8); write('Jam Check-In : ', TM[1].check_in); // ini udah string
  tempDate := StrToDateTime(TM[1].check_in);
  DecodeDate(tempDate, YY, MM, DD);
  DecodeTime(tempDate, hh, nn, ss, cc);
  gotoxy(1,i+9); write('lama menginap : '); readln(TM[i].stay);
  gotoxy(1,i+10); write('Jam Check-Out : ', format('%d-%d-%d %d:%d:%d', [DD + TM[1].stay, MM, YY, hh, nn, ss]));

  // TM[i].check_out := TM[i].stay + TM[i].check_in;
  // gotoxy(1,i+10);write('Jam Check-Out : ', format('%d-%d-%d', [DD + TM[i].stay, MM, YY]), ' 11:59:59');
  // gotoxy(1,i+10);write('Jam Check-Out : ', DayOfWeek(Now));
  readln;
end.
