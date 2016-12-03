#lang info
(define collection "left-pad")
(define deps '("base"
               "typed-racket-lib"
               "typed-racket-more"))
(define build-deps '("rackunit-lib"
                     "scribble-lib"
                     "racket-doc"))
(define pkg-desc "TODO")
(define version "0.1")
(define pkg-authors '(ben))
(define scribblings '(("docssleft-pad.scrbl" () (tool-library))))
