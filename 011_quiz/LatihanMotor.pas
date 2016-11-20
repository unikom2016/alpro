program LatihanMotor;
{I.S. : Membelikan motor kepada Sumin}
{F.S. : Menampilkan Sumin layak atau tidak mengendarai motor}

uses crt;

const
   hari = 6;

var
   i, gigi, kecepatan: integer;
   hasil, temp_hasil: string;

{ Input }
procedure Masukkan_Latihan(i: integer; var gigi, kecepatan: integer);
{I.S. : Membelikan motor kepada Sumin}
{F.S. : Menghasilkan data latihan sumin}
begin
    textcolor(15);
    writeln('Hari ke-', i, ':');
    write('Gigi motor yang digunakan : '); readln(gigi);
    write('Kecepatan                 : '); readln(kecepatan);
end; // endprocedure

procedure Periksa_Latihan(gigi, kecepatan: integer; var hasil, temp_hasil: string);
{I.S. : Membelikan motor kepada Sumin}
{F.S. : Menampilkan Sumin layak atau tidak mengendarai motor}

begin
     hasil := 'Salah';

        // if (gigi = 4) and (kecepatan >= 80) then
        //     hasil := 'Benar'
        // else if (gigi = 3) and ((kecepatan > 60) and (kecepatan < 80)) then
        //     hasil := 'Benar'
        // else if (gigi = 2) and ((kecepatan > 40) and (kecepatan < 60)) then
        //     hasil := 'Benar'
        // else if (gigi = 1) and ((kecepatan >= 0) and (kecepatan <= 40)) then
        //     hasil := 'Benar';
        if (gigi = 1) and (kecepatan <= 40)
        or (gigi = 2) and (kecepatan < 60)
        or (gigi = 3) and (kecepatan < 80)
        or (gigi = 4) and (kecepatan >= 80) then
            hasil := 'Benar';


        if (hasil = 'Salah') then
            temp_hasil := hasil;

     write('Hasil                     : ');
     textcolor(yellow);
     writeln(hasil);
end; // endprocedure Hitung_Kelayakan

procedure Tampil_Hasil_Latihan(hasil, temp_hasil: string);
{I.S. : Membelikan motor kepada Sumin}
{F.S. : Menampilkan Sumin layak atau tidak mengendarainya}
begin
     textcolor(yellow);
     if (temp_hasil <> 'Salah') then
        writeln('Selamat, kamu layak memiliki motor')
     else
        writeln('Maaf, kamu belum layak memiliki motor')
end; // endprocedure

begin
     for i := 1 to hari do
     begin
         Masukkan_Latihan(i, gigi, kecepatan);
         Periksa_Latihan(gigi, kecepatan, hasil, temp_hasil);

         writeln;
     end;

     writeln;

    Tampil_Hasil_Latihan(hasil, temp_hasil);

     readln;
end.
