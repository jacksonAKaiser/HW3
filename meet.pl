#!/bin/gprolog --consult-file

:- include('data.pl').
:- include('uniq.pl').

people([ann,bob,carla]).

% Define the meet predicate to find common slots
meet(Slot) :-
  people(People),
  fine_common_slot(People, Slot).

% Define a recursive predicate to find common slot
find_common_slot([Person|[]], Slot) :-
  free(Person, Slot).

find_common_slot([Person|Rest], Slot) :-
  free(Person, Slot),
  find_common_slot(Rest, Slot).

main :- findall(Slot, meet(Slot), Slots),
        uniq(Slots, Uniq),
        write(Uniq), nl, halt.

:- initialization(main).
