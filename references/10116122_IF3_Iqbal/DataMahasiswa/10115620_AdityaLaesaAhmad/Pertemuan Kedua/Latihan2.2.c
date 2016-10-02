#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]){
    char k[9]= "bahasa C";
    
    printf("%s\n",k);
    printf("%15s\n",k);    //Output Bahasa C
    printf("%-15s\n",k);   //Output        Bahasa C
    printf("%15.5s\n",k);  //Output Bahasa C
    printf("%-15.5s\n",k); //Output         Bahas
  
  system("PAUSE");	
  return 0;
}
