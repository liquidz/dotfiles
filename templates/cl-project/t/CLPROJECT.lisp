(in-package :cl-user)
(defpackage CLPROJECT-test
  (:use :cl
        :CLPROJECT
        :prove))
(in-package :CLPROJECT-test)

;; NOTE: To run this test file, execute `(asdf:test-system :CLPROJECT)' in your Lisp.

(plan nil)

;; blah blah blah.

(finalize)
