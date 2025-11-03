% Base case: Move one disk from Source to Target
move(1, Source, Target, _) :-
    write('Move disk from '), write(Source), write(' to '), write(Target), nl.

% Recursive case: Move N disks from Source to Target using Auxiliary
move(N, Source, Target, Auxiliary) :-
    N > 1,
    M is N - 1,
    move(M, Source, Auxiliary, Target),           % Move N-1 disks to Auxiliary
    move(1, Source, Target, _),                   % Move the largest disk to Target
    move(M, Auxiliary, Target, Source).           % Move N-1 disks onto the largest disk
