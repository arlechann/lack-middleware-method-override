(in-package :cl-user)
(defpackage :lack-middleware-method-override
            (:use :cl)
            (:export method-override))
(in-package :lack-middleware-method-override)

(defun split (sep str &optional (acc nil))
  (if (string= sep "")
      (map 'list #'string str)
      (let ((pos (search sep str))
            (len (length sep)))
        (if (null pos)
            (reverse (cons str acc))
            (split sep (subseq str (+ pos len)) (cons (subseq str 0 pos) acc))))))

(defun method-override ())
