#lang typed/racket/base

;; Just enough to check that the typed version works

(module+ test
  (require left-pad/typed typed/rackunit)
  (require/typed racket/contract
    [exn:fail:contract:blame? (-> Any Boolean)])

  (define-syntax-rule (check-contract-error e reason)
    (check-exn (λ (ex)
                 (let ([msg (if (exn? ex) (exn-message ex) "")])
                   (and (exn:fail:contract:blame? ex)
                        (regexp-match? #rx"left-pad" msg)
                        (regexp-match? (assert reason string?) msg))))
      (λ () e)))

  (test-case "left-pad-strings"
    (check-equal? (left-pad "xxx" 3 "y") "xxx")
    (check-equal? (left-pad "ha" 3 "a") "aha")
    (check-equal? (left-pad "ha" 3 #\A) "Aha")
    (check-equal? (left-pad "" 9 "f") (make-string 9 #\f)))

  (test-case "left-pad-other"
    (check-equal? (left-pad 1 2 3) "31")
    (check-equal? (left-pad 1 1 1) "1")
    (check-equal? (left-pad '(999 9 9) 10 #\') "'(999 9 9)")
    (check-equal? (left-pad 'B 2 'A) "AB"))

  (test-case "left-pad-unsupplied-arg"
    (check-equal? (left-pad "asdf" 6) "  asdf")
    (check-equal? (left-pad #f 4) "  #f"))

  (test-case "left-pad:non-positive-padding"
    (check-contract-error (left-pad "hi" 0)
      "expected: exact-positive-integer\\?\n *given: 0")
    (check-contract-error (left-pad "hi" -3)
      "expected: exact-positive-integer\\?\n *given: -3"))

  (test-case "left-pad:too-little-padding"
    (check-contract-error (left-pad 21 1 1)
      "value wider than given pad-width")
    (check-contract-error (left-pad "hello" 1)
      "value wider than given pad-width"))

  (test-case "left-pad:pad-char-too-wide"
    (check-contract-error (left-pad "a" 3 "bc")
      "pad-value wider than 1 character")
    (check-contract-error (left-pad "x" 8 61)
      "pad-value wider than 1 character")
    (check-contract-error (left-pad '(1 2 3) 9 '())
      "pad-value wider than 1 character"))

)

