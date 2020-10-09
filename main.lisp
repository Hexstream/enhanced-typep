(in-package #:enhanced-typep)

(declaim (inline typep %make-typep-wrapper)
         (ftype (function (t &optional t t)
                          t)
                typep))

(defun typep (object-or-type &optional (type nil type-supplied-p) environment)
  (if type-supplied-p
      (cl:typep object-or-type type environment)
      (lambda (object)
        (cl:typep object object-or-type))))

(defun %typep-lambda (type)
  (let* ((object-var (gensym (string '#:object)))
         (type-var (unless (constantp type)
                     (gensym (string '#:type))))
         (main `(lambda (,object-var)
                  (cl:typep ,object-var ,(or type-var type)))))
    (if type-var
        `(let ((,type-var ,type))
           ,main)
        main)))

(define-compiler-macro typep (object-or-type &optional (type nil type-supplied-p) (environment nil environment-supplied-p))
  (if type-supplied-p
      `(cl:typep ,object-or-type ,type ,@(when environment-supplied-p
                                           (list environment)))
      (%typep-lambda object-or-type)))
