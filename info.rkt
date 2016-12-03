#lang info
(define collection "left-pad")
(define deps '("base" "typed-racket-lib" "typed-racket-more"))
(define build-deps '("rackunit-lib" "scribble-lib" "racket-doc"))
(define pkg-desc "String left pad")
(define version "1.0")
(define pkg-authors '(ben))
(define scribblings '(("docs/left-pad.scrbl" () (tool-library))))
