:- [path_cost].

% adjacent(n0, n1, 2).
% adjacent(n1, n3, 3).
% adjacent(n0, n3, 1).
% adjacent(n0, n2, 0).
% adjacent(n2, n3, 1).

% cheapest_path(n0, n3, P).
% -> P = [n0,n3].
% -> P = [n0,n2,n3].
cheapest_path(S, T, P) :-
  setof((Path,Cost), path_cost(S, T, Path, Cost), Results),
  lasts(Results, Costs),
  min(Costs, MinCost),
  path_cost(S, T, P, MinCost).

% lasts/2:
% checks if the second list is unifiable
% with a list of last elements of a list of tuples.
lasts([], []).
lasts([(_,Y)|T], [Y|L]) :- lasts(T, L).

% min/2:
% check if the last argument is the minimum of the first argument being a list.
min([X], X).
min([X|T], X) :- min(T, R), X =< R, !.
min([_|T], R) :- min(T, R).
