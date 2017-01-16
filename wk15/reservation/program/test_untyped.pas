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
    arr_employee = array[1..10] of Temployee;

var
  //  F : file of Temployee;
   F : File;
   c : char;
  //  r : Temployee;
   r : Temployee;
   tempR : arr_employee;
   s : string;
   i, n : integer;

procedure fWrite;
begin
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
begin
  seek(F, 0);
  repeat
    clrscr;
    writeln('File position : ',filepos(F));
    blockRead(F, r, sizeOf(Temployee));
    writeln;
    writeln('Name    = ', r.name);     { Input data }
    writeln('Address = ', r.address);
    writeln('Phone   = ', r.phone);
    writeln('Age     = ', r.age);
    writeln('Salary  = ', r.salary);
    tempR[i] := r; // backup, to show later
    write('Show data again (Y/N) ?');
    repeat
        c:=upcase(readkey);      { Ask user : Input again or not }
    until c in ['Y','N'];
    writeln(c);
  until c='N';
end;

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
  //  fWrite;
   fRead;
  for i := 1 to 2 do
  begin
    writeln('Name    = ', tempR[i].name);     { Input data }
    writeln('Address = ', tempR[i].address);
    writeln('Phone   = ', tempR[i].phone);
    writeln('Age     = ', tempR[i].age);
    writeln('Salary  = ', tempR[i].salary);
    writeln;
  end;
   close(F);
end.