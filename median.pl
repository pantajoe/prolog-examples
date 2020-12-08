median(L, R) :-
  sort(L, SL),
  length(L, Length),
  Half is Length / 2,
  Index is floor(Half),
  select(SL, Index, R).
