#include <cstdlib>
#include <iostream>

using namespace std;

int main(int argc, char *argv[])
{
    //deklarasi variable
    int sisi;
    int luas;
    
    //proses input
    cout<<"masukan sisi = " ;
    cin>>sisi;
    
    //proses perhitungan
    luas = sisi * sisi;
    
    //proses output
    cout<<"luas persegi = "<<sisi<<" sama sengan "<<luas<<endl;// endl = end line
    
    system("PAUSE");
    return EXIT_SUCCESS;
}
