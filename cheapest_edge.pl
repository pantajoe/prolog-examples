% cheapest_edge(+Edges, -CheapestEdge).
cheapest_edge([N-C-M], N-C-M).
cheapest_edge([N-C-M|Edges], N-C-M) :-
  cheapest_edge(Edges, _-C1-_),
  C =< C1,
  % remove cut in order to obtain ALL cheapest edges,
  % i.e., all edges with the minimum cost.
  !.
cheapest_edge([_|Edges], N-C-M) :- cheapest_edge(Edges, N-C-M).

% cheapest_edge([n0-3-n1,n0-1-n3,n0-2-n2], CheapestEdge).
% -> n0-1-n3
