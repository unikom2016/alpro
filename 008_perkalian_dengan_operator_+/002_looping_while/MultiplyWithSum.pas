{ Judul }
program m_x_n_while;

{I.S. : User memasukkan dua buah nilai }

{F.S. : Menampilkan data hasil dari perkalian dua nilai dengan operator +}

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
    if ((M = 0) or (N = 0)) then
        // Aksi
        Hasil := 0

    else
        // Kondisi M > 0 or M < 0; N > 0
        if ((M > 0) or (M < 0)) and (N > 0) then
                begin
                    // Aksi
                    Hasil := M;
                    
                    // Perulangan (while)
                    i := 1;
                    while (i < N) do
                        begin
                            Hasil := Hasil + M;
                            i := i + 1;
                        end;
                end

    else
        // Kondisi N < 0; M = 3; N = -2
        if (M > 0) and (N < 0) then
                begin
                    // Aksi
                    Hasil := N;

                    // Perulangan (while) 
                    i := 1;
                    while (i < M) do
                        begin
                            Hasil := Hasil + N;
                            i := i + 1;
                        end;
                end

    // Kondisi M & N < 0
    else
        begin
            M := M * -1; // Positif
            N := N * -1; // Positif
            Hasil := M;
            
            // Perulangan (while)
            i := 1;
            while (i < N) do
                begin
                    Hasil := Hasil + M;
                    i := i + 1;
                end;
        end;
            
    { Output }
        writeln('Hasil penjumlahan dar M x N, yaitu: ', Hasil);

end.