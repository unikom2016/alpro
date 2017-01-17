program reservasi_hotel;
{I.S. : user memasukan data pemesan dan Tamu}
{F.S. : simpan lalu menampilkan list data pemesan dan Tamu}

uses crt;

const
  MAKS=100;

type
  Tamu = record
    kode, ktp, nama, alamat, telp, tipe_kamar: string;
    lama: integer;
    pajak, total_bayar: real;
  end;
  larik_tamu = array[0..MAKS] of Tamu;
  hotel    = File of Tamu;

{Kamus Global}
var
  reservasi   : larik_tamu;
  database    : hotel;
  menu, N     : integer;
  user, pass  : string;

function hargaTipe(tipe:integer): integer;
{I.S. : tipe telah terdefinisi}
{F.S. : mengembalikan harga tipe kamar}
begin
  case tipe of
    1  : hargaTipe := 510509;
    2  : hargaTipe := 510509;
    3  : hargaTipe := 598209;
    4  : hargaTipe := 598209;
  end; //endchase
end; //endfunction

function jenisTipe(tipe:integer) : string;
{I.S. : tipe telah terdefinisi}
{F.S. : mengembalikan rincian tipe kamar}
begin
  case tipe of
    1  : jenisTipe := 'Standard' ;
  end; //endchase
end; //endfunction

function kodeTipe(tipe:integer) : string;
{I.S. : tipe telah terdefinisi}
{F.S. : mengembalikan kode tipe kamar}
begin
  case tipe of
    1  : kodeTipe := 'STW' ; // standard twin
    2  : kodeTipe := 'STQ' ; // standard queen
    3  : kodeTipe := 'SWB' ; // standard twin + breakfast
    4  : kodeTipe := 'SQB' ; // standard queen + breakfast
  end; //endchase
end; //endfunction

procedure isiData(var reservasi : larik_tamu; var N : integer);
{I.S. : reservasi dan N belum terdefinsi}
{F.S. : menentukan nilai reservasi dan N}
var
  lagi : char;
  i, tipe : integer;
  kode : string;
begin
  i := 0;
  repeat
    clrscr;
    n:= n + 1;
    writeln('Memasukkan Data Pemesanan Kamar ke-',n);
    writeln('============================');
    write('NO KTP         : '); readln(reservasi[n].ktp);
    write('Nama Lengkap   : '); readln(reservasi[n].nama);
    write('Alamat         : '); readln(reservasi[n].alamat);
    write('no Telfon      : '); readln(reservasi[n].telp);
    writeln;
    writeln('===================================');
    writeln('|         Harga Tipe Kamar        |');
    writeln('===================================');
    writeln('|1 : Twin              Rp. 510.509|');
    writeln('|2 : Queen             Rp. 510.509|');
    writeln('|3 : Twin + Breakfast  Rp. 598.209|');
    writeln('|4 : Queen + Breakfast Rp. 598.209|');
    writeln('================================');
    write('Tipe Kamar     : '); readln(tipe);
    while (tipe < 1) or (tipe > 4) do
      begin
      gotoxy(25,18);
      write('Tipe Kamar Hanya ada dari 1-4, Ulangi Tekan (Enter)');
      readln; gotoxy(25,18); clreol;
      gotoxy(18,17); clreol;
      readln(tipe);
      end;
    
    write('Lama Inap      : '); readln(reservasi[n].lama);
    reservasi[n].tipe_kamar    := jenisTipe(tipe);
    reservasi[n].pajak         := (21/100) * (hargaTipe(tipe) * reservasi[n].lama);
    reservasi[n].total_bayar   := (hargaTipe(tipe) * reservasi[n].lama) - reservasi[n].pajak;
    str(n,kode);
    reservasi[n].kode  := concat(kodeTipe(tipe),'-',kode);
    write('Kode Pemesanan : '); writeln(reservasi[n].kode);
    writeln('tipe kamarnya adalah : ',reservasi[n].tipe_kamar);
    writeln('Pajak                : Rp. ',reservasi[n].pajak:0:2);
    writeln('Total Biaya          : Rp. ',reservasi[n].total_bayar:0:1);
    writeln;
    write('Mau Memasukkan Data Lagi [Y/T] : ');readln(lagi);
    i := i + 1;
    writeln('data bertambah menjadi ',i);

  until(lagi = 'T') or (lagi = 't');
  {N := i ;}
end;

Procedure tampil_data_pemesanan( reservasi : larik_tamu;  N : integer);
{I.S. : Data mahasiswa(1:N) sudah terdefinsi}
{F.S. : Menampilkan Daftar Nilai Mahasiswa yang sudah terurut berdasarkan NIM}
var
  i : integer;
begin

  //membuat header tabel
  clrscr;
  writeln('DAFTAR NILAI MAHASISWA');
  writeln('--------------------------------------------------------------------------------');
  writeln('| Kode |      KTP         |   Nama        |  Tipe Kamar | Lama |    Total      |');
  writeln('================================================================================');
  //menampilkan data mahasiswa (1:N)
  for i := 1 to N do
  begin
    gotoxy(1,i+4);
    writeln('|      |                  |               |             |      | Rp.           |');

    //menampilkan nomor urut
    gotoxy(3,i+4); write(reservasi[i].kode);

    //menampilkan NIM
    gotoxy(8,i+4); write(reservasi[i].ktp);

    //menampilkan Nama
    gotoxy(27,i+4); write(reservasi[i].nama);

    //menampilkan tipe kamar
    gotoxy(43,i+4); write(reservasi[i].tipe_kamar);

    //menampilkan lama inap
    gotoxy(59,i+4); write(reservasi[i].lama);

    //menampilkan Nilai
    gotoxy(68,i+4); write(reservasi[i].total_bayar:0:2);

  end; //endfor
  //garis penutup tabel
  writeln;
  writeln('--------------------------------------------------------------------------------');
  readln;
end;


Procedure urut_pemesanan(var reservasi : larik_tamu;  N : integer);
{}
{}
var
  i,j  : integer;
  Temp : Tamu;
begin
  for i := 1 to (N-1) do
    for j := N downto (i+1) do
    begin
      if(reservasi[j].kode < reservasi[j-1].kode)
      then
      begin
        //pertukaran dua data
        Temp  := reservasi[j];
        reservasi[j]:= reservasi[j-1];
        reservasi[j-1]:= temp;
      end; //EndIf
    end; //EndFor
end; //EndProcedure

Procedure urut_nama(var reservasi : larik_tamu;  N : integer);
{}
{}
var
  i,j  : integer;
  Temp : Tamu;
begin
  for i := 1 to (N-1) do
    for j := N downto (i+1) do
    begin
      if(reservasi[j].nama < reservasi[j-1].nama)
      then
      begin
        //pertukaran dua data
        Temp  := reservasi[j];
        reservasi[j]:= reservasi[j-1];
        reservasi[j-1]:= temp;
      end; //EndIf
    end; //EndFor
end; //EndProcedure

Procedure urut_tipe_kamar(var reservasi : larik_tamu;  N : integer);
{}
{}
var
  i,j  : integer;
  Temp : Tamu;
begin
  for i := 1 to (N-1) do
    for j := N downto (i+1) do
    begin
      if(reservasi[j].tipe_kamar < reservasi[j-1].tipe_kamar)
      then
      begin
        //pertukaran dua data
        Temp  := reservasi[j];
        reservasi[j]:= reservasi[j-1];
        reservasi[j-1]:= temp;
      end; //EndIf
    end; //EndFor
end; //EndProcedure

Procedure urut_total_bayar(var reservasi : larik_tamu;  N : integer);
{}
{}
var
  i,j  : integer;
  Temp : Tamu;
begin
  for i := 1 to (N-1) do
    for j := N downto (i+1) do
    begin
      if(reservasi[j].total_bayar < reservasi[j-1].total_bayar)
      then
      begin
        //pertukaran dua data
        Temp  := reservasi[j];
        reservasi[j]:= reservasi[j-1];
        reservasi[j-1]:= temp;
      end; //EndIf
    end; //EndFor
end; //EndProcedure




Procedure cari_no_ktp(reservasi : larik_tamu; N:integer);
{}
{}
var
  I : integer;
  ktp_cari : string;
  Ketemu  : boolean;
begin
  //memasukan KTP yang dicari
  clrscr;
  write('KTP Yang Dicari : '); readln(ktp_cari);

  //Proses Pencarian KTP
  clrscr;
  i := 1;
  Ketemu := false;
  while(Not ketemu) and (i <= N) do
  begin
    if(reservasi[i].ktp = ktp_cari)
    then
      ketemu := true
    else
      i := i+1;
  end; //EndWhile

  //menampilkan data apakah KTP yang dicari ditemukan atau tidak
  if(ketemu)
    then
     begin
       writeln('KTP yang dicari : ',ktp_cari);
       writeln('Nama pemesan    : ',reservasi[i].Nama);
       writeln('Alamat          : ',reservasi[i].alamat);
       writeln('No Telfon    : ',reservasi[i].telp);
     end
     else
       writeln('KTP ',ktp_cari,' tidak ditemukan');
     readln;
end;

Procedure cari_kode(reservasi : larik_tamu; N:integer);
{}
{}
var
  I : integer;
  kode_cari : string;
  Ketemu  : boolean;
begin
  //memasukan Kode yang dicari
  clrscr;
  write('kode Yang Dicari : '); readln(kode_cari);

  //Proses Pencarian Kode Pemesana
  clrscr;
  i := 1;
  Ketemu := false;
  while(Not ketemu) and (i <= N) do
  begin
    if(reservasi[i].kode = kode_cari)
    then
      ketemu := true
    else
      i := i+1;
  end; //EndWhile

  //menampilkan data apakah Kode Pemesanan yang dicari ditemukan atau tidak
  if(ketemu)
    then
     begin
       writeln('Kode yang dicari : ',kode_cari);
       writeln('Nama pemesan     : ',reservasi[i].Nama);
       writeln('Alamat           : ',reservasi[i].alamat);
       writeln('No Telfon        : ',reservasi[i].telp);
     end
     else
       writeln('kode ',kode_cari,' tidak ditemukan');
     readln;
end;

procedure cari_nama(reservasi : larik_tamu; N:integer);
{}
{}
var
   cari : string;
   i : integer;
begin
     write('Masukan nama yang akan dicari ');readln(cari);

     for i := 1 to N do
     begin
        if (pos(LowerCase(cari), LowerCase(reservasi[i].nama)) <> 0) then
        begin
          writeln('Kode Pemesanan',reservasi[i].kode,' : ',reservasi[i].nama,' ' );
        end;
     end;
     readln;
end;

Procedure menu_pilihan(var menu : integer);
{I.S. :}
{F.S. :}
begin
  clrscr;
  textColor(15);
  writeln('           Menu Pilihan            ');
  writeln('===================================');
  writeln('1. Isi data reservasi');
  writeln('2. Cari data Tamu (Kode)');
  writeln('3. Cari data Tamu (Nama Tamu)');
  writeln('4. Cari data Tamu (Tipe Kamar)');
  writeln('5. Tampilkan data yang terurut');
  writeln('0. Keluar');
  write('Pilihan Anda [0-5] : '); readln(menu);
  {validasi menu pilihan}
  if (menu < 0) or (menu > 5) then
  begin
    gotoxy(26,9);textcolor(yellow);
    write('Salah Memilih Menu, Ulangi! (Tekan Enter)'); readln;
    menu_pilihan(menu);
  end;
end;

Procedure menu_pilihan_lihat(var menu : integer);
{I.S. :}
{F.S. :}
begin
  writeln('Lihat Data Pemesanan Reservasi yang sudah terurut (Asc)');
  writeln('=======================================================');
  writeln('1. Urut berdasarkan Kode Pemesanan');
  writeln('2. Urut berdasarkan Nama Pelanggan');
  writeln('3. Urut berdasarkan Tipe Kamar');
  writeln('4. Urut Berdasarkan Harga total');
  writeln('0. Keluar');
  write('Pilihan Anda [0-4] : ');readln(menu);
  {validasi menu pilihan}
  if (menu < 0) or (menu > 5) then
  begin
    gotoxy(26,9);textcolor(yellow);
    write('Salah Memilih Menu, Ulangi! (Tekan Enter)'); readln;
    menu_pilihan(menu);
  end;
  writeln;
  writeln('terima kasih telah menggunakan aplikasi kami..');
  readln;
end;

Procedure menu_pilihan_cari(var menu : integer);
{I.S. :}
{F.S. :}
begin
  writeln('Menu Pilihan Cari');
  writeln('=================');
  writeln('1. Cari Data Berdasarkan No ktp');
  writeln('2. Cari Data Berdasarkan Kode Pemesanan');
  writeln('3. Cari Data Berdasarkan Nama');
  writeln('4. Cari berdasarkan Harga');
  writeln('0. Keluar');
  write('Pilihan Anda [0-4] : ');readln(menu);
  {validasi menu pilihan}
  if (menu < 0) or (menu > 5) then
  begin
    gotoxy(26,9);textcolor(yellow);
    write('Salah Memilih Menu, Ulangi! (Tekan Enter)'); readln;
    menu_pilihan(menu);
  end;
  writeln;
  writeln('terima kasih telah menggunakan aplikasi kami..');
  readln;
end;

Procedure menu_pilihan_cari_harga(var menu : integer);
{I.S. :}
{F.S. :}
begin
  writeln('Menu Pilihan Cari Harga');
  writeln('============ ');
  writeln('1. Cari Harga Lebih besar dari');
  writeln('2. Cari harga lebih kecil dari');
  writeln('0. Keluar');
  write('Pilihan Anda [0-2] : ');readln(menu);
  {validasi menu pilihan}
  if (menu < 0) or (menu > 5) then
  begin
    gotoxy(26,9);textcolor(yellow);
    write('Salah Memilih Menu, Ulangi! (Tekan Enter)'); readln;
    menu_pilihan(menu);
  end;
  writeln;
  writeln('terima kasih telah menggunakan aplikasi kami..');
  readln;
end;

procedure open_data(var reservasi:larik_tamu; var N:integer;var database : hotel);
{I.S:}
{F.S:}
var
   temp:Tamu;
begin
     N:=0;
      assign(database, 'data.txt');
      reset(database);
      if (ioresult <> 0)
         then
             rewrite(database);
         while not EOF(database) do
         begin
              read(database,temp);
              N:= N + 1;
              reservasi[N]:= temp;
         end;
         close(database);
end;//endprocedure

procedure simpan_data(var database:hotel; var N:integer;var reservasi:larik_tamu);
{I.S:}
{F.S:}
var
   i:integer;
   temp:Tamu;
begin
     assign(database,'data.txt');
     rewrite(database);
     for i:= 1 to N do
         begin
              temp:= reservasi[i];
              write(database,temp);
         end;
   close(database);
end;

procedure reset_data(var database:hotel;var reservasi:larik_tamu);
{I.S:}
{F.S:}
var
   temp:Tamu;
begin
     assign(database,'data.txt');
     rewrite(database);
              reservasi[0].kode:= '     ';
              temp:= reservasi[1];
              write(database,temp);
   close(database);
end;

procedure pilihan( var menu : integer);
{}
{}
var
m:integer;
begin
   repeat
       clrscr;
       open_data(reservasi,N,database);
       menu_pilihan(menu);
       case (menu) of
        1  :  begin {Input Data Pemesanan reservasi}
                clrscr;
                isiData(reservasi,N);
                simpan_data(database,N,reservasi);
                writeln('data tersimpan');readln;
                readln;
              end;
        2  :  begin  {Lihat Data Pemesanan reservasi yang sudah terurut}
                clrscr;
                repeat
                      clrscr;
                      menu_pilihan_lihat(m);
                      case (m) of
                       1 : begin {Urut berdasarkan Kode Pemesanan}
                           clrscr;
                                  urut_pemesanan(reservasi,N);
                                  tampil_data_pemesanan(reservasi,N);
                           end;
                       2 : begin {Urut berdasarkan Nama Pelanggan}
                           clrscr;
                                  urut_nama(reservasi,N);
                                  tampil_data_pemesanan(reservasi,N);
                           end;
                       3 : begin {Urut berdasarkan Tipe Kamar}
                           clrscr;
                                  urut_tipe_kamar(reservasi,N);
                                  tampil_data_pemesanan(reservasi,N);
                           end;
                       4 : begin {Urut Berdasarkan Harga total}
                           clrscr;
                                  urut_total_bayar(reservasi,N);
                                  tampil_data_pemesanan(reservasi,N);
                           end;
                      end; //endcase
                 until(m = 0);
              end;

        3  :  begin  {Cari Data Pemesanan Reservasi}
                clrscr;
                repeat
                      clrscr;
                      menu_pilihan_cari(menu);
                      case (menu) of
                       1 : begin {Cari Data Berdasarkan No ktp}
                           clrscr;
                           cari_no_ktp(reservasi,N);
                           end;
                       2 : begin {Cari Data Berdasarkan Kode Pemesanan}
                           clrscr;
                           cari_kode(reservasi,N);
                           end;
                       3 : begin {Cari Data Berdasarkan Nama}
                           clrscr;
                           cari_nama(reservasi,N);
                           end;
                       4 : begin {Cari berdasarkan Harga}
                           clrscr;
                           repeat
                                 clrscr;
                                 menu_pilihan_cari_harga(menu);
                                 case (menu) of
                                 1 : begin {Cari Harga Lebih besar dari}
                                     clrscr;

                                     end;
                                 2 : begin {Cari harga lebih kecil dari}
                                     clrscr;

                                     end;

                                  end; //endcase
                           until(menu=0);
                           end;
                      end; //endcase
                 until(menu=0);
              end;
        4  :  begin  {Simpan Data}
                clrscr;

              end;
        5  :  begin  {Reset Data}
                clrscr;
                reset_data(database,reservasi);
                writeln('data terhapus');readln;
              end;
      end; //endcase
   until(menu=0);

end; // end procedure

procedure login ( var pass, user : string );
{I.S. :}
{F.S. :}
var
   i,x :integer;
   u,p :string;
begin
  clrscr;
  user :='admin';
  pass :='admin';
  x := 3;
  repeat
    writeln('==================================');
    writeln('Masukan Username dan Password Anda');
    writeln('----------------------------------');
    write('Username : ');readln(u);
    write('Password : ');readln(p);
    if (user = u) and (pass = p) then
    begin
      pilihan(menu);
    end else
    begin
      clrscr;
      writeln('Username dan Password Salah, Silahkan Ulangi Lagi!');
      readln;
    end;
    clrscr;
    dec(x);
    if (x = 0) then
    begin
      writeln('Maaf Anda Tidak Bisa Login, Karna Lebih dari 3 Kali Salah');
    end;
  until (x = 0);
end;//endprocedure

{program utama}
begin
  writeln('selamat datang di aplikasi reservasi hotel');
  login(user, pass);
  readln;
end.
