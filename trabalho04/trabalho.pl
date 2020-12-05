elem_repetidos([],[]).
elem_repetidos([X|Xs0],Ys0) :-
   partition(=(X),Xs0,Es,Xs),
  (Es=[] -> Ys0=Ys; Ys0=[X|Ys]),
   elem_repetidos(Xs,Ys).

intercalada(L, [], L):- !.
intercalada([], L, L):- !.
intercalada([X|L1], [Y|L2], [X,Y|L3]):-
  intercalada(L1, L2, L3).

distribuir([],[],[]).
distribuir([X],[X],[]).
distribuir([X,Y|Z],[X|A],[Y|B]) :- distribuir(Z,A,B). 

intercalar([],B,B).
intercalar(A,[],A).
intercalar([X|A],[Y|B],[X|C]) :-
    X =< Y,
    intercalar(A,[Y|B],C).
intercalar([X|A],[Y|B],[Y|C]) :-
    X > Y,
    intercalar([X|A],B,C).

ordenada([],[]).
ordenada([X],[X]).
ordenada([X,Y|Z],S) :-
    distribuir([X,Y|Z],A,B),
    ordenada(A,As),
    ordenada(B,Bs),
    intercalar(As,Bs,S).

insercao_ord(N, X, S) :-
    append([N], X, M),
    ordenada(M, S).