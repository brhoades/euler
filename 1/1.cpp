#include <iostream>

using namespace std;

int main( )
{
  int sumnum = 0;
  int num    = 1000;

  for( int i=0; i<num; i++ )
  {
    if( i % 3 == 0 || i % 5 == 0 )
      sumnum += i;
  }

  cout << sumnum << "\n";
  return 0;
}
