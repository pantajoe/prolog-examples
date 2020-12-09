:- [select].

median(L, R) :-
  length(L, Length),
  Index is floor((Length / 2) - 0.5),
  sort(L, SL),
  select(SL, Index, R).
