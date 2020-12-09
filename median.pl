:- [select].

median(L, R) :-
  length(L, Length),
  % select the lower median if the length of the list is even.
  Index is floor((Length / 2) - 0.5),
  sort(L, SL),
  select(SL, Index, R).
