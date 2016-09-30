#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[])
{
  
  // deklarasi
  int sisi = 5;
  int luas = 25;
  
  // input
  // sisi 
  printf("Masukkan sisi persegi = ");
  scanf("%i", &sisi);
  
  // hitung luas
  luas = sisi * sisi;
  
  printf("%i x %i = %i \n", sisi, sisi, luas);
  
  system("PAUSE");	
  return 0;
}
