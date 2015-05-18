(let (current-integer)
  (loop for current-integer from 1 to 100 do
       (print (cond ((zerop (mod current-integer 15)) "fizzbuzz")
		    ((zerop (mod current-integer 5)) "buzz")
		    ((zerop (mod current-integer 3)) "fizz")
		    (t current-integer)))))
