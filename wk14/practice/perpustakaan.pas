program CreateFile;
 
uses
 crt, Sysutils, regexpr;

Type
	Str25    = String[25];
	TBookRec = Record
        Title, Author, ISBN : Str25;
        Price : Real;
    End;

    ArrayBook = Array[1..10] of TBookRec;

Var
    RegexObj     : TRegExpr;
	bookRecArray : ArrayBook;
	bookRecFile  : File of TBookRec;
	i            : byte;
    jml, menu    : integer;
    dataSearch   : String;

    procedure OpenBook;
    var 
        i : integer;
    begin
        Assign(bookRecFile, 'book2.txt');
        {$I-} Reset(bookRecFile);
        {$I+} if (IOResult <> 0) then
                Rewrite(bookRecFile)
            else
            begin
                i := 1;
                jml := filesize(bookRecFile);
                seek(bookRecFile, 0);
                while not eof(bookRecFile) do
                begin
                    seek(bookRecFile, i-1);
                    Read(bookRecFile, bookRecArray[i]); 
                    i := i + 1;
                end;
            end;
    end;

    Procedure EnterNewBook;
    var
        jml_input : integer;
    Begin
        OpenBook;
        write('jumlah : '); Readln(jml_input);
        for i := 1 to jml_input do
        begin
            Write('ISBN: '); Readln(bookRecArray[i].ISBN);
            Write('Book Name: '); Readln(bookRecArray[i].Title);
            Write('Author: '); Readln(bookRecArray[i].Author);
            Write('Price: '); Readln(bookRecArray[i].Price);   
            Seek(bookRecFile, filesize(bookRecFile));
            write(bookRecFile, bookRecArray[i]);
        end;
        close(bookRecFile);
    End;

    procedure Sort;
    var
        i, j : integer;
        temp : TBookRec;
    begin
        OpenBook;
        for i := 1 to (jml-1) do
        begin
            for j := jml downto (i+1) do
            begin
                if(bookRecArray[j].ISBN < bookRecArray[j-1].ISBN) then
                begin
                    temp    := bookRecArray[j];
                    bookRecArray[j]   := bookRecArray[j-1];
                    bookRecArray[j-1] := temp;
                end;
            end;
        end;
    end;

    procedure Overwrite;  
    begin
        Rewrite(bookRecFile);
        for i := 1 to jml do
        begin
            Seek(bookRecFile, i-1);
            write(bookRecFile, bookRecArray[i]);
        end;
    end;

    procedure Search;
    var
        i, j, k   : integer;
        temp      : ArrayBook;
    begin
        OpenBook;
        Write('Search Author : '); readln(dataSearch);
        RegexObj := TRegExpr.Create;
        RegexObj.Expression := dataSearch;
        i := 1;
        k := 0;
        while (i <= jml) do
        begin
            if RegexObj.Exec(bookRecArray[i].Author) then
            begin
                k := k + 1;
                temp[k] := bookRecArray[i];
            end;
            i := i + 1;
        end;
        
        if (k > 0) then
        begin
            for j := 1 to k do
            begin
                Write('Author : ', temp[j].Author);
                Writeln(temp[j].ISBN,' ',temp[j].Title,' ',temp[j].Author,' ',temp[j].Price:0:0);
            end;
        end
        else
            write('Data not found!');

        close(bookRecFile);
        RegexObj.Free;
    end;
    
    procedure ShowBook;
    begin
        for i := 1 to jml do
        begin
            Writeln(bookRecArray[i].ISBN,' ',bookRecArray[i].Title,' ',bookRecArray[i].Author,' ',bookRecArray[i].Price:0:0);
        end;
    end;

Begin
repeat
    Writeln('Main Menu');
    Writeln('=========');
    write('Pilih menu : '); readln(menu);
    case menu of
        1 : begin
            clrscr;
            EnterNewBook; readln;
        end;

        2 : begin
            clrscr;
            Search; readln;
        end;   
        
        3 : begin
            Sort;
            Overwrite;
            ShowBook;
        end;
    end;
until (menu = 0);
End.