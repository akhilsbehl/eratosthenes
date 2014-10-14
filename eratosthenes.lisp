#!/usr/bin/sbcl --script

(defun eratosthenes-sieve (n)
  (declare (type unsigned-byte n))
  (let ((sieve (make-array n :element-type 'bit)))
    (setf (bit sieve 0) 1)
    (do* ((p 2 next-p)
          (next-p 3 (do ((i p (1+ i))) ((eq 0 (bit sieve i)) (1+ i)))))
      ((> p (sqrt n))
       (loop for i from 0 to (1- n)
             when (eq 0 (bit sieve i))
             do (print (1+ i))))
      (do* ((i (* p p) (+ i p)))
        ((> i (length sieve)))
        (setf (bit sieve (1- i)) 1)))))

(eratosthenes-sieve (parse-integer (cadr *posix-argv*)))
