#lang racket/base
(require racket/port)

(define (how-many y z)
  (+ (- (floor (/ z 100)) (ceiling (/ y 100))) 1))

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
               (let ([x (how-many (+ num 1) (+ num move))]) (+ x (solve port (modulo (+ num move) 100))))]
              [(equal? (string-ref ln 0) #\L)
               (let ([x (how-many (- num move) (- num 1))]) (+ x (solve port (modulo (- num move) 100))))])]
           [else 0]))])))

(call-with-input-file "day1.txt"
  (lambda (p) (display (solve p 50))) #:mode 'text)