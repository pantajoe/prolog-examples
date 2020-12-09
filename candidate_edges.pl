% candidate_edges(+Edges, +NodesToCover, +CoveredNodes, -CandidateEdges).
candidate_edges([N-_-M], NodesToCover, CoveredNodes, []) :-
  concat(NodesToCover, CoveredNodes, Nodes),
  not(members(N, M, Nodes)).
candidate_edges([N-C-M], NodesToCover, CoveredNodes, [N-C-M]) :-
  concat(NodesToCover, CoveredNodes, Nodes),
  members(N, M, Nodes).
candidate_edges([N-C-M|Edges], NodesToCover, CoveredNodes, [N-C-M|CandidateEdges]) :-
  concat(NodesToCover, CoveredNodes, Nodes),
  members(N, M, Nodes),
  candidate_edges(Edges, NodesToCover, CoveredNodes, CandidateEdges).
candidate_edges([N-_-M|Edges], NodesToCover, CoveredNodes, CandidateEdges) :-
  concat(NodesToCover, CoveredNodes, Nodes),
  not(members(N, M, Nodes)),
  candidate_edges(Edges, NodesToCover, CoveredNodes, CandidateEdges).

% concat/2
% checks if the first 2 lists are unifiable with
% the first one being appended to the last one.
concat([], L, L).
concat([H|T], L, [H|R]) :- concat(T, L, R).

% members/3
% checks whether the first 2 arguments are both a member of the third argument
members(N, M, L) :- member(N, L), member(M, L).
