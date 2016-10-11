{ Judul }
Program IndexStudentPoint;

Uses sysutils, crt;

{I.S. : User memasukkan data siswa dan nilai tiap pelajaran}

{F.S. : Menampilkan data siswa dan keterangan nilai yang perlu diperbaiki atau tidak}

{ Kamus }
Const
    User = 'Dwi';
    Pass = '1234';

Var Nama, Ket, NamaPengguna, KataKunci: string;
Var N_MTK, N_BInd, N_IPA, N_BIng, SK: real;
Var BatasLogin, Urutan, i: integer;

{ Algoritma }
Begin

    { Input }
    i := 1;
    BatasLogin := 3;
    repeat
        // LOGIN
        Window(1, 1, 80, 24); TextBackground(0); ClrScr();
        GotoXY(33, 10); Write('<< L O G I N >>');
        GotoXY(30, 12); Write('Nama Pengguna    :'); Readln(NamaPengguna);
        GotoXY(30, 13); Write('Kata Kunci       :'); Readln(KataKunci);

        If ((NamaPengguna <> User) Or (KataKunci <> Pass))
            Then
                Begin
                    If (i = BatasLogin) Then
                        Begin
                            Ket := 'Maaf kamu gagal login lebih dari 3!';
                            ClrScr();

                            GotoXY(40 - (length(Ket) div 2), 1);
                            Writeln(Ket);
                            Break;
                        End
                    Else
                        Begin
                            Ket :=  'Username atau password salah!';
                            GotoXY(40 - (length(Ket) div 2), 14);
                            Writeln(Ket);
                            Readln();
                            i := i + 1;
                        End;
                    ClrScr();
                End
        Else
            Begin
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

                { Kondisi (Pemilihan) }
                // Window(40,1,80,24); TextBackground(15); ClrScr();
                // GotoXY(20,1); Write('Data Keluaran');
                // GotoXY(20,2); Write('=============');

                // GotoXY(21,5);

                // Kondisi n - 2 (Tidak lulus semua matpel)
                If ((N_MTK < SK) and (N_BInd < SK) and (N_IPA < SK) and (N_BIng < SK))
                    Then
                        Begin
                            Writeln(Nama, ', ', 'maaf kamu harus mengulang!');
                        End
                // Kondisi ke 'n - 1' (Lulus semua matpel)
                Else If ((N_MTK >= SK) and (N_BInd >= SK) and (N_IPA >= SK) and (N_BIng >= SK))
                    Then
                        Begin
                            Writeln(Nama, ', ', 'selamat kamu lulus!');
                        End
                // Kondisi ke 'n'
                Else
                    Begin
                        Writeln(Nama, ', ', 'kamu harus mengikuti ujian ulang mata pelajaran: ');
                        Urutan := 0;

                        // Cek Nilai Matematika
                        If (N_MTK < SK) 
                            Then
                            Begin
                                Urutan += 1;
                                Writeln(Urutan, '. Matematika');
                            End;
                        // Cek Nilai Bahasa Indonesia
                        If (N_BInd < SK)
                            Then
                            Begin
                                Urutan += 1;
                                Writeln(Urutan, '. Bahasa Indonesia');
                            End;
                        // Cek Nilai IPA
                        If (N_IPA < SK)
                            Then
                            Begin
                                Urutan += 1;
                                Writeln(Urutan, '. IPA');
                            End;
                        // Cek Nilai Bahasa Inggris
                        If (N_BIng < SK)
                            Then
                            Begin
                                Urutan += 1;
                                Writeln(Urutan, '. Bahasa Inggris');
                            End;
                    End;

                    Break;
                End;
    Until (i > BatasLogin);

    Readln();

End.