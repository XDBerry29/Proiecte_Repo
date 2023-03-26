(defun f(arb e nivel)
    (cond
        ((null arb) nil)
        ((and (atom arb ) (=(mod nivel 2) 1)) (list e))
        ((and (atom arb ) (=(mod nivel 2) 0)) (list arb))
        (t(list (apply #'append (mapcar #'(lambda (x) (f x e (+ 1 nivel)))arb))))

    )
)

(defun main(arb e) 
    (car (f arb e -1))
)