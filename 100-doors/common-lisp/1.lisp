(let ((doors ()) (current-door-counter 0))

	(dotimes (number-of-doors 100)
		(push nil doors))

	(dotimes (door-toggle-step 100)
		(setq current-door-counter 0)
		(setq doors
					(mapcar #'(lambda (current-door)
											(incf current-door-counter)
											(if (= (mod current-door-counter (1+ door-toggle-step)) 0)
													(not current-door)
													current-door)) doors)))
	
	(print doors))