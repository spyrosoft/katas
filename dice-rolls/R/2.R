number_of_sides <- 6
number_of_rolls <- 3000
rolls_sums <- rep( 0, number_of_sides+number_of_sides )
for ( roll in seq( number_of_rolls ) ) {
    first_die <- sample( 1:number_of_sides, 1, replace=TRUE )
    second_die <- sample( 1:number_of_sides, 1, replace=TRUE )
    total <- first_die + second_die
    rolls_sums[ total ] <- rolls_sums[ total ] + 1
    plot( rolls_sums[ 2:length(rolls_sums) ], ylab="Number of Rolls", xlab="Roll Total" )
}