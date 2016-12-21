program data_perpustakaan;

uses crt;

const
  maks_buku = 10; // maksimal buku
  pengguna = 'test';
  sandi = '1234!';

type
  // buku AOR
  dbuku = record
    kd_buku, nm_buku, pengarang: string;
    tahun: integer;
  end;
  
  arr_buku = array[1..maks_buku] of dbuku;

{ Kamus Global }
var
  user, pass: string;
  success: boolean;
  berdasarkan: string;
  pilihan: integer;
  buku: arr_buku;
  jml_buku: integer;

function sort(berdasarkan: string; buku: arr_buku): arr_buku;
var
  temp_buku: dbuku;
  j: integer;
  bertukar: boolean;
begin
  repeat
    bertukar := false;
    for j := 1 to (jml_buku - 1) do begin
      case (berdasarkan) of
        'asc': begin
          if (buku[j].kd_buku > buku[j + 1].kd_buku) then begin
            temp_buku := buku[j];
            buku[j] := buku[j + 1];
            buku[j + 1] := temp_buku;
            bertukar := true;
          end;
        end;
        'desc': begin
          if (buku[j].kd_buku < buku[j + 1].kd_buku) then begin
            temp_buku := buku[j];
            buku[j] := buku[j + 1];
            buku[j + 1] := temp_buku;
            bertukar := true;
          end;
        end;
      end;
    end;
  until (not bertukar);
  sort := buku;
end;

procedure jumlah_data(var jml_buku: integer);
{ I.S: User memasukkan banyaknya data (jml_buku) }
{ F.S: menghasilkan banyaknya data (jml_buku) }
begin
  clrscr;
  gotoxy(1, 1); write('Banyaknya buku: '); readln(jml_buku);
  // validasi
  while (jml_buku < 1) or (jml_buku > maks_buku) do begin
    gotoxy(1, 2); textcolor(red); write('Banyaknya data buku hanya antara 1-', maks_buku, '!');
    readkey;
    gotoxy(1, 2); clreol; 
    gotoxy(17, 1); clreol; textcolor(white); readln(jml_buku);
  end;
end;

{ Begin Buku }
procedure isi_buku(jml_buku: integer; var buku: arr_buku);
{ I.S: Jumlah buku telah terdefinisi }
{ F.S: Menghasilkan data baru buku }
// procedure isi_mahasiswa(i: integer); prototype
var i: integer;
begin
  clrscr;
  gotoxy(20, 1);                        write('DAFTAR BUKU');
  gotoxy(1, 2);       write('--------------------------------------------------');
  gotoxy(1, 3);       write('| No | Kode Buku | Nama Buku | Tahun | Pengarang |');
  gotoxy(1, 4);       write('--------------------------------------------------');

  // isi data
  for i := 1 to jml_buku do begin
    gotoxy(1, i + 4); write('|    |           |           |       |           |'); // divider
    gotoxy(3, i + 4); write(i);
    gotoxy(7, i + 4); readln(buku[i].kd_buku);
    gotoxy(19, i + 4); readln(buku[i].nm_buku);
    gotoxy(31, i + 4); readln(buku[i].tahun);
    gotoxy(39, i + 4); readln(buku[i].pengarang);
  end;

  gotoxy(1, i + 5);  write('--------------------------------------------------'); writeln;
end;
{ End Buku }

procedure tampil_buku(jml_buku: integer; buku: arr_buku);
{ I.S: Jumlah buku telah terdefinisi }
{ F.S: Menghasilkan data baru buku }
// procedure isi_mahasiswa(i: integer); prototype
var
  temp_buku: arr_buku;
  i: integer;
begin
  writeln('tampil data');
  clrscr;
  write('Urutkan sesuai (asc / desc): '); readln(berdasarkan);
  temp_buku := sort(berdasarkan, buku);
  clrscr;
  writeln('urutkan sesuai ', berdasarkan);
  gotoxy(20, 2);                        write('DAFTAR BUKU');
  gotoxy(1, 3);       write('--------------------------------------------------');
  gotoxy(1, 4);       write('| No | Kode Buku | Nama Buku | Tahun | Pengarang |');
  gotoxy(1, 5);       write('--------------------------------------------------');

  // isi data
  for i := 1 to jml_buku do begin
    gotoxy(1, i + 5); write('|    |           |           |       |           |'); // divider
    gotoxy(3, i + 5); write(i);
    gotoxy(7, i + 5); write(temp_buku[i].kd_buku);
    gotoxy(19, i + 5); write(temp_buku[i].nm_buku);
    gotoxy(31, i + 5); write(temp_buku[i].tahun);
    gotoxy(39, i + 5); write(temp_buku[i].pengarang);
  end;

  gotoxy(1, i + 6);  write('--------------------------------------------------'); writeln;
  readkey;
end;

procedure menu_utama(var pilihan: integer; var jml_buku: integer; var buku: arr_buku);
begin
  repeat
    clrscr;
    writeln('Menu Pilihan');
    writeln('1. Isi Data');
    writeln('2. Tampilkan data secara (asc / desc)');
    writeln('0. Keluar');
    write('Pilih: '); readln(pilihan);
    // validasi
    while (pilihan <> 1) and (pilihan <> 2) and (pilihan <> 0) do begin
      gotoxy(1, 6); textcolor(red); write('Pilihan hanya 1, 2 dan 0!');
      readkey;
      gotoxy(1, 6); clreol; 
      gotoxy(8, 5); clreol; textcolor(white); readln(pilihan);
    end;
    case (pilihan) of
      1: begin
        jumlah_data(jml_buku);
        isi_buku(jml_buku, buku);
      end;
      2: begin
        tampil_buku(jml_buku, buku);
      end;
    end;
    if (pilihan = 0) then begin
      clrscr;
      writeln('terima kasih telah menggunakan program!');
      readkey;
    end;
  until (pilihan = 0);
end;

procedure menu_login(var success: boolean);
var
  chance: integer;
begin
  clrscr;
  chance := 3;
  success := false;
  repeat
    clrscr;
    writeln('Login');
    write('User: '); readln(user);
    write('Password: '); readln(pass);
    if (pass <> sandi) or (user <> pengguna) then begin
      chance := chance - 1;
      writeln('User / Password salah, kesempatan login sisa ', chance);
      readkey;
    end;
  until ((user = pengguna) and (pass = sandi)) or (chance = 0);
  if (chance > 0) then begin
    success := true;
  end;
end;

{ Algoritma Utama }
begin
  menu_login(success);
  if (success) then begin
    menu_utama(pilihan, jml_buku, buku);
  end;
  // jumlah_data(jml_buku);
  // isi_buku(jml_buku, buku);
  // tampil_buku(jml_buku, buku);
end.