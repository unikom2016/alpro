#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[])
{
  
  //deklarasi nama dan alamat
  char nama[31];
  char alamat[51];
  
  //proses input nama
  printf("Masukan nama = ");
  fflush(stdin); gets(nama);
  
  //proses input alamat
  printf("masukan alamat = ");
  fflush(stdin); gets (alamat);
  
  //proses output
  printf("nama = %s \n", nama);
  printf("alamat = %s \n", nama);
  system("PAUSE");	
  return 0;
}
