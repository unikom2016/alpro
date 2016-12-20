program bubble_sort;

const
  maks_data = 100;

var
  bertukar: boolean;
  i, j, temp, tahap, tukar: longint;
  data: array[1..maks_data] of longint;

begin
  // isi data
  for i := 1 to maks_data do begin
    data[i] := random(100) + 1;
  end;

  // sort data
  // for i := 1 to maks_data do begin
  //   writeln(data[i]);
  // end;
  tahap := 0;
  tukar := 0;
  for i := 1 to (maks_data - 1) do begin
    tahap := tahap + 1;
    writeln(tahap);
    bertukar := false;
    for j := 1 to (maks_data - 1) do begin
      if (data[j] > data[j + 1]) then begin
        temp := data[j];
        data[j] := data[j + 1];
        data[j + 1] := temp;
        bertukar := true;
      end;
    end;

    if (not bertukar) then begin
      break;
    end;
  end;
end.