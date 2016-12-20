{ Judul }
program data_perpustakaan;

uses crt;

{ Kamus Global }
const
  pengguna = 'test';
  sandi = '1234!';
  maks_buku = 10;

type
  d_buku = record
    kd_buku, nm_buku, pengarang: string;
    tahun: integer;
  end;

  arr_buku = array[1..maks_buku] of d_buku;

var
  buku: arr_buku;
  kesempatan, jml, menu: integer;
  pilihan, urutan: string; // y / n
  user, password: string; // data user

// prototype
procedure sort_asc(size: integer);
{ I.S.: }
{ F.S.: }
{ Kamus }
var
  i: integer;
  buku_sementara: array[1..maks_buku] of d_buku; //buku sementara
  bertukar: boolean;
{ Algoritma }
begin
  // bubble sort
  repeat
    bertukar := false;
    for i := 1 to (size - 1) do begin
      if (buku[i].kd_buku > buku[i + 1].kd_buku) then begin
        buku_sementara[i].kd_buku := buku[i].kd_buku;
        buku[i].kd_buku := buku[i + 1].kd_buku;
        buku[i + 1].kd_buku := buku_sementara[i].kd_buku; // kode buku

        buku_sementara[i].nm_buku := buku[i].nm_buku;
        buku[i].nm_buku := buku[i + 1].nm_buku;
        buku[i + 1].nm_buku := buku_sementara[i].nm_buku; // nama buku

        buku_sementara[i].tahun := buku[i].tahun;
        buku[i].tahun := buku[i + 1].tahun;
        buku[i + 1].tahun := buku_sementara[i].tahun; // tahun

        buku_sementara[i].pengarang := buku[i].pengarang;
        buku[i].pengarang := buku[i + 1].pengarang;
        buku[i + 1].pengarang := buku_sementara[i].pengarang; // pengarang
        bertukar := true;
      end;
    end;
  until (bertukar);
  // end of bubble sort
end; // sort_asc

procedure sort_desc(size: integer);
{ I.S.: }
{ F.S.: }
{ Kamus }
var
  i: integer;
  buku_sementara: array[1..maks_buku] of d_buku; //buku sementara
  bertukar: boolean;
{ Algoritma }
begin
  // bubble sort
  repeat
    bertukar := false;
    for i := 1 to (size - 1) do begin
      if (buku[i].kd_buku < buku[i + 1].kd_buku) then begin
        buku_sementara[i].kd_buku := buku[i].kd_buku;
        buku[i].kd_buku := buku[i + 1].kd_buku;
        buku[i + 1].kd_buku := buku_sementara[i].kd_buku; // kode buku

        buku_sementara[i].nm_buku := buku[i].nm_buku;
        buku[i].nm_buku := buku[i + 1].nm_buku;
        buku[i + 1].nm_buku := buku_sementara[i].nm_buku; // nama buku

        buku_sementara[i].tahun := buku[i].tahun;
        buku[i].tahun := buku[i + 1].tahun;
        buku[i + 1].tahun := buku_sementara[i].tahun; // tahun

        buku_sementara[i].pengarang := buku[i].pengarang;
        buku[i].pengarang := buku[i + 1].pengarang;
        buku[i + 1].pengarang := buku_sementara[i].pengarang; // pengarang
        bertukar := true;
      end;
    end;
  until (bertukar);
end; // end sort_desc

procedure tampil_data();
var i: integer;
begin
  for i := 1 to jml do begin
    writeln(buku[i].kd_buku, '|', buku[i].nm_buku, '|', buku[i].tahun, '|', buku[i].pengarang);
  end;
  writeln;
end;

{ Algoritma Utama }
begin
  clrscr;
  kesempatan := 0;
  jml := 0;
  write('user: '); readln(user);
  write('password: '); readln(password);
  repeat
    if (user = pengguna) and (password = sandi) then begin
      clrscr;
      writeln('Menu pilihan');
      writeln('1. isi data');
      writeln('2. tampil (asc / desc)');
      writeln('0. keluar');
      readln(menu);
      
      while (menu <> 1) and (menu <> 2) and (menu <> 0) do begin
        writeln('pilihan hanya ada 1, 2, 0');
        readln(menu);
      end;

      case (menu) of
        1: begin
          repeat
            jml := jml + 1;
            while (jml = maks_buku) do begin
              writeln('tidak bisa memasukkan data buku!');
              readln(pilihan);
            end;
            clrscr;
            gotoxy(1, 1); write('isi data buku');
            write('kode buku: '); readln(buku[jml].kd_buku);
            write('nama buku: '); readln(buku[jml].nm_buku);
            write('tahun: '); readln(buku[jml].tahun);
            write('pengarang: '); readln(buku[jml].pengarang);
            write('isi data lagi? y/n: '); readln(pilihan);
          until (pilihan = 'n');
        end; // end 1
        2: begin
          clrscr;
          write('tampil data urutkan secara: (asc / desc)');
          readln(urutan);
          if (urutan = 'asc') then begin
            sort_asc(jml);
            tampil_data();
          end else if (urutan = 'desc') then begin
            sort_desc(jml);
            tampil_data();
          end;
        end; // end 2
        0: begin
          writeln('terima kasih telah mengisi data buku');
          break;
        end; // end 0
      end; // dependon
    end else begin
      kesempatan := kesempatan + 1;
      writeln('kamu salah, sisa ', 4 - kesempatan, ' lagi!');
      readln(password);
    end;
    if (kesempatan = 3) then begin
      writeln('sandi salah sampai ', kesempatan, ' kali!');
    end;
  until (kesempatan = 3);
end.