% Define vowels
vowel(a).
vowel(e).
vowel(i).
vowel(o).
vowel(u).

% Base case: empty list has 0 vowels
count_vowels([], 0).

% If head is a vowel, increment count and recurse on tail
count_vowels([H|T], Count) :-
    vowel(H),
    count_vowels(T, RestCount),
    Count is RestCount + 1.

% If head is not a vowel, continue counting in tail without increment
count_vowels([H|T], Count) :-
    \+ vowel(H),
    count_vowels(T, Count).
