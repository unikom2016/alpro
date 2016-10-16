program Menu_Pilhan;

{I.S. : User memilih salah satu menu }
{F.S. : Menampilkan hasil sesuai menu yang dipilih}

uses crt;
var
   pilihan,n,awal,akhir,i,m,Hasil,a : integer;
   suku: longint;


begin
  repeat
        clrscr;
        textcolor(15);
        writeln('Menu Pilihan');
        writeln('============');
        writeln('1. Suku Ke-N Dari Barisan 3,5,15,20,.....');
        writeln('2. MxN Menggunakan Operator Penjumlahan');
        writeln('0. Keluar');
        write('Pilihan Anda ? ');readln(pilihan);
        // Validasi Menu Pilihan
        while ( Pilihan < 0 ) or ( Pilihan > 2 ) do
        begin
          gotoxy(1,7);textcolor(lightgreen);
          write('Maaf Pilihan Hanya 0 sampai 2 , Ulangi Tekan Enter');
          readln;
          gotoxy(1,7);clreol;
          gotoxy(16,6);clreol;
          textcolor(15);readln(pilihan);
        end; //Endwhile


        case (pilihan) of
         1 : begin
              clrscr;
              {Suku ke-N}
              writeln('Suku Ke-N');
              writeln('---------');
              write('Suku N      : ');readln(n);
              
              while( n < 1 ) or ( n > 10 ) do
              begin
               textcolor(lightgreen);
               write('Harga N Baris antara 1 - 10 !');
               readln;
               textcolor(15);
               gotoxy(15,3);clreol;
               gotoxy(1,4);clreol;
               gotoxy(15,3);readln(n);
              end;

              write('Suku Ke - ');
              textcolor(lightgreen);
              write(n);

              writeln; textcolor(15);
              write('Dengan baris: ');

              if (n = 1) then
              begin
                  suku := 2; write('2');
              end
              else if (n = 2) then
              begin
                  suku := 3; write('2, 3');
              end
              else
              begin
                  awal := 2;
                  akhir := 3;
              
                  textcolor(lightgreen);
                  write('2, 3, ');
                  for i := 3 to n do  //Proses for x to y do
                  begin

                    if(i mod 2 = 1 ) then
                      suku := awal + akhir
                    else
                      suku := awal * akhir;

                    awal := akhir;
                    akhir := suku;
                    
                    write(suku);
                    if i <> n then
                      write(', ');
                  end;
              end;

              writeln;
              textcolor(15);
              write('Yaitu : ');
              textcolor(lightgreen);
              write(suku);
              readln;
             end;
         2 : begin
              clrscr;
              {MxN}
              writeln('Perkalian M x N');
              writeln('---------------');
              write('Masukkan Nilai M : ');readln(m);
              write('Masukkan Nilai N : ');readln(n);
              Hasil := m * n ; //Proses Perkalian
              writeln;
              write('Nilai M');
              gotoxy(18,6);
              write(': ');
              textcolor(lightgreen);
              writeln(m);
              textcolor(15);
              writeln('Nilai N');
              gotoxy(18,7);
              write(': ');
              textcolor(lightgreen);
              writeln(n);
              textcolor(15);
              write(' ');
              textcolor(lightgreen);
              write(m);
              textcolor(15);
              write(' X ');
              textcolor(lightgreen);
              write(n);
              textcolor(15);
              gotoxy(18,8);
              write(': ');
              if ( n = 0 )
               then
                begin
                textcolor(lightgreen);
                write(hasil);
                textcolor(15);
                end
                else
                if ( n < 0 )
                 then
                 begin
                  m := m * -1;
                  textcolor(lightgreen);
                  write(m);
                  textcolor(15);
                 end
                 else
                  begin
                   textcolor(lightgreen);
                   write(m);
                   textcolor(15);
                  end;
              if ( n < 0)
               then
               n := n * -1;
              a := 2;
              while ( a <= n ) do
               begin
                if( hasil >= 0 )
                then
                begin
                   write(' + ');
                   textcolor(lightgreen);
                   write(m);
                   textcolor(15);
                   a := a + 1;
                end
                else
                begin
                write(' + ');
                textcolor(lightgreen);
                write(m);
                textcolor(15);
                a := a + 1;
                end
               end;
              writeln;
              write('                 : ');
              textcolor(lightgreen);
              write(Hasil);
              readln;
             end;
        end; //Endcase
  until(pilihan=0)
end.
