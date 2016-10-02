    { Judul }
    Menghitung_diskon_dari_total_belanja

    {I.S. : User memasukkan total belanja}
    
	{F.S. : Menampilkan harga diskon, dan total belanja setelah dikurangi harga diskon}

    { Kamus }
    Diskon : real
    TotalBelanjaPembeli, TotalDiskonBelanja, HargaDiskon : integer

    { Algoritma }
    Diskon <- 0.25

	{ Input }
	Input(TotalBelanjaPembeli)
	
    { Proses }
    MaximumPembelian <- 100000

	{ Kondisi (Pemilihan) }
	If (TotalBelanjaPembeli > MaximumPembelian)
	    Then
            HargaDiskon <- Round(TotalBelanjaPembeli * Diskon)
            TotalDiskonBelanja <- TotalBelanjaPembeli - HargaDiskon
	EndIf

	{ Output }
	Output(HargaDiskon, TotalDiskonBelanja);