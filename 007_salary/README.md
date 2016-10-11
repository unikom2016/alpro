    { Judul }
    Menghitung_gaji_karyawan

    {I.S. : User memasukkan }
    
	{F.S. : Menampilkan }

    { Kamus }
        

    { Algoritma }
        TotalJamKerjaPerHari <- 8
        TotalJamKerjaPerBulan <- 208 // 8jam x 26hari
        UpahLemburPerJam <- 25000
        PotonganKerjaPerHari <- 50000
        PotonganKerjaPerJam <- 10000

        { Input }
        Input('NIK                    :', NIK)
        Input('NK                     :', NK)
        Input('Gol                    :', GOL)
        Input('Jumlah Jam Kerja/Bulan :', TotalJamKerjaKaryawan)
        
        { Proses }

        { Kondisi (Golongan Gaji Pokok) }
        // Golongan I
        If (GOL = 1)
            Then
                GajiPokok <- 1750000
                Tunjangan <- 0.125 // 12.5%
                TotalGajiTunjangan <- GajiPokok * Tunjangan

        // Golongan II
        Else
            If (GOL = 2)
                Then
                    GajiPokok <- 2300000
                    Tunjangan <- 0.15 // 15%
                    TotalGajiTunjangan <- GajiPokok * Tunjangan
            
        // Golongan III
        Else
            If (GOL = 3)
                Then
                    GajiPokok <- 2800000
                    Tunjangan <- 0.15 // 15%
                    TotalGajiTunjangan <- GajiPokok * Tunjangan

        // Golongan IV
        Else
            GajiPokok <- 3200000
            Tunjangan <- 0.125 // 12.5%
            TotalGajiTunjangan <- GajiPokok * Tunjangan

        EndIf

        { Kondisi {Lembur atau Potongan} }
        // Lembur
        If (TotalJamKerjaKaryawan > TotalJamKerjaPerBulan)
            Then
                JumlahLemburPerJam <- TotalJamKerjaKaryawan - TotalJamKerjaPerBulan
                TotalBonus <- UpahLemburPerJam * JumlahLemburPerJam
        Else
        // Potongan
            JumlahPotonganKerjaPerJam <- TotalJamKerjaPerBulan - TotalJamKerjaKaryawan
            If (JumlahPotonganKerjaPerJam > TotalJamKerjaPerHari)
                Then
                    PotonganPerHari <- JumlahPotonganKerjaPerJam div TotalJamKerjaPerHari
                    PotonganPerJam <- JumlahPotonganKerjaPerJam mod TotalJamKerjaPerHari
                    TotalPotongan <- (PotonganPerHari * PotonganKerjaPerHari) + (PotonganPerJam * PotonganKerjaPerJam) 
        EndIf

        { Output }
        Output('NIK                      :', NIK)
        Output('NK                       :', NK)
        Output('Gol                      :', GOL)
        Output('Jumlah Jam Kerja/Bulan   :', TotalJamKerjaKaryawan, ' Jam')
        Output('Gaji Pokok               :', GajiPokok)
        Output('Tunjangan', Tunjangan, ' :', TotalGajiTunjangan)
        Output('Lembur                   :', JumlahLemburPerJam, ' Jam')
        Output('Potongan                 :', )