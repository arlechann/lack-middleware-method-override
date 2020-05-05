(in-package :cl-user)
(defpackage :lack-middleware-method-override
            (:use :cl)
            (:export *method-override*))
(in-package :lack-middleware-method-override)

(defun get-method (parsed)
  (cdr (assoc "_method" parsed :test #'string=)))

(defun request-handler (env))

(defvar *method-override*
  (lambda (app)
    (lambda (env) (funcall app (request-handler env)))))
