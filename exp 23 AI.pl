% Gender facts
male(john).
male(james).
male(peter).
male(bob).
female(mary).
female(lisa).
female(anna).
female(emma).

% Parent facts
parent(john, james).
parent(john, lisa).
parent(mary, james).
parent(mary, lisa).

parent(james, peter).
parent(anna, peter).

parent(lisa, emma).
parent(bob, emma).

% Basic relationships
father(X, Y) :- male(X), parent(X, Y).
mother(X, Y) :- female(X), parent(X, Y).

% Sibling relationships
sibling(X, Y) :- parent(Z, X), parent(Z, Y), X \= Y.

brother(X, Y) :- male(X), sibling(X, Y).
sister(X, Y) :- female(X), sibling(X, Y).

% Ancestor relationship (recursive)
ancestor(X, Y) :- parent(X, Y).
ancestor(X, Y) :- parent(X, Z), ancestor(Z, Y).
