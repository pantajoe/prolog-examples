select([H|_], 0, H).
select([_|T], S, R) :-
  X is S - 1,
  select(T, X, R).
