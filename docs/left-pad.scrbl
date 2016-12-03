#lang scribble/manual
@require[left-pad scribble/eval (for-label racket/base racket/contract)]

@title[#:tag "top"]{left-pad}
@author[@hyperlink["https://github.com/bennn"]{Ben Greenman}]

@hyperlink["https://www.npmjs.com/package/left-pad"]{String left pad}

@defmodule[left-pad]

@examples[
(require left-pad)

(left-pad "foo" 5)

(left-pad "foobar" 6)

(left-pad 17 5 0)
]

@defproc[(left-pad [value any/c] [pad-width exact-positive-integer?] [pad-value " " any/c]) string?]{
  Converts @racket[value] to a string in @racket[display] mode, then pads it with copies of @racket[pad-value] (after coercing @racket[pad-value] to a string) until the result has length @racket[pad-width].

  Returns the same result as:
  @racketblock[
    (~a value #:align 'right
              #:min-width pad-width
              #:left-pad-string (~a pad-value))
  ]
  except that it can be faster (or slower --- it's currently slower).

  The preconditions of @racket[left-pad] are:
  @itemlist[
    @item{
      The @racket[display]-mode representation of @racket[value] has at least @racket[pad-width] characters.
    }
    @item{
      The @racket[display]-mode representation of @racket[pad-value] has exactly 1 character.
    }
  ]

  The postconditions of @racket[left-pad] are:
  @itemlist[
    @item{
      Returns a string with @racket[pad-width] characters.
    }
    @item{
      The @racket[display]-mode representation of @racket[value] is a suffix of the result string.
    }
    @item{
      The result is left-padded with copies of (the @racket[display]-mode representation of) @racket[pad-value].
    }
  ]

  The pre- and post-conditions are enforced by a badass dependent contract.
}

@include-section{typed-left-pad.scrbl}

