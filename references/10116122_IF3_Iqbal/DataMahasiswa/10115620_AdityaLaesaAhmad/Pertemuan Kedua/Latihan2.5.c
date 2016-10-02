#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[])
{
  char s1[5];
  printf("Insert string 1: ");
  scanf("%[^\n]",&s1);
  printf("result 1 :%s\n",s1);
  /*Input : Insert string 1: ab cd
    Output : Result 1 :ab cd
  */
  system("PAUSE");	
  return 0;
}
