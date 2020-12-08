% adjacent(n0, n1, 2).
% adjacent(n1, n3, 3).
% adjacent(n0, n3, 1).

% path_cost(n0, n3, P, SC).
% -> P = [n0,n1,n3], SC = 5.
% -> P = [n0,n3], SC = 1.

path_cost(S, T, [S,T], C) :- adjacent(S, T, C).
path_cost(S, T, [S|P], C) :-
  adjacent(S, X, C1),
  path_cost(X, T, P, C2),
  C is C1 + C2.
