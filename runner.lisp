(defun longest_collatz (nmax)
  (progn
    (setf colz (list 0 0))
    (loop for i from 1 upto nmax do
      (setf colz (append colz (list i (collatz i)))
    ))
    (return-from longest_collatz colz)
  )
)


(defun collatz (num)
  (progn
    (setf cnt 0)
    (loop
      (if (= num 1)
        (return-from collatz cnt)
        (progn
          (if (= (mod num 2) 0)
              (setf num (/ num 2))
              (setf num (+ (* num 3) 1) )
          )
          (incf cnt 1)
        )
      )
    )
  )
)


(progn
  (print (longest_collatz 100))
  (quit)
)


