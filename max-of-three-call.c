
// Demonstrates calling a function (max_of_three) implemented in assembly.

// Based on code at: <http://cs.lmu.edu/~ray/notes/gasexamples/>


#include <stdio.h>      // printf
#include <inttypes.h>   // int64_t, PRId64


int64_t max_of_three( int64_t, int64_t, int64_t );


int main( void )
{
    printf( "%" PRId64 "\n", max_of_three( -2, 4, 3 ) );
    printf( "%" PRId64 "\n", max_of_three( 1, -4, -7 ) );
    printf( "%" PRId64 "\n", max_of_three( 2, 3, 1 ) );
    printf( "%" PRId64 "\n", max_of_three( 2, -6, 5 ) );
    printf( "%" PRId64 "\n", max_of_three( 2, -6, 1 ) );
}


