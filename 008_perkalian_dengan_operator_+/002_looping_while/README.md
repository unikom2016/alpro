    { Judul }
    Menghitung_perkalian_antar_dua_variabel_dengan_operator_+

    {I.S. : User memasukkan dua buah nilai}
	{F.S. : Menampilkan data penjumlahan dari perkalian kedua nilai}

    { Kamus }
        
    { Algoritma }
        { Input }
        Input(M, N)
        
        { Proses }

        { Kondisi (Pemilihan) }
        
        // Kondisi M = 0 or N = 0
        If (M = 0) or (N = 0)
            Then
                // Aksi
                Hasil <- 0

        Else
            // Kondisi M > 0 or M < 0; N > 0
            If ((M > 0 or (M < 0) and (N > 0)
                Then
                    // Aksi
                    Hasil <- M
                    
                    // Perulangan (While)
                    i <- 1
                    While (i < N) 
                        Hasil <- Hasil + M
                        i <- i + 1
                    EndWhile
            EndIf

        Else
            // Kondisi N < 0; M = 3; N = -2
            If (M > 0) and (N < 0)
                Then
                    // Aksi
                    Hasil <- N

                    // Perulangan (While) 
                    i <- 1
                    While (i < N)
                        Hasil <- Hasil + N
                        i <- i + 1
                    EndWhile
            EndIf

        // Kondisi M & N < 0
        Else
            M <- M * -1 // Positif
            N <- N * -1 // Positif
            Hasil <- M
            i <- 1
            While (i < N)
                Hasil <- Hasil + M
                i <- i + 1
            EndWhile
        EndIf

        { Output }
            Output(Hasil)