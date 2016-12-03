#lang typed/racket/base

(require typed/racket/unsafe)

(unsafe-require/typed left-pad
  [left-pad (->* [Any Integer] [Any] String)])

(provide left-pad)
