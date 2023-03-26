;Sa se tipareasca lista nodurilor de pe nivelul kdintr-un arbore de tipul (A 2 B 0 C 2 D 0 E 0) .


; pargurg_st(l1l2...ln, nrNoduri, nrMuchii) = 
; = nil, if n = 0
; = nil, if nrNoduri = 1 + nrMuchii
; = {l1} U {l2} U parcurg_st(l3...ln, nrNoduri + 1, l2 + nrMuchii), otherwise

(defun parcurg_st (l nrNoduri nrMuchii)
  (cond
    ((null l) nil)
    ((= nrNoduri ( + 1 nrMuchii)) nil)
    (t (cons (car l) (cons (cadr l) (parcurg_st (cddr l) (+ 1 nrNoduri) (+ (cadr l) nrMuchii)))))
  )
)


; parcurg_dr(l1l2...ln, nrNoduri, nrMuchii) =
; = nil, if n = 0
; = l1l2...ln, if nrNoduri = 1 + nrMuchii
; = parcurg_dr(l3...ln, nrNoduri + 1, nrMuchii + l2), otherwise


(defun parcurg_dr (l nrNoduri nrMuchii)
  (cond
    ((null l) nil)
    ((= nrNoduri (+ 1 nrMuchii)) l)
    (t (parcurg_dr (cddr l) (+ 1 nrNoduri) (+ (cadr l) nrMuchii)))
  )
)


;stang(l1l2...ln) = 
; = parcurg_st(l3...ln, 0,0)

(defun stang(l)
  (parcurg_st (cddr l) 0 0)
)


;drept(l1l2...ln) =
; = parcurg_dr(l3...ln, 0, 0)

(defun drept(l)
  (parcurg_dr (cddr l) 0 0)
)



; nodes(l1l2...ln, counter, level) = 
; = nil, if n = 0 
; = l1 , if counter = level
; = append(nodes(stang(l1l2...ln), (c + 1), level), nodes(drept(l1l2...ln), (c + 1), level)), otherwise


(defun nodes(l counter level)
  (cond
    ((null l) nil)
    ((equal counter level) (list (car l)))
    (t (append (nodes (stang l) (+ 1 counter) level) (nodes (drept l) (+ 1 counter) level)))
  )
)

(defun nivel(l level)
  (nodes l 0 level)
)


