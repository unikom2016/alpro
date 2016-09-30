program kalkulator_pembayaran;
{
 Programmer : Muhammad Dzulfiqar Firdaus
 Deklarasi : Kalkulator untuk menjumlah pembayaran yang harus dibayar oleh seorang pembeli.
}
const
harga_mangga=9000;
harga_jeruk=12000;
harga_jambu=10000;
var
jumlah_mangga,jumlah_jambu,jumlah_jeruk,mangga,jambu: integer;
jeruk,total,diskon: real;

begin
writeln('Seorang pembeli membeli buah dengan jumlah sebagai berikut :');
write('Mangga berapa kg : ');readln(jumlah_mangga);
write('Jeruk berapa kg : ');readln(jumlah_jeruk);
write('Jambu berapa kg : ');readln(jumlah_jambu);
mangga:=jumlah_mangga*harga_mangga;
jambu:=jumlah_jambu*harga_jambu;
diskon:=jumlah_jeruk*0.15*harga_jeruk;
jeruk:=jumlah_jeruk*harga_jeruk-diskon;
total:=mangga+jeruk+jambu;
writeln('Jeruk diberi diskon 15%, maka rinciannya sebagai berikut :');
writeln('Mangga : ',jumlah_mangga,' Kg adalah ',mangga);
writeln('Jeruk : ',jumlah_jeruk,' Kg adalah ',jeruk:10:2);
writeln('Jambu : ',jumlah_jambu,' Kg adalah ',jambu);
writeln('Harga Totalnya adalah Rp',total:10:2);
readln;

end.
