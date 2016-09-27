Program BetweenDays;

// Kamus
var HariAwal, HariAkhir, SelisihHari, SisaHari, 
	BulanAwal, BulanAkhir, SelisihBulan, KonversiHariKeBulan, 
	TahunAwal, TahunAkhir, SelisihTahun, KonversiHariKeTahun, 
	TotalSelisihHari : integer;

// Algoritma
begin

	// Awal
	Write('Hari Awal : '); Readln(HariAwal);
	Write('Bulan Awal : '); Readln(BulanAwal);
	Write('Tahun Awal : '); Readln(TahunAwal);
	
	// Akhir
	Write('Hari Akhir : '); Readln(HariAkhir);
	Write('Bulan Akhir : '); Readln(BulanAkhir);
	Write('Tahun Akhir : '); Readln(TahunAkhir);

	// Proses
	SelisihHari := Abs(HariAkhir - HariAwal);
	// Writeln('Beda Hari : ', Abs(SelisihHari));

	SelisihBulan := Abs(BulanAkhir - BulanAwal);
	// Writeln('Beda Bulan : ', Abs(SelisihBulan));

	SelisihTahun := Abs(TahunAkhir - TahunAwal);
	// Writeln('Beda Tahun : ', Abs(SelisihTahun));
	
	// Jumlah Hari
	TotalSelisihHari := (Abs(SelisihTahun) * 365) + (Abs(SelisihBulan) * 30) + Abs(SelisihHari);

	// Konversi Tahun, Bulan, Hari
	// KonversiHariKeTahun := TotalSelisihHari div 365;
	// SisaHari := TotalSelisihHari mod 365;
	// Writeln('Berapa Tahun : ', KonversiHariKeTahun);

	// KonversiHariKeBulan := SisaHari div 30;
	// SisaHari := SisaHari mod 30;
	// Writeln('Berapa Bulan : ', KonversiHariKeBulan);

	// Writeln('Berapa Hari : ', SisaHari);

	// Output
	Writeln('Total Hari antara (dd:mm:yy): (', HariAwal, ':',
		BulanAwal, ':', TahunAwal, ') dan (', HariAkhir, ':',
		BulanAkhir, ':', TahunAkhir, ') yaitu : ', TotalSelisihHari, 'Hari');
	Writeln(TotalSelisihHari, 'Hari adalah : ', SelisihTahun, 'Tahun - ', SelisihBulan, 'Bulan - ', SelisihHari, 'Hari');
end.