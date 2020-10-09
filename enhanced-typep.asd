(asdf:defsystem #:enhanced-typep

  :author "Jean-Philippe Paradis <hexstream@hexstreamsoft.com>"

  :license "Unlicense"

  :description "Obsoletes all TYPEP thin wrappers."

  :depends-on ()

  :version "1.0"
  :serial cl:t
  :components ((:file "package")
               (:file "main"))

  :in-order-to ((asdf:test-op (asdf:test-op #:enhanced-typep_tests))))
