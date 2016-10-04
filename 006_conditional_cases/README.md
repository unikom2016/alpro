    { Judul }
    Menghitung_nilai_kelulusan_mata_pelajaran

    {I.S. : User memasukkan data siswa dan nilai tiap pelajaran}
    
	{F.S. : Menampilkan data siswa dan keterangan nilai yang perlu diperbaiki atau tidak}

    { Kamus }
        Nama, KetMTK, KetBInd, KetIPA, KetBIng, Keterangan : string
        N_MTK, N_BInd, N_IPA, N_BIng, SK : real
        JumlahRemedial, UrutanMTK, UrutanBInd, UrutanIPA, UrutanBIng : integer
        

    { Algoritma }
        { Input }
        Input('Nama                     :', Nama);
        Input('Nilai Matematika         :', N_MTK);
        Input('Nilai Bahasa Indonesia   :', N_BInd);
        Input('Nilai IPA                :', N_IPA);
        Input('Nilai Bahasa Inggris     :', N_BIng);
        Input('Standar Kelulusan        :', SK);
        
        { Proses }
        JumlahRemedial <- 0

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
        // Kondisi ke 'n' (Tidak lulus sebagian)
        Else

            Keterangan <- 'kamu harus mengikuti ujian ulang mata pelajaran: '

            // Cek Nilai Matematika
            If (N_MTK < SK)
                Then
                    JumlahRemedial <- JumlahRemedial + 1
                    UrutanMTK <- JumlahRemedial  
                    KetMTK <- UrutanMTK + '. Matematika'
            EndIf

            // Cek Nilai Bahasa Indonesia
            If (N_BInd < SK)
                Then
                    JumlahRemedial <- JumlahRemedial + 1
                    UrutanBInd <- JumlahRemedial  
                    KetBInd <- UrutanBInd + '. Bahasa Indonesia'
            EndIf

            // Cek Nilai IPA
            If (N_IPA < SK)
                Then
                    JumlahRemedial <- JumlahRemedial + 1
                    UrutanIPA <- JumlahRemedial  
                    KetIPA <- UrutanIPA + '. IPA'
            EndIf

            // Cek Nilai Bahasa Inggris
            If (N_BIng < SK)
                Then
                    JumlahRemedial <- JumlahRemedial + 1
                    UrutanBIng <- JumlahRemedial
                    KetBIng <- UrutanBIng + '. Bahasa Inggris'
            EndIf
            
        EndIf

        { Output }
        Output(Nama, ', ', Keterangan)
        If (KetMTK != '')
            Then
                Output(KetMTK)
        EndIf
        If (KetBInd != '')
            Then
                Output(KetBInd)
        EndIf
        If (KetIPA != '')
            Then
                Output(KetIPA)
        EndIf
        If (KetBIng != '')
            Then
                Output(KetBIng)
        EndIf