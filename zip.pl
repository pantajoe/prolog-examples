zip([], [], []).
zip(L, [], L).
zip([], L, L).
zip([H1|T1], [H2|T2], [H1,H2|R]) :- zip(T1, T2, R).
