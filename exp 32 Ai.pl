% Facts defining animals by type and attribute
mammal(dog).
mammal(cat).
bird(penguin).
bird(eagle).
fish(salmon).

% Rule to determine if an animal is warm-blooded (pattern matching with type)
warm_blooded(X) :- mammal(X).
warm_blooded(X) :- bird(X).

% Rule to check if an animal can fly
can_fly(X) :- bird(X), X \= penguin.
