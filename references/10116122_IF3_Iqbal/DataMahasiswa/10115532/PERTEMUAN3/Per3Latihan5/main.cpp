#include <cstdlib>
#include <iostream>

using namespace std;

int main(int argc, char *argv[])
{
    int sisi;
    int luas;
    
    // input sisi c++
    cout<<"Masukkan sisi = ";
    cin>>sisi;
    
    //hitung luas
    luas = sisi * sisi;
    
    // output luas
 
    cout<<sisi <<" x " <<sisi <<" = "<<luas<<endl; // end line
    
    system("PAUSE");
    return EXIT_SUCCESS;
}
