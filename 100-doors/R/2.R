doors <- rep( FALSE, 100 )

for ( pass in seq( 100 ) ) {
    for ( door in seq( from=pass, to=100 ) ) {
        if ( door %% pass == 0 ) {
            doors[ door ] <- !doors[ door ]
            barplot(doors)
        }
    }
}