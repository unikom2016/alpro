{ Judul }
Program Fee;

{I.S. : User memasukkan data Nomor Polisi, Jam & Menit Mulai, Jam & Menit Selesai}

{F.S. : Menampilkan total biaya parkir}

{ Kamus }
	// Nomor Polisi
var NomorPolisi : string;
	// Jam Mulai & Selesai
var JamMulai, JamSelesai, Menit,  
	// Durasi & Konversi
	DurasiMenit, KonversiJamMulai, KonversiJamSelesai,
	// Selisih
	SelisihJam,  
	// Biaya
	BiayaAwalParkir, TotalBiaya, 
	// Const
	JAM_PER_MENIT : integer;

{ Algoritma }
begin
	JAM_PER_MENIT := 60;
	BiayaAwalParkir := 1500;
	TotalBiaya := BiayaAwalParkir;

	{ Masukkan }
	write('Masukkan Nomor Polisi : '); readln(NomorPolisi);
	// Jam mulai, menggunakan Format 24 Jam
	write('Masukkan Jam Mulai (24h) : '); readln(JamMulai);
	write('Masukkan Menit Mulai : '); readln(Menit);
	{ Konversi Jam Mulai }
	KonversiJamMulai := (JamMulai * JAM_PER_MENIT) + Menit; // Mengubah Jam Masuk ke Menit

	// Jam selesai, menggunakan Format 24 Jam
	write('Masukkan Jam Selesai (24h) : '); readln(JamSelesai);
	write('Masukkan Menit Selesai : '); readln(Menit);
	{ Konversi Jam Selesai }
	KonversiJamSelesai := (JamSelesai * JAM_PER_MENIT) + Menit; // Mengubah Jam Selesai ke Menit
	
	{ Proses }
	DurasiMenit := KonversiJamSelesai - KonversiJamMulai;

	{ Kondisi (Pemilihan) }
	If (DurasiMenit >= JAM_PER_MENIT)
		Then
			SelisihJam := JamSelesai - JamMulai;
			TotalBiaya := BiayaAwalParkir + (500 * SelisihJam);

	{ Output }
	writeln();
	writeln('Lama parkir (menit) : ', DurasiMenit, 'm');
	writeln('Nomor Polisi : ', NomorPolisi);
	writeln('Membayar parkir sejumlah : Rp', TotalBiaya);
end.