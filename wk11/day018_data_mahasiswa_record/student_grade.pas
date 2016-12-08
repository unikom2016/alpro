program student_grade;

uses crt;

const
  max = 50;

type
  mhs = record // record
    nim, nama: string;
    nilai: integer;
    indeks: char;
  end;
  
  arr_std = array[0..1] of string;
  arr_mhs = array[0..max] of mhs; // array of record
  arr_idx = array[0..4] of integer; // array index

var
  mahasiswa: arr_mhs; // mahasiswa
  idx_mhs: arr_idx; // simpan data tiap indeks
  i, jml_mhs, idxA, idxB, idxC, idxD, idxE: integer;

procedure jumlah_data(var jml_mhs: integer);
{ I.S: User memasukkan banyaknya data (jml_mhs) }
{ F.S: menghasilkan banyaknya data (jml_mhs) }
begin
  write('Masukkan banyaknya mahasiswa: '); readln(jml_mhs); // validation
  // validation
  while (jml_mhs < 1) or (jml_mhs > max) do begin
    gotoxy(1, 1);
    write('Banyaknya data hanya antara 1-50');
    gotoxy(1, 1); clreol; readln;
    gotoxy(30, 1); clreol; readln(jml_mhs)
  end;
  clrscr;
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

function rata_rata(total: integer): real;
{ I.S.: banyaknya data(nilai) dan total sudah terdefinisi }
{ F.S.: menghasilkan fungsi rata-rata }
begin
  rata_rata := total / jml_mhs;
end;

function nilai_min(mahasiswa: arr_mhs): integer;
{ I.S.: data(nilai) sudah terdefinisi }
{ F.S.: menghasilkan fungsi nilai terendah }
var i: integer;
begin
  nilai_min := mahasiswa[0].nilai;

  for i := 1 to (jml_mhs - 1) do begin // 
    if (mahasiswa[i].nilai < nilai_min) then begin
      nilai_min := mahasiswa[i].nilai;
    end;
  end;
end;

function nilai_max(mahasiswa: arr_mhs): integer;
{ I.S.: data(nilai) sudah terdefinisi }
{ F.S.: menghasilkan fungsi nilai tertinggi }
var i: integer;
begin
  nilai_max := mahasiswa[0].nilai;

  for i := 1 to (jml_mhs - 1) do begin
    if (mahasiswa[i].nilai > nilai_max) then begin
      nilai_max := mahasiswa[i].nilai;
    end;
  end;
end;

// Check each index
procedure jumlah_mhs_tiap_idx(idx: char);
begin
  // for i := 0 to 4 do begin
    case (idx) of
      'A': idx_mhs[0] := idx_mhs[0] + 1;
      'B': idx_mhs[1] := idx_mhs[1] + 1;
      'C': idx_mhs[2] := idx_mhs[2] + 1;
      'D': idx_mhs[3] := idx_mhs[3] + 1;
      'E': idx_mhs[4] := idx_mhs[4] + 1;
    end;

    idxA := idx_mhs[0];
    idxB := idx_mhs[1];
    idxC := idx_mhs[2];
    idxD := idx_mhs[3];
    idxE := idx_mhs[4];
  // end;
end;

// kelulusan + presentasi
function presentase(req: integer): real;
var total: integer;
begin
  total := 0;
  case (req) of
    1: begin
      for i := 0 to 2 do begin
        total := total + idx_mhs[i]; 
      end;
    end;
    -1: begin
      for i := 3 to 4 do begin
        total := total + idx_mhs[i]; 
      end;
    end;
  end;
  
  presentase := (total / jml_mhs) * 100;
end;

procedure tampil_data;
var 
  total: integer;
  // function idx(nilai: integer); // prototype 
begin
  if (jml_mhs > 0) and (jml_mhs <= max) then begin
    window(1, 1, 100, 100);
    clrscr;
    gotoxy(39, 1); // dibagi 2
    write('DAFTAR NILAI MAHASISWA');
    gotoxy(7, 2);
    write('-------------------------------------------------------------------------------------');
    gotoxy(7, 3);
    write('| No |      NIM      |      Nama Mahasiswa      |      Nilai      |      Indeks     |');
    gotoxy(7, 4);
    write('-------------------------------------------------------------------------------------');
    
    total := 0;
    idxA := 0; idxB := 0; idxC := 0; idxD := 0; idxE := 0; 

    for i := 0 to (jml_mhs - 1) do begin // array 0
      // gotoxy(x, y)
      gotoxy(7, i + 5); write('|'); gotoxy(11, i + 5); write(i + 1, '|');
      gotoxy(28, i + 5); write('|'); // NIM
      gotoxy(55, i + 5); write('|'); // Nama
      gotoxy(73, i + 5); write('|'); // Nilai
      gotoxy(91, i + 5); write('|'); // Indeks
      // clreol; gotoxy(1, i + 6); write('---------------------------------------------------------------------------'); clreol;

      gotoxy(13, i + 5); readln(mahasiswa[i].nim); // input NIM
      gotoxy(29, i + 5); readln(mahasiswa[i].nama); // input Nama
      gotoxy(56, i + 5); readln(mahasiswa[i].nilai); // input Nilai
      mahasiswa[i].indeks := idx(mahasiswa[i].nilai);
      gotoxy(74, i + 5); write(mahasiswa[i].indeks); // input Indeks

      total := total + mahasiswa[i].nilai;
      jumlah_mhs_tiap_idx(mahasiswa[i].indeks); // increment each index
    end;

    gotoxy(7, i + 6);
    write('-------------------------------------------------------------------------------------');
    gotoxy(7, i + 7); write('Rata-rata nilai dari ', jml_mhs, ' mahasiswa, yaitu: ', rata_rata(total):0:1);
    // tambahkan fungsi nilai tertinggi dan terendah
    gotoxy(7, i + 8); write('Nilai terendah dari ', jml_mhs, ' mahasiswa, yaitu: ', nilai_min(mahasiswa));
    gotoxy(7, i + 9); write('Nilai tertinggi dari ', jml_mhs, ' mahasiswa, yaitu: ', nilai_max(mahasiswa));
    // jumlah mahasiswa per-indeks
    gotoxy(7, i + 10); write('Mahasiswa dengan indeks A, yaitu: ', idxA);
    gotoxy(7, i + 11); write('Mahasiswa dengan indeks B, yaitu: ', idxB);
    gotoxy(7, i + 12); write('Mahasiswa dengan indeks C, yaitu: ', idxC);
    gotoxy(7, i + 13); write('Mahasiswa dengan indeks D, yaitu: ', idxD);
    gotoxy(7, i + 14); write('Mahasiswa dengan indeks E, yaitu: ', idxE);
    // presentase kelulusan
    gotoxy(7, i + 15); write('Mahasiswa yang lulus: ', presentase(1):0:1, '%');
    gotoxy(7, i + 14); write('Mahasiswa yang tidak lulus: ', presentase(-1):0:1, '%');
  end else
    writeln('Ga bisa nambahin mahasaiswa, karena penuh');
end;

begin
  jumlah_data(jml_mhs);
  tampil_data;
  readln;
end.