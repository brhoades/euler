#include <iostream>
#include <cstdlib>

using namespace std;

long long sum = 0;
int size = 0;
int halfsize;

void fill( const int downs, const int rights )
{
  if( downs + rights == size )
  {
    sum++;
    return;
  }

  if( downs < halfsize )
    fill( downs+1, rights );

  if( rights < halfsize )
    fill( downs, rights+1 );
}

int main( const int argc, const char** argv )
{
  if( argc > 1 )
  {
    size = atoi(argv[1]);
    halfsize = size/2.f;
    fill( 0, 0 );
    cout << sum << endl;
  }

  return 0;
}
