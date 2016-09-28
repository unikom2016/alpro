    { Judul }
    Menentukan_berat_badan_ideal

    {I.S. : User memasukkan berat badan dan tinggi badan}
    
	{F.S. : Menampilkan keterangan berat badan ideal dan tidak ideal}

    { Kamus }
        BeratBadan, TinggiBadan, BeratIdeal : integer
        Pesan : string

    { Algoritma }
        { Input }
        Input(BeratBadan, TinggiBadan)
        Pesan <- 'Tidak Ideal'
        
        { Proses }
        BeratIdeal <- TinggiBadan - 100
        BeratIdeal <- BeratIdeal - (BeratIdeal * 0.10)

        { Kondisi (Pemilihan) }
        If ((BeratBadan - BeratIdeal) <= 2)
            Then
                Pesan <- 'Ideal'

        { Output }
        Output(Pesan)