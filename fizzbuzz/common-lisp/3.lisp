(dotimes (i 100) (
	cond (
		( zerop ( mod i 15 ) )
			( write-line "fizzbuzz" )
		) ( ( zerop ( mod i 3 ) )
			( write-line "fizz" )
		) ( ( zerop ( mod i 5 ) )
			( write-line "buzz" )
		) ( t (format t "~D~%" (+ i 1) ) )
	)
)
