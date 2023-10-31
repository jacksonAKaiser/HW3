#!/bin/gprolog --consult-file

:- include('data.pl').

meetone(Person, Slot) :-
	free(Person, Slot).

main :- findall(Person,
		(meetone(Person,slot(time(8,30,am),time(8,45,am))),
		Person \= bob), % Exclude Bob
		People),
	write(People), nl, halt.

:- initialization(main).
