(defun longest_collatz (num)
  (progn
    (setf cnt 0)
    (loop
      (if (= num 1)
        (return-from longest_collatz cnt)
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
  (print (longest_collatz 5))
  (quit)
)


