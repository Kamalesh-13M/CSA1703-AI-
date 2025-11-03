% Facts
fact(sprinklers_off).
fact(hot).
fact(alarm_off).

% Rules: conclusion :- conditions
rule(sprinklers_on) :- fact(hot), fact(alarm_beeps).
rule(fire) :- fact(hot), fact(smoky).
rule(smoky) :- fact(alarm_beeps).
rule(switch_on_sprinklers) :- rule(fire).

% Backward chaining predicate to prove a Goal
prove(Goal) :-
    fact(Goal).         % Goal is true if it is a known fact
prove(Goal) :-
    rule(Goal),         % Goal is true if it can be derived from a rule
    prove_conditions(Goal).

% Prove all conditions of a rule
prove_conditions(Goal) :-
    Goal =.. [Head|Conditions],
    prove_all(Conditions).

prove_all([]).
prove_all([H|T]) :-
    prove(H),
    prove_all(T).
