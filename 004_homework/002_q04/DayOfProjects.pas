Program DayOfProjects;

{I.S. : User memasukkan berapa hari proyek berlangsung}
{F.S. : Menampilkan perubahan hari ke berapa tahun, bulan dan hari}

// Kamus
var JumlahHari, Tahun, Bulan, SisaHari : integer;

// Algoritma
begin
	// Input
	Write('Masukkan berapa lama proyek (hari) : '); readln(JumlahHari);

	// Proses
	Tahun := JumlahHari div 365;
	SisaHari := JumlahHari mod 365;

	Bulan := SisaHari div 30;
	SisaHari := SisaHari mod 30;

	Writeln('Proyek berlangsung selama : ', Tahun, ' Tahun ', Bulan, ' Bulan ', SisaHari, ' Hari');
end.
