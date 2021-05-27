;;;; bcl.asd

(asdf:defsystem #:bcl
  :description "Describe bcl here"
  :author "Your Name <your.name@example.com>"
  :license  "Specify license here"
  :version "0.0.1"
  :serial t
  :depends-on (#:val314159/lutil)
  :components ((:file "package")
               (:file "bcl")))
