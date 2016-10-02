	{ Judul }
    Menentukan_nilai_tukaran_pecahan

	{I.S. : User memasukkan nilai rupiah}
	{F.S. : Menampilkan nilai tukaran pecahan}

	{ Kamus }
		Rp1000, Rp500, Rp100, Rp50, Rp25,
    	JumlahUang, SisaUang : integer

	{ Algoritma }
		{ Masukkan }
		Input(JumlahUang)

		{ Proses }
		Rp1000 <- JumlahUang div 1000
		SisaUang <- JumlahUang mod 1000

		Rp500 <- SisaUang div 500
		SisaUang <- SisaUang mod 500

		Rp100 <- SisaUang div 100
		SisaUang <- SisaUang mod 100

		Rp50 <- SisaUang div 50
		SisaUang <- SisaUang mod 50

		Rp25 <- SisaUang div 25
		SisaUang <- SisaUang mod 25
	
		{ Keluaran }
		Output(Rp1000, 'Pecahan Rp1000', Rp500, 'Pecahan Rp500', Rp100, 'Pecahan Rp100',
		Rp50, 'Pecahan Rp50', Rp25, 'Pecahan Rp25')