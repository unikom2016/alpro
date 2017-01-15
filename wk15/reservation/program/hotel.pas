program hotel;

uses
  crt;

{ Tipe Bentukan }
type
  Kamar = record
      tipe: string;
      status: integer;
      no: integer;
      // pajak, harga: double;
      harga: double;
    // function StatusKamar: integer;
    // function TipeKamar: string;
    // procedure TambahKamar;
  end;
  Tamu = record
    tipe_kamar: string;
    no_kamar: integer;
    // k: Kamar;
    nama, alamat, telp: string;
    check_in, check_out: TDateTime;
    pajak, bayar: double;

    // function NamaTamu: string;
    // function NomorKamarTamu: integer;
    // function IsiTamu: integer;
    // procedure TampilTamu;
  end;

  arr_kamar = array of Kamar;

{ Kamus Global }
var
  pesan: Kamar;

{ Prototype Procedure & Function }
{ Start Kamar }
procedure TambahKamar(var k: Kamar);
var
  c: integer;
begin
  clrscr;
  writeln('Nomor Kamar.:', k.no);
  writeln('1. Standard Twin');
  writeln('2. Standard Queen');
  writeln('3. Standard Twin (Sarapan)');
  writeln('4. Standard Queen (Sarapan)');
  write('Masukkan jenis kamar: ');
  readln(c);

  case (c) of
    1: 
    begin
      k.tipe := 'Standard Twin';
      k.harga := 500000;
    end;
    2: 
    begin
      k.tipe := 'Standard Queen';
      k.harga := 500000;
    end;
    3: 
    begin
      k.tipe := 'Standard Twin (Sarapan)';
      k.harga := 500000 + 87000;
    end;
    4: 
    begin
      k.tipe := 'Standard Twin (Sarapan)';
      k.harga := 500000 + 87000;
    end else
    begin
      writeln('Nomor tidak ada!'); readkey;
      TambahKamar(k); // recursive call
    end;
  end; // endcase
end; // tambah

procedure TampilKamar(k: Kamar);
var
  deskripsi: string;
begin
  clrscr;
  writeln('Nomor Kamar  : ', k.no);
  writeln('Tipe Kamar   : ', k.tipe);
  writeln('Harga Kamar  : Rp. ', k.harga:0:2);

  if (k.status = 0) then
  begin
    deskripsi := 'Tersedia';
  end else
  begin
    deskripsi := 'Tidak Tersedia';
  end;

  writeln('Status Kamar : ', deskripsi);
  write('Silakan tekan sembarang untuk lanjut!'); readkey;
end; // display
{ End Kamar }

{ Start Tamu }


function IsiTamu(t: Tamu): integer;
var
  f: integer;
begin
  clrscr;
  writeln('Nama Tamu              : ', t.nama);
  writeln('Alamat Tamu            : ', t.alamat);
  writeln('Nomor Telepon Tamu     : ', t.telp);
  t.check_in := Now; // get current date
  f := BacaTamu(t.no_kamar, t.tipe_kamar , t.pajak , t.bayar, t.check_out);
  IsiTamu := f;
end; // IsiTamu

procedure TampilTamu(t: Tamu);
var
  total: double;
begin
  clrscr;
  writeln('Customer Name       : ', t.nama);
	writeln('\nCustomers phone number: ', t.telp);
	writeln('\nRoom No.              : ', t.no_kamar);
	writeln('\nRoom Type             :  ', t.tipe_kamar);
  total := t.bayar + (t.pajak;
	writeln('\nTotal Rent            :  ', total);
	writeln('\nAdvance               :  ', );
	cout<<adamt;
	writeln('\nBalance               :  ', );
	cout<<bal;

	printf("\nThe Check in year is : %d\n", check_in.da_year);
	printf("\nThe Check in Month is: %d\n", check_in.da_mon);
	printf("\nThe Check in Date is : %d\n", check_in.da_day);

	printf("\nThe checkout year is : %d\n", check_out.da_year);
	printf("\nThe checkout Date is : %d\n", check_out.da_day);
	printf("\nThe checkout Month is: %d\n", check_out.da_mon);
end;
{ End Tamu }

begin
  TambahKamar(pesan);
  TampilKamar(pesan);
end.