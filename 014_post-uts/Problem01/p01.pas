{ Judul: Soal_nomor_01 }
program problem_01;

{ Kamus Global: }
var
    a, b: real;

{ Algoritma Utama: }
begin
    a := 2;
    b := 10;
    a := a + 2 mod 10;
    b := b + 2 * 3 - b / 2;

    writeln('Nilai a: ', a:10:0);
    writeln('Nilai b: ', b:10:0);
end.