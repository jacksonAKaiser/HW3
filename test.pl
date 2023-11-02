#!/bin/gprolog --consult-file

:- include('meet.pl').

% Test 1: Common Meeting Times Test
test_common_meeting_times :-
    findall(Slot, meet(Slot), People),
    % Define the expected result based on the data in data.pl
    ExpectedSlots = [slot(time(10,0,am),time(11,0,am)),
                    slot(time(8,0,am),time(9,0,am)),
                    slot(time(8,0,pm),time(9,0,pm))],
    assert_equal(Slots, ExpectedSlots, "Common Meeting Times Test").

% Test 2: Availabitly from 8:30AM-8:45AM
test_bob_has_slot :-
    findall(Person,
        (meetone(Person, slot(time(8,30,am),time(8,45,am))),
        Person \= bob), % Exclude Bob
        People),
    assert_equal(Person, [ann,bob,carla], "Availability at 8:30 AM Test").

% Define a predicate to assert whether two lists are equal.
assert_equal(Actual, Expected, TestName) :-
    (permutation(Expected, Actual) -> 
        format("Test passed: ~w~nExpected: ~w~nActual: ~w~n", [TestName, Expected, Actual])
    ; 
        format("Test failed: ~w~nExpected: ~w~nActual: ~w~n", [TestName, Expected, Actual])
    ).

% Run the tests
main :- 
	test_common_meeting_times,
	test_bob_has_slot,
	halt.


:- initialization(main).