{$mode delphi}
program test_untyped;
{ A crude database recording }
uses crt, sysutils;

type { Class object }
  Generic<T> = class
    procedure fRead(var F: T; var r: T);
    procedure fWrite(var F: T; var r: T);
  end;

procedure Generic.fRead(var F: T; var r: T);
begin
  clrscr;
  // seek(F, 0);
  writeln('berapa nilai total: ', total);
  writeln('File position : ', filepos(F));
  blockRead(F, r, sizeOf(r));
  readln;
end; // end fRead

procedure Generic.fWrite(var F: T; var r: T);
begin
  clrscr;
  seek(F, filesize(F));
  writeln('berapa nilai total: ', total); readln;
  writeln('File position : ', filepos(F));
  blockWrite(F, r, sizeOf(r)); { Write data to file }
end; // end fWrite

// procedure fDelete;
// var
//   nama: string;
//   delElement: integer;
//   tempR: Temployee;
// begin
//   seek(F, 0);
//   write('search your data by name: '); readln(nama);
//   while not eof(F) do
//   begin
//     writeln('file position: ', filePos(F));
//     blockRead(F, tempR, sizeOf(Temployee));
//     if (nama = tempR.name) then
//     begin
//       delElement := filePos(F);
//     end else
//     begin
//       // seek(F, )
//       blockWrite(F, tempR, sizeOf(Temployee));
//     end;
//   end;
// end; // end fDelete

type
  Temployee = record
    name    : string[20];
    address : string[40];
    phone   : string[15];
    age     : byte;
    salary  : longint;
  end;
  arr_employee = array[1..100] of Temployee;
  Employee = Generic<Temployee>;

var
   F : File; // Untyped files
   c : char; // choices
   dR, realR : arr_employee;
   s : string; // file name
   n, j, total : integer; // total data

procedure loadEmployee(var realR: arr_employee; var total: integer);
begin
  total := 0;
  seek(F, 0); // necessary before fRead;
  repeat
    inc(total);
    // writeln('berapa nilai total: ', total); readln;
    // writeln('File position : ', filepos(F));
    fRead(F, realR[total]);
    // blockRead(F, realR[total], sizeOf(realR[total]));
    writeln('Name    = ', realR[total].name);     { Input data }
    writeln('Address = ', realR[total].address);
    writeln('Phone   = ', realR[total].phone);
    writeln('Age     = ', realR[total].age);
    writeln('Salary  = ', realR[total].salary);
    write('Load more data (Y/N) ?');
    repeat
        c:=upcase(readkey);      { Ask user : Input again or not }
    until c in ['Y','N'];
    writeln(c);
  until c='N';
end;

procedure inputEmployee(var realR: arr_employee; var total: integer);
begin
  repeat
    inc(total);
    write('Name    = '); readln(realR[total].name);     { Input data }
    write('Address = '); readln(realR[total].address);
    write('Phone   = '); readln(realR[total].phone);
    write('Age     = '); readln(realR[total].age);
    write('Salary  = '); readln(realR[total].salary);
    fWrite(F, realR[total]);
    write('Input data again (Y/N) ?');
    repeat
        c:=upcase(readkey);      { Ask user : Input again or not }
    until c in ['Y','N'];
    writeln(c);
  until c='N';
end;

procedure display(realR: arr_employee);
begin
  writeln('nilai total saat ini: ', total); readln;
  for j := 1 to total do
  begin
    clrscr;
    writeln('Name    = ', realR[j].name);     { Input data }
    writeln('Address = ', realR[j].address);
    writeln('Phone   = ', realR[j].phone);
    writeln('Age     = ', realR[j].age);
    writeln('Salary  = ', realR[j].salary);
    readln;
  end;
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
   end else
   begin                  { If it exists then }
      n:=filesize(F);     { Calculate total record }
      // seek(F,n);          { Move file pointer PAST the last record }
   end;

   fileMode := 2;
   reset(F, sizeOf(Temployee));
   loadEmployee(realR, total);
  //  inputEmployee(realR, total);
   // fDelete;
   display(realR);
  close(F);
end.