// Judul
Menampilkan_jumlah_tahun_bulan_dan_hari_proyek_berlangsung

{I.S. : User memasukkan berapa hari proyek berlangsung}
{F.S. : Menampilkan perubahan hari ke berapa tahun, bulan dan hari}

Kamus
-----
    JumlahHari, Tahun, Bulan, SisaHari : integer;

Algoritma
---------
	Input(JumlahHari);
	-----

	Tahun <- JumlahHari div 365; // Hasil bagi dari JumlahHari di bagi 365 (1 Tahun)
	SisaHari <- JumlahHari mod 365; // Sisa bagi, di simpan ke variabel lain

	Bulan <- SisaHari div 30; // Hasil bagi dari SisaHari di bagi 30 (1 Bulan)
	SisaHari <- SisaHari mod 30; // Sisa bagi, di simpan ke variabel lain

	Output(Tahun, Bulan, Hari);
	------

