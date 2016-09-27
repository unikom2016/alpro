    { Judul }
    Menentukan_jarak_perjalanan

	{I.S. : User memasukkan jarak dalam centimeter}
	{F.S. : Menampilkan jarak dalam bentuk kilometer, meter dan centimeter}

	{ Kamus }
		Jarak, SisaJarak, KiloMeter, Meter, CentiMeter : integer;

	{ Algoritma }
		{ Masukkan }
		Input(Jarak);

		{ Proses } 
		KiloMeter <- Jarak div 100000 // Hasil bagi konversi CM ke KiloMeter
		SisaJarak <- Jarak mod 100000 // Sisa bagi konversi CM ke KM

		Meter <- SisaJarak div 1000 // Hasil bagi konversi Sisa CM ke Meter
		SisaJarak <- SisaJarak mod 1000 // Sisa bagi konversi CM ke KM

		CentiMeter <- SisaJarak

		{ Keluaran }
		Output(KiloMeter, Meter, CentiMeter);