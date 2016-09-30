program hello_world;
{
        Program Untuk Menampilkan Kata Hello World
        Masukan  : -
        Keluaran : Menampilkan Kata Hello World
}
{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes
  { you can add units after this };

begin
  writeln('Hellow World');
  writeln;
  writeln;
  writeln;
  writeln('Nama: Muhammad Septian');
  readln;
end.

