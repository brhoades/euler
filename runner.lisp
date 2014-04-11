
(defun collatz (num cnt)
  (if (= num 1)
    (return-from collatz cnt)
    (if (= (mod num 2) 0) 
        (collatz (/ num 2) (+ cnt 1))
        (collatz (+ (* num 3) 1) (+ cnt 1))
    ) 
  )
)

(defun max_collatz (mnum mfndn mfnd i)
  (if (> i mnum)
    (return-from max_collatz (list mfnd mfndn))
    (progn 
      (setf thisfnd (collatz i 1))
      (if (> thisfnd mfnd)
        (max_collatz mnum i thisfnd (+ i 1))
        (max_collatz mnum mfndn mfnd (+ i 1))
      )
    )
  )
)

#|Lisp, call a functionw ith the current max and go from there.|#
(defun longest_collatz (num)
  (progn
    (setf maxn (make-array 2))
    (setf (aref maxn 0) '1)
    (setf (aref maxn 1) '1)
    (loop for i from 1 below (+ num 1) do
      (let* ((thisn (collatz i 0))
          (print (aref maxn 1)) 
        )
      ))
    )
  )

(progn
  (print (max_collatz 5 0 0 1))
  (print (max_collatz 10 0 0 1))
  (print (max_collatz 50 0 0 1))
  (quit)
)


