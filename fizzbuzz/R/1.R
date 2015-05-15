fizzbuzz_sequence <- seq( 1, 100 )

for ( counter in fizzbuzz_sequence )
    {
        if ( counter %% 15 == 0 )
            {
                print( "FIZZBUZZ" )
            }
        if ( counter %% 3 == 0 )
            {
                print( "FIZZ" )
            }
        else if ( counter %% 5 == 0 )
            {
                print( "BUZZ" )
            }
        else
            {
                print( counter )
            }
        
    }