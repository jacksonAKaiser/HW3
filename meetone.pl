#!/bin/gprolog --consult-file

:- include('data.pl').

% Define the meetone predicate to check a specific slot for a person
meetone(Person, Slot) :-
    free(Person, Slot).

main :- findall(Person,
		(meetone(Person,slot(time(8,30,am),time(8,45,am))),
		Person \= bob), % Exclude Bob
		People),
	write(People), nl, halt.

:- initialization(main).
