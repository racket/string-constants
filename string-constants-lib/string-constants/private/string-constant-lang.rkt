#lang racket/base
(require (for-syntax racket/base syntax/parse
                     racket/sequence))

(provide (rename-out [-#%module-begin #%module-begin])
         #%datum
         define
         #%top-interaction)

(define-syntax (-#%module-begin stx)
  (syntax-parse stx
    [(_ stuff ...)
     #'(#%plain-module-begin
        (define the-hash (make-hash))
        (string-constant-item the-hash stuff) ...)]))

(begin-for-syntax
  (define-syntax-class str-or-id-as-str
    #:attributes
    [(str 0)]
    (pattern str:str)
    (pattern x:id
             #:fail-unless (compile-time-string? (syntax-local-value #'x (λ () #f)))
             "identifier must be bound by #:define"
             #:with str (compile-time-string-str (syntax-local-value #'x)))))

(define-syntax (string-constant-item stx)
  (syntax-parse stx
    [(_ the-hash (#:define x:id s:str))
     #'(define-syntax x (compile-time-string 's))]
    [(_ the-hash (x:id str:str-or-id-as-str))
     #'(add-sc the-hash 'x str)]
    [(_ the-hash (x:id this-str:str-or-id-as-str next-str:str-or-id-as-str ...))
     (define expln
       (string-append
        "  multi-line string constants must be broken on spaces"
        " and the space must start at the beginning of the"
        " (non-first) string constant"))
     (for ([a-next-str (in-list (syntax->list #'(next-str.str ...)))])
       (unless (regexp-match #rx"^ " (syntax-e a-next-str))
         (raise-syntax-error 'string-constant-lang
                             (string-append
                              "expected a string that begins with a space\n"
                              expln)
                             stx
                             a-next-str)))
     (when (regexp-match #rx" $" (syntax-e #'this-str.str))
       (raise-syntax-error 'string-constant-lang
                           (string-append
                            "expected a string that does not end with a space\n"
                            expln)
                           stx
                           #'this-str))
     #'(add-sc the-hash 'x this-str next-str ...)]))

(begin-for-syntax
 (struct compile-time-string (str)
   #:property prop:procedure
   (λ (this stx)
     (syntax-parse stx
       [x:id #`'#,(compile-time-string-str this)]))))

(define (add-sc the-hash name . strs)
  (hash-set! the-hash name (apply string-append strs)))
