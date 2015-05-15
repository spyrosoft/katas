doors <- rep( FALSE, 100 )

for ( pass in 1:100 ) {
    for ( door in 1:100 ) {
        if ( door %% pass == 0 ) {
            doors[ door ] <- !doors[ door ]
        }
    }
}

doors