    ### Soal:
    Sumin dibelikan motor, tapi harus latihan dulu. Ketentuannya:
    1. Gigi 1: 0 - 40 km/h
    2. Gigi 2: 41 - 60 km/h
    3. Gigi 3: 61 - 80 km/h
    4. Gigi 4: >= 80 km/h

    Latihan dilaksanakan 6 hari, Sumin boleh menggunakan motor kalau dalam 6 hari "Benar" semua.
    Misal, Sumin mengendarai menggunakan Gigi 1 dengan kecepatan 35 km/h, maka sumin dinyatakan lulus di hari itu.
    Begitu seterusnya.

    ### Output
    Hari ke-1
    Gigi        : 1
    Kecepatan   : 35
    Hasil       : Benar

    s/d

    Hari ke-6
    Gigi        : 2
    Kecepatan   : 40
    Hasil       : Salah

    Maaf, kamu belum layak menggunakan motor

    #### Algo #####
    { Procedure }
        Procedure masukkan_latihan(i: integer; var g, v: integer);
            {I.S. : Membelikan motor}
            {F.S. : Menampilkan kelayakan mengendarai motor}        
        EndProcedure
        Procedure periksa_latihan(i: integer; var g, v: integer);
        Procedure tampilkan_latihan(i: integer; var g, v: integer);

    { Judul }
        Uji_kelayakan_mengendarai_motor

    {I.S. : Membelikan motor}
    {F.S. : Menampilkan kelayakan mengendarai motor}

    { Kamus }
        hari = 2;

        i, gigi, kecepatan: integer;
        hasil, temp_hasil: string;
        Procedure masukkan_latihan(i: integer; var g, v: integer);
        Procedure periksa_latihan(i: integer; var g, v: integer);
        Procedure tampilkan_latihan(i: integer; var g, v: integer);
        
    { Algoritma }
        { Input }