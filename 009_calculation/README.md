    { Judul }
    Menu_pilihan

    {I.S. : User memilih salah satu menu}
    {F.S. : Menampilkan hasil dari menu yang dipilih}

    { Kamus }
    Pilihan: integer

    { M x N }
    M, N, Hasil, i: integer

    { Suku ke-N }
    m00, m01, m02, m03, x, total: integer
        
    { Algoritma }
    { Input }
        Repeat
            // Munculkan Menu Pilihan
            Input(Pilihan) // Pilihan Anda?

            While (Pilihan < 0) or (Pilihan > 2) Do
                // Memberitahu kalau pilihan salah
                Input(Pilihan) // Pilih ulang
            EndWhile

            DependOn (Pilihan)
                1:  Begin
                        // Label Perkalian M x N
                        
                        { Input }
                        Hasil <- 0
                        
                        Input(M)
                        Input(N)

                        { Kondisi (Pemilihan) }
                        
                        // Kondisi M = 0 or N = 0
                        If (M = 0) or (N = 0) 
                            Then
                                // Aksi
                                Hasil <- 0

                        Else
                            // Kondisi M > 0 or M < 0 N > 0
                            If ((M > 0) or (M < 0)) and (N > 0) 
                                Then       
                                    // Perulangan (For)
                                    For i <- 1 to N Do
                                        Ouput(M)
                                        Hasil <- Hasil + M
                                    EndFor

                        Else
                            // Kondisi N < 0 M = 3 N = -2
                            If (M > 0) and (N < 0) 
                                Then
                                    // Perulangan (For)
                                    For i <- 1 to M Do
                                        Output(N)
                                        Hasil <- Hasil + N
                                    EndFor

                        // Kondisi M & N < 0
                        Else
                            M <- M * -1 // Positif
                            N <- N * -1 // Positif

                            // Perulangan (For)
                            For i <- 1 to N Do
                                Output(M)
                                Hasil <- Hasil + M
                            EndFor
                        EndIf
                        
                        Output(Hasil)

                    EndDepend // EndCase 1, M x N
                2:  Begin
                        // Menampilkan menu suku ke-N
                        Input(x)
                        
                        If (x > 0) and (x <= 10) 
                            Then
                                Output('Deretnya adalah: ')
                                For i <- 1 to x Do
                                    // Rumus deret tingkat 3
                                    total <- 2 + (n - 1) + ((n^2 - 3n + 2) div 2) + ((n^3) div 6)
                                    Output(total)
                                EndFor
                            Output(total)
                        Else
                            Output('Nilai N hanya boleh dari 1 - 10!')
                        EndIf
                    End // EndCase 2, Suku ke-n
                0:  Begin
                        Output('Kamu Keluar!')
                    End // EndCase 3
        Until (Pilihan = 0)