    // Judul
    Menentukan_biaya_parkir

    {I.S. : User memasukkan data Nomor Polisi, Jam & Menit Masuk, Jam & Menit Selesai}

    {F.S. : Menampilkan total biaya parkir}

    // Kamus
	// Nomor Polisi
	NomorPolisi : string
	// Jam Masuk
	JamMasuk, MenitMasuk : integer
	// Jam Keluar
	JamKeluar, MenitKeluar : integer
	// Selisih & Konversi
	SelisihMenit, KonversiJamMasuk, KonversiJamKeluar : integer
	// Biaya
	BiayaParkir, TotalBiaya : integer
	// Const
	JAM_PER_MENIT : integer

    // Algoritma
	JAM_PER_MENIT <- 60
	BiayaParkir <- 1500
	TotalBiaya <- BiayaParkir

	// Input
	Input(NomorPolisi, JamMasuk, MenitMasuk, JamKeluar, MenitKeluar) // Format 24 Jam
	
	// Proses
	KonversiJamMasuk <- (JamMasuk * JAM_PER_MENIT) + MenitMasuk
	KonversiJamKeluar <- (JamKeluar * JAM_PER_MENIT) + MenitKeluar
	DurasiMenit <- KonversiJamKeluar - KonversiJamMasuk

	// Kondisi (Pemilihan)
	If (DurasiMenit > JAM_PER_MENIT)
	    Then
			SelisihJam <- JamKeluar - JamMasuk
			TotalBiaya <- BiayaParkir + (500 * SelisihJam)
	EndIf

	// Output