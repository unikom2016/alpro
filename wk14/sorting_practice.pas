program mengolahdatabuku;
{ I.S.: user memasukkan data buku }
{ F.S.: menampilkan data buku yang sudah terurut }

uses crt, regexpr;

const
  maks_buku = 20;
  user = 'iqbal';
  pass = '10116122';

type
  dbuku = record
    kd_buku, nm_buku, tahun, pengarang: string;
  end;

  arr_buku = array[1..maks_buku] of dbuku;

var
  buku: arr_buku;
  n, menu: integer; // banyaknya data buku
  np, ks: string; // NP: Nama Pengguna, KS: Kata Sandi

// fungsi login
function menu_login(np, ks: string): boolean;
{ I.S.: (np) dan (ks) sudah terdefinisi }
{ F.S.: menghasilkan fungsi menu_login }
var kesempatan: integer;
begin
  kesempatan := 1;
  menu_login := false;
  while ((np <> user) or (ks <> pass)) and (kesempatan <> 3) do begin
    gotoxy(1, 3); write('Salah login');
    readkey;
    gotoxy(1, 3); clreol; // hapus error
    gotoxy(12, 1); clreol; readln(np);
    gotoxy(12, 2); clreol; readln(ks);
    kesempatan := kesempatan + 1;
  end;
  if (kesempatan <= 3) and (np = user) and (ks = pass) then begin
    menu_login := true;
  end
end;

// prosedur menu pilihan
procedure menu_pilihan(var menu: integer);
begin
  clrscr;
  gotoxy(30, 9);  write('MENU PILIHAN');
  gotoxy(30, 10);  write('============');
  gotoxy(30, 11); write('1. Isi data buku');
  gotoxy(30, 12); write('2. Tampil data buku');
  gotoxy(30, 13); write('3. Cari data buku');
  gotoxy(30, 14); write('0. Keluar');
  gotoxy(30, 15); write('Pilihan anda? '); readln(menu);

  // validasi
  while (menu <> 1) and (menu <> 2) and (menu <> 3) and (menu <> 0) do begin
    gotoxy(30, 16); write('Menu hanya (1/2/0)!');
    readkey;
    gotoxy(30, 16); clreol;
    gotoxy(44, 15); clreol; readln(menu);
  end;
end;

// procedure cari_kode_buku(var kd: string);
// var i: integer;
// begin
//   i := 1;
//   while (kd <> bk[i].kd_buku) and (i < n) do begin
//     i := i + 1;
//   end;
//   if (kd = bk[i].kd_buku) then begin
    
//   end;
// end;

// prosedur memasukkan data buku
procedure isi_data_buku(var n: integer; var bk: arr_buku);
{ I.S.: user memasukkan banyaknya data (n) dan data buku }
{ F.S.: menghasilkan banyaknya data (n) dan data buku }
var i: integer;
begin
  clrscr;
  write('Banyaknya data buku: '); readln(n);
  clrscr;
  gotoxy(30, 9);        write('DAFTAR BUKU');
  gotoxy(30, 10);       write('==================================================');
  gotoxy(30, 11);       write('| No | Kode Buku | Nama Buku | Tahun | Pengarang |');
  gotoxy(30, 12);       write('==================================================');
  for i := 1 to n do begin
    gotoxy(30, i + 12); write('|    |           |           |       |           |');
    gotoxy(32, i + 12); write(i);
    gotoxy(36, i + 12); readln(bk[i].kd_buku);
    // cari_kode_buku(bk[i].kd_buku);
    gotoxy(48, i + 12); readln(bk[i].nm_buku);
    gotoxy(60, i + 12); readln(bk[i].tahun);
    gotoxy(68, i + 12); readln(bk[i].pengarang);
  end;
  gotoxy(30, i + 13);   write('==================================================');
end;

procedure swap(var a, b: dbuku);
var
  c: dbuku;
begin
  c := a;
  a := b;
  b := c;
end;

function urut_berdasarkan: integer;
var
  pilih: integer;
begin
  clrscr;
  gotoxy(1, 1); write('Urutkan berdasarkan');
  gotoxy(1, 2); write('1. Kode buku');
  gotoxy(1, 3); write('2. Nama buku');
  gotoxy(1, 4); write('3. Tahun');
  gotoxy(1, 5); write('4. Pengarang');
  gotoxy(1, 6); write('Pilihan anda? '); readln(pilih);
  while (pilih < 1) and (pilih > 4) do begin
    gotoxy(1, 7); write('Pilihan hanya 1-4!');
    readln;
    gotoxy(1, 7); clreol; // hapus error
    gotoxy(14, 6); clreol; readln(pilih);
  end;
  urut_berdasarkan := pilih;
end;

// prosedur mengurutkan data buku
procedure urut_data_buku(n: integer; var bk: arr_buku);
var
  i, j: integer;
begin
  clrscr;
  for i := 1 to n - 1 do begin // tahap
    for j := n downto i + 1 do begin
      if (bk[j].kd_buku < bk[j - 1].kd_buku) then begin // asc
        swap(bk[j], bk[j - 1]);
      end;
    end;
  end;
end;
 {
   - kualitas kamar (standard, high quality)
   - berapa jenis kamar (variasi: ukuran kasur (single / double / etc))
   - berapa harganya
   - jam (check-in / check-out maks)
 }

// prosedur menampilkan data buku yang sudah terurut
procedure tampil_data_buku(n: integer; bk: arr_buku);
var
  i: integer;
  metode: string;
begin
  clrscr;
  gotoxy(30, 8); write('Ubah metode urut (asc / desc): '); readln(metode);
  clrscr;
  gotoxy(30, 9);        write('DAFTAR BUKU');
  gotoxy(30, 10);       write('==================================================');
  gotoxy(30, 11);       write('| No | Kode Buku | Nama Buku | Tahun | Pengarang |');
  gotoxy(30, 12);       write('==================================================');
  case (metode) of
    'asc': begin// ascending
      for i := 1 to n do begin
        gotoxy(30, i + 12); write('|    |           |           |       |           |');
        gotoxy(32, i + 12); write(i);
        gotoxy(36, i + 12); write(bk[i].kd_buku);
        gotoxy(48, i + 12); write(bk[i].nm_buku);
        gotoxy(60, i + 12); write(bk[i].tahun);
        gotoxy(68, i + 12); write(bk[i].pengarang);
      end;
      gotoxy(30, i + 13);   write('==================================================');
    end;
    'desc': begin
      n := n + 1;
      for i := n - 1 downto 1 do begin
        gotoxy(30, n - i + 12); write('|    |           |           |       |           |');
        gotoxy(32, n - i + 12); write(n - i);
        gotoxy(36, n - i + 12); write(bk[i].kd_buku);
        gotoxy(48, n - i + 12); write(bk[i].nm_buku);
        gotoxy(60, n - i + 12); write(bk[i].tahun);
        gotoxy(68, n - i + 12); write(bk[i].pengarang);
      end;
      gotoxy(30, n - i + 13);   write('==================================================');
    end;
  end; // end dependon
end;

procedure cari_data(bk: arr_buku);
var
  cari: string;
  pilih: integer;
  // binary
  first, last, mid: integer;
  found: boolean;
  // sequential
  i: integer;
  regexPengarang: tregexpr;
begin
  clrscr;
  // writeln('Menu Cari'); 
  // writeln('1. Kode Buku');
  // writeln('2. Pengarang');
  write('Pilih: '); readln(pilih);

  write('Data yang dicari: '); readln(cari);
  case (pilih) of
    1: begin
      writeln('mulai mencari kode buku...');
      first := 1; last := n;
      found := false;
      while (not found) and (last >= first) do begin
        mid := (first + last) div 2;
        if (cari > bk[mid].kd_buku) then begin
          first := mid + 1;
        end else if (cari < bk[mid].kd_buku) then begin
          last := mid - 1;
        end else begin          
          writeln('Data ditemukan di indeks: ', mid);
          found := true;
        end;
      end;
    end;
    2: begin
      regexPengarang := tregexpr.create;
      // regexPengarang.expression := concat('.*', cari, '.*');
      regexPengarang.expression := '.*' + cari + '.*';
      writeln('mulai mencari pengarang...');
      found := false;
      i := 1;
      while (not found) and (i <= n) do begin
        // if (cari = bk[i].kd_buku) then begin
        if (regexPengarang.exec(bk[i].pengarang)) then begin
          found := true;
        end else begin
          i := i + 1;
        end;
      end;
      if (found) then begin
        writeln('pengarang ditemukan pada indeks ke-', i);
      end else begin
        writeln('pengarang tidak ditemukan!');
      end;
    end;
  end; //endcase
end;

procedure simpan_file;
begin
end;

{ Algoritma Utama }
begin
  clrscr;
  // write('User     : '); readln(np);
  // write('Password : '); readln(ks);
  // if (menu_login(np, ks)) then begin
    repeat
      clrscr;
      menu_pilihan(menu);
      case (menu) of
        1: isi_data_buku(n, buku);
        2: begin
          urut_data_buku(n, buku);
          tampil_data_buku(n, buku);
          readkey;
        end; // end case
        3: begin
          cari_data(buku);
          readkey;
        end;
      end;
    until (menu = 0);
  // end else begin
  //   write('Maaf, sudah 3 kali salah login!');
  //   readkey;
  // end;
end.