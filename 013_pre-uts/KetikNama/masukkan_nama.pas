program masukkan_nama;

var
    nama: string;
    
    { Protototype }
    { Input nama_variable = ' nama_variable' or by value }
    { I/O nama_variable = 'var nama_variable' or by reference } 
    procedure input(var nama: string); // Output
    begin
        write('Masukkan nama: '); readln(nama);
    end;

    procedure output(nama: string);
    begin
        writeln('Hallo, ', nama);
    end; 

begin
    { Runtunan }
    input(nama);
    output(nama);
end.