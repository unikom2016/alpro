program student_grade;

uses crt;

const
  maks_mhs = 50; // mahasiswa
  maks_mk = 10; // matakuliah

type
  // mata kuliah
  dmk = record
    kd_mk, nm_mk: string;
    sks: integer;
  end;

  // mahasiswa
  dmhs = record // record
    nim, nama: string;
    ipk: real;
  end;
  
  arr_mk = array[1..maks_mk] of dmk; // matakuliah array of record
  arr_mhs = array[1..maks_mhs] of dmhs; // mahasiswa array of record
  arr_nilai = array[1..maks_mhs, 1..maks_mk] of integer; // metriks nilai
  arr_idx = array[1..maks_mhs, 1..maks_mk] of char; // metriks indeks

{ Kamus Global }
var
  mahasiswa: arr_mhs;
  matakuliah: arr_mk;
  nilai: arr_nilai;
  indeks: arr_idx;
  // i, j: integer; // buat looping dan tabel
  baris: integer; // buat nyimpan baris dari tabel mahasiswa dan matkul
  jml_mhs, jml_mk: integer; // buat jumlah mahasiswa dan matkul

procedure jumlah_data_mhs(var jml_mhs: integer);
{ I.S: User memasukkan banyaknya data (jml_mhs) }
{ F.S: menghasilkan banyaknya data (jml_mhs) }
begin
  gotoxy(1, 1); write('Masukkan banyaknya mahasiswa: '); readln(jml_mhs); // validation
  // validation
  while (jml_mhs < 1) or (jml_mhs > maks_mhs) do begin
    gotoxy(1, 1);
    write('Banyaknya data mahasiswa hanya antara 1-50');
    gotoxy(1, 1); clreol; readln;
    gotoxy(45, 1); clreol; readln(jml_mhs)
  end;
end;

procedure jumlah_data_mk(var jml_mk: integer);
{ I.S: User memasukkan banyaknya data (jml_mk) }
{ F.S: menghasilkan banyaknya data (jml_mk) }
begin
  gotoxy(1, 2); write('Masukkan banyaknya matkul: '); readln(jml_mk); // validation
  // validation
  while (jml_mk < 1) or (jml_mk > maks_mk) do begin
    gotoxy(1, 2);
    write('Banyaknya data mata kuliah hanya antara 1-5');
    gotoxy(1, 2); clreol; readln;
    gotoxy(45, 2); clreol; readln(jml_mk)
  end;
end;

{ Begin Mahasiswa }
procedure isi_mahasiswa(i: integer; var mahasiswa: arr_mhs);
{ I.S: User memasukkan data tiap mahasiswa }
{ F.S: Menyimpan data mahasiswa }
begin
  gotoxy(23, i + 4); readln(mahasiswa[i].nim); // Isi NIM
  gotoxy(33, i + 4); readln(mahasiswa[i].nama); // Isi Nama
end;

procedure tabel_mahasiswa(jml_mhs: integer; var mahasiswa: arr_mhs);
{ I.S: Jumlah mahasiswa telah terdefinisi }
{ F.S: Menghasilkan data baru mahasiswa }
// procedure isi_mahasiswa(i: integer); prototype
var i: integer;
begin
  clrscr;
  gotoxy(31, 1); // dibagi 2
  write('DAFTAR MAHASISWA');
  gotoxy(17, 2);
  write('-------------------------------------------');
  gotoxy(17, 3);
  write('| No |   NIM   |      Nama Mahasiswa      |');
  gotoxy(17, 4);
  write('-------------------------------------------');

  for i := 1 to jml_mhs do begin
    gotoxy(17, i + 4); write('|    |         |                          |');
    gotoxy(18, i + 4); write(i);

    isi_mahasiswa(i, mahasiswa);
  end;

  gotoxy(17, i + 5);
  writeln('-------------------------------------------');
  baris := baris + i + 5;
end;
{ End Mahasiswa }

{ Begin Mata Kuliah }
procedure isi_matkul(i: integer; baris: integer; var matakuliah: arr_mk);
{ I.S: User memasukkan data tiap mata kuliah }
{ F.S: Menyimpan data mata kuliah }
begin
  // gotoxy(19, baris + i + 4); readln(matakuliah[i].kd_mk); // Isi Kode MK
  // gotoxy(42, baris + i + 4); readln(matakuliah[i].nm_mk); // Isi Nama MK
  // gotoxy(65, baris + i + 4); readln(matakuliah[i].sks); // Isi SKS
end;

procedure tabel_matkul(jml_mk: integer; baris: integer; var matakuliah: arr_mk);
{ I.S: Jumlah mata kuliah telah terdefinisi }
{ F.S: Menghasilkan data baru mata kuliah }
// procedure isi_matkul; prototype
begin
  // gotoxy(41, baris + 1); // dibagi 2
  // write('DAFTAR MATA KULIAH');
  // gotoxy(17, baris + 2);
  // write('--------------------------------------------------');
  // gotoxy(17, baris + 3);
  // write('| No | Kode Mata Kuliah | Nama Mata Kuliah | SKS |');
  // gotoxy(17, baris + 4);
  // write('--------------------------------------------------');
  
  // for i := 1 to jml_mk do begin
  //   // Tabel
  //   gotoxy(17, baris + i + 4); write('|    |                  |                  |     |'); // header
  //   gotoxy(18, baris + i + 4); write(i);
  //   // gotoxy(45, baris + i + 4); write('|'); // Tutup Kode MK
  //   // gotoxy(68, baris + i + 4); write('|'); // Tutup Nama MK
  //   // gotoxy(77, baris + i + 4); write('|'); // Tutup SKS

  //   isi_matkul(i, baris, matakuliah);
  // end;

  // gotoxy(17, baris + i + 5);
  // writeln('--------------------------------------------------');
end;
{ End Mata Kuliah }

{ Begin Perhitungan }
function idx(n: integer): char;
{ I.S.: (n) sudah terdefinisi }
{ F.S.: menghasilkan fungsi idx n }
begin
  case (n) of
    80..100: idx := 'A';
    70..79: idx := 'B';
    60..69: idx := 'C';
    50..59: idx := 'D';
    0..49: idx := 'E';
  end;
end;

function bobot(idx_mhs: char; sks: integer): real;
{ I.S.: (idx_mhs) & (sks) sudah terdefinisi }
{ F.S.: menghasilkan fungsi bobot }
begin
  case (idx_mhs) of
    'A': bobot := 4 * sks;
    'B': bobot := 3 * sks;
    'C': bobot := 2 * sks;
    'D': bobot := 1 * sks;
    'E': bobot := 0 * sks;
  end;
end;
{ End Perhitungan }

procedure isi_nilai(jml_mhs, jml_mk: integer; mahasiswa: arr_mhs; var nilai: arr_nilai);
{ I.S.: User mengisi data nilai }
{ F.S.: Menghasilkan nilai tiap mahasiswa }
begin
  // for i := 1 to jml_mhs do begin
  //   gotoxy(7, i + 5); write(mahasiswa[i].nim); // NIM
  //   for j := 1 to jml_mk do begin
  //     gotoxy(j * 9, i + 5); readln(nilai[i, j]); // nilai
  //   end;
  // end;
end;

procedure isi_indeks(jml_mhs, jml_mk: integer; nilai: arr_nilai; var indeks: arr_idx);
{ I.S.: User mengisi data indeks }
{ F.S.: Menghasilkan indeks tiap mahasiswa }
begin
  // for i := 1 to jml_mhs do begin
  //   for j := 1 to jml_mk do begin
  //     indeks[i, j] := idx(nilai[i, j]);
  //     gotoxy(j * 9, i + 5); clreol; delay(300); write(indeks[i, j]);
  //   end;
  // end;
  // readln;
end;

procedure tabel_indeks_nilai(jml_mhs, jml_mk: integer; mahasiswa: arr_mhs; matakuliah: arr_mk);
{ I.S.: User memulai mengisi data nilai dan indeks }
{ F.S.: Menampilkan indeks tiap mahasiswa }
begin
  // clrscr;
  // gotoxy(39, 1); // dibagi 2
  // write('DAFTAR NILAI MAHASISWA');
  // gotoxy(7, 3);
  // write('NIM');
  // for i := 1 to jml_mk do begin
  //   gotoxy(i * 9, 3); write(matakuliah[i].kd_mk);
  // end;
  // isi_nilai(jml_mhs, jml_mk, mahasiswa, nilai); // prosedur
  // isi_indeks(jml_mhs, jml_mk, indeks);
  // writeln;
end;

procedure tampil_data; // khs
var
  total_sks, total_bobot: real;
begin
  // clrscr;
  // baris := 0;
  // for i := 1 to jml_mhs do begin
  //   total_bobot := 0;
  //   total_sks := 0; // reset for each student

  //   if (i > 1) then baris := baris - i + 1;
  //   gotoxy(1, baris + i + 1); write('mahasiswa ke-', i);
  //   gotoxy(1, baris + i + 2); write('NIM:', mahasiswa[i].nim);
  //   gotoxy(1, baris + i + 3); write('Nama:', mahasiswa[i].nama);
  //   gotoxy(1, baris + i + 4); write('no | kode mata kuliah | nama mata kuliah | sks | indeks');
  //   baris := baris + i + 4;

  //   for j := 1 to jml_mk do begin
  //     total_sks := total_sks + matakuliah[j].sks;
  //     total_bobot := total_bobot + (bobot(indeks[i, j], matakuliah[j].sks));

  //     gotoxy(1, baris + j); write('   |                  |                  |     |        |');
  //     gotoxy(1, baris + j); write(j + 1);
  //     gotoxy(5, baris + j); write(matakuliah[j].kd_mk);
  //     gotoxy(25, baris + j); write(matakuliah[j].nm_mk);
  //     gotoxy(44, baris + j); write(matakuliah[j].sks);
  //     gotoxy(50, baris + j); write(indeks[i, j]);
  //   end;
  //   mahasiswa[i].ipk := total_bobot / total_sks;
  //   gotoxy(1, baris + j + 1); write('IPK: ', mahasiswa[i].ipk:1:1);
  //   baris := baris + j + 1;
  // end;
end;

{ Algoritma Utama }
begin
  window(1, 1, 100, 100);
  clrscr;
  // masukkan jumlah
  jumlah_data_mhs(jml_mhs);
  jumlah_data_mk(jml_mk);
  // tampilkan tabel matkul dan mahasiswa
  tabel_mahasiswa(jml_mhs, mahasiswa);
  // tabel_matkul;
  // // tampilkan nilai mahasiswa
  // tabel_indeks_nilai;
  // // tampilkan semuanya
  // tampil_data;
end.