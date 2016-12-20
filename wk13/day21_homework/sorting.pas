program sorting_practice;

const
  maks_data = 15;

var
  { Bubble Sort }
  bertukar: boolean;
  i, j, temp, tahap, tukar: longint;

  { Selection Sort }
  min: longint;
  data: array[1..maks_data] of longint;

procedure isi_data;
begin
  for i := 1 to maks_data do begin
    data[i] := random(maks_data) + 1;
  end;
end;

procedure bubble_sort_bool;
begin
  for i := 1 to (maks_data - 1) do begin
    tahap := tahap + 1;
    writeln(tahap);
    bertukar := false;
    for j := maks_data downto i + 1 do begin
      if (data[j] < data[j - 1]) then begin
        temp := data[j];
        data[j] := data[j - 1];
        data[j - 1] := temp;
        bertukar := true;
      end;
    end;

    if (not bertukar) then begin
      break;
    end;
  end;
end;

procedure bubble_sort;
begin
  for i := 1 to (maks_data - 1) do begin
    tahap := tahap + 1;
    writeln(tahap);
    for j := maks_data downto i + 1 do begin
      if (data[j] < data[j - 1]) then begin
        temp := data[j];
        data[j] := data[j - 1];
        data[j - 1] := temp;
      end;
    end;
  end;
end;

procedure selection_sort;
begin
  case (based_on) of
    'asc': begin
      for i := 1 to (maks_data - 1) do begin
        min := i;
        for j := i + 1 to maks_data do begin
          if (data[j] < data[min]) then begin
            min := j;
          end;
        end;
        temp := data[i];
        data[i] := data[min];
        data[min] := temp;
      end;
    end;
  end;
end;

procedure tampil_data;
begin
  for i := 1 to maks_data do begin
    writeln(data[i]);
  end;
end;

begin
  tahap := 0;
  tukar := 0;
  // isi data
  isi_data;

  // sort data
  // bubble_sort;  
  // bubble_sort_bool;
  selection_sort;

  // sorted data
  tampil_data;
end.