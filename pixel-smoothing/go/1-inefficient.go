package main

import (
	"fmt"
	"container/list"
)

var (
	orthogonal_multiplier float64 = 0.8
	diagonal_multiplier float64 = 0.4
)

func main() {
	original_pixels := [][]uint8{ { 0, 0, 0 }, { 0, 255, 0 }, { 0, 0, 0 } }
	fmt.Print( "Original: " )
	fmt.Println( original_pixels )
	smooth_pixels := smooth_pixels( original_pixels )
	fmt.Print( "  Smooth: " )
	fmt.Println( smooth_pixels )
}

func smooth_pixels( original_pixels [][]uint8 ) [][]uint8 {
	smooth_pixels := copy_pixels( original_pixels )
	
	for column := uint8( 0 ); column < uint8( len( original_pixels ) ); column++ {
		
		for row := uint8( 0 ); row < uint8( len( original_pixels[ 0 ] ) ); row++ {
			
			smooth_pixels[ column ][ row ] = get_smooth_pixel( column, row, original_pixels )
			
		}
		
	}
	
	return smooth_pixels
}

func copy_pixels( original_pixels [][]uint8 ) [][]uint8 {
	x_dimension := len( original_pixels )
	y_dimension := len( original_pixels[ 0 ] )
	
	smooth_pixels := make( [][]uint8, x_dimension )
	smooth_pixels_slice := make( []uint8, x_dimension * y_dimension )
	for smooth_pixels_counter := range original_pixels {
		smooth_pixels[ smooth_pixels_counter ], smooth_pixels_slice = smooth_pixels_slice[ :len( original_pixels[ 0 ] ) ], smooth_pixels_slice[ len( original_pixels[ 0 ] ): ]
	}
	return smooth_pixels
}

func get_smooth_pixel( column uint8, row uint8, original_pixels [][]uint8 ) uint8 {
	var pixel_average uint8
	var pixel_total uint16
	pixels_to_average := get_pixels_to_average( column, row, original_pixels )
	
	for pixel_to_average := pixels_to_average.Front(); pixel_to_average != nil; pixel_to_average = pixel_to_average.Next() {
		pixel_total += uint16( pixel_to_average.Value.(uint8) )
	}
	
	pixel_average = uint8( float32( pixel_total ) / float32( pixels_to_average.Len() ) )
	
	return pixel_average
}

func get_pixels_to_average( column uint8, row uint8, original_pixels [][]uint8 ) *list.List {
	var smoothing_pixel, pixel_to_average uint8
	var smoothing_column, smoothing_row int8
	
	pixels_to_average := list.New()
	current_pixel := original_pixels[ column ][ row ]
	
	for smoothing_column = -1; smoothing_column <= 1; smoothing_column++ {
		
		for smoothing_row = -1; smoothing_row <= 1; smoothing_row++ {
			
			column_to_smooth := int8( column ) + smoothing_column
			row_to_smooth := int8( row ) + smoothing_row
			
			if column_to_smooth >= 0 && row_to_smooth >= 0 && column_to_smooth < int8( len( original_pixels ) ) && row_to_smooth < int8( len( original_pixels[ 0 ] ) ) {
				
				smoothing_pixel = original_pixels[ column_to_smooth ][ row_to_smooth ]
				
				if ( column_to_smooth + row_to_smooth ) % 2 == 0 {
					
					pixel_to_average = get_pixel_to_average( current_pixel, smoothing_pixel, diagonal_multiplier )
					
				} else {
					
					pixel_to_average = get_pixel_to_average( current_pixel, smoothing_pixel, orthogonal_multiplier )
					
				}
				
				pixels_to_average.PushFront( pixel_to_average )
				
			}
			
		}
		
	}
	
	return pixels_to_average
}

func get_pixel_to_average( current_pixel uint8, smoothing_pixel uint8, multiplier float64 ) uint8 {
	return current_pixel - uint8( ( float64( current_pixel ) - float64( smoothing_pixel ) ) * float64( multiplier ) )
}