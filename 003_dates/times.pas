// Judul
program times;

{Menginzinkan fungsi window() untuk digunakan}
uses crt;

// Kamus
{Untuk inisialisasinya selalu pake "var"
Ikuti algoritma yang tadi yaa}
var Hari, Jam, Menit, JumlahDetik, SisaDetik : longint;

// Konstanta
{Di bawah ini disebut konstanta, boleh kamu tinggalkan atau ikuti}
// Memasukkan 'data secara langsung'
const DETIK_PER_HARI = 84600; // 3600 detik (Per Jam) * 24 (Jam) = 84600 Detik
const DETIK_PER_JAM = 3600; // 60 detik (Per Menit) * 60 (Menit) = 3600 Detik
const DETIK_PER_MENIT = 60; // 1 (Menit) * 60 (Detik) = 60 Detik

// Algoritma
begin
	{Membentuk Jendela Masukkan}
	{Membuat Persegi (x1, y1, x2, y2); Dengan background berwarna 0 (hitam); Memulai jendela}
	window(2, 2, 38, 24); textbackground(5); clrscr();
	{Mewarnai text dengan 15 (Putih)}
	textcolor(15);
	{Menuju titik koordinat x,y; Tampilkan tulisan pada koordinat tersebut}
	gotoxy(13,2); write('Data Masukkan'); // Label
	gotoxy(13,3); write('============='); // Pembatas Label

	// Input
	{Menuju titik koordinat; Membuat tulisan; memasukkan data dari user ke variabel JumlahDetik}
	gotoxy(2,5); write('Masukkan waktu (detik) : '); readln(JumlahDetik);

	{Memulai Kalkulasi}
	// Proses Hari
	Hari := JumlahDetik div DETIK_PER_HARI; // Hasil bagi dari JumlahDetik bagi 84600
	SisaDetik := JumlahDetik mod DETIK_PER_HARI; // Sisa bagi dari JumlahDetik bagi 84600

	// Proses Jam
	Jam := SisaDetik div DETIK_PER_JAM; // Hasil bagi dari SisaDetik bagi 3600
	SisaDetik := SisaDetik mod DETIK_PER_JAM; // Sisa bagi dari SisaDetik bagi 3600

	// Proses Menit
	Menit := SisaDetik div DETIK_PER_MENIT; // Hasil bagi dari SisaDetik bagi 60
	SisaDetik := SisaDetik mod DETIK_PER_MENIT; // Sisa bagi dari SisaDetik bagi 60
	{Menghentikan Kalkulasi}

	{Membentuk Keluaran Masukkan}
	{Membuat Persegi; Dengan background berwarna 0 (hitam); Memulai jendela}
	window(42, 2, 79, 24); textbackground(5); clrscr();
	{Mewarnai text dengan 15 (Putih)}
	textcolor(15);
	{Menuju titik koordinat x,y; Tampilkan tulisan pada koordinat tersebut}
	gotoxy(13,2); write('Data Keluaran'); // Label
	gotoxy(13,3); write('============='); // Pembatas Label

	// Output
	{Menuju titik koordinat; mewarnai text 4 (Merah); memunculkan nilai dari JumlahDetik}
	gotoxy(2,5); textcolor(4); write(JumlahDetik);
	{Mewarnai text 15 (Putih); menampilkan label}
	textcolor(15); write(' detik terdiri dari : '); // n detik terdari : 

	{Menuju titik koordinat; mewarnai text 4 (Merah); memunculkan nilai dari Hari}
	gotoxy(2,6); textcolor(4); write(Hari); // gotoxy() pertama untuk menampilkan data Hari, Jam, Menit, Detik
	{Mewarnai text 15 (Putih); menampilkan label}
	textcolor(15); write(' Hari, '); // n Hari, 
	
	{Menuju titik koordinat; mewarnai text 4 (Merah); memunculkan nilai dari Jam}
	textcolor(4); write(Jam); // Lihat Perbedaannya? tidak perlu dipanggil lagi :)
	{Mewarnai text 15 (Putih); menampilkan label}
	textcolor(15); write(' Jam, '); // n Jam, 

	{Menuju titik koordinat; mewarnai text 4 (Merah); memunculkan nilai dari Menit}
	textcolor(4); write(Menit);
	{Mewarnai text 15 (Putih); menampilkan label}
	textcolor(15); write(' Menit, '); // n Menit, 

	{Menuju titik koordinat; mewarnai text 4 (Merah); memunculkan nilai dari SisaDetik}
	textcolor(4); write(SisaDetik);
	{Mewarnai text 15 (Putih); menampilkan label}
	textcolor(15); write(' Detik '); // n Detik 

	{Biarkan Jendela terbuka, hingga kita tekan ENTER}
	readln(); // Menunggu user memasukkan data

end.
