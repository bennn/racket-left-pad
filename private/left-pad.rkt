#lang racket/base

(provide left-pad)

(require (only-in racket/format ~a))

(define (left-pad value pad-width [pad-value " "])
  (~a value #:align 'right
            #:min-width pad-width
            #:left-pad-string (~a pad-value)))
