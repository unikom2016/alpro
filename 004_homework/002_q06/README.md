// Judul
Menukarkan_bilangan_bulat

{I.S. : User memasukkan tiga buah bilangan bulat}
{F.S. : Menampilkan bilangan bulat yang telah bertukar}

Kamus
-----
    temp, x, y, z : integer;

Algoritma
---------
	Input(x, y, z);
	-----
    
    // Swap x, y
	temp <- x
    x <- y
    y <- z
    z <- temp

	Output(x, y, z);
	------
