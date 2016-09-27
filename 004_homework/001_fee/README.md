    { Judul }
    Menentukan_biaya_parkir

    {I.S. : User memasukkan data Nomor Polisi, Jam & Menit Masuk, Jam & Menit Selesai}
    
	{F.S. : Menampilkan total biaya parkir}

	{ Kamus }
		// Nomor Polisi
		NomorPolisi : string
		// Jam Masuk
		JamMasuk, MenitMasuk, 
		// Jam Keluar
		JamKeluar, MenitKeluar, 
		// Durasi & Konversi
		DurasiMenit, KonversiJamMasuk, KonversiJamKeluar, 
		// Biaya
		BiayaParkir, TotalBiaya, 
		// Const
		JAM_PER_MENIT : integer

    { Algoritma }
		JAM_PER_MENIT <- 60
		BiayaParkir <- 1500
		TotalBiaya <- BiayaParkir

		{ Masukkan }
		Input(NomorPolisi, Jam, Menit) // Jam masuk, menggunakan Format 24 Jam
		KonversiJamMasuk <- (Jam * JAM_PER_MENIT) + Menit // Mengubah Jam Masuk ke Menit

		Input(Jam, Menit) // Jam keluar, menggunakan Format 24 Jam
		KonversiJamKeluar <- (Jam * JAM_PER_MENIT) + Menit // Mengubah Jam Keluar ke Menit
		
		{ Proses }
		DurasiMenit <- KonversiJamKeluar - KonversiJamMasuk

		{ Kondisi (Pemilihan) }
		If (DurasiMenit > JAM_PER_MENIT)
			Then
				SelisihJam <- JamKeluar - JamMasuk
				TotalBiaya <- BiayaParkir + (500 * SelisihJam)
		EndIf

		{ Output }
		Output('Nomor Polisi : ', NomorPolisi,
			' Membayar parkir sejumlah : Rp', TotalBiaya);