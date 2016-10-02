#include <stdio.h>
#include <stdlib.h>
//-----------------------------OPERATOR----------------------------
int main(int argc, char *argv[]){
  int a=4, b=2, c;
  int d=5;
  int e=6, f=3;
  int g=7, h=2;
  int i=8, j=4;
  int k=9, l=5;
  
  c = a+b;
  printf("%d\n",c); 
  
  d += 1;
  printf("%d\n",d); 
  
  e -= f;
  printf("%d\n",e); 
  
  g *= h;
  printf("%d\n",g); 
  
  i /= j;
  printf("%d\n",i); 
  
  k %= 1;
  printf("%d\n",k); 
  
  system("PAUSE");	
  return 0;
}
