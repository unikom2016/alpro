program student_grade;

uses crt;

const
  maks_mhs = 50; // mahasiswa
  maks_mk = 10; // matakuliah

type
  // mata kuliah
  matkul = record
    kd_mk, nm_mk: string;
    sks: integer;
  end;

  // mahasiswa
  mhs = record // record
    nim, nama: string;
    ipk: real;
  end;
  
  arr_mk = array[0..maks_mk] of matkul; // matakuliah array of record
  arr_mhs = array[0..maks_mhs] of mhs; // mahasiswa array of record
  arr_nilai = array[0..maks_mhs, 0..maks_mk] of integer;
  arr_idx = array[0..maks_mhs, 0..maks_mk] of char;
  // array cuma bisa data tipe yg sama, jadi ga bisa <char, int> <key, value>

{ Kamus Global }
var
  mahasiswa: arr_mhs;
  matakuliah: arr_mk;
  nilai: arr_nilai; // simpan data
  indeks: arr_idx;
  // idx_mhs: arr_int; // simpan data tiap indeks
  i, j: integer; // buat looping
  jml_mhs, jml_mk: integer; // buat jumlah mahasiswa dan matkul
  // idxA, idxB, idxC, idxD, idxE: integer; // untuk indeks persiswa

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

{ Begin Mata Kuliah }
procedure isi_matkul;
begin
  gotoxy(23, i + 5); readln(matakuliah[i].kd_mk); // Isi Kode MK
  gotoxy(46, i + 5); readln(matakuliah[i].nm_mk); // Isi Nama MK
  gotoxy(69, i + 5); readln(matakuliah[i].sks); // Isi SKS
end;

procedure tabel_matkul;
// procedure isi_matkul; prototype
begin
  clrscr;
  gotoxy(41, 1); // dibagi 2
  write('DAFTAR MATA KULIAH');
  gotoxy(17, 2);
  write('-------------------------------------------------------------');
  gotoxy(17, 3);
  write('| No |   Kode Mata Kuliah   |   Nama Mata Kuliah   |   SKS  |');
  gotoxy(17, 4);
  write('-------------------------------------------------------------');
  
  for i := 0 to (jml_mk - 1) do begin
    // gotoxy(x, y)
    // Tabel
    gotoxy(17, i + 5); write('|'); // No
    gotoxy(21, i + 5); write(i + 1, '|'); // Tutup No
    gotoxy(45, i + 5); write('|'); // Tutup Kode MK
    gotoxy(68, i + 5); write('|'); // Tutup Nama MK
    gotoxy(77, i + 5); write('|'); // Tutup SKS

    isi_matkul;
  end;

  gotoxy(17, i + 6);
  write('-------------------------------------------------------------------------------------');
  writeln;
end;
{ End Mata Kuliah }

{ Begin Mahasiswa }
procedure isi_mahasiswa;
begin
  gotoxy(13, i + 5); readln(mahasiswa[i].nim); // Isi NIM
  gotoxy(29, i + 5); readln(mahasiswa[i].nama); // Isi Nama
end;

procedure tabel_mahasiswa;
// procedure isi_mahasiswa; prototype
begin
  clrscr;
  gotoxy(42, 1); // dibagi 2
  write('DAFTAR MAHASISWA');
  gotoxy(7, 2);
  write('-------------------------------------------------');
  gotoxy(7, 3);
  write('| No |      NIM      |      Nama Mahasiswa      |');
  gotoxy(7, 4);
  write('-------------------------------------------------'); 

  for i := 0 to (jml_mhs - 1) do begin // array 0
    // gotoxy(x, y)
    gotoxy(7, i + 5); write('|');
    gotoxy(11, i + 5); write(i + 1, '|'); // Tutup No
    gotoxy(28, i + 5); write('|'); // Tutup NIM
    gotoxy(55, i + 5); write('|'); // Tutup Nama

    isi_mahasiswa;
  end;

  gotoxy(7, i + 6);
  write('-------------------------------------------------');
  writeln;
end;
{ End Mahasiswa }

{ Begin Perhitungan }
function idx(n: integer): char;
{ I.S.: (n) sudah terdefinisi }
{ F.S.: menghasilkan fungsi idx n }
begin
  case (n) of
    80..100: idx := 'A'; // nama variabel / fungsi?
    70..79: idx := 'B';
    60..69: idx := 'C';
    50..59: idx := 'D';
    0..49: idx := 'E';
  end;
end;

function bobot(idx_mhs: char; sks: integer): real;
begin
  case (idx_mhs) of
    'A': bobot := 4.0 * sks;
    'B': bobot := 3.0 * sks;
    'C': bobot := 2.0 * sks;
    'D': bobot := 1.0 * sks;
    'E': bobot := 0.0 * sks;
  end;
end;
{ End Perhitungan }

procedure isi_nilai;
begin
  for i := 0 to (jml_mhs - 1) do begin
    gotoxy(7, i + 5); // write('|'); // buka NIM
    write(mahasiswa[i].nim); // NIM
    for j := 0 to (jml_mk - 1) do begin
      gotoxy((j + 1) * 15, i + 5); readln(nilai[i, j]); // nilai
    end;
  end;
end;

procedure isi_indeks;
begin
  for i := 0 to (jml_mhs - 1) do begin
    for j := 0 to (jml_mk - 1) do begin
      indeks[i, j] := idx(nilai[i, j]);
      gotoxy((j + 1) * 15, i + 5); clreol; delay(300); write(indeks[i, j]);
    end;
  end;
  readln;
end;

procedure tabel_indeks_nilai;
begin
  clrscr;
  gotoxy(39, 1); // dibagi 2
  write('DAFTAR NILAI MAHASISWA');
  gotoxy(7, 3);
  write('NIM');
  for i := 0 to (jml_mk - 1) do begin
    gotoxy((i + 1) * 15, 3); write(matakuliah[i].kd_mk);
  end;
  isi_nilai; // prosedur
  isi_indeks;
  writeln;
end;

procedure tampil_data; // khs
var
  total_sks, total_bobot: real;
  baris: integer; // buat nyimpan baris dari mahasiswa sebelumnya
begin
  clrscr;
  baris := 0;
  for i := 0 to (jml_mhs - 1) do begin
    total_bobot := 0;
    total_sks := 0; // reset for each student

    gotoxy(1, i + 1 + baris); write('mahasiswa ke-', i + 1);
    gotoxy(1, i + 2 + baris); write('NIM:', mahasiswa[i].nim);
    gotoxy(1, i + 3 + baris); write('Nama:', mahasiswa[i].nama);
    gotoxy(1, i + 4 + baris); write('no | kode mata kuliah | nama mata kuliah | sks | indeks');
    for j := 0 to (jml_mk - 1) do begin
      total_sks := total_sks + matakuliah[j].sks;
      total_bobot := total_bobot + (bobot(indeks[i, j], matakuliah[j].sks));

      gotoxy(1, i + 5 + j + baris); write('   |                  |                  |     |        |');
      gotoxy(1, i + 5 + j + baris); write(j + 1);
      gotoxy(1 * 5, i + 5 + j + baris); write(matakuliah[j].kd_mk);
      gotoxy(1 * 25, i + 5 + j + baris); write(matakuliah[j].nm_mk);
      gotoxy(1 * 44, i + 5 + j + baris); write(matakuliah[j].sks);
      gotoxy(1 * 50, i + 5 + j + baris); write(indeks[i, j]);
    end;
    mahasiswa[i].ipk := total_bobot / total_sks;
    gotoxy(1, i + 6 + j + baris); write('IPK: ', mahasiswa[i].ipk:1:1);
    baris := i + 7 + j;
  end;
end;

{ Algoritma Utama }
begin
  window(1, 1, 100, 100);
  clrscr;
  // masukkan jumlah
  jumlah_data_mhs(jml_mhs);
  jumlah_data_mk(jml_mk);
  // tampilkan tabel matkul dan mahasiswa
  tabel_mahasiswa;
  tabel_matkul;
  // tampilkan nilai mahasiswa
  tabel_indeks_nilai;
  // tampilkan semuanya
  tampil_data;
end.