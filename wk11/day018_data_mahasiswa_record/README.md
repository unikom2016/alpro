    { Procedure and Function }
      Procedure Isi_Data(Output n: Integer, Output mahasiswa: arr_mhs)
      { I.S.: }
      { F.S.: }
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

      Function Idx(Input nilai: Integer)
      { I.S.: }
      { F.S.: }
      { Kamus }
      { Algoritma }
        DependOn (nilai)
          80..100: Idx <- 'A'
          70..79: Idx <- 'A'
          60..69: Idx <- 'A'
          50..59: Idx <- 'A'
          0..49: Idx <- 'E'
        EndDepend
      EndFunction

      Procedure Tampil_Data(Input mahasiswa: arr_mhs)
      { I.S.: }
      { F.S.: }
      { Kamus }
        i: Integer
        Function Idx(Input nilai: Integer)
      { Algoritma }
        For i <- 1 To n Do
          mahasiswa(i).indeks <- Idx(mahasiswa(i).nilai)
          Output(mahasiswa(i).nim, mahasiswa(i).nama, mahasiswa(i).nilai, mahasiswa(i).indeks)
        EndFor
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
      Procedure Tampil_Data(Input mahasiswa: arr_mhs)

    { Algoritma }
      Isi_Data(n, mahasiswa)
      Tampil_Data(mahasiswa)