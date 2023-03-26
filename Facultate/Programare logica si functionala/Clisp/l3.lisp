;12. Definiti o functie care inlocuieste un nod cu altul intr-un arbore n-ar
;reprezentat sub forma (radacina lista_noduri_subarb1...lista_noduri_subarbn)
;Ex: arborelele este (a (b (c)) (d) (e (f))) si nodul 'b se inlocuieste cu
;nodul 'g => arborele (a (g (c)) (d) (e (f)))



(defun schimba(n a arb)
  (cond
    ((null arb) nil)
    ((equal arb n) (list a))
    ((atom arb) (list arb))
    (t (list (apply #'append(mapcar #'(lambda (arbore) (schimba n a arbore)) arb))))
  )
)

(defun schimba_main(n a arb)
    (car (schimba n a arb))
)

