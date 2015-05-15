doors <- rep( FALSE, 100 )
for ( pass in seq( 100 ) ) {
    doors <- doors != ( ( seq( 100 ) %% pass ) == 0 )
}