;this doesn't work
(let ((string-to-reverse "I am a banana.")
			(reversed-string string-to-reverse)
			(current-string-index))
	(dotimes (i (length string-to-reverse))
		(setf current-string-index (- (length string-to-reverse) i 1))
		(print i)
		(print reversed-string)
		(setf (subseq reversed-string i (1+ i)) (subseq string-to-reverse current-string-index (1+ current-string-index))))
	(print reversed-string))