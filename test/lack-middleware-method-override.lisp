(in-package :cl-user)
(defpackage :lack-middleware-method-override-test
            (:use :cl
                  :prove
                  :lack-middleware-method-override))
(in-package :lack-middleware-method-override-test)

(plan 15)

(is (lack-middleware-method-override::get-method '(("a" . "b") ("c" . "d"))) nil)
(is (lack-middleware-method-override::get-method '(("_method" . "POST") ("c" . "d"))) "POST" :test #'equalp)
(is (lack-middleware-method-override::get-method '(("_method" . "POST") ("_method" . "DELETE"))) "POST" :test #'equalp)
(is (lack-middleware-method-override::get-method nil) nil)

(finalize)
