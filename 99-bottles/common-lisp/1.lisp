(loop for bottles from 99 downto 1 do
	(format t "~D bottle~P of beer on the wall~%" bottles bottles)
	(format t "~D bottle~P of beer~%" bottles bottles)
	(write-line "Take one down, pass it around")
	(format t "~D bottle~P of beer on the wall~%" (- bottles 1) (- bottles 1))
	(write-line ""))
