(in-package :cl-user)
(defpackage :lack-middleware-method-override-test
            (:use :cl
                  :prove
                  :lack-middleware-method-override))
(in-package :lack-middleware-method-override-test)

(plan 8)

(is (lack-middleware-method-override::split "=" "a=b") '("a" "b") :test #'equalp)
(is (lack-middleware-method-override::split "=" "a") '("a") :test #'equalp)
(is (lack-middleware-method-override::split "" "a=b") '("a" "=" "b") :test #'equalp)
(is (lack-middleware-method-override::split "cd" "abcdefabcdef") '("ab" "efab" "ef") :test #'equalp)
(is (lack-middleware-method-override::parse-query "a=b") '(("a" . "b")) :test #'equalp)
(is (lack-middleware-method-override::parse-query "a=b&c=d") '(("a" . "b") ("c" . "d")) :test #'equalp)
(is (lack-middleware-method-override::parse-query "") nil :test #'equalp)
(is (lack-middleware-method-override::parse-query "ab=cd&ef=ab&cd=ef") '(("ab" . "cd") ("ef" . "ab") ("cd" . "ef")) :test #'equalp)

(finalize)
