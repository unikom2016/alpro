#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[])
{

  int a;
  
  printf("Masukan Nilai : "); scanf("%d",&a);
  
  if (a % 2==0)
  printf("Nilai yang anda masukan Bernilai Genap %d\n",a);
  else
  printf("Nilai yang anda masukan bernilai Ganjil %d\n",a);
     
  
  
  system("PAUSE");	
  return 0;
}
