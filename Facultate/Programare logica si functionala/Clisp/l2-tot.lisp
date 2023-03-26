;PROBLEMA 1 - PROBLEMA 13

(defun apartine_arbore(l elem)
    (cond 
        ((null l) nil)
        ((listp (car l)) (OR (apartine_arbore (car l) elem) (apartine_arbore (cdr l) elem) ) )
        ((equal (car l) elem) t)
        (t (apartine_arbore (cdr l) elem))
    )
)

(defun path(l elem)
    (cond
        ((null l) nil)
        ((equal (car l) elem) (list (car l)) )
        ((apartine_arbore (cadr l) elem) (cons (car l) (path (cadr l) elem)))
        ((apartine_arbore (caddr l) elem) (cons (car l) (path (caddr l) elem) ))
        (t NIL)
    )
)

;(path '(A (B) (C (D) (E (F) (G (H) (I))))) 'I)

;PROBLEMA 2

(defun nivel_k (l k)
    (cond
        ((null l) NIL)
        ((= k 1) (list (car l)))
        (t (append (nivel_k (cadr l) (- k 1)) (nivel_k (caddr l) (- k 1)) ) )
    )
)

;PROBLEMA 3

(defun nr_niveluri(l)
    (cond
        ((null l) 0)
        ((null (cdr l)) 1)
        (t (+ 1 (max (nr_niveluri (cadr l)) (nr_niveluri (caddr l)))))
    )
)

;PROBLEMA 5 - PROBLEMA 10

(defun apartine_arbore(l elem)
    (cond 
        ((null l) nil)
        ((listp (car l)) (OR (apartine_arbore (car l) elem) (apartine_arbore (cdr l) elem) ) )
        ((equal (car l) elem) t)
        (t (apartine_arbore (cdr l) elem))
    )
)

(defun nivel_nod(l elem)
    (cond
        ((null l) NIL)
        ((equal (car l) elem) 0)
        ((apartine_arbore (cadr l) elem) (+ 1 (nivel_nod (cadr l) elem)))
        ((apartine_arbore (caddr l) elem) (+ 1 (nivel_nod (caddr l) elem)))
        (t NIL)
    )
)

;PROBLEMA 6 - PROBLEMA 8
;SRD
(defun inordine(arb)
	(cond
		; frunza
        ((null arb) nil)
		((null (cdr arb))
			(list (car arb))
		)
		(t
			(append
				(inordine (cadr arb))
				(list (car arb))
				(inordine (caddr arb))
			)
		)
	)
)

;PROBLEMA 11

;nodurile de pe nivelul k
(defun nivel_k (l k)
    (cond
        ((null l) NIL)
        ((= k 1) (list (car l)))
        (t (append (nivel_k (cadr l) (- k 1)) (nivel_k (caddr l) (- k 1)) ) )
    )
)

(defun lungime(l)
    (cond
        ((null l) 0)
        (t (+ 1 (lungime (cdr l))))
    )
)

;incep cu i de la 0
(defun nivel_maxim(l i)
    (cond
        ;daca am trecut deja de nivelul maxim
        ((= (lungime (nivel_k l i)) 0) 0)

        ((> (lungime (nivel_k l i)) (lungime (nivel_k l (nivel_maxim l (+ i 1))))) i)
        (t (nivel_maxim l (+ i 1)))
    )
)

(defun noduri_nivel_maxim(l)
    (cons (list (nivel_maxim l 0)) (list (nivel_k l (nivel_maxim l 0))))
)

;PROBLEMA 12
;RSD
(defun preordine(arb)
	(cond
		; frunza
        ((null arb) nil)
		((null (cdr arb))
			(list (car arb))
		)
		(t
			(append
                (list (car arb))
				(preordine (cadr arb))
				(preordine (caddr arb))
			)
		)
	)
)

;PROBLEMA 14
;SDR
(defun postordine(arb)
	(cond
		; frunza
        ((null arb) nil)
		((null (cdr arb))
			(list (car arb))
		)
		(t
			(append
				(postordine (cadr arb))
				(postordine (caddr arb))
                (list (car arb))
			)
		)
	)
)


;PROBLEMA 16

(defun nr_niveluri(l)
    (cond
        ((null l) 0)
        ((null (cdr l)) 1)
        (t (+ 1 (max (nr_niveluri (cadr l)) (nr_niveluri (caddr l)))))
    )
)

(defun echilibrat(l)
    (cond
        ((null l) t)
        (t (AND (< (abs (- (nr_niveluri (cadr l)) (nr_niveluri (caddr l)))) 2) (echilibrat (cadr l)) (echilibrat (caddr l))) )
    )
)