(defun f(l k ncur)
    (cond
        ((and (atom l) (= k ncur)) (list 0))
        ((atom l) (list l))
        (t(list (apply #'append (mapcar #'(lambda (x) (f x k (+ 1 ncur))) l ))))
    )
)

(defun main(l k) 
    (car (f l k 0))
)