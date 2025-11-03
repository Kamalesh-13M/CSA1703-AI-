% Facts: bird(Name).
bird(sparrow).
bird(eagle).
bird(penguin).
bird(ostrich).
bird(flamingo).

% Rule: can_fly(Bird) is true if Bird is a bird and not a flightless bird
flightless(penguin).
flightless(ostrich).

can_fly(Bird) :-
    bird(Bird),
    \+ flightless(Bird).
