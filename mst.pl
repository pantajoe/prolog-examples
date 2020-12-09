:- [extract_nodes], [candidate_edges], [cheapest_edge].

% ?- mst([n0-1-n2, n0-3-n1, n1-3-n3, n1-1-n2, n3-1-n4, n2-6-n4], MST).
% -> MST = [n0-1-n2, n1-1-n2, n1-3-n3, n3-1-n4].

% mst(+Graph, -MinimumSpanningTree).
mst([], []) :- !.
mst([N-C-M], [N-C-M]) :- !.
mst(Edges, MST) :-
  extract_nodes(Edges, [FirstNode|Nodes]),
  extend_forest(Edges, [FirstNode], Nodes, [], MST),
  !.

extend_forest([], _, _, Graph, Graph).
extend_forest(_, _, [], Graph, Graph).
extend_forest(Edges, CoveredNodes, NodesToCover, Graph, Result) :-
  candidate_edges(Edges, CoveredNodes, NodesToCover, CandidateEdges),
  cheapest_edge(CandidateEdges, N-C-M),
  concat_without_duplicates(CoveredNodes, [N,M], NewCoveredNodes),
  remove_multiple([N,M], NodesToCover, NewNodesToCover),
  remove(N-C-M, Edges, NewEdges),
  concat(Graph, [N-C-M], NewGraph),
  extend_forest(NewEdges, NewCoveredNodes, NewNodesToCover, NewGraph, Result).

% concat/2
% checks if the first 2 lists are unifiable with
% the first one being appended to the last one.
concat([], L, L).
concat([H|T], L, [H|R]) :- concat(T, L, R).

% concats 2 lists and makes sure there are no duplicate entries.
concat_without_duplicates(L1, L2, R) :-
  concat(L1, L2, L3),
  list_to_set(L3, R).

% removes the first occurance of the item from the list.
remove(_, [], []).
remove(Item, [Item|T], T) :- !.
remove(Item, [H|T], [H|R]) :- !, remove(Item, T, R).

% removes all occurances of the item from the list.
remove_all(_, [], []) :- !.
remove_all(Item, [Item|T], R) :- !, remove_all(Item, T, R).
remove_all(Item, [H|T], [H|R]) :- !, remove_all(Item, T, R).

% removes all occurances of all elements in the first input from the list.
remove_multiple([], L, L).
remove_multiple([Item|Items], List, Result) :-
  remove_all(Item, List, R),
  remove_multiple(Items, R, Result).

