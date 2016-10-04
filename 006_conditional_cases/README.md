    { Judul }
    Menghitung_nilai_kelulusan_mata_pelajaran

    {I.S. : User memasukkan }
    
	{F.S. : Menampilkan }

    { Kamus }
        

    { Algoritma }
        { Input }
        Input('Nama :', Nama);
        Input('Nilai Matematika :' N_MTK);
        Input('Nilai Bahasa Indonesia :', N_BInd);
        Input('Nilai IPA :', N_IPA);
        Input('Nilai Bahasa Inggris :', N_BIng);
        Input('Standar Kelulusan :', SK);
        
        { Proses }
        JumlahRemedial <- 0

        { Kondisi (Pemilihan) }
        // Kondisi n - 2
        If ((N_MTK < SK) and (N_BInd < SK) and (N_IPA < SK) and (N_BIng < SK))
            Then
                Keterangan <- 'maaf kamu harus mengulang!'
        // Kondisi ke 'n - 1'
        Else
            If ((N_MTK >= SK) and (N_BInd >= SK) and (N_IPA >= SK) and (N_BIng >= SK))
                Then
                    Keterangan <- 'selamat kamu lulus!'
            EndIf
        // Kondisi ke 'n'
        Else
            // Cek Nilai Matematika
            If (N_MTK < SK)
                Then
                    KodeMatPel <- MTK
                    JumlahRemedial <- 1
            EndIf
            // Cek Nilai Matematika
            If (N_MTK < SK)
                Then
                    KodeMatPel <- MTK
                    JumlahRemedial <- 1
            EndIf
            // Cek Nilai Matematika
            If (N_MTK < SK)
                Then
                    KodeMatPel <- MTK
                    JumlahRemedial <- 1
            EndIf
            // Cek Nilai Matematika
            If (N_BIng < SK)
                Then
                    KodeMatPel <- 'Ba'
                    JumlahRemedial <- 1
            EndIf
            Output(Nama, 'harus mengikuti ujian ulang mata pelajaran: ')
            Output()


        { Output }
        Output(Keterangan)