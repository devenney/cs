#lang sicp

10  ; 10

(+ 5 3 4)  ; 12

(- 9 1)  ; 8

(/ 6 2)  ; 3

(+
 (* 2 4)  ; 8
 (- 4 6)  ; -2
 )  ; 6

(define a 3)  ; a
(define b (+ a 1))  ; b

(> b a)  ; b = 4, a = 3 -> T
(< b (* a b))  ; b = 4, (* a b) = 12 -> F

(if (and
     (> b a)  ; b = 4, a = 3 -> T
     (< b (* a b)))  ; b = 4, (* a b) = 12 => 4 < 12-> T
    b
    a)  ; T and T => T -> 4

(cond ((= a 4) 6)  ; a != 4
      ((= b 4) (+ 6 7 a))  ; b == 4 -> T
      (else 25)
      )  ; 16

(+ 2 (if(> b a) b a))  ;  b > a -> + 2 4 => 6

(+ (cond ((> a b) a)  ; F
         ((< a b) b)  ; T -> 4
         (else -1))
   (+ a 1))  ; + 4 (+ 3 1) => + 4 4 => 8