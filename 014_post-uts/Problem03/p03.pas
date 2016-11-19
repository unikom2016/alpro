{ Judul: Soal_nomor_03 }
program p03;

{ Kamus Global: }
var
    i: integer;

{ Algoritma Utama: }
begin
    i := 13;

    if (i > 15) or (i = 25) then
        writeln('i')
    else
        writeln(i);

    i := i + 1;
    writeln('Nilai i: ', i)
end.