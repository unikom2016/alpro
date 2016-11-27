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

{ Process Procedure }
function nilai_dari(suku: integer): integer;
{I.S. : Nilai n telah terdefinisi}
{F.S. : Menampilkan hasil rumus deret}
{ Kamus Lokal }
var awal, rasio, rumus: integer;
{ Algoritma }
begin
  awal := 3;
  rasio := 5;
  if (suku < 1) then
    writeln('You cannot')
  else if (suku = 1) then begin
    // writeln('suku ke-', suku);
    nilai_dari := suku * awal;
  end else if (suku = 2) then begin
    // writeln('suku ke-', suku);
    nilai_dari := suku + awal;
  end else begin
    // writeln('suku ke-', suku);
    nilai_dari := suku * rasio;
  end;
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
    write(nilai_dari(i));
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
  hasil := nilai_dari(n);
  tampil(hasil);
end.