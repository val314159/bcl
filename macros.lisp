;;;; macros.lisp

(in-package #:bcl)

(defmacro f   (&rest r) `(format nil ,@r))
(defmacro fmt (&rest r) `(format   T ,@r))

