
%a)Sa se sorteze o lista cu eliminarea dublurilor. De ex: [4 2 6 2 3 4] =>[2 3 4 6]b)Se da o lista eterogena, formata din numere intregi si liste de numere. Sa se sorteze fiecare sublista fara pastrarea dublurilor. De ex:[1, 2, [4, 1, 4], 3, 6, [7, 10, 1, 3, 9], 5, [1, 1, 1], 7] =>[1, 2, [1, 4], 3, 6, [1, 3, 7, 9, 10], 5, [1], 7].

%elimina(X: element, L0:lista, L1:lista)
%X - elementul a carei aparitie o eliminam
%L0 -lista sursa
%L1 -lista rezultata
%model de flux (i,i,i) sau (i,i,o)

elimina(_,[],[]).
elimina(E,[E|T],L):-!,elimina(E,T,L).
elimina(E,[H|T],[H|L]):-elimina(E,T,L).

%inserare(X: element, L0:lista, L1:lista)
%X - elementul pe care il inseram in L0
%L0 -lista sursa
%L1 -lista rezultata
%model de flux (i,i,i) sau (i,i,o)


inserare(E,[],[E]):-!.
inserare(E,[H|T],[H|L]):-E>=H,!, inserare(E,T,L).
inserare(E,[H|T],[E|[H|T]]):-!.

%inserare(L1:lista, L2:lista)
%L1 -lista sursa
%L2 -lista sortata
%model de flux (i,i) sau (i,o)


sortare([],[]):-!.
sortare([H|T],L):-elimina(H,T,L1), sortare(L1,L2), inserare(H,L2,L).

%b

lista_et([],[]).
lista_et([H|T],[R|L]):-is_list(H),sortare(H,R),lista_et(T,L).
lista_et([H|T],[H|L]):-number(H),lista_et(T,L).



