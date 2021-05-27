;;;; bcl.asd

(defsystem #:bcl
  :description "Describe bcl here"
  :author "Your Name <your.name@example.com>"
  :license  "Specify license here"
  :version "0.0.1"
  :serial T
  :depends-on (#:lutil #:hunchentoot #:hunchensocket)
  :components ((:file "package")
               (:file "macros")
               (:file "bcl")))
