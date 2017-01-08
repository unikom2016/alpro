procedure hotel;

const
  jmlMaks = 100;

type
  tipe = record
    id, deskripsi: string;
  end;

  kamar = record
    id: string;
    tipeKamar: tipe;
    kapasitas: integer;
  end;

  tamu = record
    id, nama: string;
  end;

  reservasi = record
    id: integer;
    dataTamu: tamu;
    dataKamar: kamar;
    tanggalAwal, tanggalAkhir: date;
    pembayaran: integer;
    gagalPesan: boolean;
  end;

  arrReservasi = array [1..jmlMaks] of reservasi;

var
  dataReservasi: arrReservasi;
  arsipReservasi: file of reservasi;

begin
  Open(arsipReservasi, 1);
  dataReservasi.id := 1;
  dataReservasi.dataTamu.id := 1;
  dataReservasi.dataTamu.nama := 'mochadwi';
  dataReservasi.dataKamar.id := 1;
  dataReservasi.dataKamar.tipeKamar.id := 1;
  dataReservasi.dataKamar.tipeKamar.deskripsi := 'single, wifi, laundry dan breakfast';
  dataReservasi.dataKamar.kapasitas := 10;

  Fwrite(arsipReservasi, dataReservasi);

  // writeln('reservasi id: ', dataReservasi);
end.