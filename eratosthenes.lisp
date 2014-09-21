#|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
|                                  MAIN                                   |
|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||#

(defun mark-nth (in-bit-vec n) (setf (bit in-bit-vec (1- n)) 1))

(defun make-sieve (upto-n)
  (let ((sieve (make-array upto-n :element-type 'bit)))
    (mark-nth sieve 1)
    sieve))

(defun collect-primes-left (in-sieve)
  (loop for n from 0 to (1- (length in-sieve)) when
        (eq 0 (bit in-sieve n)) collect (+ n 1)))

(defun find-next (from-p in-sieve)
  (do ((next (1+ from-p) (1+ next)))
    ((eq 0 (bit in-sieve (1- next))) next)))

(defun eratosthenes-sieve (upto-n)
  (do* ((sieve (make-sieve upto-n))
        (p 2 next-p)
        (next-p 3 (find-next p sieve)))
    ((> p (sqrt upto-n)) (collect-primes-left sieve))
    (do* ((n (* p p) (+ n p)))
      ((> n (length sieve)))
      (mark-nth sieve n))))

;;; TODO: 
; 1. Add type declarations.
; 2. Convert the loop-collect to something more efficient. Required?

#|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
|                                  TEST                                   |
|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||#

(print (eratosthenes-sieve 10))
(print (eratosthenes-sieve 50))
(print (eratosthenes-sieve 100))
