Program DayOfProjects;

{I.S. : }
{F.S. : }

// Kamus
var JumlahHari, Tahun, Bulan, SisaHari : integer;

// Algoritma
begin
	// Input
	Write('Masukkan berapa lama hari : '); readln(JumlahHari);

	// Proses
	Tahun := JumlahHari div 365;
	SisaHari := JumlahHari mod 365;

	Bulan := SisaHari div 30;
	SisaHari := SisaHari mod 30;

	Write(Tahun, ' Tahun ', Bulan, ' Bulan ', SisaHari, ' Hari');
end.
