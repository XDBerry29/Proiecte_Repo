comb([H|_],1,[H]).
comb([_|T],K,C):-comb(T,K,C).
comb([H|T],K,[H|C]):-K>1,K1 is K-1,comb(T,K1,C).

%ARANJAMNENTE - ex 7
insereaza(E,L,[E|L]).
insereaza(E,[H|T],[H|Rez]):-insereaza(E,T,Rez).

aranj([H|_],1,[H]).
aranj([_|T],K,R):-aranj(T,K,R).
aranj([H|T],K,R):-K>1,K1 is K-1,
	aranj(T,K1,R1),
	insereaza(H,R1,R).

%PERMUTARI
perm([], []).
perm([E|T],P):-perm(T, L),insereaza(E,L,P).

% submultimi(L: lista mare, R: sublista)
% (i,o), (i,i)
submultimi([],[]).
submultimi([_|T],Rez):-submultimi(T,Rez).
submultimi([H|T],[H|Rez]):-submultimi(T,Rez).







