#|
  This file is a part of CLPROJECT project.
|#

(in-package :cl-user)
(defpackage CLPROJECT-asd
  (:use :cl :asdf))
(in-package :CLPROJECT-asd)

(defsystem CLPROJECT
  :version "0.1"
  :author "Masashi Iizuka <liquidz.uo@gmail.com>"
  :license "MIT"
  :depends-on ()
  :components ((:module "src"
                :components
                ((:file "CLPROJECT"))))
  :description ""
  :long-description
     #.(uiop:read-file-string
         (uiop:subpathname *load-pathname* "README.md"))
  :in-order-to ((test-op (test-op CLPROJECT-test))))
