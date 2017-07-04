(in-package :cl-user)
(defpackage CLPROJECT/test/core
  (:use :cl
        :rove
        :CLPROJECT))
(in-package :CLPROJECT/test/core)

(deftest foo-test
  (skip "skip for now"))
