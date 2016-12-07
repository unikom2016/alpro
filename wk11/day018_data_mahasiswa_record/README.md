    { Procedure and Function }
      Procedure Isi_Data(Output n: Integer, Output mahasiswa: arr_mhs)
      { I.S.: User mengisi data nim, nama dan nilai mahasiswa }
      { F.S.: Mendefinisikan data nim, nama dan nilai maha }
      { Kamus }
        i: Integer
      { Algoritma }
        Input(n)
        While (n < 0) and (n > maks) Do
          Output('Kisarannya: 1-50')
        EndWhile
        For i <- 1 To n Do
          Input(mahasiswa(i).nim, mahasiswa(i).nama, mahasiswa(i).nilai)
        EndFor
      EndProcedure

      Function Idx(Input nilai: Integer): Char
      { I.S.: nilai telah terdefinisi }
      { F.S.: Menghasilkan indeks nilai }
      { Kamus }
      { Algoritma }
        DependOn (nilai)
          80..100: Idx <- 'A'
          70..79: Idx <- 'B'
          60..69: Idx <- 'C'
          50..59: Idx <- 'D'
          0..49: Idx <- 'E'
        EndDepend
      EndFunction

      Function Rata_rata(Input n, total: Integer): Real
      { I.S.: n dan total telah terdefinisi }
      { F.S.: Menghasilkan nilai rata-rata }
      { Kamus }
      { Algoritma }
        Rata_rata <- total / n
      EndFunction

      Function Cari_Min(Input n: Integer, Input mahasiswa: arr_mhs): Integer
      { I.S.: n dan mahasiswa telah terdefinisi }
      { F.S.: Menghasilkan nilai minimum }
      { Kamus }
        i: Integer
      { Algoritma }
        Cari_Min <- mahasiswa(1).nilai
        For i <- 1 To n Do
          If (mahasiswa(i).nilai < Cari_Min) Then
            Cari_Min <- mahasiswa(i).nilai
          EndIf
        EndFor
      EndFunction

      Function Cari_Max(Input n: Integer, Input mahasiswa: arr_mhs): Integer
      { I.S.: n dan mahasiswa telah terdefinisi }
      { F.S.: Menghasilkan nilai maksimum }
      { Kamus }
        i: Integer
      { Algoritma }
        Cari_Max <- mahasiswa(1).nilai
        For i <- 1 To n Do
          If (mahasiswa(i).nilai > Cari_Max) Then
            Cari_Max <- mahasiswa(i).nilai
          EndIf
        EndFor
      EndFunction

      Procedure Tampil_Data(Input n: Integer, Input mahasiswa: arr_mhs)
      { I.S.: n dan mahasiswa telah terdefinisi }
      { F.S.: Menampilkan data mahasiswa }
      { Kamus }
        i: Integer
        Function Idx(Input nilai: Integer)
      { Algoritma }
        For i <- 1 To n Do
          mahasiswa(i).indeks <- Idx(mahasiswa(i).nilai)
          Output(mahasiswa(i).nim, mahasiswa(i).nama, mahasiswa(i).nilai, mahasiswa(i).indeks)
          total <- total + mahasiswa(i).nilai
        EndFor
        Output(Rata_rata(n, total), Cari_Min(n, mahasiswa), Cari_Max(n, mahasiswa))
      EndProcedure

    { Judul }
    Data_Mahasiswa

    { Kamus }
      Const
        maks = 50

      Type
        dmhs = Record
          nim, nama: String,
          nilai: Integer,
          indeks: Char
        EndRecord
        arr_mhs = array[1..maks] of dmhs

      mahasiswa: arr_mhs
      n: Integer
      Procedure Isi_Data(Output n: Integer, Output mahasiswa: arr_mhs)
      Procedure Tampil_Data(Input n: Integer, Input mahasiswa: arr_mhs)

    { Algoritma }
      Isi_Data(n, mahasiswa)
      Tampil_Data(n, mahasiswa)