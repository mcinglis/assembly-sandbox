
// Based on code at: <http://cs.lmu.edu/~ray/notes/gasexamples/>

#include <stdio.h>

double sum( double const * xs, size_t n );

int main( void )
{
    double xs[] = { 40.5, 26.7, 21.9, 1.5, 0.2398, -40.52, -23.4 };
    printf( "%20.7f\n", sum( xs, 7 ) );
    printf( "%20.7f\n", sum( xs, 2 ) );
    printf( "%20.7f\n", sum( xs, 0 ) );
    printf( "%20.7f\n", sum( xs, 3 ) );
}

