{ Judul }
Program BetweenDays;

{I.S. : User memasukkan hari pertama dan kedua}

{F.S. : Menampilkan jumlah hari antara hari pertama dan kedua}

{ Kamus }
Var	HariAwal, HariAkhir, Hari, Bulan, Tahun, SisaHari : integer;

{ Algoritma }
begin
	{ Masukkan Pertama }
	Write('Masukkan Hari Pertama : '); Readln(Hari);
	Write('Masukkan Bulan Pertama : '); Readln(Bulan);
	Write('Masukkan Tahun Pertama : '); Readln(Tahun);
	{ Hari Pertama }
	HariAwal := Hari + (Bulan * 30) + (Tahun * 365);

	{ Mencari Selisih } 
	// SelisihTahun := TahunAwal - TahunAkhir
	// SelisihBulan := BulanAwal - BulanAkhir
	// SelisihHari := HariAwal - HariAkhir

	{ Masukkan Kedua }
	Write('Masukkan Hari Kedua : '); Readln(Hari);
	Write('Masukkan Bulan Kedua : '); Readln(Bulan);
	Write('Masukkan Tahun Kedua : '); Readln(Tahun);
	HariAkhir := Hari + (Bulan * 30) + (Tahun * 365);

	{ Proses }
	// Mengetahui Jarak Hari Pertama dan Kedua
	Hari := HariAkhir - HariAwal;
	
	Tahun := Hari div 365;
	SisaHari := Hari mod 365;

	Bulan := SisaHari div 30;
	SisaHari := SisaHari mod 30;

	{ Keluaran }
	Writeln('Total hari : ', Hari);
	Writeln('Jarak ', Hari,' hari dalam format (Tahun:Bulan:Hari): ', Tahun, ' Tahun ', Bulan, ' Bulan ', SisaHari, ' Hari');
end.