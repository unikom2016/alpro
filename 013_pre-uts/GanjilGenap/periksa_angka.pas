program periksa_angka;

var
    angka: integer;
    keterangan: string;

    procedure input(var angka: integer);
    begin
        write('Masukkan angka: ');
        readln(angka);
    end;
    
    procedure proses(angka: integer; var keterangan: string);
    begin
        if angka mod 2 <> 0 then
            keterangan := 'adalah angka ganjil'
        else
            keterangan := 'adalah angka genap'
    end;

    procedure output(angka: integer; keterangan: string);
    begin
        write(angka);
        write(', ');
        writeln(keterangan);
    end;

begin
    input(angka);
    proses(angka, keterangan);
    output(angka, keterangan);
end.