program reservasi_hotel;
{I.S. : user memasukan data pemesan dan Tamu}
{F.S. : simpan lalu menampilkan list data pemesan dan Tamu}

uses crt, sysutils; // window sama date unit

const
  MAKS = 100;
  BUKUTAMU = 'data.dat';
  RIWAYAT = 'riwayat.dat';

type
  { Tipe data bentukan }
  Tamu = record
    kode, ktp, nama, alamat, telp, tipe_kamar: string;
    lama: integer;
    pajak, total_bayar: double; // agar menerima data lebih banyak
    check_in, check_out: TDateTime;
  end;
  larik_tamu = array[1..MAKS] of Tamu;
  hotel      = File of Tamu;

{Kamus Global}
var
  reservasi  : larik_tamu;
  database   : hotel;
  menu, n    : integer;
  user, pass : string;
  i, j, min  : integer; // untuk pengurutan

{File purwarupa}
procedure bukaData(var database: hotel; nama: string; mode: integer); // mode 1: membaca; 2: menulis
{I.S: database belum terdefinisi}
{F.S: menentukan nilai database dan mode proses file}
begin
  assign(database, nama);
  { memulai pemeriksaan file }
  {$I-} reset(database);
  {$I+} if (IOResult <> 0) then
  begin
    writeln('File belum dibuat!');
    rewrite(database); readkey;
  end; { selesai pemeriksaan file }
  case (mode) of
    1: reset(database); // untuk membaca
    2: rewrite(database); // untuk menulis ulang
  end;
end;//endprocedure

procedure loadData(var database: hotel; var n: integer; var reservasi: larik_tamu);
{I.S.: database telah terdefinisi, n dan reservasi belum terdefinisi}
{F.S.: menentukan nilai n dan reservasi}
var
  temp: Tamu;
begin
  bukaData(database, BUKUTAMU, 1); // buka file
  n := 0;
  writeln('Loading data sebelumnya...');
  seek(database, 0); // tentukan posisi file ke indeks awal
  while not eof(database) do begin
    inc(n);
    read(database, temp);
    reservasi[n] := temp;
    if (temp.kode <> '') then
    begin
      // delay(700); writeln('sukses');
    end;
  end;
  close(database);
end; //end loadData

procedure simpanData(var database: hotel; var n: integer; var reservasi: larik_tamu);
{I.S: semua variable telah terdefinsi}
{F.S: simpan data reservasi ke dalam file database}
var
  i    : integer;
  temp : Tamu;
begin
  bukaData(database, BUKUTAMU, 2); // siap2 menulis
  for i := 1 to n do
  begin
    temp := reservasi[i];
    write(database, temp);
  end;
  close(database);
end; // end simpanData

procedure resetData(var database: hotel; var reservasi: larik_tamu);
{I.S: semua variable telah terdefinsi}
{F.S: menghapus semua data}
var 
  riwayat : hotel;
  temp    : Tamu;
begin
  bukaData(database, BUKUTAMU, 2); // menimpa yang sebelumnya
  close(database);
end; // end resetData
{ End File purwarupa }

function hargaTipe(tipe: integer): longint;
{I.S. : tipe telah terdefinisi}
{F.S. : mengembalikan harga tipe kamar}
begin
  { harga relatif perhari akan selalu berubah }
  case (tipe) of
    1  : hargaTipe := 510509;
    2  : hargaTipe := 510509;
    3  : hargaTipe := 598209;
    4  : hargaTipe := 598209;
  end; //endchase
end; //endfunction

function jenisTipe(tipe: integer): string;
{I.S. : tipe telah terdefinisi}
{F.S. : mengembalikan rincian tipe kamar}
begin
  case (tipe) of
    1: jenisTipe := 'Standard Twin';
    2: jenisTipe := 'Standard Queen';
    3: jenisTipe := 'Standard Twin + Breakfast';
    4: jenisTipe := 'Standard Queen + Breakfast';
  end; //endchase
end; //endfunction

function kodeTipe(tipe:integer): string;
{I.S. : tipe telah terdefinisi}
{F.S. : mengembalikan kode tipe kamar}
begin
  case (tipe) of
    1  : kodeTipe := 'STW' ; // standard twin
    2  : kodeTipe := 'STQ' ; // standard queen
    3  : kodeTipe := 'SWB' ; // standard twin + breakfast
    4  : kodeTipe := 'SQB' ; // standard queen + breakfast
  end; //endchase
end; //endfunction

procedure isiData(var reservasi : larik_tamu; var n : integer);
{I.S. : reservasi dan n belum terdefinsi}
{F.S. : menentukan nilai reservasi dan n}
var
  lagi    : char;
  i, tipe : integer;
  kode    : string;
  dd, mm, yy,
  hh, nn, ss, ms: word; // menyimpan tanggal check-in dan check-out untuk di-format
begin
  i := 0;
  repeat
    clrscr;
    inc(n);
    writeln('Memasukkan Data Pemesanan Kamar ke-',n);
    writeln('======================================');
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
    writeln('===================================');
    write('Tipe Kamar           : '); readln(tipe);
    while (tipe < 1) or (tipe > 4) do
    begin
      gotoxy(25,18); textcolor(yellow);
      write('Tipe Kamar Hanya ada dari 1-4, Ulangi Tekan (Enter)'); readln;
      gotoxy(25,18); clreol;
      gotoxy(18,17); clreol; textcolor(white); readln(tipe);
    end;
    
    reservasi[n].check_in := Now; // simpan hari ini
    decodeDate(reservasi[n].check_in, yy, mm, dd);
    // decodeTime(reservasi[n].check_in, hh, nn, ss);
    writeln('Waktu Check-in       : ', format('%d/%d/%d', [dd, mm, yy]));
    write('Durasi Menginap      : '); readln(reservasi[n].lama);
    writeln('Waktu Check-out      : ', format('%d/%d/%d', [dd + reservasi[n].lama, mm, yy]));
    reservasi[n].tipe_kamar    := jenisTipe(tipe);
    reservasi[n].pajak         := (21/100) * (hargaTipe(tipe) * reservasi[n].lama); { Pajaknya 21% }
    // writeln('[debug] hasil pajak: ', reservasi[n].pajak:0:2); readkey;
    reservasi[n].total_bayar   := (hargaTipe(tipe) * reservasi[n].lama) + reservasi[n].pajak;
    str(n, kode);
    // writeln('[debug] kodenya: str(', n, ', ', kode, ')');
    reservasi[n].kode  := concat(kodeTipe(tipe),'-',kode);
    // writeln('[debug] hasil concat: ', reservasi[n].kode);
    write('Kode Pemesanan       : ', reservasi[n].kode); writeln();
    writeln('Tipe Kamarnya adalah : ', reservasi[n].tipe_kamar);
    writeln('Pajak (21%)          : Rp. ',reservasi[n].pajak:0:2);
    writeln('Total Biaya          : Rp. ',reservasi[n].total_bayar:0:2);
    writeln;
    write('Mau Memasukkan Data Lagi [Y/T] : ');
    repeat
      lagi := upCase(readkey);
    until lagi in ['Y', 'T'];
    inc(i); // menambah berpa kali?
    writeln;
    writeln('data bertambah menjadi ',i);
    readkey;
  until (lagi = 'T');
end;

procedure tampilData( reservasi : larik_tamu;  n : integer);
{I.S. : Data tamu(1:n) sudah terdefinsi}
{F.S. : Menampilkan daftar tamu}
var
  i : integer;
begin
  //membuat header tabel
  clrscr;
  writeln('                                               DAFTAR TAMU                                                   ');
  writeln('-------------------------------------------------------------------------------------------------------------');
  writeln('| Kode |        KTP         |          Nama           |        Tipe Kamar        | Lama |       Total       |');
  writeln('-------------------------------------------------------------------------------------------------------------');
  //menampilkan data mahasiswa (1:n)
  for i := 1 to n do
  begin
    gotoxy(1,i+4);
    write('|      |                    |                         |                          |      | Rp.               |');
    //menampilkan nomor
    gotoxy(3,i+4); write(reservasi[i].kode);
    //menampilkan ktp
    gotoxy(8,i+4); write(reservasi[i].ktp);
    //menampilkan Nama
    gotoxy(27,i+4); write(reservasi[i].nama);
    //menampilkan tipe kamar
    gotoxy(43,i+4); write(reservasi[i].tipe_kamar);
    //menampilkan lama inap
    gotoxy(59,i+4); write(reservasi[i].lama);
    //menampilkan total bayar
    gotoxy(68,i+4); write(reservasi[i].total_bayar:0:2);
  end; //endfor
  //garis penutup tabel
  writeln('-------------------------------------------------------------------------------------------------------------');
  readln;
end;

procedure tukar(var a, b: Tamu);
{I.S. : a dan b telah terdefinsi}
{F.S. : menghasilkan nilai a yang telah bertukar}
var
  temp: Tamu;
begin
  temp := a;
  a    := b;
  b    := temp;
end; // EndProcedure tukar

// procedure ascending(mode: integer);
// begin
//   case (mode) of
//     1: begin {kode}
//       if(reservasi[j].kode < reservasi[j-1].kode) then
//       begin
//         tukar(reservasi[j], reservasi[j - 1]);
//       end; // EndIf
//     end; // EndCase 1
//     2: begin {nama}
//       if(reservasi[j].nama < reservasi[j-1].nama) then
//       begin
//         tukar(reservasi[j], reservasi[j - 1]);
//       end; // EndIf
//     end; // EndCase 2
//     3: begin {tipe kamar}
//       if(reservasi[j].tipe_kamar < reservasi[j-1].tipe_kamar) then
//       begin
//         tukar(reservasi[j], reservasi[j - 1]);
//       end; // EndIf
//     end; // EndCase 3
//     4: begin {harga}
//       if(reservasi[j].total_bayar < reservasi[j-1].total_bayar) then
//       begin
//         tukar(reservasi[j], reservasi[j - 1]);
//       end; // EndIf
//     end; // EndCase 4
//   end; // EndCase mode
// end; // EndProcedure ascending

procedure bubbleSort(var reservasi: larik_tamu; n: integer; mode: integer);
{I.S. : reservasi, n dan mode telah terdefinsi}
{F.S. : mengurutkan data reservasi secara ascending}
begin
  { Bubble sort }
  // clrscr;
  // write('Urutkan data secara (asc / desc): '); readln(metode);
  { Mode }
  { 1. Kode }
  { 2. KTP }
  for i := 1 to (n-1) do
    for j := n downto (i+1) do
    begin
      case (mode) of
        1: begin {kode}
          if(reservasi[j].kode < reservasi[j-1].kode) then
          begin
            tukar(reservasi[j], reservasi[j - 1]);
          end; // EndIf
        end; // EndCase 1
        2: begin {KTP}
          if(reservasi[j].ktp < reservasi[j-1].ktp) then
          begin
            tukar(reservasi[j], reservasi[j - 1]);
          end; // EndIf
        end; // EndCase 3
      end; // EndCase mode
    end; // EndFor langkah
  end; // EndFor tahap
end; // EndProcedure bubbleSort

procedure selectionSort(var reservasi: larik_tamu; n: integer; mode: integer);
{I.S. : reservasi, n dan mode telah terdefinsi}
{F.S. : mengurutkan data reservasi secara ascending}
begin
  { Minimum Selection sort }
  // clrscr;
  // write('Urutkan data secara (asc / desc): '); readln(metode);
  { Mode }
  { 1. Nama }
  { 2. Tipe Kamar }
  for i := 1 to n do
  begin
    min := i;
    for j := (i + 1) to n do
    begin
      case (mode) of
        1: begin
          if (reservasi[j].nama < reservasi[min].nama) then
          begin
            min := j;
          end;
        end; // EndCase 1
        2: begin
          if (reservasi[j].tipe_kamar < reservasi[min].tipe_kamar) then
          begin
            min := j;
          end;
        end; // EndCase 2
      end; // EndCase mode
    end; // EndFor langkah
    swap(reservasi[min], reservasi[i]);
  end; // EndFor tahap
end; // EndProcedure bubbleSort

procedure binarySearch(reservasi: larik_tamu; n: integer);
{I.S. : reservasi dan n telah terdefinsi}
{F.S. : mencari data reservasi yang (unik)}
var
  awal, tengah, akhir: integer;
  ktp_cari: string;
  ketemu: boolean;
begin
  //memasukan KTP yang dicari
  clrscr;
  write('KTP Yang Dicari : '); readln(ktp_cari);

  //Proses Pencarian KTP (Binary Search, karena unik)
  clrscr;
  ketemu := false;
  awal := 1; akhir := n;
  while (not ketemu) and (awal <= akhir) do
  begin
    tengah := (awal + akhir) div 2; // cari indeks tengah
    if (ktp_cari > reservasi[tengah].ktp) then
    begin
      awal := tengah + 1;
    end else if (ktp_cari < reservasi[tengah].ktp) then
    begin
      akhir := tengah - 1;
    end else
    begin
      ketemu := true;
    end;
  end; // endwhile

procedure cariNoKtp(reservasi: larik_tamu; n: integer);
{}
{}
var
  awal, tengah, akhir: integer;
  ktp_cari: string;
  ketemu: boolean;
begin
  //memasukan KTP yang dicari
  clrscr;
  write('KTP Yang Dicari : '); readln(ktp_cari);

  //Proses Pencarian KTP (Binary Search, karena unik)
  clrscr;
  ketemu := false;
  awal := 1; akhir := n;
  while (not ketemu) and (awal <= akhir) do
  begin
    tengah := (awal + akhir) div 2; // cari indeks tengah
    if (ktp_cari > reservasi[tengah].ktp) then
    begin
      awal := tengah + 1;
    end else if (ktp_cari < reservasi[tengah].ktp) then
    begin
      akhir := tengah - 1;
    end else
    begin
      ketemu := true;
    end;
  end; // endwhile

  //menampilkan data apakah KTP yang dicari ditemukan atau tidak
  if (ketemu) then
  begin
    tampilData(reservasi, tengah);
  end else
  begin
    writeln('KTP ',ktp_cari,' tidak ditemukan');
  end;
  readln;
end;

procedure cariKode(reservasi: larik_tamu; n: integer);
{}
{}
var
  awal, tengah, akhir: integer;
  kode_cari: string;
  ketemu: boolean;
begin
  //memasukan Kode yang dicari
  clrscr;
  write('kode Yang Dicari : '); readln(kode_cari);

  //Proses Pencarian Kode Pemesanan (Binary Search)
  clrscr;
  ketemu := false;
  awal := 1; akhir := n;
  while (not ketemu) and (awal <= akhir) do
  begin
    tengah := (awal + akhir) div 2; // cari indeks tengah
    if (kode_cari > reservasi[tengah].kode) then
    begin
      awal := tengah + 1;
    end else if (kode_cari < reservasi[tengah].kode) then
    begin
      akhir := tengah - 1;
    end else
    begin
      ketemu := true;
    end;
  end;

  //menampilkan data apakah Kode Pemesanan yang dicari ditemukan atau tidak
  if (ketemu) then
  begin
    tampilData(reservasi, tengah);
  end else
  begin
    writeln('kode ',kode_cari,' tidak ditemukan');  
  end;

  readln;
end;

procedure cari_nama(reservasi : larik_tamu; n:integer);
{}
{}
var
  cari : string;
  i, k : integer;
  tempTamu: larik_tamu;
begin
     write('Masukan nama yang akan dicari '); readln(cari);
     i := 0;
     k := 0;
     while (i <= n) do
     begin
        inc(i);
        if (pos(lowerCase(cari), lowerCase(reservasi[i].nama)) > 0) then
        begin
          // writeln('Kode Pemesanan',reservasi[i].kode,' : ',reservasi[i].nama,' ' );
          inc(k);
          tempTamu[k] := reservasi[i]; // simpan ke variabel sementara
        end;
     end;

    if (k > 0) then
    begin
      tampilData(tempTamu, k);
    end else
    begin
      writeln('nama yang mengandung ',cari,' tidak ditemukan');  
    end;
    readln;
end;

procedure menuPilihan(var menu : integer);
{I.S. :}
{F.S. :}
begin
  clrscr;
  textColor(15);
  writeln('           Menu Pilihan            ');
  writeln('===================================');
  writeln('1. Isi data reservasi');
  writeln('2. Cari data Tamu (Kode Pesan)');
  writeln('3. Cari data Tamu (Nomor KTP)');
  writeln('4. Cari data Tamu (Nama Tamu)');
  writeln('5. Tampilkan data yang terurut');
  writeln('0. Keluar');
  write('Pilihan Anda [0-5] : '); readln(menu);
  {validasi menu pilihan}
  if (menu < 0) or (menu > 5) then
  begin
    gotoxy(26,9);textcolor(yellow);
    write('Salah Memilih Menu, Ulangi! (Tekan Enter)'); readln;
    menuPilihan(menu);
  end;
  // writeln;
  // writeln('terima kasih telah menggunakan aplikasi kami..');
  // readln;
end;

procedure menu_pilihan_lihat(var menu : integer);
{I.S. :}
{F.S. :}
begin
  writeln('Lihat Data Pemesanan Reservasi yang sudah terurut (Asc)');
  writeln('=======================================================');
  writeln('1. Urut ascending Kode Pemesanan');
  writeln('2. Urut ascending Nama Pelanggan');
  writeln('3. Urut ascending Tipe Kamar');
  writeln('4. Urut Berdasarkan Harga total');
  writeln('0. Keluar');
  write('Pilihan Anda [0-4] : ');readln(menu);
  {validasi menu pilihan}
  if (menu < 0) or (menu > 5) then
  begin
    gotoxy(26,9);textcolor(yellow);
    write('Salah Memilih Menu, Ulangi! (Tekan Enter)'); readln;
    menu_pilihan_lihat(menu);
  end;
  // writeln;
  // writeln('terima kasih telah menggunakan aplikasi kami..');
  // readln;
end;

procedure menu_pilihan_cari(var menu : integer);
{I.S. :}
{F.S. :}
begin
  writeln('Menu Pilihan Cari');
  writeln('=================');
  writeln('1. Cari Data Berdasarkan No ktp');
  writeln('2. Cari Data Berdasarkan Kode Pemesanan');
  writeln('3. Cari Data Berdasarkan Nama');
  writeln('4. Cari ascending Harga');
  writeln('0. Keluar');
  write('Pilihan Anda [0-4] : ');readln(menu);
  {validasi menu pilihan}
  if (menu < 0) or (menu > 5) then
  begin
    gotoxy(26,9);textcolor(yellow);
    write('Salah Memilih Menu, Ulangi! (Tekan Enter)'); readln;
    menu_pilihan_cari(menu);
  end;
  // writeln;
  // writeln('terima kasih telah menggunakan aplikasi kami..');
  // readln;
end;

procedure menu_pilihan_cari_harga(var menu : integer);
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
    menu_pilihan_cari_harga(menu);
  end;
  // writeln;
  // writeln('terima kasih telah menggunakan aplikasi kami..');
  // readln;
end;

procedure pilihan(var menu : integer);
{}
{}
var
  m: integer;
begin
  repeat
    clrscr;
    loadData(database, n, reservasi);
    menuPilihan(menu);
    // menu := 1;
    case (menu) of
      1: begin {Input Data Pemesanan reservasi}
        clrscr;
        isiData(reservasi,n);
        // simpanData(database,n,reservasi);
        readln;
      end; // end 1
      2: begin  {Lihat Data Pemesanan reservasi yang sudah terurut}
        repeat
          clrscr;
          menu_pilihan_lihat(m);
          case (m) of
            1: begin {Urut ascending Kode Pemesanan}
              clrscr;
              bubbleSort(reservasi,n);
              tampilData(reservasi,n);
            end;
            2: begin {Urut ascending Nama Pelanggan}
              clrscr;
              urutNama(reservasi,n);
              tampilData(reservasi,n);
            end;
            3: begin {Urut ascending Tipe Kamar}
              clrscr;
              urutTipeKamar(reservasi,n);
              tampilData(reservasi,n);
            end;
            4: begin {Urut Berdasarkan Harga total}
              clrscr;
              urut_total_bayar(reservasi,n);
              tampilData(reservasi,n);
            end;
          end; //endcase
        until (m = 0);
      end; // end 2
      3: begin  {Cari Data Pemesanan Reservasi}
        repeat
          clrscr;
          menu_pilihan_cari(menu);
          case (menu) of
            1: begin {Cari Data Berdasarkan No ktp}
              clrscr;
              cariNoKtp(reservasi,n);
            end; // end 1 no ktp
            2: begin {Cari Data Berdasarkan Kode Pemesanan}
              clrscr;
              cariKode(reservasi,n);
            end; // end 2 kode
            3: begin {Cari Data Berdasarkan Nama}
              clrscr;
              cari_nama(reservasi,n);
            end; // end 3 nama
            4: begin {Cari ascending Harga}
              repeat
                clrscr;
                menu_pilihan_cari_harga(menu);
                case (menu) of
                  1: begin {Cari Harga Lebih besar dari}
                    clrscr;
                  end;
                  2: begin {Cari harga lebih kecil dari}
                    clrscr;
                  end;
                end; //endcase
              until (menu = 0);
            end; // end 4 harga
          end; //endcase
        until (menu = 0);
      end; // end 3
      4: begin  {Simpan Data}
        clrscr;
      end; // end 4 simpan data
      5: begin  {Reset Data}
        clrscr;
        resetData(database, reservasi);
        writeln('data terhapus');readln;
      end; // end 5 reset data
    end; //endcase utama
  until (menu = 0);
end; // end procedure

procedure login(var pass, user: string);
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
      break;
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