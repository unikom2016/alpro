{ Judul }
Program IndexStudentPoint;

Uses sysutils;

{I.S. : User memasukkan data siswa dan nilai tiap pelajaran}

{F.S. : Menampilkan data siswa dan keterangan nilai yang perlu diperbaiki atau tidak}

{ Kamus }
var Nama, MatPel1, MatPel2, MatPel3, MatPel4, Keterangan,
    Remed1, Remed2, Remed3, Remed4 : string;
var N_MTK, N_BInd, N_IPA, N_BIng, SK, JumlahRemedial : integer;


{ Algoritma }
begin
    { Input }
    Write('Nama                     :'); Readln(Nama);
    Write('Nilai Matematika         :'); Readln(N_MTK);
    Write('Nilai Bahasa Indonesia   :'); Readln(N_BInd);
    Write('Nilai IPA                :'); Readln(N_IPA);
    Write('Nilai Bahasa Inggris     :'); Readln(N_BIng);
    Write('Standar Kelulusan        :'); Readln(SK);

    { Proses }
    JumlahRemedial := 0;

    { Kondisi (Pemilihan) }
    // Kondisi n - 2 (Tidak lulus semua matpel)
    If ((N_MTK < SK) and (N_BInd < SK) and (N_IPA < SK) and (N_BIng < SK))
        Then
            Begin
                Keterangan := 'maaf kamu harus mengulang!';
            End
    // Kondisi ke 'n - 1' (Lulus semua matpel)
    Else If ((N_MTK >= SK) and (N_BInd >= SK) and (N_IPA >= SK) and (N_BIng >= SK))
            Then
                Begin
                    Keterangan := 'selamat kamu lulus!';
                End
    // Kondisi ke 'n'
    Else
        Begin
            Keterangan := 'kamu harus mengikuti ujian ulang mata pelajaran: ';

            // Cek Nilai Matematika
            If (N_MTK < SK)
                Then
                    Begin
                        JumlahRemedial += 1;
                        MatPel1 := 'MTK';
                        Remed1 := IntToStr(JumlahRemedial) + '. ' + MatPel1;
                    End;
            // Cek Nilai Bahasa Indonesia
            If (N_BInd < SK)
                Then
                    Begin
                        JumlahRemedial += 1;
                        MatPel2 := 'Bahasa Indonesia';
                        Remed2 := IntToStr(JumlahRemedial) + '. ' + MatPel2;
                    End;
            // Cek Nilai IPA
            If (N_IPA < SK)
                Then
                    Begin
                        JumlahRemedial += 1;
                        MatPel3 := 'IPA';
                        Remed3 := IntToStr(JumlahRemedial) + '. ' + MatPel3;
                    End;
            // Cek Nilai Bahasa Inggris
            If (N_BIng < SK)
                Then
                    Begin
                        JumlahRemedial += 1;
                        MatPel4 := 'Bahasa Inggris';
                        Remed4 := IntToStr(JumlahRemedial) + '. ' + MatPel4;
                    End;
        End;

    { Output }
    Writeln(Nama, ', ', Keterangan);
    If (MatPel1 <> '')
        Then
            Writeln()
    Writeln(Remed2);
    Writeln(Remed3);
    Writeln(Remed4);
end.