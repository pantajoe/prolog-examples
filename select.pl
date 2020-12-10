select([Head|_], 0, Head) :- !.
select([_|Tail], Index, Result) :-
  NewIndex is Index - 1,
  select(Tail, NewIndex, Result).
