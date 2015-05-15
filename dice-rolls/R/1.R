populate_dice_rolls_table <- function( number_of_sides ) {
    dice_rolls_table <- matrix( rep(0, number_of_sides*number_of_sides), number_of_sides )
    for ( column in 1:number_of_sides ) {
        for ( row in 1:number_of_sides ) {
            dice_rolls_table[ column, row ] = column + row
        }
    }
    return( dice_rolls_table )
}

get_dice_rolls_totals <- function( dice_rolls_table ) {
    dice_rolls_totals <- rep( 0, max( dice_rolls_table ) )
    dice_rolls_totals[ 1 ] <- NA
    for ( dice_roll in dice_rolls_table ) {
        dice_rolls_totals[ dice_roll ] = dice_rolls_totals[ dice_roll ] + 1
    }
    return( dice_rolls_totals )
}

d4 <- populate_dice_rolls_table( 4 )
d6 <- populate_dice_rolls_table( 6 )
d10 <- populate_dice_rolls_table( 10 )
d20 <- populate_dice_rolls_table( 20 )

d4_totals <- get_dice_rolls_totals( d4 )
d6_totals <- get_dice_rolls_totals( d6 )
d10_totals <- get_dice_rolls_totals( d10 )
d20_totals <- get_dice_rolls_totals( d20 )

plot(d20_totals)
barplot(d20_totals)
heatmap(d20)