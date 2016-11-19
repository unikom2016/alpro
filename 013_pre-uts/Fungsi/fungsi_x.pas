{ Judul }
program fungsi_x;

{ Kamus Global }
var
    x, y: integer;

    { Prototype - By Value }
    procedure input(x: integer);
    { Ga Perlu Kamus Lokal }
    begin
        write('Masukkan nilai x: ');
        readln(x);
    end;

    { Prototype - By Reference untuk variabel y }
    procedure proses(x: integer; var y: integer);
    { Ga Perlu Kamus Lokal }
    begin
        writeln('Lakukan perhitungan dengan rumus f(x) = 2x + 1...');
        y := 2*x + 1;
    end;

    { Prototype - By Value }
    procedure output(x, y: integer);
    begin
        writeln('x saat ini: ', x);
        writeln('y saat ini: ', y);
        writeln('Nilai y adalah: ', y);
    end;

{ Algoritma Utama }
begin
    y := 0;
    { x dari user }
    { Ngambil data dari Kamus Global }
    input(x); // Parameter Aktual (1. tipe data harus sama; 2. jumlah; 3. urutan harus bener / susunan)
    proses(x, y);
    output(x, y);
end.