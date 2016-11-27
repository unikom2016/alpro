    { Judul }
        Menampilkan_suku_ke_n

    {I.S. : User mendefinisikan suku ke-N}
    {F.S. : Menampilkan hasil dari barisan suku ke-n}

    { Kamus }
        n, hasil: Integer

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
        EndFunction

        { Process Procedure }
        Function nilai_dari(Input baris: Integer): Real
        {I.S. : Nilai n telah terdefinisi}
        {F.S. : Menampilkan hasil rumus deret}
        { Kamus Lokal }
            rumus: Integer
        { Algoritma }
            If (baris = 0) Then // Termination
                nilai_dari <- 0
            Else
                rumus <- (2*n + 4*sqr(n) - 12*n + ((n - 3)*(n - 2)*(n - 1) div 2) + 9);
                nilai_dari <- rumus + nilai_dari(baris - 1) 

            nilai_dari <- suku
        EndFunction

        Procedure tampil_suku(Input hasil: Integer)
        {I.S. : User telah mendefinisikan hasil}
        {F.S. : Mengeluarkan nilai hasil pada layar}
        { Kamus Lokal }
        { Algoritma }
            Output(hasil)
        EndProcedure

    { Kamus Global }
        hasil, n: Integer
        Procedure isi_suku(Output n: Integer)
        Function factorial(Input n: Integer)
        Function nilai_dari(Input n: Integer)
        Procedure tampil_deret(Input hasil: Integer)
        
    { Algoritma Utama}
        { Input }
        isi_suku(n)
        hasil <- nilai_dari(n)
        tampil_deret(hasil)

