(defun nr_aparitii(l elem)
  (cond
    ((null l) 0)
    ((listp (car l)) (+ (nr_aparitii (car l) elem) (nr_aparitii (cdr l) elem)))
    ((equal (car l) elem) (+ 1 (nr_aparitii (cdr l) elem))  )
    (t (nr_aparitii (cdr l) elem))
  )
)

(defun e_par(nr)
    (cond
        (( AND (numberp nr) (equal (mod nr 2) 0 ) ) t)
        (t nil)
    )
)


(defun elimina_elem(l elem)
    (cond
        ((null l) nil)
        ((listp (car l)) (cons (elimina_elem (car l) elem) (elimina_elem (cdr l) elem )))
        ((equal (car l) elem) (elimina_elem (cdr l) elem))
        (t (cons (car l) (elimina_elem (cdr l) elem) ))
    )
)


(defun sterge(l elem)
    (cond  
        ((null l) nil)
        ((listp (car l)) (cons (sterge (car l) elem) (sterge (cdr l) elem )))
        ((AND  (equal (car l) elem) (e_par (nr_aparitii l elem)) (numberp (car l))) (sterge (elimina_elem l elem) elem))
        (T(cons (car l) (sterge (cdr l) elem)))
    )
)