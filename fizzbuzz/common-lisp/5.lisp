(loop for i from 1 to 100 do
	(cond ((= (mod i 15) 0) (print "fizzbuzz"))
				((= (mod i 5) 0) (print "buzz"))
				((= (mod i 3) 0) (print "fizz"))
				(t (print i))))