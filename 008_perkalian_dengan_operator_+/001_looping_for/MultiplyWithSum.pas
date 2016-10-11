{ Judul }
program MultiplyWithSum;

{I.S. : User memasukkan dua buah nilai}
{F.S. : Menampilkan data penjumlahan dari perkalian kedua nilai}

{ Kamus }
var M, N, Hasil, i: integer;
    
{ Algoritma }
begin

    { Input }
    write('Masukkan nilai M: '); readln(M);
    write('Masukkan nilai N: '); readln(N);

    { Proses }

    { Kondisi (Pemilihan) }
    
    // Kondisi M = 0 or N = 0
    if (M = 0) or (N = 0) then
            // Aksi
            Hasil := 0

    else
        // Kondisi M > 0 or M < 0; N > 0
        // M = 3; N = 2
        if ((M > 0) or (M < 0)) and (N > 0) then
	        begin                
                // Perulangan (for)
                for i := 1 to N do
                    begin
                        Hasil := Hasil + M;
                    end;
            end

    else
        // Kondisi N < 0; M = 3; N = -2
        if (M > 0) and (N < 0) then
	        begin
                // Perulangan (for)
                for i := 1 to M do
                    begin
                        Hasil := Hasil + N;
                    end;
            end

    // Kondisi M & N < 0
    else
        begin
            M := M * -1; // Positif
            N := N * -1; // Positif

            // Perulangan (for)
            for i := 1 to N do
                begin
                    Hasil := Hasil + M;
                end;
        end;

    { writeln }
        writeln(Hasil);

end.
