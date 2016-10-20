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