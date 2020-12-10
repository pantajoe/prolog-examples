zip([], [], []) :- !.
zip(List, [], List) :- !.
zip([], List, List) :- !.
zip([Head1|Tail1], [Head2|Tail2], [Head1,Head2|Rest]) :- zip(Tail1, Tail2, Rest).
