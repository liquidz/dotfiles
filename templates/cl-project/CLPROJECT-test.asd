#|
  This file is a part of CLPROJECT project.
|#

(in-package :cl-user)
(defpackage CLPROJECT-test-asd
  (:use :cl :asdf))
(in-package :CLPROJECT-test-asd)

(defsystem CLPROJECT-test
  :author "Masashi Iizuka <liquidz.uo@gmail.com>"
  :license "MIT"
  :depends-on (:CLPROJECT
               :prove)
  :components ((:module "t"
                :components
                ((:test-file "CLPROJECT"))))
  :description "Test system for CLPROJECT"

  :defsystem-depends-on (:prove-asdf)
  :perform (test-op :after (op c)
                    (funcall (intern #.(string :run-test-system) :prove-asdf) c)
                    (asdf:clear-system c)))
