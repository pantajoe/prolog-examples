% extract_nodes(+Edges, -Nodes).
extract_nodes([E1-_-E2], [E1,E2]) :- !.
extract_nodes([E1-_-E2|Edges], Nodes) :-
  extract_nodes(Edges, N1),
  list_to_set([E1,E2|N1], Nodes).

% extract_nodes([n0-1-n2, n0-3-n1, n1-3-n3, n1-1-n2, n3-1-n4, n2-6-n4], Nodes).
% -> Nodes = [n1,n2,n3,n4].
