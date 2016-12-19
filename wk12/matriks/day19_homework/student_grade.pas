program student_grade;

uses crt;

const
  maks_mhs = 50; // Mahasiswa
  maks_mk = 10; // Mata Kuliah

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
  
  arr_mk = array[1..maks_mk] of dmk; // Mata Kuliah array of record
  arr_mhs = array[1..maks_mhs] of dmhs; // Mahasiswa array of record
  arr_nilai = array[1..maks_mhs, 1..maks_mk] of integer; // matriks nilai
  arr_idx = array[1..maks_mhs, 1..maks_mk] of char; // matriks indeks

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
  gotoxy(1, 1); write('Banyaknya Mahasiswa: '); readln(jml_mhs);
  // validasi
  while (jml_mhs < 1) or (jml_mhs > maks_mhs) do begin
    gotoxy(1, 2); textcolor(red);
    write('Banyaknya data Mahasiswa hanya antara 1-50!'); readln;
    gotoxy(45, 2); clreol;
    gotoxy(1, 2); clreol; textcolor(white);
    gotoxy(22, 1); clreol; readln(jml_mhs);
  end;
end;

procedure jumlah_data_mk(var jml_mk: integer);
{ I.S: User memasukkan banyaknya data (jml_mk) }
{ F.S: menghasilkan banyaknya data (jml_mk) }
begin
  gotoxy(1, 2); write('Banyaknya Mata Kuliah: '); readln(jml_mk);
  // validasi
  while (jml_mk < 1) or (jml_mk > maks_mk) do begin
    gotoxy(1, 3); textcolor(red);
    write('Banyaknya data Mata Kuliah hanya antara 1-10!'); readln;
    gotoxy(47, 2); clreol;
    gotoxy(1, 3); clreol; textcolor(white);
    gotoxy(24,2); clreol; readln(jml_mk);
  end;
  gotoxy(1, 3); write('Tekan enter untuk melanjutkan!'); readln;
end;

{ Begin Mahasiswa }
procedure no_mhs_ke(i: integer);
begin
  gotoxy(17, i + 4); write('|    |         |                          |');
  gotoxy(21, i + 4); write(i);
end;

procedure isi_mahasiswa(i: integer; var mahasiswa: arr_mhs);
{ I.S: User memasukkan data tiap mahasiswa }
{ F.S: Menyimpan data mahasiswa }
begin
  gotoxy(23, i + 4); readln(mahasiswa[i].nim); // Isi NIM
  //validasi
  while (length(mahasiswa[i].nim) <> 8) do begin
    gotoxy(17, i + 5); textcolor(red); write('NIM hanya boleh 8 digit!');
    readkey;
    gotoxy(17, i + 5); clreol; // hapus keterangan error
    gotoxy(23, i + 4); clreol; textcolor(white);
    no_mhs_ke(i); 
    gotoxy(23, i + 4); readln(mahasiswa[i].nim); // Isi NIM
  end;
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
    no_mhs_ke(i);

    isi_mahasiswa(i, mahasiswa);
  end;

  gotoxy(17, i + 5);
  writeln('-------------------------------------------');
  baris := baris + i + 6;
end;
{ End Mahasiswa }

{ Begin Mata Kuliah }
procedure isi_matkul(i: integer; var matakuliah: arr_mk);
{ I.S: User memasukkan data tiap mata kuliah }
{ F.S: Menyimpan data mata kuliah }
begin
  gotoxy(23, baris + i + 4); readln(matakuliah[i].kd_mk); // Isi Kode MK
  gotoxy(42, baris + i + 4); readln(matakuliah[i].nm_mk); // Isi Nama MK
  gotoxy(63, baris + i + 4); readln(matakuliah[i].sks); // Isi SKS
end;

procedure tabel_matkul(jml_mk: integer; var matakuliah: arr_mk);
{ I.S: Jumlah mata kuliah telah terdefinisi }
{ F.S: Menghasilkan data baru mata kuliah }
// procedure isi_matkul; prototype
var i: integer;
begin
  gotoxy(33, baris + 1); // dibagi 2
  write('DAFTAR MATA KULIAH');
  gotoxy(17, baris + 2);
  write('--------------------------------------------------');
  gotoxy(17, baris + 3);
  write('| No | Kode Mata Kuliah | Nama Mata Kuliah | SKS |');
  gotoxy(17, baris + 4);
  write('--------------------------------------------------');
  
  for i := 1 to jml_mk do begin
    // Tabel
    gotoxy(17, baris + i + 4); write('|    |                  |                  |     |');
    gotoxy(21, baris + i + 4); write(i);

    isi_matkul(i, matakuliah);
  end;

  gotoxy(17, baris + i + 5);
  write('--------------------------------------------------');
  gotoxy(17, baris + i + 6); write('Tekan enter untuk melanjutkan!'); readln;
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

procedure isi_nilai(var nilai: arr_nilai);
{ I.S.: User mengisi data nilai }
{ F.S.: Menghasilkan nilai tiap mahasiswa }
var i, j: integer;
begin
  for i := 1 to jml_mhs do begin
    textcolor(lightblue);
    gotoxy(1, i + 5); write(mahasiswa[i].nim);
    for j := 1 to jml_mk do begin
      textcolor(white);
      gotoxy(j * 10, i + 5); readln(nilai[i, j]);
      //validasi
      while(nilai[i,j] < 0) or (nilai[i,j] > 100) do
        begin
        gotoxy(j * 10, i + 6); textcolor(red); write('Nilai hanya dari 0-100!');
        readkey;
        gotoxy(j * 10 + 26, i + 6); clreol;
        gotoxy(j * 10, i + 6); clreol; textcolor(white);
        gotoxy(j * 10, i + 5); clreol; readln(nilai[i, j]);
        end;
    end;
  end;
end;

procedure isi_indeks(var indeks: arr_idx);
{ I.S.: User mengisi data indeks }
{ F.S.: Menghasilkan indeks tiap mahasiswa }
var i, j: integer;
begin
  for i := 1 to jml_mhs do begin
    for j := 1 to jml_mk do begin
      indeks[i, j] := idx(nilai[i, j]);
      textcolor(red);
      gotoxy(j * 10, i + 5); clreol; delay(300); write(indeks[i, j]);
    end;
  end;
  textcolor(white);
  gotoxy(1, i + 6); write('Tekan enter untuk melanjutkan!'); readln;
end;

procedure tabel_indeks_nilai(jml_mhs, jml_mk: integer; var nilai: arr_nilai; var indeks: arr_idx);
{ I.S.: User memulai mengisi data nilai dan indeks }
{ F.S.: Menampilkan indeks tiap mahasiswa }
var i: integer;
begin
  clrscr;
  gotoxy(39, 1); // dibagi 2
  write('Pengisian Nilai Mahasiswa');
  gotoxy(39, 2); write('-------------------------');
  gotoxy(1, 5); write('NIM');
  gotoxy(10, 4); write('Kode Mata Kuliah');
  for i := 1 to jml_mk do begin
    textcolor(lightblue);
    gotoxy(i * 10, 5); write(upcase(matakuliah[i].kd_mk));
  end;
  isi_nilai(nilai); // prosedur
  isi_indeks(indeks);
  writeln;
end;

procedure tampil_data(jml_mhs, jml_mk: integer; mahasiswa: arr_mhs; matakuliah: arr_mk; nilai: arr_nilai; indeks: arr_idx); // khs
var
  total_sks, total_bobot: real;
  i, j: integer;
begin
  clrscr;
  baris := 0;

  gotoxy(25, 1); write('HASIL STUDI MAHASISWA TEKNIK INFORMATIKA UNIKOM SEBANYAK ', jml_mhs, ' MAHASISWA');
  gotoxy(1, 2); write('========================================================================================================================');
  for i := 1 to jml_mhs do begin
    total_bobot := 0;
    total_sks := 0; // reset for each student

    if (i > 1) then baris := baris - i; // line-length for each student table
    gotoxy(1, baris + i + 4);
    write('-----------------------------------------------------Mahasiswa Ke-', i, '-----------------------------------------------------');
    gotoxy(1, baris + i + 5); write('NIM  : ', mahasiswa[i].nim);
    gotoxy(1, baris + i + 6); write('Nama : ', mahasiswa[i].nama);
    gotoxy(1, baris + i + 7); write('-----------------------------------------------------------');
    gotoxy(1, baris + i + 8); write('| No | Kode Mata Kuliah | Nama Mata Kuliah | SKS | Indeks |');
    gotoxy(1, baris + i + 9); write('-----------------------------------------------------------');
    baris := baris + i + 9;

    for j := 1 to jml_mk do begin
      total_sks := total_sks + matakuliah[j].sks;
      total_bobot := total_bobot + (bobot(indeks[i, j], matakuliah[j].sks));

      gotoxy(1, baris + j); write('|    |                  |                  |     |        |');
      gotoxy(3, baris + j); write(j);
      gotoxy(7, baris + j); write(upcase(matakuliah[j].kd_mk));
      gotoxy(27, baris + j); write(upcase(matakuliah[j].nm_mk));
      gotoxy(46, baris + j); write(matakuliah[j].sks);
      gotoxy(52, baris + j); write(indeks[i, j]);
    end;
    mahasiswa[i].ipk := total_bobot / total_sks;
    gotoxy(1, baris + j + 1); write('-----------------------------------------------------------');
    gotoxy(1, baris + j + 2); writeln('IPK  : ', mahasiswa[i].ipk:0:1);
    baris := baris + j;
  end;
end;

{ Algoritma Utama }
begin
  // window(1, 1, 100, 100);
  clrscr;
  textcolor(white);
  // masukkan jumlah
  jumlah_data_mhs(jml_mhs);
  jumlah_data_mk(jml_mk);

  // tampilkan tabel matkul dan mahasiswa
  tabel_mahasiswa(jml_mhs, mahasiswa);
  tabel_matkul(jml_mk, matakuliah);

  // isi nilai dan tampilkan indeks tiap mahasiswa
  tabel_indeks_nilai(jml_mhs, jml_mk, nilai, indeks);

  // tampilkan semuanya
  tampil_data(jml_mhs, jml_mk, mahasiswa, matakuliah, nilai, indeks);
  readln;
end.
