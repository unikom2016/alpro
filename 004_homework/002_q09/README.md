    { Judul }
    Menentukan_jarak_perjalanan

	{I.S. : User memasukkan jarak dalam centimeter}
	{F.S. : Menampilkan jarak dalam bentuk kilometer, meter dan centimeter}

	{ Kamus }
		PanjangSatuanMeter, Inchi, Kaki, Yard, Mm, Cm : real

	{ Algoritma }
		{ Masukkan }
		Input(PanjangSatuanMeter)

		{ Proses } 
		Mm <- PanjangSatuanMeter * 1000
		Cm <- PanjangSatuanMeter * 100
		Inchi <- Mm / 25.4
		Kaki <- Cm / 30.48
		Yard <- PanjangSatuanMeter / 0.9144
		
		{ Keluaran }
		Output('Inchi : ', Inchi, ' Kaki : ', Kaki, ' Yard : ', Yard)