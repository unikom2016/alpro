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
        Function rumus_deret(Input n: Integer): Real
        {I.S. : Nilai n telah terdefinisi}
        {F.S. : Menampilkan hasil rumus deret}
        { Kamus Lokal }
            i: Integer
        { Algoritma }
            // Rumus deret tingkat
                For i <- 1 To n Do
                    rumus_deret <- (3 div factorial(0)) 
                    + (2 * (n - 1) div factorial(1)) 
                    + (8 * (n - 1) * (n - 2) div factorial(2)) 
                    + (3 * (n - 1) * (n - 2) * (n - 3) div factorial(3))
                EndFor
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
        Function rumus_deret(Input n: Integer)
        Procedure tampil_deret(Input hasil: Integer)
        
    { Algoritma Utama}
        { Input }
        isi_suku(n)
        hasil <- rumus_deret(n)
        tampil_deret(hasil)

