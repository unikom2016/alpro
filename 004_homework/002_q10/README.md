    { Judul }
    Menentukan_berat_badan_ideal

	{I.S. : User memasukkan Tinggi Badan}
	{F.S. : Menampilkan total berat badan ideal}

	{ Kamus }
		TinggiBadan, BeratIdeal, BeratBadanIdeal : integer

	{ Algoritma }
		{ Masukkan }
		Input(TinggiBadan)

		{ Proses } 
		BeratIdeal <- TinggiBadan - 100
		BeratBadanIdeal <- BeratIdeal - (BeratIdeal * 0.10)
		

		{ Keluaran }
		Output(BeratBadanIdeal)