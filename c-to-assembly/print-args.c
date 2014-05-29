
#include <stdio.h>

int main( int argc, char const * const * argv )
{
    while ( argc-- > 0 ) {
        puts( *( argv++ ) );
    }
}


