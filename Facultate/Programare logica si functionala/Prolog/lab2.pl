%list_member((X: simbol, L:lista)
%L - lista la care verificam apartenenta lui X
%X - simbolul a carui apartenenta o verificam
%model de flux (i,i) sau (i,o)

list_member(X,[X|_]).
list_member(X,[_|TAIL]) :- list_member(X,TAIL).

%list_union(L1: lista, L2: lista, X - lista)
%L1,L2 - liste(multimi) a caror reuniune o cautam
%X - reuniune lui L1 si L2
%model de flux (i,i,i) sau (i,i,o)

list_union([X|Y],Z,W) :- list_member(X,Z),list_union(Y,Z,W).
list_union([X|Y],Z,[X|W]) :- \+ list_member(X,Z), list_union(Y,Z,W).
list_union([],Z,Z).

%facePerechi(L: lista, Rez: lista, X: symbol)
%L - lista originala
%Rez - lista care contine perechi de forma [L,X], unde X
%este un element al listei L
%X - numarul care va face parte din perechi
%model de flux (i,i,i) sau (i,o,i)

facePerechi([],[],_).
facePerechi([Cap|Coada],[[X,Cap]|L],X):-facePerechi(Coada,L,X).

%combinaListe(L1: lista, L2: lista, L3: lista)
%L1 - lista la care concatenam L2
%L2 - lista pe care o concatenam la finalul listei L1
%L3 - lista rezultat
%model de flux (i,i,i) sau (i,i,o)

combinaListe([],L,L).
combinaListe([Cap|Coada],L,[Cap|X]):-combinaListe(Coada,L,X).

%adaugaPereche(L: lista, Rez: lista)
%L - lista pentru care creem combinarile de doua elemente
%Rez - lista rezultat
%model de flux (i,i) sau (i,o)

adaugaPereche([],[]).
adaugaPereche([Cap|Coada],X):-adaugaPereche(Coada,X1),
    facePerechi(Coada,X2,Cap),
    combinaListe(X2,X1,X).
