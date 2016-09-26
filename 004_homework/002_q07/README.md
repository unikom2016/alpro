// Judul
Menentukan_nilai_tukaran_pecahan

{I.S. : User memasukkan nilai rupiah}
{F.S. : Menampilkan nilai tukaran pecahan}

Kamus
-----
    Ribuan, Ratusan1, Ratusan2, Puluhan1, Puluhan2,
    JumlahUang, SisaUang : Integer;

Algoritma
---------
	Input(JumlahUang);
	-----

	Ribuan <- JumlahUang div 1000;
	SisaUang <- JumlahUang mod 1000;

	Ratusan1 <- SisaUang div 500;
	SisaUang <- SisaUang mod 500;

    Ratusan2 <- SisaUang div 100;
	SisaUang <- SisaUang mod 100;

    Puluhan1 <- SisaUang div 50;
	SisaUang <- SisaUang mod 50;

    Puluhan2 <- SisaUang div 25;
	SisaUang <- SisaUang mod 25;

	Output(Ribuan, 'Pecahan Rp1000', Ratusan1, 'Pecahan Rp500', Ratusan2, 'Pecahan Rp100',
    Puluhan1, 'Pecahan Rp50', Puluhan2, 'Pecahan Rp25');
	------

