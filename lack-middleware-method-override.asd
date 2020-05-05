(defsystem "lack-middleware-method-override"
  :version "0.0.1"
  :author "arlechann"
  :license "GPL v3"
  :depends-on ("lack-request")
  :components ((:module "src"
                :components ((:file "lack-middleware-method-override"))))
  :description "Override HTTP method"
  :in-order-to ((test-op (test-op "lack-middleware-method-override/test"))))

(defsystem "lack-middleware-method-override/test"
  :defsystem-depends-on ("prove-asdf")
  :author "arlechann"
  :license "GPL v3"
  :depends-on ("lack-middleware-method-override"
               "prove")
  :components ((:module "test"
                :components
                ((:test-file "lack-middleware-method-override"))))
  :description "Test system for lack-middleware-method-override"
  :perform (test-op :after (op c) (funcall (intern #.(string :run) :prove) c)))
