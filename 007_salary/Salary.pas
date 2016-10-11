{ Judul }
Program Salary;

{I.S. : User memasukkan }

{F.S. : Menampilkan }

{ Kamus }
Var NK : string;
Var NIK, GOL,
    TotalJamKerjaKaryawan,
    // Lembur
    UpahLemburPerJam, Lembur,
    // Potongan
    Potongan, PotonganKerjaPerHari, PotonganKerjaPerJam,
    TotalPotonganPerHari, TotalPotonganPerJam : integer;
Const
    // Total Jam Kerja (Hari atau Bulan)
    TotalJamKerjaPerHari, TotalJamKerjaPerBulan : integer;
    // Potongan Jam Kerja (Jam atau Hari)
    TotalPotonganPerHari, TotalPotonganPerJam



{ Algoritma }
Begin
    TotalJamKerjaPerHari := 8;
    TotalJamKerjaPerBulan := 208; // 8jam x 26hari
    UpahLemburPerJam := 25000;
    PotonganKerjaPerHari := 50000;
    PotonganKerjaPerJam := 10000;

    { Input }
    Write('NIK                    :'); Readln(NIK);
    Write('NK                     :'); Readln(NK);
    Write('Gol                    :'); Readln(GOL);
    Write('Jumlah Jam Kerja/Bulan :'); Readln(TotalJamKerjaKaryawan);

    { Proses }

    { Kondisi (Golongan Gaji Pokok) }
    // Golongan I
    If (GOL = 1)
        Then
        Begin
            GajiPokok := 1750000;
            Tunjangan := 0.125; // 12.5%
            TotalGajiTunjangan := GajiPokok * Tunjangan;
        End;

    // Golongan II
    Else
        If (GOL = 2)
            Then
            Begin
                GajiPokok := 2300000;
                Tunjangan := 0.15; // 15%
                TotalGajiTunjangan := GajiPokok * Tunjangan;
            End;
        
    // Golongan III
    Else
        If (GOL = 3)
            Then
            Begin
                GajiPokok := 2800000;
                Tunjangan := 0.15; // 15%
                TotalGajiTunjangan := GajiPokok * Tunjangan;
            End;

    // Golongan IV
    Else
        Begin
            GajiPokok := 3200000;
            Tunjangan := 0.125; // 12.5%
            TotalGajiTunjangan := GajiPokok * Tunjangan;
        End;

    { Kondisi {Lembur atau Potongan} }
    // Lembur
    If (TotalJamKerjaKaryawan > TotalJamKerjaPerBulan)
        Then
        Begin
            JumlahLemburPerJam := TotalJamKerjaKaryawan - TotalJamKerjaPerBulan;
            TotalBonus := UpahLemburPerJam * JumlahLemburPerJam;
        End;
    Else
    // Potongan
        Begin
            JumlahPotonganKerjaPerJam := TotalJamKerjaPerBulan - TotalJamKerjaKaryawan;
            If (JumlahPotonganKerjaPerJam > TotalJamKerjaPerHari)
                Then
                Begin
                    TotalPotonganPerHari := JumlahPotonganKerjaPerJam div TotalJamKerjaPerHari;
                    TotalPotonganPerJam : integer;

            Const
                // Total Jam Kerja (Hari atau Bulan)
            TotalJamKerjaPerHari, TotalJamKerjaPerBulan : integer;
            // Potongan Jam Kerja (Jam atau Hari)
            TotalPotonganPerHari, TotalPotonganPerJam
                := J    umlahPotonganKerjaPerJam mod TotalJamKerjaPerHari;
                    TotalPotongan := (TotalPotonganPerHari * PotonganKerjaPerHari) + (TotalPotonganPerJam : integer;

            Const
                // Total Jam Kerja (Hari atau Bulan)
            TotalJamKerjaPerHari, TotalJamKerjaPerBulan : integer;
            // Potongan Jam Kerja (Jam atau Hari)
            TotalPotonganPerHari, TotalPotonganPerJam
                * Po    tonganKerjaPerJam);
                End;
        End;

    { Output }
    Writeln('NIK                      :', NIK);
    Writeln('NK                       :', NK);
    Writeln('Gol                      :', GOL);
    Writeln('Jumlah Jam Kerja/Bulan   :', TotalJamKerjaKaryawan, ' Jam');
    Writeln('Gaji Pokok               :', GajiPokok);
    Writeln('Tunjangan', Tunjangan, ' :', TotalGajiTunjangan);
    Writeln('Lembur                   :', JumlahLemburPerJam, ' Jam');
    Writeln('Potongan                 :', );

End.