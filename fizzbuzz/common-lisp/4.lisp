( dotimes ( i 100 )
	(
		setf n ( + i 1 )
	)
	(
		cond
		(
			( zerop ( mod n 15 ) )
			( write-line "fizzbuzz" )
		)
		(
			( zerop ( mod n 3 ) )
			( write-line "fizz" )
		)
		(
			( zerop ( mod n 5 ) )
			( write-line "buzz" )
		)
		(
			t
			( format t "~D~%" n )
		)
	)
)
