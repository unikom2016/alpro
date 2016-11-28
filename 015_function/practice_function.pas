{ Judul }
program Menampilkan_suku_ke_n;

{I.S. : User mendefinisikan suku ke-N}
{F.S. : Menampilkan hasil dari barisan suku ke-n}

{ Kamus Global }
var n, hasil: integer;

{ Procedure and Function }
{ Input Procedure }
procedure isi_suku(var n: integer);
{I.S. : User memasukkan nilai n}
{F.S. : Mengeluarkan nilai n}
{ Kamus Lokal }
{ Algoritma }
begin
  write('Masukkan baris ke-');
  readln(n);
end;

function factorial(n: integer): integer;
begin
  if (n = 0) then
    factorial := 1
  else
    factorial := factorial(n - 1) * n;
end;

{ Process Procedure }
function nilai_dari(suku: integer): integer;
{I.S. : Nilai n telah terdefinisi}
{F.S. : Menampilkan hasil rumus deret}
{ Kamus Lokal }
{ Algoritma }
begin
  nilai_dari := (2 div factorial(0))
  + ((suku - 1) div factorial(1))
  + (((suku - 1) * (suku - 2)) div factorial(2))
  + (7 * ((suku - 1) * (suku - 2) * (suku - 3)) div factorial(3))
  + (-20 * ((suku - 1) * (suku - 2) * (suku - 3) * (suku - 4)) div factorial(4));
end;

procedure tampil(hasil: integer);
{I.S. : User telah mendefinisikan hasil}
{F.S. : Mengeluarkan nilai hasil pada layar}
{ Kamus Lokal }
var i: integer;
{ Algoritma }
begin
  writeln('Barisannya yaitu: ');
  for i := 1 to n do begin
    write(nilai_dari(i + 1));
    if (i <> n) then
      write(', ');
  end;
  writeln;
  writeln('Nilai dari suku ke-', n, ' yaitu: ', hasil);
end;

{ Algoritma Utama}
{ Input }
begin
  isi_suku(n);
  hasil := nilai_dari(n + 1);
  tampil(hasil);
end.