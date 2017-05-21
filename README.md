left-pad
===
[![Build Status](https://travis-ci.org/bennn/racket-left-pad.svg)](https://travis-ci.org/bennn/racket-left-pad)
[![Coverage Status](https://coveralls.io/repos/bennn/racket-left-pad/badge.svg?branch=master&service=github)](https://coveralls.io/github/bennn/racket-left-pad?branch=master)
[![Scribble](https://img.shields.io/badge/Docs-Scribble-blue.svg)](http://docs.racket-lang.org/left-pad/index.html)

[String left pad](https://www.npmjs.com/package/left-pad)

Install
---
```
$ raco pkg install left-pad
```

Usage
---
```
#lang racket
(require left-pad)

(left-pad "foo" 5)
;; => "  foo"

(left-pad "foobar" 6)
;; => "foobar"

(left-pad 17 5 0)
;; => "00017"
```

*NOTE:* The third argument should `display` as a string with length 1. The function throws an error if this is not true.
