	{ Judul }
    Menghitung_berapa_hari_jarak_kedua_tanggal

	{I.S. : User memasukkan hari pertama dan kedua}

	{F.S. : Menampilkan jumlah hari antara hari pertama dan kedua}

	{ Kamus }
		HariAwal, HariAkhir, BulanAwal, BulanAkhir, TahunAwal, TahunAkhir,
		SelisihHari, SelisihBulan, SelisihTahun : integer

	{ Algoritma }
		{ Masukkan Pertama }
		Input(Hari, Bulan, Tahun)
		{ Hari Pertama }
		HariAwal <- Hari + (Bulan * 30) + (Tahun * 365)

		{ Mencari Selisih } 
		// SelisihTahun <- TahunAwal - TahunAkhir
		// SelisihBulan <- BulanAwal - BulanAkhir
		// SelisihHari <- HariAwal - HariAkhir

		{ Masukkan Kedua }
		Input(Hari, Bulan, Tahun)
		HariAkhir <- Hari + (Bulan * 30) + (Tahun * 365)

		{ Proses }
		Hari <- HariAkhir - HariAwal
		
		Tahun <- Hari div 365
		SisaHari <- Hari mod 365

		Bulan <- SisaHari div 30
		SisaHari <- SisaHari mod 30
	
		{ Keluaran }
		Output(Tahun, Bulan, Hari);