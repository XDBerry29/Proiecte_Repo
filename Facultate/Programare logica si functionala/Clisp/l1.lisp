;4.a)Definiti o functie care intoarce suma a doi vectori.
; Specificatii: suma(l1: vector1 , l2: vector2 ) => returneaza lista suma a celor 2 vectori
(defun suma(l1 l2)
    (cond 
        ((null l1) l2)
        ((null l2) l1)
        (t (cons (+ (car l1) (car l2)) (suma (cdr l1) (cdr l2))))
    )    
)


;b)Definiti o functie care obtine dintr-o lista data lista tuturor atomilorcare apar, 
;pe orice nivel,dar in aceeasi ordine.
;De exemplu:(((A B) C) (D E)) --> (A B C D E)
; Specificatii: liniar(l1: lista neomogena) => lista liniara rezultata

(defun liniar(l)
    (cond
        ((null l) nil)
        ((atom (car l)) (cons (car l) (liniar (cdr l))))
        ((listp (car l)) (append (liniar (car l)) (liniar (cdr l))))
    )
)


;c)Sa  se  scrie  o  functie  care  plecand  de  la  o  lista  data  ca  argument, 
;inverseaza numai secventele continue de atomi.
;Exemplu:(a b c (d (e f) g h i)) ==> (c b a (d (f e) i h g))

; Specificatii: inversare(l: lista) => lista inversata

(defun inversare (l)
    (if (null l)
        nil
        (append (inversare (cdr l)) (list (car l)))
    )        
)

; Specificatii: inv_lista_b(l: lista) => lista inversata conform cerintei

(defun inv_lista_b (l aux)
    (cond
        ((null l) (inversare aux))
        ((listp (car l)) (append (inversare aux) (cons (inv_lista_b (car l) nil) (inv_lista_b (cdr l) nil))))
        (T (inv_lista_b (cdr l) (append aux (list (car l)))))
    )
)



; Specificatii: inv_lista(l: lista) => wrapper pt fuctia inv_lista_b

(defun inv_lista (l) 
    (inv_lista_b l nil)
)


;d)Sa  se  construiasca  o  functie  care  intoarce  maximul  
;atomilor  numerici dintr-o lista, de la nivelul superficial.
;Ex: (2 5 (6 7) 1) => 5


; Specificatii: maxim(a:element b:element) => elementul numeric maxim , nil daca nu exista
(defun maxim (a b)
    (cond
        ((and (not (numberp a)) (not (numberp b))) nil)
        ((not (numberp a)) b)
        ((not (numberp b)) a)
        ((> a b) a)
        (T b)
    )
)

; Specificatii: max_list(l:lista) => elementul numeric maxim , sin lista superficiala

(defun max_list (l)
    (if (null (cdr l)) 
        (car l)
        (maxim (car l) (max_list (cdr l)))
    )
)
