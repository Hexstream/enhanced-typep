(cl:defpackage #:enhanced-typep_tests
  (:use #:cl #:parachute)
  (:shadow #:test)
  (:shadowing-import-from #:enhanced-typep #:typep)
  (:shadowing-import-from #:enhanced-boolean #:boolean))

(cl:in-package #:enhanced-typep_tests)

(defmacro test (comp expected form)
  `(progn
     (is ,comp ,expected ,form)
     (locally (declare (inline typep))
       (is ,comp ,expected ,form))
     (locally (declare (notinline typep))
       (is ,comp ,expected ,form))))

(define-test "main"
  (test eq t (boolean (typep "" 'string)))
  (test eq nil (boolean (typep :keyword 'string)))
  (test eq t (boolean (typep "" 'string nil)))
  (test eq nil (boolean (typep :keyword 'string nil)))
  (test eq t (boolean (funcall (typep 'string) "")))
  (test eq nil (boolean (funcall (typep 'string) :keyword)))
  (let ((type 'string))
    (test eq t (boolean (typep "" type)))
    (test eq nil (boolean (typep :keyword type)))
    (test eq t (boolean (typep "" type nil)))
    (test eq nil (boolean (typep :keyword type nil)))
    (test eq t (boolean (funcall (typep type) "")))
    (test eq nil (boolean (funcall (typep type) :keyword)))))
