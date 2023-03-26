;PROBLEMA 1

; insereaza2(l1l2...ln, elem, pozitie) = 
; = NIL, if n = 0
; = {l1} U {elem} U insereaza2(l2...ln, elem, pozitie + 1) , daca pozitie % 2 = 0
; = {l1} U insereaza2(l2...ln, elem, pozitie + 1) , altfel


(defun insereaza2(l elem pozitie)
  (cond
    ((null l) nil)
    ((equal (mod pozitie 2) 0) (cons (car l) (cons elem (insereaza2 (cdr l) elem (+ 1 pozitie)))))
    (t (cons (car l) (insereaza2 (cdr l) elem (+ 1 pozitie))))
  )
)

(defun main1(l elem)
  (insereaza2 l elem 1)
)

;b
(defun inverseaza_total(l)
  (cond
    ((null l) nil)
    ((listp (car l)) (append (inverseaza_total(cdr l)) (inverseaza_total(car l))))
    (T (append (inverseaza_total(cdr l)) (list(car l))))
  )
)

;c
(defun cmmdc(a b)
  (cond
    ((not (numberp a)) b)
    ((not (numberp b)) a)
    ((= 0 b) a)
    ((= a b) a)
    ((> a b) (cmmdc b (- a b)))
    (t (cmmdc a (- b a)))
  )
)

(defun cmmdc_lista(l)
  (cond
    ((null l) nil)
    ((listp (car l)) (cmmdc (cmmdc_lista (car l)) (cmmdc_lista (cdr l))))
    ((not (numberp (car l))) (cmmdc_lista (cdr l)))
    (t (cmmdc (car l) (cmmdc_lista(cdr l))))
  )
)

;d nr_aparitii_neliniara
(defun nr_aparitii(l elem)
  (cond
    ((null l) 0)
    ((listp (car l)) (+ (nr_aparitii (car l) elem) (nr_aparitii (cdr l) elem)))
    ((equal (car l) elem) (+ 1 (nr_aparitii (cdr l) elem))  )
    (t (nr_aparitii (cdr l) elem))
  )
)

;PROBLEMA 2

;a
(defun elem_n(l n poz)
    (cond
        ((null l) nil)
        ((equal n poz) (car l))
        (t (elem_n (cdr l) n (+ poz 1)))
    )
)

(defun main1(l n)
    (elem_n l n 1)
)

;b
(defun apartine_neliniara(l elem)
    (cond
        ((null l) nil)
        ((listp (car l)) (OR (apartine_neliniara (cdr l) elem) (apartine_neliniara (car l) elem)))
        ((equal (car l) elem) t)
        (t (apartine_neliniara (cdr l) elem))
    )
)

;c
(defun subliste (l)
  (cond
    ((atom l) nil)
    (T (apply 'append (list l) (mapcar 'subliste l)))
  )
)

;d
(defun sterge_elem(l elem)
    (cond
        ((null l) nil)
        ((equal (car l) elem) (sterge_elem (cdr l) elem))
        (t (append (list (car l)) (sterge_elem (cdr l) elem)))
    )
)

(defun lista_multime(l)
    (cond
        ((null l) nil)
        (t (cons (car l) (lista_multime (sterge_elem l (car l)))))
    )
)

;PROBLEMA 3

;a
(defun produs_vectori(l1 l2)
  (cond
    ((null l1) 0)
    (t (+ (* (car l1) (car l2)) (produs_vectori (cdr l1) (cdr l2))))
  )
)

;b
(defun maxim(a b)
  (cond
    ((> a b) a)
    (t b)
  )
)

(defun adancime(l contor)
  (cond
    ((null l) contor)
    ((listp (car l)) (maxim (adancime (car l) (+ contor 1)) (adancime (cdr l) contor)))
    (t (adancime (cdr l) contor))
  )
)

(defun main2(l)
    (adancime l 1)
)

;c
(defun sterge_elem(l elem)
    (cond
        ((null l) nil)
        ((equal (car l) elem) (sterge_elem (cdr l) elem))
        (t (append (list (car l)) (sterge_elem (cdr l) elem)))
    )
)

(defun obtine_min(l min)
    (cond
        ((null l) min)
        ((< (car l) min) (obtine_min (cdr l) (car l)))
        (t (obtine_min (cdr l) min))
    )
)
(defun main_min(l)
    (obtine_min l (car l))
)

(defun sort_fara_dubluri(l)
    (cond
        ((null l) nil)
        (t (append (list (main_min l)) (sort_fara_dubluri (sterge_elem l (main_min l)))))
    )
)

;d apare_liniara
(defun apare(l elem)
    (cond
        ((null l) nil)
        ((equal (car l) elem) t)
        (t (apare (cdr l) elem))
    )
)

(defun intersectie(l1 l2)
    (cond
        ((null l1) nil)
        ((apare l2 (car l1)) (cons (car l1) (intersectie (cdr l1) l2)))
        (t (intersectie (cdr l1) l2))
    )
)

;PROBLEMA 4

;a
(defun lungime(l)
  (cond
    ((null l) 0)
    (t (+ 1 (lungime (cdr l))))
  )
)

(defun suma_vectori(l1 l2)
  (cond
    ((not (equal (lungime l1) (lungime l2))) nil)
    ((null l1) nil)
    (t (cons (+ (car l1) (car l2)) (suma_vectori (cdr l1) (cdr l2))))
  )
)

;b
(defun obtine_atomi(l)
    (cond
        ((null l) nil)
        ((listp (car l)) (append (obtine_atomi (car l)) (obtine_atomi (cdr l))))
        (t (cons (car l) (obtine_atomi (cdr l))))
    )
)

;c
(defun inverseaza_continuele (l aux)
  (cond
    ((null l) aux)

    ;daca e lista adaug la final de aux, am terminat cu actuala inversare si lipesc car l inversat si cdr l inversat (appenduite)
    ((listp (car l)) (append aux (append (list (inverseaza_continuele (car l) nil)) (inverseaza_continuele (cdr l) nil))))

    ;adaug practic la inceput de aux -> 1 2 3 va fi 3 2 1 ca adaug la inceput de fiecare data
    (t (inverseaza_continuele (cdr l) (append (list (car l)) aux)))
  )
)

;d
(defun maxim(a b)
    (cond
        ((not (numberp a)) b)
        ((not (numberp b)) a)
        ((> a b) a)
        (t b)
    )
)

(defun maxim_superficial(l)
    (cond
        ((null l) nil)
        ((numberp (car l))  (maxim (car l) (maxim_superficial (cdr l))) )
        (t (maxim_superficial (cdr l)))
    )
)

;PROBLEMA 5

;a
(defun interclasare_dubluri(l1 l2)
    (cond
        ((null l1) l2)
        ((null l2) l1)
        ((< (car l1) (car l2)) (cons (car l1) (interclasare_dubluri (cdr l1) l2)))
        (t (cons (car l2) (interclasare_dubluri l1 (cdr l2))))
    )
)

;b
(defun inlocuire_elem(l elem_vechi lista_noua)
    (cond
        ((null l) nil)
        ((listp (car l)) (cons (inlocuire_elem (car l) elem_vechi lista_noua) (inlocuire_elem (cdr l) elem_vechi lista_noua)))
        ((equal (car l) elem_vechi) (cons lista_noua (inlocuire_elem (cdr l) elem_vechi lista_noua)))
        (t (cons (car l) (inlocuire_elem (cdr l) elem_vechi lista_noua)))
    )
)

;c bafta frt ca e lunga suma

;prima data fac numerele sa aiba acelasi nr de cifre
(defun adauga_0(l nr_zerouri) 
    (cond
        ((equal nr_zerouri 0) l)
        (t (append '(0) (adauga_0 l (- nr_zerouri 1)) ))
    )
)

(defun lungime(l)
  (cond
    ((null l) 0)
    (t (+ 1 (lungime (cdr l))))
  )
)

;l1 e mai scurta si o egalam cu l2
(defun egaleaza(l1 l2)
    (cond
        ((equal (lungime l1) (lungime l2) ) l1)
        (t (egaleaza (adauga_0 l1 1) l2 ))
    )
)

;o sa lucrez cu listele inversate
(defun inverseaza_liniara(l)
    (cond
        ((null l) nil)
        (t (append (inverseaza_liniara (cdr l)) (list (car l)) ))
    )
)

;suma_dummy adica doar adun element cu element, corectez dupa
(defun suma_dummy(l1 l2)
    (cond
        ((null l1) nil)
        (t (append (list (+ (car l1) (car l2)) ) (suma_dummy (cdr l1) (cdr l2)) ) )
    )
)

;inversez liste, le egalez si fac suma_dummy
(defun pregatire(l1 l2)
    (cond
        ((< (lungime l1) (lungime l2)) (suma_dummy (inverseaza_liniara (egaleaza l1 l2)) (inverseaza_liniara l2) ) )
        ((> (lungime l1) (lungime l2)) (suma_dummy (inverseaza_liniara (egaleaza l2 l1)) (inverseaza_liniara l1) ) )
        ((= (lungime l1) (lungime l2)) (suma_dummy (inverseaza_liniara l1) (inverseaza_liniara l2) ) )
    )
)

;corectez cele de >9
(defun corecteaza(l)
    (cond
        ((null l) NIL)
        ((and (> (car l) 9) (null (cdr l))) (append (list (- (car l) 10)) '(1) ) )
        ((< (car l) 10) (cons (car l) (corecteaza (cdr l))))
        (t (cons (- (car l) 10) (corecteaza (cons (+ 1 (car (cdr l))) (cddr l)))))
    )
)

;transform din lista in numar, vezi ca lista tre sa fie inversata
(defun lista_numar(l)
    (cond
        ((null l) 0)
        (t (+ (car l) (* 10 (lista_numar (cdr l)))))
    )
)



;ok acum combin toate prostiile si obtin suma invers sub forma de lista, apoi o transform in nr
(defun main(l1 l2)
    (lista_numar (corecteaza (pregatire l1 l2)))
)


;d
(defun cmmdc(a b)
  (cond
    ((not (numberp a)) b)
    ((not (numberp b)) a)
    ((= 0 b) a)
    ((= a b) a)
    ((> a b) (cmmdc b (- a b)))
    (t (cmmdc a (- b a)))
  )
)

(defun cmmdc_lista(l)
  (cond
    ((null l) nil)
    ((numberp (car l)) (cmmdc (car l) (cmmdc_lista(cdr l))))
    (t (cmmdc_lista (cdr l)))
  )
)

;PROBLEMA 6

;a
(defun dublare_n(l n poz)
    (cond
        ((null l) nil)
        ((equal poz n) (append (list (car l) (car l)) (cdr l)))
        (t (append (list (car l)) (dublare_n (cdr l) n (+ 1 poz))))
    )
)

(defun main1(l n)
    (dublare_n l n 1)
)

;b
(defun asociere (l1 l2)
    (cond
        ((null l1) nil)
        (t (append (list(cons (car l1) (car l2))) (asociere (cdr l1) (cdr l2))))
    )
)

;c
(defun numara_subliste(l)
  (cond
    ((null l) 1)
    ((listp (car l)) (+ (numara_subliste (car l)) (numara_subliste (cdr l))))
    (t (numara_subliste (cdr l)))
  )
)

;d
(defun numara_numere (l)
  (cond
    ((null l) 0)
    ((numberp (car l)) (+ 1 (numara_numere (cdr l))))
    (t (numara_numere (cdr l)))
  )
)

;PROBLEMA 7

;a
(defun liniara(l)
    (cond
        ((null l) t)
        ((listp (car l)) nil)
        (t (liniara (cdr l)))
    )
)

;b
(defun apare_neliniara(l elem)
    (cond
        ((null l) nil)
        ((equal (car l) elem) t)
        ((listp (car l)) (OR (apare (car l) elem) (apare (cdr l) elem)))
        (t (apare (cdr l) elem))
    )
)

(defun inlocuire(l el_v el_n)
  (cond
    ((null l) nil)
    ((equal (car l) el_v) (cons el_n (cdr l)))
    ((and (listp (car l)) (apare_neliniara (car l) el_v)) (cons (inlocuire (car l) el_v el_n) (cdr l)))
    (t (cons (car l) (inlocuire (cdr l) el_v el_n)))
  )
)

;c
(defun inverseaza_total(l)
  (cond
    ((null l) nil)
    ((listp (car l)) (append (inverseaza_total(cdr l)) (inverseaza_total(car l))))
    (T (append (inverseaza_total(cdr l)) (list(car l))))
  )
)

(defun main3(l)
    (cond
        ((null l) nil)
        ((listp (car l)) (append (list (car (inverseaza_total (car l)))) (main3 (cdr l)) ))
        (t (append (list (car l)) (main3 (cdr l))))
    )
)

;d interclasare_fara_dubluri
(defun interclasare(l1 l2)
    (cond
        ((null l1) l2)
        ((null l2) l1)
        ((< (car l1) (car l2)) (cons (car l1) (interclasare (cdr l1) l2)))
        (t (cons (car l2) (interclasare l1 (cdr l2))))
    )
)

(defun elimina_dubluri(l)
    (cond
        ((null l) nil)
        ((null (cdr l)) (list (car l)))
        ((equal (car l) (car (cdr l))) (elimina_dubluri (cdr l)))
        (t (append (list (car l)) (elimina_dubluri (cdr l))))
    )
)

(defun main4(l1 l2)
    (elimina_dubluri (interclasare l1 l2))
)

;PROBLEMA 8

;a
(defun elimina_n(l n poz)
    (cond
        ((null l) nil)
        ((equal poz n) (elimina_n (cdr l) n (+ 1 poz)) )
        (t (append (list (car l)) (elimina_n (cdr l) n (+ 1 poz)) ) )
    )
)

(defun main1(l n)
    (elimina_n l n 1)
)

;b succesor
(defun inverseaza_liniara(l)
    (cond
        ((null l) nil)
        (t (append (inverseaza_liniara (cdr l)) (list (car l)) ))
    )
)

;cu lista inversata
(defun succesor(l)
    (cond
        ((null l) nil)
        ((equal (car l) 9) (cons '0 (succesor (cdr l)) ) )
        (t (cons (+ 1 (car l)) (cdr l) ))
    )
)

;in caz ca trec la nr diferit de cifre
(defun verifica_0(l)
    (cond
        ((equal (car l) 0) (cons '1 l))
        (t l)
    )
)

(defun succesor(l)
    (verifica_0 (inverseaza_liniara (succesor (inverseaza_liniara l))))
)

;c
(defun liniarizare(l)
  (cond
    ((null l) nil)
    ((listp (car l)) (append (liniarizare(car l)) (liniarizare(cdr l)) ))
    (T (append (list(car l)) (liniarizare (cdr l)) ))
  )
)

(defun sterge_elem(l elem)
    (cond
        ((null l) nil)
        ((equal (car l) elem) (sterge_elem (cdr l) elem))
        (t (append (list (car l)) (sterge_elem (cdr l) elem)))
    )
)

(defun elimina_dubluri(l)
    (cond
        ((null l) nil)
        ((not (equal (cdr l) nil)) (append (list (car l)) (elimina_dubluri (sterge_elem (cdr l) (car l))) ))
        (t (append (list (car l)) (elimina_dubluri (cdr l)) ) )
    )
)

(defun main(l)
    (elimina_dubluri (liniarizare l))
)



;d
(defun apare(l elem)
    (cond
        ((null l) nil)
        ((equal (car l) elem) t)
        (t (apare (cdr l) elem))
    )
)

(defun este_multime(l)
    (cond
        ((null l) t)
        ((AND (not (equal (cdr l) nil)) (apare (cdr l) (car l)))  nil)
        (t (este_multime (cdr l)))
    )
)

;PROBLEMA 9

;a
(defun contine (l e)
    (cond
        ((null l) nil)
        ((equal (car l) e) T)
        (T (contine (cdr l) e))
    )
)

(defun diferenta (l k)
    (cond
         ((null l) nil)
         ((not (contine k (car l))) (cons (car l) (diferenta (cdr l) k)))
         (T (diferenta (cdr l) k))
    )
)

;b
(defun inverseaza_neliniara (l)
    (cond
        ((null l) nil)
        ((listp (car l)) (append (inverseaza_neliniara (cdr l)) (list (inverseaza_neliniara (car l)))))
        (T (append (inverseaza_neliniara (cdr l)) (list (car l))))
    )
)

;c
(defun lungime(l)
  (cond
    ((null l) 0)
    (t (+ 1 (lungime (cdr l))))
  )
)

(defun construieste_lista(L len f)
	(cond
		((null L) nil)

		((atom (car L))
			(cond
				; lungime impara (si este primul element din lista) => adaug in rezultat elementul
				((and (= f 1) (= (mod len 2) 1))
					(cons (car L) (construieste_lista (cdr L) len 0))
				)
				; trec mai departe
				(t    (construieste_lista (cdr L) len f) )
			)
		)
		; primul element e o lista => merg in adancime si continui
		(t
			(append 
				(construieste_lista (car L) (lungime (car L)) 1)
				(construieste_lista (cdr L) len f)
			)
		)
	)
)

(defun main(L)
	(construieste_lista L (lungime L) 1)
)

;d
(defun suma(l)
    (cond
        ((null l) 0)
        ((listp (car l)) (+ (suma (cdr l)) (suma(car l)) ))
        (t (+ (car l) (suma (cdr l)))) 
    )
) 

;PROBLEMA 10

;a
(defun suma_superficial(l)
    (cond
        ((null l) 0)
        ((numberp (car l)) (+ (car l) (suma_superficial (cdr l))))
        (t (suma_superficial (cdr l)) )
    )
)

;b
(defun fa_perechi(l elem)
    (cond
        ((null l) nil)
        (t (cons (list elem (car l) ) (fa_perechi (cdr l) elem) )  )
    )
)

(defun perechi(l)
    (cond
        ((null l) nil)
        ((not (equal (cdr l) nil)) (append (fa_perechi (cdr l) (car l)) (perechi (cdr l)) ))
        (t (perechi (cdr l)))
    )
)

;c mereu ma uit dupa combinatia semn op1 op2 si inlocuiesc cu rezultatul pana ajung la un sg numar
(defun fa_operatie(semn nr1 nr2)
    (cond
        ((equal semn '+) (+ nr1 nr2))
        ((equal semn '*) (* nr1 nr2))
        ((equal semn '-) (- nr1 nr2))
    )
)

(defun operatie_mica(l)
    (cond
        ((equal (cdr l) nil) (car l))
        ((AND (not (numberp (car l))) (numberp (cadr l)) (numberp (caddr l)) ) (  append  (list (fa_operatie (car l) (cadr l) (caddr l)))  (cdddr l)  ))
        (t (append (list (car l)) (operatie_mica (cdr l)) ))
    )
)

(defun expresie_preordine(l)
    (cond
        ((null (cdr l)) (car l))
        (t (expresie_preordine (operatie_mica l) ))
    )
)

;d nr_aparitii_liniara
(defun nr_aparitii(l elem)
    (cond
        ((null l) 0)
        ((equal (car l) elem) (+ 1 (nr_aparitii (cdr l) elem)))
        (t (nr_aparitii (cdr l) elem))
    )
)

(defun sterge_elem(l elem)
    (cond
        ((null l) nil)
        ((equal (car l) elem) (sterge_elem (cdr l) elem))
        (t (append (list (car l)) (sterge_elem (cdr l) elem)))
    )
)

(defun perechi_nr_aparitii(l)
    (cond
        ((null l) nil)
        (t (cons (list (car l) (nr_aparitii l (car l))) (perechi_nr_aparitii (sterge_elem (cdr l) (car l)) ) ) )
    )
)

;PROBLEMA 11

;a
(defun cmmdc(a b)
  (cond
    ((not (numberp a)) b)
    ((not (numberp b)) a)
    ((= 0 b) a)
    ((= a b) a)
    ((> a b) (cmmdc b (- a b)))
    (t (cmmdc a (- b a)))
  )
)

(defun cmmmc(a b)
    (cond 
        ((not (numberp a)) b)
        ((not (numberp b)) a)
        (t (/ (* a b) (cmmdc a b)) )
    )
)

(defun cmmmc_lista(l)
  (cond
    ((null l) nil)
    ((listp (car l)) (cmmmc (cmmmc_lista (car l)) (cmmmc_lista (cdr l))))
    ((not (numberp (car l))) (cmmdc_lista (cdr l)))
    (t (cmmmc (car l) (cmmmc_lista(cdr l))))
  )
)

;b
;0 inseamna ca suntem in scadere 1 in crestere
(defun lungime(l)
  (cond
    ((null l) 0)
    (t (+ 1 (lungime (cdr l))))
  )
)

(defun munte(l ok)
    (cond
     ((equal (lungime l) 1) t)
     ((AND (< (car l) (car (cdr l))) (equal ok 1)) (munte (cdr l) 1))
     ((> (car l) (car (cdr l))) (munte (cdr l) 0))
     (t nil)
    )
)

;vedem sa nu scadem din prima
(defun main2(l)
    (cond
        ((< (car l) (car (cdr l))) (munte l 1))
        (t nil)
    )
)

;c
(defun maxim(a b)
    (cond
        ((not (numberp a)) b)
        ((not (numberp b)) a)
        ((> a b) a)
        (t b)
    )
)

(defun maxim_neliniara(l)
  (cond
    ((null l) nil)
    ((listp (car l)) (maxim (maxim_neliniara (car l)) (maxim_neliniara (cdr l))))
    (t (maxim (car l) (maxim_neliniara (cdr l))))
  )
)

;elimina_elem_neliniara - sterge_elem_neliniara
(defun elimina_elem(l elem)
    (cond
        ((null l) nil)
        ((listp (car l)) (cons (elimina_elem (car l) elem) (elimina_elem (cdr l) elem )) )
        ((equal (car l) elem) (elimina_elem (cdr l) elem))
        (t (cons (car l) (elimina_elem (cdr l) elem) ))
    )
)

(defun main3 (l)
    (elimina_elem l (maxim_neliniara l))
)

;d
(defun e_par(nr)
    (cond
        (( AND (numberp nr) (equal (mod nr 2) 0 ) ) t)
        (t nil)
    )
)

(defun produs_pare(l)
    (cond
        ((null l) 1)
        ((listp (car l)) (* (produs_pare (car l)) (produs_pare (cdr l))) )
        ((e_par (car l)) (* (car l) (produs_pare (cdr l))))
        (t (produs_pare (cdr l)))
    )
)

;PROBLEMA 12

;a
(defun produs_vectori(l1 l2)
  (cond
    ((null l1) 0)
    (t (+ (* (car l1) (car l2)) (produs_vectori (cdr l1) (cdr l2))))
  )
)

;b
(defun maxim(a b)
  (cond
    ((and (not (numberp a)) (not (numberp b))) nil)
    ((not (numberp a)) b)
    ((not (numberp b)) a)
    ((> a b) a)
    (t b)
  )
)

(defun max_lista(l)
    (cond
        ((null l) nil)
        ((AND (equal (lungime l) 1) (atom (car l))) (car l))
        ((listp (car l)) (maxim (max_lista (car l)) (max_lista (cdr l))))
        (t (maxim (car l) (max_lista (cdr l))))
    )
)

;c e nasol, intreaba-ma

;ins poz n a unei liste
(defun ins(e n l)
    (cond
        ((= n 1) (cons e l))
        (t (cons (car l) (ins e (- n 1) (cdr l))))
    )
)

;ins pe toate poz de la n+1 la 1 si combina liste
(defun insert (e n l)
    (cond
        ((= n 0) nil)
        (t (cons (ins e n l) (insert e (- n 1) l)))  
    )
)

;wrapper
(defun inserare(e l)
    (insert e (+ (length l) 1) l)
)

;; l- lista de liste!!!
(defun inserareFiecareLista(e l)
    (cond
        ((null l) nil)
        ;;lista de lista + lista de lista
        (t (append (inserare e (car l)) (inserareFiecareLista e (cdr l))))
    )
)

(defun permutari(l)
    (cond 
        ((null l) (list nil))
        (t (inserareFiecareLista (car l) (permutari (cdr l))))
    )
)

;d
(defun nr_par(l)
    (cond
        ((null l) t)

        ;aici verific sa existe si al doilea element si sa nu fie nil
        ((not (null (cadr l)) ) (nr_par (cddr l)))
        (t nil)
    )
)

;PROBLEMA 13
;a
(defun intercalare_n(l n elem poz)
    (cond
        ((null l) nil)
        ((equal poz n) (cons elem l))
        (t (cons (car l) (intercalare_n (cdr l) n elem (+ poz 1))))
    )
)

(defun main1(l n elem)
    (intercalare_n l n elem 1)
)

;b
(defun suma(l)
    (cond
        ((null l) 0)
        ((listp (car l)) (+ (suma (cdr l)) (suma(car l)) ))
        ((numberp (car l)) (+ (car l) (suma (cdr l)))) 
        (t (+ 0 (suma (cdr l)))) 
    )
) 

;c
(defun subliste(l)
  (cond
    ((atom l) nil)
    (T (apply 'append (list l) (mapcar 'subliste l)))
  )
)

;d
(defun sterge_prima_aparitie(l elem)
    (cond
        ((null l) nil)
        ((equal (car l) elem) (cdr l))
        (t (append (list (car l)) (sterge_prima_aparitie (cdr l) elem)))
    )
)

(defun apare(l elem)
    (cond
        ((null l) nil)
        ((equal (car l) elem) t)
        (t (apare (cdr l) elem))
    )
)

(defun egalitate(l1 l2)
    (cond
        ((AND (null l1) (null l2)) t)
        ((apare l2 (car l1)) (egalitate (cdr l1) (sterge_prima_aparitie l2 (car l1))))
        (t nil)
    )
)

;PROBLEMA 14

;a
(defun elinima_din_n_in_n(l n ok)
    (cond
        ((null l) nil)
        ((equal ok 1) (elinima_din_n_in_n (cdr l) n n))
        (t (cons (car l) (elinima_din_n_in_n (cdr l) n (- ok 1))))
    )
)

(defun main1(l n)
    (elinima_din_n_in_n l n n)
)

;b
;0 inseamna ca suntem in scadere 1 in crestere
(defun lungime(l)
  (cond
    ((null l) 0)
    (t (+ 1 (lungime (cdr l))))
  )
)

(defun vale(l ok)
    (cond
     ((equal (lungime l) 1) t)
     ((AND (> (car l) (car (cdr l))) (equal ok 0)) (vale (cdr l) 0))
     ((< (car l) (car (cdr l))) (vale (cdr l) 1))
     (t nil)
    )
)

;vedem sa nu crestem din prima
(defun main2(l)
    (cond
        ((> (car l) (car (cdr l))) (vale l 0))
        (t nil)
    )
)

;c
(defun minim(a b)
  (cond
    ((and (not (numberp a)) (not (numberp b))) nil)
    ((not (numberp a)) b)
    ((not (numberp b)) a)
    ((< a b) a)
    (t b)
  )
)

;min_lista minim_lista min_neliniara minim_neliniara
(defun min_lista(l)
    (cond
        ((null l) nil)
        ((AND (equal (lungime l) 1) (atom (car l))) (car l))
        ((listp (car l)) (minim (min_lista (car l)) (min_lista(cdr l))))
        (t (minim (car l) (min_lista (cdr l))))
    )
)

;d elimina_elem_liniara - sterge_elem_liniara
(defun sterge_elem(l elem)
    (cond
        ((null l) nil)
        ((equal (car l) elem) (sterge_elem (cdr l) elem))
        (t (append (list (car l)) (sterge_elem (cdr l) elem)))
    )
)

;max_lista max_neliniara maxim_lista maxim_neliniara
(defun maxim(a b)
  (cond
    ((and (not (numberp a)) (not (numberp b))) nil)
    ((not (numberp a)) b)
    ((not (numberp b)) a)
    ((> a b) a)
    (t b)
  )
)

(defun max_lista(l)
    (cond
        ((null l) nil)

        ;am ajuns la lungimea 1
        ((AND (null (cdr l)) (atom (car l))) (car l))
        ((listp (car l)) (maxim (max_lista (car l)) (max_lista(cdr l))))
        (t (maxim (car l) (max_lista (cdr l))))
    )
)

(defun main3(l)
    (sterge_elem l (max_lista l))
)

;PROBLEMA 15

;a
(defun sterge_prima_aparitie(l elem)
    (cond
        ((null l) nil)
        ((equal (car l) elem) (cdr l))
        (t (append (list (car l)) (sterge_prima_aparitie (cdr l) elem)))
    )
)

(defun reuniune(l1 l2)
    (cond
        ((null l1) l2)
        ((null l2) l1)
        (t (cons (car l1) (reuniune (cdr l1) (sterge_prima_aparitie l2 (car l1)))))
    )
)

;b
(defun produs(l)
    (cond
        ((null l) 1)
        ((listp (car l)) (* (produs (cdr l)) (produs(car l)) ))
        ((numberp (car l)) (* (car l) (produs (cdr l)))) 
        (t (* 1 (produs (cdr l))))
    )
) 

;c 
(defun minim(a b)
    (cond
        ((not (numberp a)) b)
        ((not (numberp b)) a)
        ((< a b) a)
        (t b)
    )
)

(defun minim_neliniara(l)
  (cond
    ((null l) nil)
    ((listp (car l)) (minim (minim_neliniara (car l)) (minim_neliniara (cdr l))))
    (t (minim (car l) (minim_neliniara (cdr l))))
  )
)


(defun sort_dubluri(l)
    (cond
        ((null l) nil)
        (t (append (list (minim_neliniara l)) (sort_dubluri (sterge_prima_aparitie l (minim_neliniara l)))))
    )
)

;d
(defun poz_elem(l elem poz)
    (cond
        ((null l) nil)
        ((equal (car l) elem) (append (list poz) (poz_elem (cdr l) elem (+ 1 poz))))
        (t (poz_elem (cdr l) elem (+ 1 poz)))
    )
)

(defun main_poz_elem(l elem)
    (poz_elem l elem 0)
)

(defun poz_min(l)
    (poz_elem l (main_min l))
)