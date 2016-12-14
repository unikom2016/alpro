program membuat_matriks_a;

uses crt;

type
  matriks = array[1..5, 1..3] of integer;

{ Kamus Global }
var
  a: matriks;
procedure isi_matriks(var a: matriks);
var i, j: integer;
begin
  clrscr;
  window(1, 1, 80, 30);
  writeln('masukkan elemen matriks a');
  writeln('-------------------------');
  for i := 1 to 5 do begin
    for j := 1 to 3 do begin
      // write('a[', i, ', ', j, '] = '); read(a[i,j]);
      gotoxy(j*3, i+2); read(a[i,j]);
    end;
    writeln;
  end;
end;

procedure tampil_matriks(a: matriks);
var i, j: integer;
begin
  clrscr;
  writeln('tampilkan elemen matriks a');
  writeln('-------------------------');
  for i := 1 to 5 do begin
    for j := 1 to 3 do begin
      // write('a[', i, ', ', j, '] = ', a[i,j], '; ');
      gotoxy(j*3, i+2); delay(700); write(a[i,j]);
    end;
    writeln;
  end;
end;

begin
  isi_matriks(a);
  tampil_matriks(a);
end.