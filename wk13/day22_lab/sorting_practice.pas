program mengolahdatabuku;
{ I.S.: user memasukkan data buku }
{ F.S.: menampilkan data buku yang sudah terurut }

uses crt;

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
  gotoxy(30, 13); write('0. Keluar');
  gotoxy(30, 14); write('Pilihan anda? '); readln(menu);

  // validasi
  while (menu <> 1) and (menu <> 2) and (menu <> 0) do begin
    gotoxy(30, 15); write('Menu hanya (1/2/0)!');
    readkey;
    gotoxy(30, 15); clreol;
    gotoxy(44, 14); clreol; readln(menu);
  end;
end;

// prosedur memasukkan data buku
procedure isi_data_buku(var n: integer; var bk: arr_buku);
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
    gotoxy(48, i + 12); readln(bk[i].nm_buku);
    gotoxy(60, i + 12); readln(bk[i].tahun);
    gotoxy(68, i + 12); readln(bk[i].pengarang);
  end;
end;

procedure swap(var a, b: dbuku);
var
  c: dbuku;
begin
  c := a;
  a := b;
  b := c;
end;

// prosedur mengurutkan data buku
procedure urut_data_buku(n: integer; var bk: arr_buku);
var
  i: integer;
  swapped: boolean;
begin
  repeat
    swapped := false;
    for i := 1 to (n - 1) do begin
      // ascending
      if (bk[i].kd_buku > bk[i + 1].kd_buku) then begin
        swap(bk[i], bk[i + 1]);
        swapped := true;
      end;
    end;
  until (not swapped);
end;

// prosedur menampilkan data buku yang sudah terurut
procedure tampil_data_buku(n: integer; bk: arr_buku);
begin
  
end;

{ Algoritma Utama }
begin
  clrscr;
  write('User     : '); readln(np);
  write('Password : '); readln(ks);
  if (menu_login(np, ks)) then begin
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
      end;
    until (menu = 0);
  end else begin
    write('Maaf, sudah 3 kali salah login!');
    readkey;
  end;
end.