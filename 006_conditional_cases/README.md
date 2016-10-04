    { Judul }
    Menghitung_nilai_kelulusan_mata_pelajaran

    {I.S. : User memasukkan data siswa dan nilai tiap pelajaran}
    
	{F.S. : Menampilkan data siswa dan keterangan nilai yang perlu diperbaiki atau tidak}

    { Kamus }
        Nama, MatPel1, MatPel2, MatPel3, MatPel4 : string
        N_MTK, N_BInd, N_IPA, N_BIng, SK, JumlahRemedial : real
        

    { Algoritma }
        { Input }
        Input('Nama                     :', Nama);
        Input('Nilai Matematika         :' N_MTK);
        Input('Nilai Bahasa Indonesia   :', N_BInd);
        Input('Nilai IPA                :', N_IPA);
        Input('Nilai Bahasa Inggris     :', N_BIng);
        Input('Standar Kelulusan        :', SK);
        
        { Proses }
        JumlahRemedial <- 0
        TotalMatPel <- 4

        { Kondisi (Pemilihan) }
        // Kondisi n - 2 (Tidak lulus semua matpel)
        If ((N_MTK < SK) and (N_BInd < SK) and (N_IPA < SK) and (N_BIng < SK))
            Then
                Keterangan <- 'maaf kamu harus mengulang!'
        // Kondisi ke 'n - 1' (Lulus semua matpel)
        Else
            If ((N_MTK >= SK) and (N_BInd >= SK) and (N_IPA >= SK) and (N_BIng >= SK))
                Then
                    Keterangan <- 'selamat kamu lulus!'
            EndIf
        // Kondisi ke 'n'
        Else

            Keterangan <- 'kamu harus mengikuti ujian ulang mata pelajaran: '

            // Cek Nilai Matematika
            If (N_MTK < SK)
                Then
                    JumlahRemedial <- JumlahRemedial + 1
                    MatPel1 <- 'MTK'
                    Remed1 <- JumlahRemedial + '. ' + MatPel1
            EndIf
            // Cek Nilai Bahasa Indonesia
            If (N_BInd < SK)
                Then
                    JumlahRemedial <- JumlahRemedial + 1
                    MatPel2 <- 'Bahasa Indonesia'
                    Remed2 <- JumlahRemedial + '. ' + MatPel2
            EndIf
            // Cek Nilai IPA
            If (N_MTK < SK)
                Then
                    JumlahRemedial <- JumlahRemedial + 1
                    MatPel3 <- 'IPA'
                    Remed3 <- JumlahRemedial + '. ' + MatPel3
            EndIf
            // Cek Nilai Bahasa Inggris
            If (N_BIng < SK)
                Then
                    JumlahRemedial <- JumlahRemedial + 1
                    MatPel4 <- 'Bahasa Inggris'
                    Remed4 <- JumlahRemedial + '. ' + MatPel4
            EndIf
        EndIf

        { Output }
        Output(Nama, ', ', Keterangan)
        Output(Remed1)
        Output(Remed2)
        Output(Remed3)
        Output(Remed4)