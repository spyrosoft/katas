(defvar *doors* nil)

(defun populate-doors ()
  (dotimes (i 100)
    (push 0 *doors*)))

(defun solve-100-doors-enigma ()
  (let (current-pass door-counter)
    (dotimes (current-pass-index 100)
      (setf current-pass (+ 1 current-pass-index))
      (setf door-counter 1)
;      (loop for current-door in *doors* by current-pass do
      (loop for current-door in *doors* do
	   (cond ((zerop (mod door-counter current-pass))
		  (cond ((zerop current-door) (setf current-door 1))
			(t (setf current-door 0)))))
	   (setf door-counter (+ 1 door-counter))))))
;	 (print current-door))))
;	 (toggle-doors current-pass)))

;(defun toggle-doors (current-pass)
;  (loop for current-door in *doors* by current-pass do
;       (print current-pass)))

(populate-doors)
(solve-100-doors-enigma)
(print *doors*)

; Not very familiar with the concept of looping over lists yet
;(defun toggle-doors (current-pass)
;  (loop for i from 1 to 100 by current-pass do
;       (setf current-door (nth *doors* current-pass))
;       (if (= current-door 0);
;	   (setf (nth current-pass *doors*) 1)
;	   (setf (nth current-pass *doors*) 0))))

; Why am I doing this with an array?
;(let ((doors))
;  (setf doors (make-array '(101)))
;  (loop for i from 1 upto 100 do
;       (setf (aref doors i) i))
;  (print doors))
