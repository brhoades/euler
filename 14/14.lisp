(defun longest_collatz (nmax)
  (declare (optimize (speed 3) (safety 0)))
  (setf colz (list 0 0))
  (loop for i from 1 upto nmax do
    (setf colz (append colz (list i (collatz i)))
  ))
  (setf maxn 0)
  (setf maxi 0)
  (loop for i from 0 upto (- (length colz) 1) do
    (if (= (mod i 2) 1)
      nil
      (if (> (nth (+ i 1) colz) maxn)
        (progn
          (setf maxn (nth (+ i 1) colz))
          (setf maxi (nth i colz))
        )
        nil
      )
    )
  )
  (return-from longest_collatz (list (+ maxn 1) maxi))
)


(defun collatz (num)
  (declare (optimize (speed 3) (safety 0)))
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

