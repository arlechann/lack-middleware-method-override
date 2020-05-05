(in-package :cl-user)
(defpackage :lack-middleware-method-override
            (:use :cl)
            (:import-from :lack.request
                          :make-request)
            (:export *method-override*))
(in-package :lack-middleware-method-override)

(defun get-method (parsed)
  (cdr (assoc "_method" parsed :test #'string=)))

(defun request-handler (env)
  (let* ((body-parameters (lack.request:request-body-parameters (lack.request:make-request env)))
         (method (get-method body-parameters)))
    (if method
       (setf (getf env :REQUEST-METHOD) method))
    env))

(defvar *method-override*
  (lambda (app)
    (lambda (env) (funcall app (request-handler env)))))
