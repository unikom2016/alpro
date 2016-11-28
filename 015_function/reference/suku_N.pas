program suku_ke_n;
{I.S. : user memasukkan nila N}
{F.S. : menampilkan Suku Ke-N}
var
   n,Hasil : integer;

procedure isi_n (var n : integer);
{I.S. : User memasukkan nilai N}
{F.S. : mendefenisikan nilai N}
begin
     write('N = '); readln(n);
end;

function SukuN (n :integer) : integer;
{I.S. : nilai N telah terdefinisi}
{F.S. : menentukan suku ke- N}
var
   i,n1,n2,suku : integer;
begin
    if(n = 1)
      then
        suku := 3
      else
      if (n=2)
        then
          suku := 5
        else
        begin
        n1 := 3;
        n2 := 5;
        for i := 3 to n do
        begin
          if (i mod 2 = 1)
            then
              suku := n1*n2
            else
              suku := n1+n2;
        n1 := n2;
        n2 := suku;
        end;
        end;

SukuN := suku;
end;

procedure tampilan (Hasil : integer);
{I.S. : suku sudah terdefinisi }
{F.S. : menampilkan suku ke-N}
begin
   writeln('Suku ke-N : ',Hasil);
   readln;

end;

begin
     isi_n(n);
     Hasil := SukuN(n);
     tampilan(Hasil);
end.
