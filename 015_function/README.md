    { Judul }
        Menampilkan_suku_ke_n

    {I.S. : User mendefinisikan suku ke-N}
    {F.S. : Menampilkan hasil dari barisan suku ke-n}

    { Procedure and Function }
        { Input Procedure }
        Procedure isi_suku(Output n: Integer)
        {I.S. : User memasukkan nilai n}
        {F.S. : Mengeluarkan nilai n}
        { Kamus Lokal }
        { Algoritma }
            Input(n)
        EndProcedure

        Function factorial(Input n: Integer): Integer
        {I.S. : Nilai n telah terdefinisi}
        {F.S. : Menampilkan hasil faktorial nilai n}
        { Kamus Lokal }
        { Algoritma }
                If (n = 0) Then
                    factorial <- 1
                Else
                    factorial <- factorial(n - 1) * n
                EndIf
        EndFunction

        { Process Procedure }
        Function nilai_dari(Input n: Integer): Integer
        {I.S. : Nilai n telah terdefinisi}
        {F.S. : Menampilkan hasil rumus deret}
        { Kamus Lokal }
            rumus: Integer
            Function factorial(Input n: Integer): Integer
        { Algoritma }
            rumus <- (3 div factorial(0)) 		
            + ((2 * (i - 1)) div factorial(1)) 		
            + ((8 * (i - 1) * (i - 2)) div factorial(2)) 		
            + ((3 * (i - 1) * (i - 2) * (i - 3)) div factorial(3))
            nilai_dari <- rumus

            If (n = 4) Then
                nilai_dari <- nilai_dari - 16
            EndIf
        EndFunction

        Procedure tampil(Input hasil: Integer)
        {I.S. : User telah mendefinisikan hasil}
        {F.S. : Mengeluarkan nilai hasil pada layar}
        { Kamus Lokal }
            i: Integer
            Function nilai_dari(Input n: Integer): Integer
        { Algoritma }
            For i <- 1 To n Do
                Output(nilai_dari(i))
                If (i != n) Then
                    Output(', ')
            EndFor
            Output(hasil)
        EndProcedure

    { Kamus Global }
        hasil, n: Integer
        Procedure isi_suku(Output n: Integer)
        Function nilai_dari(Input n: Integer): Integer
        Procedure tampil(Input hasil: Integer)
        
    { Algoritma Utama}
        { Input }
        isi_suku(n)
        hasil <- nilai_dari(n)
        tampil(hasil)