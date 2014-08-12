#include <stdio.h>

int main( )
{
  int sumnum = 0;
  int num    = 1000;
  int i;

  for( i=0; i<num; i++ )
  {
    if( i % 3 == 0 || i % 5 == 0 )
      sumnum += i;
  }

  printf( "%d\n", sumnum );

  return 0;
}
