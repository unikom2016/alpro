Menampilkan_jumlah_detik_dalam_hari_jam_menit_dan_detik

{I.S. : User memasukkan detik}
{F.S. : Menampilkan waktu dengan satuan: Hari, Jam, Menit dan Detik}

Kamus
	Hari, Jam, Menit, JumlahDetik, SisaDetik : integer
	DETIK_PER_HARI, DETIK_PER_JAM, DETIK_PER_MENIT : longint

Algoritma
	// Membentuk "Jendela" Input
	Input(JumlahDetik);

	// Proses Hari
	Hari <- JumlahDetik div DETIK_PER_HARI
	SisaDetik <- JumlahDetik mod DETIK_PER_HARI

	// Proses Jam
	Jam <- SisaDetik div DETIK_PER_JAM
	SisaDetik <- SisaDetik mod DETIK_PER_JAM

	// Proses Menit
	Menit <- SisaDetik div DETIK_PER_MENIT
	SisaDetik <- SisaDetik mod DETIK_PER_MENIT

	Output(Hari, Jam, Menit, JumlahDetik);

Referensi:
-Maximum Value Integer: http://wiki.freepascal.org/Integer
-Example code for color: http://www.irietools.com/iriepascal/progref298.html