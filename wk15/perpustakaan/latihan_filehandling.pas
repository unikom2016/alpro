program MengolahDataBuku;
{I.S.: user memasukan data buku}
{F.S.: menampilka data buku yang sudah terurut}
uses
crt, sysutils;
const
  MaksBuku = 20;
  // nama_file = 'E:\DataMahasiswa\Tugas\Alpro\file_test\data_buku.txt';
  nama_file = 'data_buku.txt';
type
  DataBuku = record
    KodeBuku,NamaBuku : string;
    Tahun, Pengarang  : string;
  end;
  Buku = array[1..MaksBuku] of DataBuku;
var
  BK     : Buku;
  N,Menu : integer; //banyaknya data buku
  NP,KS  : string;  //NP : Nama Pengguna, KS : Kata Sandi
  NmP    : string;  //Nama Pengarang
  file_buku   : file of databuku;
  isOpened: boolean;
  i:integer;

procedure OpenBook;
var
  i: integer;
begin
  Assign(file_buku, nama_file);
  {$I-} // disable i/o checking
  Reset(file_buku); // read the files
  {$I+} // enable i/o checking
  if (IOResult <> 0) then // error occured
  begin
    Rewrite(file_buku); // start all over again, and create a new files
  end else
  begin
    i := 1;
    N := FileSize(file_buku); // total data inside files
    Seek(file_buku, 0); // looking for index 0 in the files
    while not EOF(file_buku) do // while there's not end of line, keep searching
    begin
      Seek(file_buku, i - 1); // remember, starts from 0
      Read(file_buku, BK[i]); // store from file to memory, in this case to BK variable
      Inc(i); // same logic as i := i + 1;
    end; // end while
  end; // end if
  
  isOpened := true;
end; // end OpenBook

procedure CloseBook;
begin
  if (isOpened) then
  begin
    Close(file_buku); // don't forget to close the book, to prevent unexpected things memory allocation
  end;
end;

procedure tambah;
var
  jml: integer;
begin
  write('masukkan jumlah data'); readln(jml); // use local variable, to store the amount of data we want to input
  OpenBook;
  for i:=1 to jml do
  begin
    write('kude buku : ');readln(bk[i + n].kodebuku);
    write('nama buku : ');readln(bk[i + n].Namabuku);
    write('tahun     : ');readln(bk[i + n].tahun);
    write('pengarang : ');readln(bk[i + n].pengarang);
    Seek(file_buku, FileSize(file_buku));
    write(file_buku, bk[i + n]); // we acts i + n, due to the previous OpenBook already store the data to memory until "n"
    // to prevents data loss in memory, and access violation
  end;
  CloseBook;
end;

procedure tampil;
begin
  OpenBook;
  for i := 1 to N do
  begin
    writeln('kude buku : ',bk[i].kodebuku);
    writeln('nama buku : ',bk[i].Namabuku);
    writeln('tahun     : ',bk[i].tahun);
    writeln('pengarang : ',bk[i].pengarang);
  end;
  CloseBook;
end;

begin
  OpenBook;
  CloseBook;
  clrscr;
  tambah;
  readkey;
  clrscr;
  tampil;
  readkey;
end.
