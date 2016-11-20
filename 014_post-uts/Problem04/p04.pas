{ Judul: Soal_nomor_04 }
program p04;

{ Kamus Global: }
var
    i, a, b, x: integer;

{ Algoritma Utama: }
begin
    i := 1;
    a := 2;
    while (a <= 4) do
    // for a := 2 to 4 do
    begin
        writeln('Rute ke-', i);
        a := a + 1;
        b := a + 1;
        while (b >= 1) do
        // for b := (a + 1) downto 1 do
        begin
            write('Nilai a: ', a);
            write('| Nilai b: ', b);
            x := a + b;
            writeln('| Nilai x: ', x);
            b := b - 1;
        end;
        writeln;
        i := i + 1;
    end;

    writeln('Nilai akhir dari x: ', x);
end.