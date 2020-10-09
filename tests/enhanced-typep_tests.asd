(asdf:defsystem #:enhanced-typep_tests

  :author "Jean-Philippe Paradis <hexstream@hexstreamsoft.com>"

  :license "Unlicense"

  :description "enhanced-typep unit tests."

  :depends-on ("enhanced-typep"
               "parachute"
               "enhanced-boolean")

  :serial cl:t
  :components ((:file "tests"))

  :perform (asdf:test-op (op c) (uiop:symbol-call '#:parachute '#:test '#:enhanced-typep_tests)))
