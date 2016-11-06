program nilai_siswa;

type
    sw = record
        nama: string;
        a, b, c, d, e: integer;
    end;

    total = array[1..5] of longint;

    larik_siswa = array of sw;

var
    siswa: larik_siswa;
    idx: integer;
    lanjut: char;

procedure isidatasiswa(idx: integer; var siswa: larik_siswa);
begin
    setlength(siswa, idx);
    writeln('========Data Siswa========');
    // write('Nama Siswa: '); readln(siswa[idx].nama);
    writeln('Siswa ke-', idx);
    write('Mata Pelajaran 1: '); readln(siswa[idx - 1].a);
    write('Mata Pelajaran 2: '); readln(siswa[idx - 1].b);
    write('Mata Pelajaran 3: '); readln(siswa[idx - 1].c);
    write('Mata Pelajaran 4: '); readln(siswa[idx - 1].d);
    write('Mata Pelajaran 5: '); readln(siswa[idx - 1].e);
end;

function hitungnilairata(idx: integer; siswa: larik_siswa): total;
var
    i: integer;
begin
    for i := 1 to 5 do
        hitungnilairata[i] := 0;

    hitungnilairata[1] := hitungnilairata[1] + siswa[idx].a;
    hitungnilairata[2] := hitungnilairata[2] + siswa[idx].b;
    hitungnilairata[3] := hitungnilairata[3] + siswa[idx].c;
    hitungnilairata[4] := hitungnilairata[4] + siswa[idx].d;
    hitungnilairata[5] := hitungnilairata[5] + siswa[idx].e;
end;

procedure tampildatasiswa(idx: integer; siswa: larik_siswa);
var
    nilai: total;
    jumlah: longint;
begin
    jumlah := 0;
    nilai := hitungnilairata(idx - 1, siswa);
    jumlah := jumlah + nilai[idx];

    if (length(siswa) > 1) then
    begin
        writeln('Mata Pelajaran ke-', idx);
        writeln('Jumlah nilai keseluruhan: ', jumlah);
        writeln('Nilai rata-rata: ', (nilai[idx - 1] + nilai[idx]) div length(siswa));
    end;
end;

begin
    idx := 1;
    repeat
        isidatasiswa(idx, siswa);

        writeln;

        tampildatasiswa(idx, siswa);

        write('Lanjutkan masukkan data (Y / N): '); readln(lanjut);
        idx := idx + 1;
    until (lanjut = 'N') or (lanjut = 'n');
end.