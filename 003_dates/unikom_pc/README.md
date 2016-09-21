ALGORITMA

Judul

{I.S. : }
{F.S. : }

Kamus

Algoritma
    Input(JumlahDetik);
    
    // Proses Hari
    Hari <- JumlahDetik div DETIK_PER_HARI
    SisaDetik <- JumlahDetik mod DETIK_PER_HARI

    // Proses Jam
    Jam <- SisaDetik div DETIK_PER_JAM
    SisaDetik <- SisaDetik mod DETIK_PER_JAM

    // Proses Jam
    Jam <- SisaDetik div DETIK_PER_JAM
    SisaDetik <- SisaDetik mod DETIK_PER_JAM

