#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[])
{
  const float phi = 3.14;
  int jari;
  float luas;
  
  printf("Inputkan jari-jari nya !"); 
  scanf("%i", &jari);
  
  luas = phi*jari*jari;
  
  printf("Luas Lingkaran : %.2f x %i = %.2f \n",phi, jari, luas);
  
  system("PAUSE");	
  return 0;
}
