program mengolahdatabuku;
{ I.S.: user memasukkan data buku }
{ F.S.: menampilkan data buku yang sudah terurut }

uses crt, regexpr, sysutils;

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
  temp_i: array[1..maks_buku] of integer;

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
  gotoxy(30, 8);  write('MENU PILIHAN');
  gotoxy(30, 9);  write('============');
  gotoxy(30, 10); write('1. Isi data buku');
  gotoxy(30, 11); write('2. Tampil data buku');
  gotoxy(30, 12); write('3. Cari data buku');
  gotoxy(30, 13); write('0. Keluar');
  gotoxy(30, 14); write('Pilihan anda? '); readln(menu);

  // validasi
  while (menu < 0) or (menu > 3) do begin
    gotoxy(30, 15); write('Menu hanya (1/2/0)!');
    readkey;
    gotoxy(30, 15); clreol;
    gotoxy(44, 14); clreol; readln(menu);
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
  i, k: integer;
  j: array[1..maks_buku] of integer;
  regexPengarang: tregexpr;
begin
  clrscr;
  writeln('Menu Cari'); 
  writeln('1. Kode Buku');
  writeln('2. Pengarang');
  write('Pilih: '); readln(pilih);

  { Validasi menu cari }
  while (pilih < 1) or (pilih > 2) do begin
    write('salah, hanya (1/2)'); readln(pilih);
  end;

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
        if (first = last) then begin
          writeln('Kode      :', cari);
          writeln('Nama      :', bk[mid].nm_buku);
          writeln('Tahun     :', bk[mid].tahun);
          writeln('Pengarang :', bk[mid].pengarang);
        end;
      end;
    end;
    2: begin
      writeln('mulai mencari pengarang...');
      regexPengarang := tregexpr.create;
      regexPengarang.expression := '.*' + cari + '.*';
      i := 0;
      k := 0;
      // bk[n + 1].pengarang := cari;
      while (i < n) do begin
        i := i + 1;
        if (regexPengarang.exec(bk[i].pengarang)) then begin
          k := k + 1;
          j[k] := i;
        end;
      end;
      regexPengarang.free;
      writeln('pengarang ditemukan sebanyak ', k);
      if (k > 0) then begin
        for i := 1 to k do begin // dari 1 ga masalah, kan? bukan dari i?
          writeln('nama pengarang: ', bk[j[i]].pengarang);
          writeln('kode buku: ', bk[j[i]].kd_buku);
          writeln('nama buku: ', bk[j[i]].nm_buku);
          writeln('tahun: ', bk[j[i]].tahun);
        end;
      end else begin
        writeln('pengarang ', cari, ' tidak ditemukan!');
      end;
    end;
  end; //endcase
end;

procedure simpan_file;
const
  nama_file = '/Users/mochadwi/Documents/learn/college/unikom/class/100_alpro/wk14/data_buku.txt';
var
  file_buku: file of arr_buku;
  i: integer;
begin
  {assignfile(file_buku, nama_file);
  for i := 1 to n do begin
    append(file_buku);
    write(file_buku, bk[i].kd_buku, '   |');
    write(file_buku, bk[i].nm_buku, '   |');
    write(file_buku, bk[i].tahun, '   |');
    write(file_buku, bk[i].pengarang, '    |');
    writeln;
  end;
  closefile(file_buku);}
end;

function kosong: boolean;
begin
  kosong := false;
  if (n = 0) then begin
    kosong := true;
  end;
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
          if (not kosong) then begin
            urut_data_buku(n, buku);
            tampil_data_buku(n, buku);
          end else begin
            writeln('harus isi data dulu!');
          end;
          readkey;
        end; // end case
        3: begin
          if (not kosong) then begin
            cari_data(buku);
          end else begin
            writeln('harus isi data dulu!');
          end;
          readkey;
        end;
      end;
    until (menu = 0);
  // end else begin
  //   write('Maaf, sudah 3 kali salah login!');
  //   readkey;
  // end;
end.