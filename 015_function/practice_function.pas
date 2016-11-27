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
function nilai_dari(urutan: integer): integer;
{I.S. : Nilai n telah terdefinisi}
{F.S. : Menampilkan hasil rumus deret}
{ Kamus Lokal }
var rumus: integer;
{ Algoritma }
begin
    if (urutan = 0) then // Termination
      nilai_dari := 0
    else begin
      rumus := (2*urutan + 4*sqr(urutan) - 12*urutan + 
                ((urutan - 3)*(urutan - 2)*(urutan - 1) div 2) + 9
              );
      // nilai_dari := nilai_dari(baris - 1) + 3;
    end;

    nilai_dari := rumus;
    if (urutan = 4) then
        nilai_dari := nilai_dari - 16;
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