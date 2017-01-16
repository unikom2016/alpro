program test_untyped;
{ A crude database recording }
uses crt;
type
   Temployee = record
                  name    : string[20];
                  address : string[40];
                  phone   : string[15];
                  age     : byte;
                  salary  : longint;
               end;
    arr_employee = array[1..100] of Temployee;

var
  //  F : file of Temployee;
   F : File;
   c : char;
  //  r : Temployee;
   r : Temployee;
   tempR, realR : arr_employee;
   s : string;
   i, j, n : integer;

procedure fWrite;
begin
  seek(F, filesize(F));
  repeat
    clrscr;
    writeln('File position : ',filepos(F));
    write('Name    = '); readln(r.name);     { Input data }
    write('Address = '); readln(r.address);
    write('Phone   = '); readln(r.phone);
    write('Age     = '); readln(r.age);
    write('Salary  = '); readln(r.salary);
    blockWrite(F, r, sizeOf(Temployee)); { Write data to file }
    write('Input data again (Y/N) ?');
    repeat
        c:=upcase(readkey);      { Ask user : Input again or not }
    until c in ['Y','N'];
    writeln(c);
  until c='N';
end;

procedure fRead;
var
  tempR: Temployee;
begin
  seek(F, 0);
  i := 0;
  repeat
    clrscr;
    writeln('File position : ',filepos(F));
    blockRead(F, r, sizeOf(Temployee));
    writeln('Name    = ', r.name);     { Input data }
    writeln('Address = ', r.address);
    writeln('Phone   = ', r.phone);
    writeln('Age     = ', r.age);
    writeln('Salary  = ', r.salary);
    write('Show data again (Y/N) ?');
    repeat
        c:=upcase(readkey);      { Ask user : Input again or not }
    until c in ['Y','N'];
    writeln(c);
    inc(i);
    tempR := r;
    realR[i] := tempR; // backup, to show later
    writeln('increment: ', i); readln;
  until c='N';
end; // end fRead

begin
   clrscr;
  //  write('Input file name to record databases : '); readln(s);
   s := 'coba1.dat';

   assign(F,s);           { Associate it }
   {$I-}
   reset(F, sizeOf(Temployee));           { First, open it }
   {$I+}

   n:=IOResult;
   if n<>0 then           { If it's doesn't exist then }
   begin
      {$I-}
      rewrite(F, sizeOf(Temployee));      { Create it    }
      {$I+}
      n:=IOResult;
      if n<>0 then
      begin
         writeln('Error creating file !'); halt;
      end;
   end
   else
   begin                  { If it exists then }
      n:=filesize(F);     { Calculate total record }
      // seek(F,n);          { Move file pointer PAST the last record }
   end;

   fileMode := 2;
   reset(F, sizeOf(Temployee));
   fWrite;
   fRead;

   writeln(i); readln;
  for j := 1 to i do
  begin
    clrscr;
    writeln('Name    = ', realR[j].name);     { Input data }
    writeln('Address = ', realR[j].address);
    writeln('Phone   = ', realR[j].phone);
    writeln('Age     = ', realR[j].age);
    writeln('Salary  = ', realR[j].salary);
    readln;
  end;
  close(F);
end.