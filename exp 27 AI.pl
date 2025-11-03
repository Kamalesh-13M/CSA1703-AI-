% Define edges of the graph
edge(a, b).
edge(a, c).
edge(b, d).
edge(c, e).
edge(d, f).
edge(e, f).

% BFS algorithm
bfs(Start, Goal, Path) :-
    bfs_queue([[Start]], Goal, Path).

% If the first path in the queue reaches the Goal, return it as Path
bfs_queue([[Goal|RestPath]|_], Goal, Path) :-
    reverse([Goal|RestPath], Path).

% Otherwise, expand the first path and add new paths to the queue
bfs_queue([CurrentPath|OtherPaths], Goal, Path) :-
    CurrentPath = [CurrentNode|_],
    findall(
        [NextNode|CurrentPath],
        (edge(CurrentNode, NextNode), \+ member(NextNode, CurrentPath)),
        NewPaths
    ),
    append(OtherPaths, NewPaths, UpdatedPaths),
    bfs_queue(UpdatedPaths, Goal, Path).
