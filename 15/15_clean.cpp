#include <iostream>
#include <cstdlib>

using namespace std;

int fill( const int downs, const int rights, const int size )
{
  int sum=0;

  if( downs + rights == size )
    return 1;

  if( downs < size/2 )
    sum += fill( downs+1, rights, size );

  if( rights < size/2 )
    sum += fill( downs, rights+1, size );
  
  return sum;
}

int main( const int argc, const char** argv )
{
  if( argc > 1 )
    cout << fill( 0, 0, atoi(argv[1]) ) << endl;

  return 0;
}
