    { Judul }
    Membuat_menu_pilihan

    {I.S. : User memilih salah satu menu }
    {F.S. : Menampilkan hasil sesuai menu yang dipilih}

    { Kamus }
        pilihan,n,awal,akhir,i,m,Hasil,a: integer
        suku: longint

    { Algoritma }
        Repeat
                Input(Pilihan) // Menu Pilihan
                
                { Validasi Menu Pilihan }
                While ( Pilihan < 0 ) or ( Pilihan > 2 ) Do
                    Output('Maaf Pilihan Hanya 0 - 2 , Ulangi Tekan Enter')
                    Input(Pilihan)
                EndWhile

                DependOn (Pilihan)
                    1 : Begin
                        {MxN}
                        Input(m) // Masukkan m
                        Input(n) // Masukkan n
                        
                        Hasil <- m * n  //Proses Perkalian
                        
                        Output(m)
                        Output(n)

                        Output(m, ' X ', n, ': ')

                        If ( n = 0 )
                        Then
                                Hasil <- 0
                        Else
                            If ( n < 0 )
                                Then
                                    m <- m * -1
                                    Output(m)
                        Else
                            Output(m)
                        EndIf

                        If ( n < 0 )
                            Then
                                n <- n * -1
                                a <- 2 // Inisialisasi While
                            While ( a <= n ) Do
                                If ( Hasil >= 0 )
                                    Then
                                        Output(' + ')
                                        Output(m)
                                        a <- a + 1
                                Else
                                    Output(' + ') // Operator
                                    Output(m)
                                    a <- a + 1
                                EndIf
                            EndWhile

                            Output(Hasil)
                        EndIf
                    EndCase // Case 1, berakhir

                    2 : Begin
                        {Suku ke-N}
                        Input(n) // Suku ke-n
                        
                        While ( n < 1 ) or ( n > 10 ) Do
                            Output('Harga N Baris antara 1 - 10 !')
                            // Hanya hapus masukkan sebelumnya
                            Input(n) // Masukkan n, lagi
                        EndWhile

                        Output(n)

                        Output('Dengan baris: ')

                        If (n = 1)
                            Then
                                suku <- 2
                                Output('2');
                        Else If (n = 2)
                            Then
                                suku <- 3;
                                Output('2, 3');
                            EndIf
                        Else
                            awal <- 2;
                            akhir <- 3;
                        
                            Output('2, 3, ');
                            For i <- 3 to n Do
                                If(i mod 2 = 1 ) Then
                                    suku <- awal + akhir
                                Else
                                    suku <- awal * akhir

                                awal <- akhir
                                akhir <- suku
                                
                                Output(suku)
                                If i <> n Then
                                    Output(', ') // Pembatas antar suku
                            EndFor

                        EndIf

                        Output(suku)
                        EndCase // Case 2, berakhir
                
                EndDepend

        Until (Pilihan=0)