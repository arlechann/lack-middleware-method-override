(in-package :cl-user)
(defpackage :lack-middleware-method-override
            (:use :cl)
            (:export method-override))
(in-package :lack-middleware-method-override)

(defun split (sep str)
  (labels ((rec (sep str acc)
            (let ((pos (search sep str))
                  (len (length sep)))
              (if (null pos)
                  (reverse (cons str acc))
                  (rec sep (subseq str (+ pos len)) (cons (subseq str 0 pos) acc))))))
    (if (or (= (length sep) 0)
            (= (length str) 0))
        (map 'list #'string str)
        (rec sep str nil))))

(defun parse-query (query)
  (mapcar (lambda (pair) (cons (car pair) (cadr pair)))
          (mapcar (lambda (str) (split "=" str))
                  (split "&" query))))

(defun method-override ())
