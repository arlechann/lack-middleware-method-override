(in-package :cl-user)
(defpackage :lack-middleware-method-override-test
            (:use :cl
                  :prove
                  :lack-middleware-method-override))
(in-package :lack-middleware-method-override-test)

(plan 4)

(is (lack-middleware-method-override::split "=" "a=b") '("a" "b") :test #'equalp)
(is (lack-middleware-method-override::split "=" "a") '("a") :test #'equalp)
(is (lack-middleware-method-override::split "" "a=b") '("a" "=" "b") :test #'equalp)
(is (lack-middleware-method-override::split "cd" "abcdefabcdef") '("ab" "efab" "ef") :test #'equalp)
(finalize)
