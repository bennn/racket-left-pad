#lang scribble/manual
@require[
  left-pad
  (for-label racket/base racket/contract)
]

@title{Typed Racket API}
@defmodule[left-pad/typed]

@defthing[left-pad (->* [Any Integer] [Any] String)]{}
