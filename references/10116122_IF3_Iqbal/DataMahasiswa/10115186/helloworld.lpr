program helloworld;
{
        Program untuk Mencetak Hello World
        Masukan : -
        Keluaran: string Hello World
}

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes
  { you can add units after this };

begin
  write('hello world');
  readln();
end.

