%apartineL(L: lista, X:simbol)
%L - lista la care verificam apartenenta lui X
%X - simbolul a carui apartenenta o verificam
%model de flux (i,i) sau (i,o)

apartineL([X|_],X).
apartineL([_|T],E):-apartineL(T,E).

%elimina(X: element, L0:lista, L1:lista)
%X - elementul a carei aparitie o eliminam
%L0 -lista sursa
%L1 -lista rezultata
%model de flux (i,i,i) sau (i,i,o)

elimina(_,[],[]).
elimina(E,[E|T],L):-!,elimina(E,T,L).
elimina(E,[H|T],[H|L]):-elimina(E,T,L).

elap([],_).
elap([H|T],R):- \+ apartineL(H,T),elap(T,R).
elap([H|T],R):- apartineL(H,T),elimina(H,[H|T],R2),elap(R2,R).









