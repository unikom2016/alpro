program student_grade;

uses crt;

const
  maks_mhs = 50; // mahasiswa
  maks_mk = 5; // matakuliah

type
  // mata kuliah
  matkul = record
    kd_mk, nm_mk: string;
    sks: integer;
  end;

  // mahasiswa
  mhs = record // record
    nim, nama: string;
    nilai: array[0..maks_mk] of integer;
    indeks: array[0..maks_mk] of char;
  end;
  
  arr_mk = array[0..maks_mk] of matkul; // matakuliah array of record
  arr_mhs = array[0..maks_mhs] of mhs; // mahasiswa array of record
  arr_int = array[0..maks_mk] of integer; // array index
  // array cuma bisa data tipe yg sama, jadi ga bisa <char, int> <key, value>

{ Kamus Global }
var
  mahasiswa: arr_mhs;
  matakuliah: arr_mk; 
  idx_mhs: arr_int; // simpan data tiap indeks
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
function idx(nilai: integer): char;
{ I.S.: (nilai) sudah terdefinisi }
{ F.S.: menghasilkan fungsi idx nilai }
begin
  case (nilai) of
    80..100: idx := 'A'; // nama variabel / fungsi?
    70..79: idx := 'B';
    60..69: idx := 'C';
    50..59: idx := 'D';
    0..49: idx := 'E';
  end;
end;

function ipk(total: integer): integer;
begin
  
end;
{ End Perhitungan }

procedure isi_nilai;
begin
  for j := 0 to (jml_mk - 1) do begin
    gotoxy((j + 1) * 15, i + 5); readln(mahasiswa[i].nilai[j]);
  end;
end;

procedure isi_indeks;
begin
  for i := 0 to (jml_mhs - 1) do begin
    for j := 0 to (jml_mk - 1) do begin
      mahasiswa[i].indeks[j] := idx(mahasiswa[i].nilai[j]);
      gotoxy((j + 1) * 15, i + 5); clreol; delay(300); write(mahasiswa[i].indeks[j]);
    end;
  end;
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

  for i := 0 to (jml_mhs - 1) do begin
    gotoxy(7, i + 5); // write('|'); // buka NIM
    write(mahasiswa[i].nim); // NIM

    isi_nilai;
  end;

  isi_indeks;
  writeln;
end;

procedure tampil_data;
var total: integer;
begin
  write('NIM:', mahasiswa[i].nim);
  write('Nama:', mahasiswa[i].nama);
  // tabel
  total := total + mahasiswa[i].nilai[j];
  write('IPK:', ipk(total));
end;

{ Algoritma Utama }
begin
  window(1, 1, 100, 100);
  clrscr;
  jumlah_data_mhs(jml_mhs);
  jumlah_data_mk(jml_mk);
  tabel_mahasiswa;
  tabel_matkul;
  tabel_indeks_nilai;
  // clrscr;
  // tampil_data;
end.