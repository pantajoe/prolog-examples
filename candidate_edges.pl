% candidate_edges(+Edges, +NodesToCover, +CoveredNodes, -CandidateEdges).
candidate_edges([N-C-M], NodesToCover, CoveredNodes, [N-C-M]) :- members(N, M, NodesToCover, CoveredNodes).
candidate_edges([N-_-M], NodesToCover, CoveredNodes, []) :- not(members(N, M, NodesToCover, CoveredNodes)).
candidate_edges([N-C-M|Edges], NodesToCover, CoveredNodes, [N-C-M|CandidateEdges]) :-
  members(N, M, NodesToCover, CoveredNodes),
  candidate_edges(Edges, NodesToCover, CoveredNodes, CandidateEdges),
  !.
candidate_edges([N-_-M|Edges], NodesToCover, CoveredNodes, CandidateEdges) :-
  not(members(N, M, NodesToCover, CoveredNodes)),
  candidate_edges(Edges, NodesToCover, CoveredNodes, CandidateEdges).

% candidate_edges([n0-1-n2, n0-3-n1, n1-3-n3, n1-1-n2, n3-1-n4, n2-6-n4], [n0], [n2, n1, n3, n4], E).
% -> E = [n0-1-n2, n0-3-n1].

% members/4
% true if Item1 is in List1 and Item2 in List2 or vice versa.
members(Item1, Item2, List1, List2) :- member(Item1, List1), member(Item2, List2), !.
members(Item1, Item2, List1, List2) :- member(Item2, List1), member(Item1, List2), !.
