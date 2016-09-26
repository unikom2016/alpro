Program Fee;

{I.S. : }
{F.S. : }

// Kamus
var NomorPolisi, JamMasuk, MenitMasuk, JamSelesai, MenitSelesai,
	SelisihJam, SelisihMenit, BiayaAwalParkir, TotalBiaya,
	LamaParkirDalamMenit, JAM_PER_MENIT : integer;

// Algoritma
begin

	JAM_PER_MENIT := 60;
	BiayaAwalParkir := 1500;
	TotalBiaya := BiayaAwalParkir;

	// Input
	// write('Masukkan Nomor Polisi : '); readln(NomorPolisi);

	write('Masukkan Jam Masuk : '); readln(JamMasuk);
	write('Masukkan Menit Masuk : '); readln(MenitMasuk);
	
	write('Masukkan Jam Selesai : '); readln(JamSelesai);
	write('Masukkan Menit Selesai : '); readln(MenitSelesai);

	// Process
	SelisihJam := JamSelesai - JamMasuk;
	SelisihMenit := SelisihJam * JAM_PER_MENIT;
	LamaParkirDalamMenit := MenitMasuk + MenitSelesai + SelisihMenit;

	// Condition
	If (LamaParkirDalamMenit > JAM_PER_MENIT) Then
	    TotalBiaya := BiayaAwalParkir + (500 * SelisihJam);

	// Output
	writeln('Dengan Nomor Polisi : ', NomorPolisi);
	writeln('Total Biaya yang perlu di bayarkan, yaitu Rp : ', TotalBiaya);

end.
