(defsystem "CLPROJECT"
  :class :package-inferred-system
  :version "0.1"
  :author "Masashi Iizuka <liquidz.uo@gmail.com>"
  :license "MIT"
  :depends-on ("CLPROJECT/src/core")
  :description ""
  :long-description
     #.(uiop:read-file-string
         (uiop:subpathname *load-pathname* "README.md"))
  :in-order-to ((test-op (test-op "CLPROJECT/test"))))

(defsystem "CLPROJECT/test"
  :class :package-inferred-system
  :depends-on ("rove"
               "CLPROJECT/test/core")
  :perform (test-op (o c) (symbol-call :rove '#:run c)))
;;; vim: set ft=lisp lisp:
