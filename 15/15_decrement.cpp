#include <iostream>
#include <cstdlib>

using namespace std;

long fill( const unsigned int downs, const unsigned int rights )
{
  long sum=0;

  if( !downs && !rights )
    return 1;

  if( downs )
    sum += fill( downs-1, rights );

  if( rights )
    sum += fill( downs, rights-1 );
  
  return sum;
}

int main( const int argc, const char** argv )
{
  if( argc > 1 )
    cout << fill( atoi(argv[1])/2, atoi(argv[1])/2 ) << endl;

  return 0;
}
