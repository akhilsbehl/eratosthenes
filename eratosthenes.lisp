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

(defmacro timeit ((&key
                    (to-stream *standard-output*)
                    (with-runs 1))
                  &body body)
  "Note that this function may barf if you are depending on a single evaluation
  and choose with-runs to be greater than one. But I guess that will be the
  caller's mistake instead."
  (let ((start-time (gensym))
        (stop-time (gensym))
        (temp (gensym))
        (retval (gensym)))
    `(let ((,start-time (get-internal-run-time))
           (,retval (let ((,temp))
                      (dotimes (i ,with-runs ,temp)
                        (setf ,temp ,@body))))
           (,stop-time (get-internal-run-time)))
       (format ,to-stream
               "~CTime spent in expression over ~:d iterations: ~f seconds.~C"
               #\linefeed ,with-runs
               (/ (- ,stop-time ,start-time)
                  internal-time-units-per-second)
               #\linefeed)
       ,retval)))

(timeit (:to-stream *error-output*)
        (eratosthenes-sieve (parse-integer (cadr *posix-argv*))))
