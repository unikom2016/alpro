program rapot;

uses
	crt;

var
	jumlah_siswa,i,j,nilai: integer;
	nilai_siswa : array[1..10,1..5] of integer;
        rata_rata : array[1..5] of integer;
begin	
	write('Jumlah Siswa : '); readln(jumlah_siswa);

	for	i:= 1 to jumlah_siswa do
	begin
		for	j:= 1 to 5 do
		begin
			write('Nilai [', i ,'][', j ,'] : ');readln(nilai);
			nilai_siswa[i,j] := nilai
		end;
	end;

	for	i:= 1 to jumlah_siswa do
	begin
                write('Siswa ',i,' = ');
		for	j:= 1 to 5 do
		begin
			write(nilai_siswa[i,j],' ');
                        rata_rata[j] := nilai_siswa[i - 1,j] + nilai_siswa[i, j];
		end;
                writeln;
	end;

	for	j:= 1 to 5 do
	begin
	     write(rata_rata[j] div jumlah_siswa,' ');

	end;
	readln;
end.
