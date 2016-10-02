#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[])
{
  int alas, tinggi;
  float luas;
  
  printf("inputkan alas ! "); scanf("%i",&alas);
  printf("inputkan tinggi ! "); scanf("%i",&tinggi);
  luas = 0.5*alas*tinggi;
  printf("Luas Segitiga : 0.5 x %i x %i = %.2f \n",alas, tinggi, luas);
  system("PAUSE");	
  return 0;
}
