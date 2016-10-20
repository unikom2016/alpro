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
        Procedure masukkan_latihan(Input i: integer; Output gigi, kecepatan: integer);
            {I.S. : Melakukan latihan motor}
            {F.S. : Menghasilkan latihan perhari}

            { Kamus }
                // tidak ada

            { Algoritma }
                Output(i) // Hari ke-i
                Input(g, v); // gigi motor dan kecepatan
        EndProcedure // masukkan_latihan

        Procedure periksa_latihan(Input gigi, kecepatan: integer; Output hasil, temp_hasil: string);
            {I.S. : Memeriksa hasil latihan dari tiap hari yang sudah terdefinisi}
            {F.S. : Menampilkan kelayakan mengendarai motor atau tidak}

            { Kamus }
                // tidak ada

            { Algoritma }
                hasil <- ''
                If (gigi = 4) and (kecepatan >= 80)
                    Then
                    hasil <- 'Benar'
                Else
                    If (gigi = 3) and ((kecepatan > 60) and (kecepatan < 80))
                        Then
                        hasil <- 'Benar'
                Else
                    If (gigi = 2) and ((kecepatan > 40) and (kecepatan < 60))
                        Then
                        hasil <- 'Benar'
                Else
                    If (gigi = 1) and ((kecepatan > 0) and (kecepatan < 40))
                        Then
                        hasil <- 'Benar'

                If (hasil = 'Salah')
                    Then
                    temp_hasil <- hasil

                Outpu(hasil); // munculkan Salah atau Benar        
        EndProcedure // periksa_latihan

        Procedure tampilkan_latihan(Input hasil, temp_hasil: string);
            {I.S. : Mendapat total keberhasilan yang telah terdefinisi }
            {F.S. : Menampilkan keterangan boleh menggunakan motor atau tidak}

            { Kamus }
                // tidak ada

            { Algoritma }
                If (temp_hasil = 'Salah')
                    Then
                    Output('Maaf, kamu belum layak');
                Else
                    Output('Selamat, kamu layak');

        EndProcedure // tampilkan_latihan
    { End of Sub-routine / Sub-program }

    { Judul }
        Uji_kelayakan_mengendarai_motor

    {I.S. : Latihan menggunakan motor}
    {F.S. : Menampilkan kelayakan mengendarai motor}

    { Kamus }
        hari = 6;

        i, gigi, kecepatan: integer;
        hasil, temp_hasil: string;

        { Prototype } // dalam notasi algoritma, prosedur dalam kamus disebut prototype
            Procedure masukkan_latihan(Input i: integer; Output gigi, kecepatan: integer);
            Procedure periksa_latihan(Input gigi, kecepatan: integer; Output hasil, temp_hasil: string);
            Procedure tampilkan_latihan(Input hasil, temp_hasil: string);
        
    { Algoritma }
        // For looping, paling sederhana
        For i <- 1 to hari Do
            { Input }
            masukkan_latihan(i, gigi, kecepatan)
            { Proces }
            periksa_latihan(gigi, kecepatan)
        EndFor

        { Output }
        tampilkan_latihan(hasil, temp_hasil)
    { End of Main Algorithm }