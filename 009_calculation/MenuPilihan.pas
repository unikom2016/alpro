{ Judul }
program MenuPilihan;

{I.S. : User memilih salah satu menu}
{F.S. : Menampilkan hasil dari menu yang dipilih}

uses crt, sysutils;

{ Kamus }
var Pilihan: integer;

{ M x N }
var M, N, Hasil, i: integer;

{ Suku ke-N }
var
    m00, m01, m02, m03, x, total: integer;
    
{ Algoritma }
begin
    { Input }
    repeat
        clrscr; textcolor(white);
        gotoxy(28, 1); write('Menu Pilihan');
        gotoxy(28, 2); write('------------');

        
        gotoxy(8, 4); writeln('1. M x N menggunakan operator +');
        gotoxy(8, 5); writeln('2. Barisan dari N suku: 2, 3, 5, 15, ... ');
        gotoxy(8, 6); writeln('0. Keluar');

        gotoxy(8, 7); write('PILIHAN ANDA? '); readln(Pilihan);

        while (Pilihan < 0) or (Pilihan > 2) do
            begin
                gotoxy(8, 8); textcolor(yellow);
                write('Pilihan hanya 0 / 1 / 2, Ulangi tekan enter!');
                readln;
                gotoxy(8, 8); clreol;
                gotoxy(22, 7); clreol; textcolor(white);
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
                    gotoxy(1, 5); write(M, ' x ', N);
                    gotoxy(18, 5); write('= ');

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
                                // Perulangan (for)
                                for i := 1 to M do
                                    begin
                                        write(N);
                                        Hasil := Hasil + N;
                                        if (i <> M) then
                                            write(' + ');
                                    end;
                            end

                    // Kondisi M & N < 0
                    else
                        begin
                            M := M * -1; // Positif
                            N := N * -1; // Positif

                            // Perulangan (for)
                            for i := 1 to N do
                                begin
                                    write(M);
                                    Hasil := Hasil + M;
                                    if (i <> N) then
                                        write(' + ');
                                end;
                        end;

                        gotoxy(18, 6);
                        writeln('= ', Hasil);
                    readln;
                end; // EndDepend M x N
            2:  begin
                    clrscr();
                    writeln('Barisan dari N suku');
                    writeln('-------------------');

                    write('Masukkan nilai N: '); readln(x);
                    if (x > 0) and (x <= 10) then
                    begin
                        write('Deretnya adalah: ');
                        for i := 1 to x do
                        begin
                            m00 := 2;
                            m01 := i - 1;
                            m02 := sqr(i) - 3*i + 2;
                            m03 := m02 * (i - 3) * 7;
                            total := m00 + m01 + (m02 div 2) + (m03 div 6);
                            // Un := 2 + (n - 1) + ((n^2 - 3n + 2) / 2) + ((n^3) / 6)
                            textcolor(yellow);
                            write(total);
                            if (i <> x) then
                            begin
                                textcolor(white); write(', ');
                            end;
                        end;
                        textcolor(white);
                        writeln();
                        write('Nilai suku ke-', x, ' adalah: ');
                        textcolor(yellow); writeln(total);
                        textcolor(white);
                    end
                    else
                    begin
                        textcolor(yellow);
                        write('Nilai N hanya boleh dari 1 - 10!');
                        textcolor(white);
                    end;
                    readln;
                end;
            0:  begin
                    gotoxy(8, 9); writeln('Kamu Keluar!');
                end;
        end;
    until (Pilihan = 0);
end.