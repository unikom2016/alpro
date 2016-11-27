program Conversion;

uses math;

procedure menu(var c: integer);
begin
    writeln('Choices');
    writeln('--------');
    writeln('1. Binary -> Decimal, Octal, Hexa');
    writeln('2. Decimal -> Binary, Octal, Hexa');
    writeln('3. Octal -> Binary, Decimal, Hexa');
    writeln('4. Hexa -> Binary, Decimal, Octal');
    writeln('5. Hexa -> Exit!');

    write('What to convert? '); readln(c);
end;

procedure process_menu(c: integer);
begin
    case (c) of
        1: begin
            writeln('What you want to convert?');
            writeln('1. Binary to Decimal');
            writeln('2. Binary to Octal');
            writeln('3. Binary to Hexa');

            // write('Your answer? '); readln(bc);
        end;    
        0: begin
            writeln('Exited!');
        end;
    end;
end;

function binary_to_decimal(n: integer): real;
var
    r: real;
begin
    write('How much bit is active? '); readln(n);

    { Baris Geometri: Sn = a(1 - r^n) / 1 - r }

    // ratio = 2
    r := 2; 
    binary_to_decimal := (r**n - 1) / (r - 1);
    writeln(binary_to_decimal:10:0);
end;

var
    choices, data: integer;

begin
    // repeat
        // Show menu
        // menu(choices);
        binary_to_decimal(data);
    // until (choices = 0);
end.