// Judul
Menghitung_berapa_hari_jarak_kedua_tanggal

{I.S. : User memasukkan hari pertama dan kedua}
{F.S. : Menampilkan jumlah hari antara hari pertama dan kedua}

Kamus:
-----
	Tahun, Bulan, SisaHari : integer;

Algoritma:
---------
	Input(HariAwal, BulanAwal, TahunAwal, HariAkhir, BulanAkhir, TahunAkhir);
	-----

	SelisihTahun <- Abs(TahunAwal - TahunAkhir)
	SelisihBulan <- Abs(BulanAwal - BulanAkhir)
	SelisihHari <- Abs(HariAwal - HariAkhir)
	
	
	Output(Tahun, Bulan, Hari);
	------