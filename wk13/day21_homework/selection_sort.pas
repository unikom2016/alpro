program bubble_sort;

const
  maks_data = 10;

var
  i, j, min, temp, tahap, tukar: longint;
  data: array[1..maks_data] of longint;

begin
  // isi data
  for i := 1 to maks_data do begin
    data[i] := (random(maks_data) + 1) * i;
  end;

  // previous dataa
  for i := 1 to maks_data do begin
    // writeln(data[i]);
  end;

  // selection sort data
  tahap := 0;
  for i := 1 to (maks_data - 1) do begin
    min := i;
    tahap := tahap + 1;
    // writeln(tahap);
    for j := i + 1 to maks_data do begin
      if (data[j] < data[min]) then begin
        min := j;
      end;
    end;
    temp := data[i];
    data[i] := data[min];
    data[min] := temp;
  end;

  // sorted data
  for i := 1 to maks_data do begin
    writeln(data[i]);
  end;
end.