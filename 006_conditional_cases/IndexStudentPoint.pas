{ Judul }
Program IndexStudentPoint;

Uses sysutils, crt;

{I.S. : User memasukkan data siswa dan nilai tiap pelajaran}

{F.S. : Menampilkan data siswa dan keterangan nilai yang perlu diperbaiki atau tidak}

{ Kamus }
Const
    User = 'Dwi';
    Pass = '1234';

Var Nama, KetMTK, KetBInd, KetIPA, KetBIng, Keterangan, 
    NamaPengguna, KataKunci : string;
Var N_MTK, N_BInd, N_IPA, N_BIng, SK : real;
Var JumlahRemedial, UrutanMTK, UrutanBInd, UrutanIPA, UrutanBIng : integer;

{ Algoritma }
Begin

    { Input }
    // LOGIN
    Window(1, 1, 80, 24); TextBackground(15); ClrScr();
    GotoXY(32, 10); Write('<< L O G I N >>');
    GotoXY(32, 12); Write('Nama Pengguna    :'); Readln(NamaPengguna);
    GotoXY(32, 13); Write('Kata Kunci       :'); Readln(KataKunci);

    If ((NamaPengguna <> User) or (KataKunci <> Pass))
        then
        begin
          GotoXY(30, 14);
          Write('Login gagal!');
        end
    Else
        begin
        ClrScr();
        // Data Masukkan
        // Window(1,1,40,24); TextBackground(15); ClrScr();
        // GotoXY(20,1); Write('Data Masukkan');
        // GotoXY(20,2); Write('=============');

        // Data Siswa dan Nilai Mata Pelajaran 
        GotoXY(1,5);
        Write('Nama                     :'); Readln(Nama);
        Write('Nilai Matematika         :'); Readln(N_MTK);
        Write('Nilai Bahasa Indonesia   :'); Readln(N_BInd);
        Write('Nilai IPA                :'); Readln(N_IPA);
        Write('Nilai Bahasa Inggris     :'); Readln(N_BIng);
        Write('Standar Kelulusan        :'); Readln(SK);

        { Proses }
        JumlahRemedial := 0;

        { Kondisi (Pemilihan) }
        // Window(40,1,80,24); TextBackground(15); ClrScr();
        // GotoXY(20,1); Write('Data Keluaran');
        // GotoXY(20,2); Write('=============');

        // GotoXY(21,5);
        // Kondisi n - 2 (Tidak lulus semua matpel)
        If ((N_MTK < SK) and (N_BInd < SK) and (N_IPA < SK) and (N_BIng < SK))
            Then
                Begin
                    Keterangan := 'maaf kamu harus mengulang!';
                    Writeln(Nama, ', ', Keterangan);
                End
        // Kondisi ke 'n - 1' (Lulus semua matpel)
        Else If ((N_MTK >= SK) and (N_BInd >= SK) and (N_IPA >= SK) and (N_BIng >= SK))
            Then
                Begin
                    Keterangan := 'selamat kamu lulus!';
                    Writeln(Nama, ', ', Keterangan);
                End
        // Kondisi ke 'n'
        Else
            Begin
                Keterangan := 'kamu harus mengikuti ujian ulang mata pelajaran: ';
                Writeln(Nama, ', ', Keterangan);

                // Cek Nilai Matematika
                If (N_MTK < SK) 
                    Then
                    Begin
                        JumlahRemedial += 1;
                        UrutanMTK := JumlahRemedial;
                        KetMTK := IntToStr(UrutanMTK) + '. ' + 'Matematika';
                        Writeln(KetMTK);
                    End;
                // Cek Nilai Bahasa Indonesia
                If (N_BInd < SK)
                    Then
                    Begin
                        JumlahRemedial += 1;
                        UrutanBInd := JumlahRemedial;
                        KetBInd := IntToStr(UrutanBInd) + '. ' + 'Bahasa Indonesia';
                        Writeln(KetBInd);
                    End;
                // Cek Nilai IPA
                If (N_IPA < SK)
                    Then
                    Begin
                        JumlahRemedial += 1;
                        UrutanIPA := JumlahRemedial;
                        KetIPA := IntToStr(UrutanIPA) + '. ' + 'IPA';
                        Writeln(KetIPA);
                    End;
                // Cek Nilai Bahasa Inggris
                If (N_BIng < SK)
                    Then
                    Begin
                        JumlahRemedial += 1;
                        UrutanBIng := JumlahRemedial;
                        KetBIng := IntToStr(UrutanBIng) + '. ' + 'Bahasa Inggris';
                        Writeln(KetBIng);
                    End;
            End;

    End;
    
    Readln();

End.