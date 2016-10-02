#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[])
{
    int JumlahAnak;
    float GajiKotor,Tunjangan,PersenTunjangan,Potongan=0.2,
    PersenPotongan = 0.05;
 
    printf("Gaji Kotor  : "); scanf("%f",&GajiKotor);
    printf("Jumlah Anak : "); scanf("%d",&JumlahAnak);
    
    if(JumlahAnak > 2)(    PersenTunjangan = 0.3;,
    PersenPotongan  = 0.07;
    
    Tunjangan = PersenTunjangan * GajiKotor;
    Potongan  = PersenPotongan  * GajiKotor;
    
    printf("\nBesarnya Tunjangan = Rp. %.2f\n",Tunjangan);
    printf("Besarnya Potongan = Rp. %.2f\n,",Potongan);
  system("PAUSE");	
  return 0;
}
