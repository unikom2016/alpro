// Judul
Menentukan_biaya_parkir

{I.S. : User memasukkan data Nomor Polisi, Jam & Menit Masuk, Jam & Menit Selesai}
{F.S. : Menampilkan total biaya parkir}

// Kamus
	JAM_PER_MENIT, BiayaParkir, NomorPolisi, JamMasuk, MenitMasuk, JamSelesai, MenitSelesai : Integer

// Algoritma
	JAM_PER_MENIT <- 60
	BiayaParkir <- 1500

	Input(NomorPolisi, JamMasuk, MenitMasuk, JamSelesai, MenitSelesai)
	
	SelisihJam <- JamSelesai - JamMasuk
	SelisihMenit <- SelisihJam * JAM_PER_MENIT
	LamaParkirDalamMenit <- MenitMasuk + MenitSelesai + SelisihMenit
	If (LamaParkirDalamMenit > JAM_PER_MENIT)
	    Then
			TotalBiaya <- BiayaParkir + (500 * SelisihJam)
	EndIf

	Output(TotalBiaya)
	
