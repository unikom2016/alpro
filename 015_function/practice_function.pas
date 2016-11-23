{ Judul }
program practice_function;
uses math;

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
  write('Masukkan nilai n: ');
  readln(n);
end;

function factorial(n: integer): integer;
{I.S. : Nilai n telah terdefinisi}
{F.S. : Menampilkan hasil faktorial nilai n}
{ Kamus Lokal }
{ Algoritma }
begin
  if (n = 0) then
    factorial := 1
  else
    factorial := factorial(n - 1) * n;
end;

{ Process Procedure }
function rumus_deret(n: integer): integer;
{I.S. : Nilai n telah terdefinisi}
{F.S. : Menampilkan hasil rumus deret}
{ Kamus Lokal }
var awal, akhir, i: integer;
{ Algoritma }
begin
  // Rumus deret tingkat 3
  // for i := 1 to n do begin
    // rumus_deret := (3 div factorial(0)) 
    // + ((2 * (n - 1)) div factorial(1)) 
    // + ((8 * (n - 1) * (n - 2)) div factorial(2)) 
    // + ((3 * (n - 1) * (n - 2) * (n - 3)) div factorial(3));
    // + ((5 * (n - 1)) div factorial(1)) 
    // + ((10 * (n - 1) * (n - 2)) div factorial(2)) 
    // + ((5 * (n - 1) * (n - 2) * (n - 3)) div factorial(3))
    // + ((3 * (n - 1) * (n - 2) * (n - 3) * (n - 4)) div factorial(4));
    // rumus_deret := 2*n + 4*sqr(n) - 12*n + ((n - 3)*(n - 2)*(n - 1) div 2) + 9;
    // rumus_deret := (3 * (1 - 4**n)) div (1 - 4); // geometri
    // rumus_deret := 3 * 4**(n - 1); // suku ke-n
    if (n = 0) then
      writeln('Tidak ada!')
    else begin
      if (n = 1) then begin
        rumus_deret := 3;
        writeln(rumus_deret);
      end else if (n = 2) then begin
        rumus_deret := 5;
        writeln('3, ', rumus_deret);
      end else begin
        awal := 3;
        akhir := 5;

        write('3, 5, ');
        for i := 3 to n do begin
          if (i mod 2 = 0) then
            rumus_deret := awal + akhir
          else
            rumus_deret := awal * akhir;

          awal := akhir;
          akhir := rumus_deret;

          write(rumus_deret);
          if i <> n then
            write(', ');
        end;
        writeln;
      end;
    end;
  // end;
end;

procedure tampil_suku(n, hasil: integer);
{I.S. : User telah mendefinisikan hasil}
{F.S. : Mengeluarkan nilai hasil pada layar}
{ Kamus Lokal }
{ Algoritma }
begin
  writeln('Hasil suku ke-', n, ', yaitu: ', hasil);
end;

{ Algoritma Utama}
begin
  { Input }
  isi_suku(n); // prosedur
  { Process }
  hasil := rumus_deret(n); // fungsi
  { Output }
  tampil_suku(n, hasil); // prosedur
end.