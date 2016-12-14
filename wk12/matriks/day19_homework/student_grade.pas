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
  arr_idx = array[0..4] of integer; // array index
  // array cuma bisa data tipe yg sama, jadi ga bisa <char, int> <key, value>

var
  mahasiswa: arr_mhs;
  matakuliah: arr_mk; 
  idx_mhs: arr_idx; // simpan data tiap indeks
  i, jml_mhs, jml_mk, idxA, idxB, idxC, idxD, idxE: integer;

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

procedure isi_matkul;
begin
  for i := 0 to (jml_mk - 1) do begin
    
  end;
end;

procedure tampil_mk;
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
    gotoxy(17, i + 5); write('|', i + 1); // No
    gotoxy(22, i + 5); write('|'); // Tutup No
    gotoxy(45, i + 5); write('|'); // Tutup Kode MK
    gotoxy(68, i + 5); write('|'); // Tutup Nama MK
    gotoxy(77, i + 5); write('|'); // Tutup SKS

    // isi_matkul;
  end;
end;

procedure isi_dmahasiswa;
begin
  for i := 0 to (jml_mhs - 1) do begin
    // gotoxy(13, i + 5); readln(mahasiswa[i].nim); // input NIM
    // gotoxy(29, i + 5); readln(mahasiswa[i].nama); // input Nama
    // gotoxy(56, i + 5); readln(mahasiswa[i].nilai); // input Nilai
    // mahasiswa[i].indeks := idx(mahasiswa[i].nilai);
    // gotoxy(74, i + 5); write(mahasiswa[i].indeks); // input Indeks
  end;
end;

procedure tampil_data; 
begin
  clrscr;
  gotoxy(39, 1); // dibagi 2
  write('DAFTAR NILAI MAHASISWA');
  gotoxy(7, 2);
  write('-------------------------------------------------------------------------------------');
  gotoxy(7, 3);
  write('| No |      NIM      |      Nama Mahasiswa      |      Nilai      |      Indeks     |');
  gotoxy(7, 4);
  write('-------------------------------------------------------------------------------------'); 

  for i := 0 to (jml_mhs - 1) do begin // array 0
    // gotoxy(x, y)
    gotoxy(7, i + 5); write('|'); gotoxy(11, i + 5); write(i + 1, '|');
    gotoxy(28, i + 5); write('|'); // NIM
    gotoxy(55, i + 5); write('|'); // Nama
    gotoxy(73, i + 5); write('|'); // Nilai
    gotoxy(91, i + 5); write('|'); // Indeks

    isi_dmahasiswa;
  end;

  gotoxy(7, i + 6);
  write('-------------------------------------------------------------------------------------');
  writeln;
end;

begin
  window(1, 1, 100, 100);
  clrscr;
  // jumlah_data_mhs(jml_mhs);
  jumlah_data_mk(jml_mk);
  tampil_mk;
  // clrscr;
  // tampil_data;
end.