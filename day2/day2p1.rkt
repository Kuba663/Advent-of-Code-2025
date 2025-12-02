#lang racket/base
(require megaparsack megaparsack/text
         data/monad data/applicative
         racket/port)

(define (add-wrong-ids from to)
  (let ([n (string->number from)] [len (string-length from)])
    (if [equal? (string-ref from 0) #\0]
        (+ n (if [not (equal? from to)] (add-wrong-ids (number->string (+ n 1)) to) 0))
        (+ (if [and
                (= (modulo len 2) 0)
                (equal? (substring from 0 (/ len 2)) (substring from (/ len 2)))]
               n 0)
           (if [not (equal? from to)] (add-wrong-ids (number->string (+ n 1)) to) 0)))))

(define range*/p
  (do [from <- integer/p]
    (char/p #\-)
    [to <- integer/p]
    (pure (add-wrong-ids (number->string from) (number->string to)))))
(define ranges*/p
  (many/p range*/p #:sep (char/p #\,)))

(define file-contents
  (port->string (open-input-file "day2.txt") #:close? #t))

(display (apply + (parse-result! (parse-string ranges*/p file-contents))))
