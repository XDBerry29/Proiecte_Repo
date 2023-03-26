submultimi([],[]).
submultimi([_|T],Rez):-submultimi(T,Rez).
submultimi([H|T],[H|Rez]):-submultimi(T,Rez).


suma([],0).
suma([H|T],R):-suma(T,R1), R is H+R1.


cond(L,R):-submultimi(L,R),suma(R,S),0 is S mod 3.

main(L,R):-findall(C,cond(L,C),R).


