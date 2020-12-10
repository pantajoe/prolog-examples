:- [select].

median(List, Median) :-
  length(List, Length),
  % select the lower median if the length of the list is even.
  Index is (Length - 1) // 2,
  sort(List, SortedList),
  select(SortedList, Index, Median).
