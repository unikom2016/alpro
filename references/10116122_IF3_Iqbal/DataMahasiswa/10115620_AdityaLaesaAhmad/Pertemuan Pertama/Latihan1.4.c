#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]){
 int a,b,c,d,e,f,g;
 a = 2;
 b = 4;
 
 //Operator Aritmatika
 
 c = a + b;
 d = b - a;
 e = a * b;
 f = b / a;
 g = 3 % a;
 
 printf("a = b = %d + %d = %d\n",a , b , c );
 printf("b - a = %d - %d = %d\n",b , a , d );
 printf("a * b = %d * %d = %d\n",b , a , f );
 printf("3 mod a = 3 mod %d = %d\n",a ,g);
  system("PAUSE");	
  return 0;
}
