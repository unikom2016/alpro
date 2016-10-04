{ Judul }
Program IndexStudentPoint;

Uses sysutils;

{I.S. : User memasukkan data siswa dan nilai tiap pelajaran}

{F.S. : Menampilkan data siswa dan keterangan nilai yang perlu diperbaiki atau tidak}

{ Kamus }
var CR, LF, CRLF : string; // Newline
var Nama, KetMTK, KetBInd, KetIPA, KetBIng, Keterangan : string;
var N_MTK, N_BInd, N_IPA, N_BIng, SK : real;
var JumlahRemedial, UrutanMTK, UrutanBInd, UrutanIPA, UrutanBIng : integer;


{ Algoritma }
begin
    CR := #13;
    LF := #10;
    CRLF := CR + LF;
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
                        UrutanMTK := JumlahRemedial;
                        KetMTK := IntToStr(UrutanMTK) + '. ' + 'Matematika'+CRLF;
                    End;
            // Cek Nilai Bahasa Indonesia
            If (N_BInd < SK)
                Then
                    Begin
                        JumlahRemedial += 1;
                        UrutanBInd := JumlahRemedial;
                        KetBInd := IntToStr(UrutanBInd) + '. ' + 'Bahasa Indonesia'+CRLF;
                    End;
            // Cek Nilai IPA
            If (N_IPA < SK)
                Then
                    Begin
                        JumlahRemedial += 1;
                        UrutanIPA := JumlahRemedial;
                        KetIPA := IntToStr(UrutanIPA) + '. ' + 'IPA'+CRLF;
                    End;
            // Cek Nilai Bahasa Inggris
            If (N_BIng < SK)
                Then
                    Begin
                        JumlahRemedial += 1;
                        UrutanBIng := JumlahRemedial;
                        KetBIng := IntToStr(UrutanBIng) + '. ' + 'Bahasa Inggris'+CRLF;
                    End;
        End;

    { Output }
    Writeln(Nama, ', ', Keterangan);
    Write(KetMTK);
    Write(KetBInd);
    Write(KetIPA);
    Write(KetBIng);

end.