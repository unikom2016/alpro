program array_dalam_record;

type
  kamar = record
    tipe: string; // standard, vip, exclusive
    jenis: string; // double, single
    stok: integer;
    harga: integer;
  end;
  fasilitas = record
    layanan: string;
    harga: integer;
  end;

begin

  // tabel, fasilitas
  // resepsionis, masukkin fasilitas tamu
  readln(fasilitas[i].layanan); // 1
  i := 1;
  found := false;
  while not found do // searching
  begin
    // hanya boleh pilih satu
    // 1. wifi; 2. laundry; 3. breakfast
    total_harga := 0;
    case (fasilitas[i].layanan) of
      1:
      begin 
        total_harga := kamar[i].harga + fasilitas[i].harga;
      end;
      2:
      begin 
        total_harga := kamar[i].harga + fasilitas[i].harga;
      end;
      3:
      begin 
        total_harga := kamar[i].harga + fasilitas[i].harga;
      end;
    end;
    inc(i);
  end;

  writeln(total_harga); // hasil dari 
end.