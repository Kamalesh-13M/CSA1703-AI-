% State is represented as state(MonkeyPos, MonkeyStatus, BoxPos, HasBanana)
% MonkeyPos, BoxPos can be left, middle, right
% MonkeyStatus can be onfloor or onbox
% HasBanana can be hasnot or has

% Actions that change the state:

% Grasp the banana if the monkey is on the box and the box is under the bananas
move(state(middle, onbox, middle, hasnot), grasp, state(middle, onbox, middle, has)).

% Monkey climbs onto the box if they are at the same position and monkey is on floor
move(state(P, onfloor, P, H), climb, state(P, onbox, P, H)).

% Monkey pushes the box from P1 to P2 if monkey and box are at P1, both on floor
move(state(P1, onfloor, P1, H), push(P1, P2), state(P2, onfloor, P2, H)) :- P1 \= P2.

% Monkey walks from position P1 to P2 if monkey is on floor and box is somewhere
move(state(P1, onfloor, B, H), walk(P1, P2), state(P2, onfloor, B, H)) :- P1 \= P2.

% The goal is to reach a state where the monkey has the bananas
canget(state(_, _, _, has)).

% Recursively try all moves to reach the goal state
canget(State1) :-
    move(State1, _, State2),
    canget(State2).
