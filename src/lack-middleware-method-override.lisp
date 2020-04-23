(in-package :cl-user)
(defpackage :lack-middleware-method-override
            (:use :cl)
            (:export *method-override*))
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

(defun get-method (parsed)
  (cdr (assoc "_method" parsed :test #'string=)))

(defun request-handler (env)
  (let ((current (getf env :request-method))
        (rewrited (get-method (parse-query (getf env :query-string)))))
    (if (and (eq current :POST)
              rewrited)
        (progn (setf (getf env :request-method) (intern rewrited :keyword))
               env)
        env)))

(defvar *method-override*
  (lambda (app)
    (lambda (env) (funcall app (request-handler env)))))
