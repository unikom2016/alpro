	{ Judul }
    Menukarkan_bilangan_bulat

    {I.S. : User memasukkan tiga buah bilangan bulat}
    {F.S. : Menampilkan bilangan bulat yang telah bertukar}

	{ Kamus }
		temp, x, y, z : integer;

	{ Algoritma }
		{ Masukkan }
		Input(x, y, z);

		{ Proses }
		// Swap x, y
        temp <- x
        x <- y
        y <- z
        z <- temp
	
		{ Keluaran }
		Output(x, y, z);