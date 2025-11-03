% Symptom facts will be dynamically asserted based on user input
:- dynamic symptom/1.

% Hypothesis rules for diseases based on symptoms
hypothesis(flu) :-
    symptom(fever),
    symptom(headache),
    symptom(body_ache),
    symptom(sore_throat),
    symptom(cough).

hypothesis(common_cold) :-
    symptom(runny_nose),
    symptom(sneezing),
    symptom(sore_throat),
    symptom(cough).

hypothesis(malaria) :-
    symptom(fever),
    symptom(chills),
    symptom(sweating),
    symptom(headache).

% Clear all symptoms before a new diagnosis session
clear_symptoms :-
    retractall(symptom(_)).

% Ask user about a symptom and record response
ask(Symptom) :-
    format('Do you have ~w? (yes/no) ', [Symptom]),
    read(Response),
    (Response == yes ->
        assertz(symptom(Symptom));
        true).

% Consult user for all known symptoms used in hypotheses
consult_symptoms :-
    Symptoms = [fever, headache, body_ache, sore_throat, cough, runny_nose, sneezing, chills, sweating],
    maplist(ask, Symptoms).

% Start diagnosis session
diagnose :-
    clear_symptoms,
    writeln('Medical Diagnosis Expert System'),
    consult_symptoms,
    (hypothesis(Disease) ->
        format('You may have ~w.~n', [Disease]);
        writeln('Sorry, diagnosis inconclusive.')),
    clear_symptoms.
