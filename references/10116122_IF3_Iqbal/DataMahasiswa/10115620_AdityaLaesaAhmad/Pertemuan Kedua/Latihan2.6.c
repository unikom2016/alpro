#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]){
    int JumlahAnak;
    float GajiKotor,Tunjangan,PersenTunjangan=0.2;
    
    printf("Gaji Kotor  : "); scanf("%f",&GajiKotor);
    printf("Jumlah Anak : "); scanf("%d",&JumlahAnak);
    
    if(JumlahAnak > 2) PersenTunjangan = 0.3;
    Tunjangan = PersenTunjangan * GajiKotor;
    
    printf("\nBesarnya Tunjangan = Rp. %.2f\n",Tunjangan);
  
  system("PAUSE");	
  return 0;
}
