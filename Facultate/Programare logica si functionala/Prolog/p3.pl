%problema 6
% Sa se genereze toate sirurile de n paranteze ce se inchid
% corect. Exemplu:n=4 sunt 2 solutii: (()) si ()()

genereazaP([],0):-!.
genereazaP([H|T],N):-N>0,H = "(",N1 is N-1,genereazaP(T,N1).
genereazaP([H|T],N):-N>0,H = ")",N1 is N-1,genereazaP(T,N1).

valideazaP([],0):-!.
valideazaP([H|T],N):-N>=0,H = "(",!, N1 is N+1,valideazaP(T,N1).
valideazaP([H|T],N):-N>=0,H = ")",!, N1 is N-1,valideazaP(T,N1).

scrie([]):-nl,!.
scrie([H|T]):-write(H),scrie(T),!.

paranteze(N):-genereazaP(Rez,N),valideazaP(Rez,0),scrie(Rez),fail.
