#lang racket/base
(require racket/port)

(define (solve port num)
  (let ([ln (read-line port 'any)])
    (cond
      [(eof-object? ln) 0]
      [else
       (let ([move (string->number (substring ln 1))])
         (cond
           [number? move
            (cond
              [(equal? (string-ref ln 0) #\R)
               (let ([x (modulo (+ num move) 100)]) (+ (if (= x 0) 1 0) (solve port x)))]
              [(equal? (string-ref ln 0) #\L)
               (let ([x (modulo (- num move) 100)]) (+ (if (= x 0) 1 0) (solve port x)))])]
           [else 0]))])))

(call-with-input-file "day1.txt"
  (lambda (p) (display (solve p 50))) #:mode 'text)
