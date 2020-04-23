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
(is (lack-middleware-method-override::split "=" "") nil)

(is (lack-middleware-method-override::parse-query "a=b") '(("a" . "b")) :test #'equalp)
(is (lack-middleware-method-override::parse-query "a=b&c=d") '(("a" . "b") ("c" . "d")) :test #'equalp)
(is (lack-middleware-method-override::parse-query "") nil)
(is (lack-middleware-method-override::parse-query "ab=cd&ef=ab&cd=ef") '(("ab" . "cd") ("ef" . "ab") ("cd" . "ef")) :test #'equalp)

(is (lack-middleware-method-override::get-method '(("a" . "b") ("c" . "d"))) nil)
(is (lack-middleware-method-override::get-method '(("_method" . "POST") ("c" . "d"))) "POST" :test #'equalp)
(is (lack-middleware-method-override::get-method '(("_method" . "POST") ("_method" . "DELETE"))) "POST" :test #'equalp)
(is (lack-middleware-method-override::get-method nil) nil)

(finalize)
