width <- 3
height <- 3
orthogonal_multiplier <- 0.8
diagonal_multiplier <- 0.4

original_pixels <- matrix( rep( 0, width*height ), width )
original_pixels[2,2] <- 255

smooth_pixels <- matrix( rep( 0, width*height ), width )

smooth_original_pixels <- function() {
    for ( column in 1:width ) {
        for ( row in 1:height ) {
            smooth_pixels[ column, row ] <- get_smooth_pixel( column, row )
        }
    }
    print( smooth_pixels )
}

get_smooth_pixel <- function( column, row ) {
    pixel_total <- 0
    pixels_to_average <- get_pixels_to_average( column, row )
    for ( pixel_to_average in pixels_to_average ) {
        pixel_total <- pixel_total + pixel_to_average
    }
    return( round( pixel_average <- pixel_total / length( pixels_to_average ) ) )
}

get_pixels_to_average <- function( column, row ) {
    current_pixel <- original_pixels[ column, row ]
    pixels_to_average <- NULL
    for ( smoothing_column in -1:1 ) {
        for ( smoothing_row in -1:1 ) {
            column_to_smooth <- column + smoothing_column
            row_to_smooth <- row + smoothing_row
            if ( column_to_smooth > 0
            && row_to_smooth > 0
            && column_to_smooth <= width
            && row_to_smooth <= height ) {
                smoothing_pixel <- original_pixels[ column_to_smooth, row_to_smooth ]
                if ( ( column_to_smooth + row_to_smooth ) %% 2 == 0 ) {
                    pixel_to_average <- get_pixel_to_average( current_pixel, smoothing_pixel, diagonal_multiplier )
                } else {
                    pixel_to_average <- get_pixel_to_average( current_pixel, smoothing_pixel, orthogonal_multiplier )
                }
                pixels_to_average[ length( pixels_to_average ) + 1 ] <- pixel_to_average
            }
        }
    }
    return( pixels_to_average )
}

get_pixel_to_average <- function( current_pixel, smoothing_pixel, multiplier ) {
    return( current_pixel - ( current_pixel -  smoothing_pixel ) * multiplier )
}

smooth_original_pixels()