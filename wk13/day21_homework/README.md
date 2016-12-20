procedure sort_asc(input size: integer)
{ I.S.: }
{ F.S.: }
{ Kamus }
  i: integer
  kd_sementara: string // kode buku kd_sementara
  bertukar: boolean
{ Algoritma }
// bubble sort
repeat
  bertukar <- false
  for i <- 1 to (size - 1) do
    if (buku(i).kd_buku > buku(i + 1).kd_buku) then
      kd_sementara <- buku(i).kd_buku
      buku(i).kd_buku <- buku(i + 1).kd_buku
      buku(i + 1).kd_buku <- kd_sementara
      bertukar <- true
    endif
  endfor
until (bertukar)
// end of bubble sort
endprocedure

procedure sort_desc(input size: integer)
{ I.S.: }
{ F.S.: }
{ Kamus }
  i: integer
  kd_sementara: string // kode buku kd_sementara
  bertukar: boolean
{ Algoritma }
// bubble sort
repeat
  bertukar <- false
  for i <- 1 to (size - 1) do
    if (buku(i).kd_buku < buku(i + 1).kd_buku) then
      kd_sementara <- buku(i).kd_buku
      buku(i).kd_buku <- buku(i + 1).kd_buku
      buku(i + 1).kd_buku <- kd_sementara
      bertukar <- true
    endif
  endfor
until (bertukar)
endprocedure

{ Judul }
Data_perpustakaan

{ Kamus Global }
const
  sandi = '1234!'
  // maks_buku = 10

type
  d_buku = record
    kd_buku, nm_buku, pengarang: string;
    tahun: integer
  endrecord

  arr_buku = array[] of d_buku; // array dinamis

buku: arr_buku;
kesempatan: integer;
// prototype
procedure sort(input pilihan: string)
procedure tampil_data()

{ Algoritma }
repeat
  input(user, password);
  while (password <> sandi) do
    kesempatan <- kesempatan + 1
    output('kamu salah, sisa ', kesempatan, ' lagi!')
  endwhile

  if (user <> '') then
    output('Menu pilihan')
    input(menu)
    
    while (menu <> 1) or (menu <> 2) or (menu <> 0) do
      output('pilihan hanya ada 1, 2, 0')
    endwhile

    dependon (menu)
      1: 
        // setlength(0, x);
        output('isi data buku')
        repeat
          jml <- jml + 1
          while (jml = maks_buku) do
            output('tidak bisa memasukkan data buku!')
          endwhile

          output('|kode buku|nama buku|tahun|pengarang|')
          input(buku(jml).kd_buku, buku(jml).nm_buku, buku(jml).tahun, buku(jml).pengarang)
          output('isi data lagi? y/n');
          input(pilihan);
        until(pilihan = 'n')
      2:
        output('tampil data urutkan secara: (asc / desc)')
        input(pilihan)
        if (pilihan = asc) then
          sort_asc(jml)
          tampil_data();
        elseif (pilihan = desc) then
          sort_desc(jml)
          tampil_data();
        endif
      0:
        output('terima kasih telah mengisi data buku')
        break

    enddepend
  endif
until(kesempatan > 3)