;;; 1.1
10 ; 10
(+ 5 3 4) ; 12
(- 9 1) ; 8
(/ 6 2) ; 3
(+ (* 2 4) (- 4 6)) ; 6
(define a 3)
(define b (+ a 1))
(+ a b (* a b)) ; 19
(= a b) ; #f
(if (and (> b a) (< b (* a b)))
    b
    a) ; 4
(cond ((= a 4) 6)
      ((= b 4) (+ 6 7 a))
      (else 25)) ; 16
(+ 2 (if (> b a) b a)) ; 6
(* (cond ((> a b) a)
         ((< a b) b)
         (else -1))
   (+ a 1)) ; 16

;;; 1.2
(/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5)))))
(* 3 (- 6 2) (- 2 7)))

;;; 1.3
(define (f a b c) (cond ((and (< a b) (< a c)) (+ (* b b) (* c c)))
                        ((and (< b a) (< b c)) (+ (* a a) (* c c)))
                        ((and (= c b) (< c a)) (+ (* a a) (* c c)))
                        ((and (= b a) (< b c)) (+ (* b b) (* c c)))
                        ((and (= a b) (> a c)) (* 2 (* a a)))
                        (else (+ (* a a) (* b b)))
                        ))

(define (f a b c) (+ (* max(a b) max(a b)) (* max(min(a b) c) (max(min(a b) c)))))

;;; 1.4
;;; if b is greater than 0, the function subtracts b from a. Otherwise, it adds b to a.

;;; 1.5
;;; applicative - hangs bc it gets stuck in (p) evaluates to (p)... loop
;;; normal - doesn't evaluate (p) at all bc 0 = 0, so it returns 0

;;; 1.6
;;; infinite loop bc function is evaluated in applicative order whereas if/special forms are evaluated in normal order

;;; 1.7
(define (average x y)
    (/ (+ x y) 2))

(define (improve guess x)
    (average guess (/ x guess)))

(define (good-enough? guess x)
    (< (abs (- (square guess) x)) .001))

(define (sqrt-iter guess x)
    (if (good-enough? guess x)
        guess
        (sqrt-iter (improve guess x)
                    x)))

(sqrt-iter .0000004 .0000004) ; yields .0000004 which is obviously not the sqrt of itself
