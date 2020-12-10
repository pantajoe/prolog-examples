% adjacent(n0, n1, 2).
% adjacent(n1, n3, 3).
% adjacent(n0, n3, 1).

% path_cost(n0, n3, P, SC).
% -> P = [n0,n1,n3], SC = 5.
% -> P = [n0,n3], SC = 1.

path_cost(Start, Target, [Start,Target], Cost) :- adjacent(Start, Target, Cost).
path_cost(Start, Target, [Start|Path], Cost) :-
  adjacent(Start, X, Cost1),
  path_cost(X, Target, Path, Cost2),
  Cost is Cost1 + Cost2,
  !.
