program typed_files;
uses crt;
type newrec = record
                    name:string[50];
                    job:string[20];
              end;

var one:newrec;
    f:file of newrec;
    is_created:boolean;
    choice:char;
    
procedure press;
begin
     write('Press enter to continue');
     readln;
end;

procedure create_file;
begin
     assign(f,'myfile.dat');
     {$I-}
     rewrite(f);
     {$I+}
     if ioresult <> 0 then begin
         writeln('error when creating a new file');
         is_created:=false;
         press;
     end;
     is_created:=true;
     writeln('file created');
     press;
end;




procedure add_new(x:newrec);

procedure gathering;  (*local proc*)
begin
     (*gathering data*)
     write('Name: ');
     readln(x.name);
     write('Job: ');
     readln(x.job);
end;

begin
    if is_created then begin
        writeln('the file contains: ',filesize(f),' elements');
        if filesize(f) = 0 then begin (*so the file created but empty*)
           seek(f,0);(*jump to the begining of the file*)
           gathering;
           (*then write in*)
           write(f,x);
        end else begin (*else jump after the last element*)
           seek(f,filesize(f));
           writeln('this is the ',filesize(f)+1,'. element: ');
           gathering;
           write(f,x);
        end;
    end else writeln('first create a new file');
    press;
end;

procedure read_back;
var i:word;
begin
    if is_created then begin
       i:=0;
       reset(f);
       seek(f,i);
       writeln('the contents of the file are: ');
       while not eof(f) do begin
             read(f,one);(*read one element*)
             with one do begin
                  writeln('---');
                  writeln(i,'.element:   Name: ',name,' , Job: ',job);
             end;
             inc(i);
       end;
    end else writeln('first create a new file');
    press;
end;


begin
     is_created:=false;
     repeat
           clrscr;
           writeln('(C)reate a new file');
           writeln('(A)dd new element to the file');
           writeln('(R)ead back');
           writeln('(Q)uit');
           write('choice: ');
           readln(choice);
           choice:=upcase(choice);
           case choice of
                'C':create_file;
                'A':add_new(one);
                'R':read_back;
           end;
     until choice = 'Q';
     close(f);
     writeln('file closed');
     press;
end.

(*
1,first press 'c' to create a new typed file
2,press 'a' to add new elements to that file
3,repeat 2. option three times or more
4,press 'r' to read back the contents of that file
5,press 'q' if you want to quit
-
when you first run my program and create myfile.dat then you can modify
the main program
is_created:=true;
and then comes the repeat section...
then you do not need every run (session) to create a new file
but be careful,the file must be created first!!!!
-
*)
(*created by FlamingClaw 2010.02.11*)