insereaza(E,L,[E|L]).
insereaza(E,[H|T],[H|Rez]):-insereaza(E,T,Rez).

aranj([H|_],1,[H]).
aranj([_|T],K,R):-aranj(T,K,R).
aranj([H|T],K,R):-K>1,K1 is K-1,
	aranj(T,K1,R1),
	insereaza(H,R1,R).



produs([],1).
produs([H|T],R):-produs(T,P),R is P * H.

conditie(L,P,K,R):-aranj(L,K,R),produs(R,P).

main(L,P,K,R):-findall(C, conditie(L,P,K,C) , R).


f([],0).
f([H|T],S):-f(T,S1),a([H|T],S,S1).



a([H|_],S,S1):-H<S1,!,S is H+S1.
a([_|_],S,S1):-S is S1+2.



