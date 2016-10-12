{ Judul }
program MenuPilihan;

{I.S. : User memilih salah satu menu}
{F.S. : Menampilkan hasil dari menu yang dipilih}

uses CRT;

{ Kamus }
var Pilihan: integer;
{ M x N }
var M, N, Hasil, i: integer;
var KetPilihan: string;
    
{ Algoritma }
begin
    { Input }
    repeat
        clrscr; textcolor(white);
        writeln('Menu Pilihan');
        writeln('------------');

        writeln('1. M x N menggunakan operator +');
        writeln('2. Barisan dari N suku: 2, 3, 5, 15, ... ');
        writeln('0. Keluar');

        KetPilihan := 'PILIHAN ANDA? ';
        write(KetPilihan); readln(Pilihan);

        while (Pilihan < 0) or (Pilihan > 2) do
            begin
                gotoxy(1, 7); textcolor(yellow);
                write('Pilihan hanya 0 / 1 / 2, Ulangi tekan enter!');
                readln;
                gotoxy(1, 7); clreol;
                gotoxy(length(KetPilihan) + 1,6); clreol; textcolor(white);
                readln(Pilihan);
            end;

        case (Pilihan) of
            1:  begin
                    clrscr();
                    writeln('Perkalian M x N');
                    writeln('------------');
                    
                    { Input }
                    Hasil := 0;

                    write('Masukkan nilai M: '); readln(M);
                    write('Masukkan nilai N: '); readln(N);

                    { Proses }

                    { Kondisi (Pemilihan) }
                    
                    // Kondisi M = 0 or N = 0
                    if (M = 0) or (N = 0) then
                            // Aksi
                            Hasil := 0

                    else
                        // Kondisi M > 0 or M < 0; N > 0
                        // M = 3; N = 2
                        if ((M > 0) or (M < 0)) and (N > 0) then
                            begin       
                                write(M, ' x ', N, ' = ');

                                // Perulangan (for)
                                for i := 1 to N do
                                    begin
                                        write(M);
                                        Hasil := Hasil + M;
                                        if (i <> N) then
                                            write(' + ');
                                    end;
                            end

                    else
                        // Kondisi N < 0; M = 3; N = -2
                        if (M > 0) and (N < 0) then
                            begin

                                write(M, ' x ', N, ' = ');
                                // Perulangan (for)
                                for i := 1 to M do
                                    begin
                                        write(N);
                                        Hasil := Hasil + N;
                                        if (i <> N) then
                                            write(' + ');
                                    end;
                            end

                    // Kondisi M & N < 0
                    else
                        begin
                            M := M * -1; // Positif
                            N := N * -1; // Positif
                            write(M, ' x ', N, ' = ');

                            // Perulangan (for)
                            for i := 1 to N do
                                begin
                                    write('-', M);
                                    Hasil := Hasil + M;
                                    if (i <> N) then
                                        write(' + ');
                                end;
                        end;

                    { writeln }
                        writeln();
                        writeln('      = ', Hasil);
                        readln;
                end;
            2:  begin
                    clrscr();
                    writeln('Barisan dari N suku');
                    writeln('-------------------');
                    readln;
                end;
            0:  begin
                    writeln('Kamu Keluar!');
                end;
        end;
    until (Pilihan = 0);
    
    { Proses }

    { Kondisi (Pemilihan) }


    { Output }

end.