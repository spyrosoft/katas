
width = 3
height = 3

origin_pixels <- matrix( rep( 225, width*height ), width )
origin_pixels[2,2] = 0

smooth_pixels <- matrix( rep( 0, width*height ), width )

smooth_origin_pixels <- function() {
    for ( column in 1:width ) {
        for ( row in 1:height ) {
            average_surrounding_pixels( column, row )
        }
    }
}

average_surrounding_pixels <- function( column, row ) {
    for ( surrounding_column_offset in -1:1 ) {
        for ( surrounding_row_offset in -1:1 ) {
            surrounding_column <- column - surrounding_column_offset
            surrounding_row <- row - surrounding_row_offset
            
            orthogonal_multiplier <- 0.2
            diagonal_multiplier <- 0.1
            
            smoothing_pixel <- origin_pixels[ column, row ]
            
            if ( surrounding_column > 0 & surrounding_row > 0 & surrounding_column <= width & surrounding_row <= height ) {
                if ( ( surrounding_column + surrounding_row ) %% 2 == 0 ) {
#                    print( surrounding_column )
#                    print( surrounding_row )
                    print( origin_pixels[ surrounding_column, surrounding_row ] )
                } else {
                    
                }
            }
        }
    }
    print("----")
}

get_smooth_pixel <- function(  ) {
    
}

smooth_origin_pixels()