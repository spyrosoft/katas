; It turns out that the 100 doors problem just doesn't lend itself to using lists. Arrays are the way to go.

;; (let* ((limit 10) (doors (make-array (list limit) :element-type 'boolean)))
;;   (do ((door 0 (1+ door)))
;;       ((> door (1- limit)))
;;     (do ((toggle-door door (1+ toggle-door)))
;;         ((> toggle-door limit))
;;       (print toggle-door)
;;       ;(setf (aref doors toggle-door) (not (aref doors toggle-door)))
;;       ))
;;   (print doors))

(defmacro while (test &rest body)
  `(do ()
       ((not ,test))
     ,@body))

(defun fill-list (length value)
  (let ((new-list '()))
    (while (< (length new-list) length)
      (push value new-list))
    new-list))

(let* ((limit 10) (doors (fill-list limit nil)) (current-door 0))
  (do ((door doors (rest door)))
      ((null door))
    (progn
      (setf current-door (1+ current-door))
      (do ((door-multiplier 1 (1+ door-multiplier))
           ;; `nth' gets the car of the nth, no the list itself
           (toggle-door door (nth (* current-door door-multiplier) toggle-door)))
          ((null toggle-door))
          (setf (first toggle-door) (not (first toggle-door))))))
  (print doors))