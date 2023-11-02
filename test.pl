#!/bin/gprolog --consult-file

:- include('meet.pl').

% Define a test predicate that asserts wheather the result is expected.
test_common_meeting_times :-
	findall(Slot, meet(Slot), Slots),
	% Define the expected result based on the data in data.pl
	ExpectedSlots = [Slot(time(10,0,am),time(11,0,am))],
	assert_equal(Slots, ExpectedSlots, "Common meeting times test").

% Define a test predicate to check if Bob has a specific time slot available.
test_bob_has_slot :-
	findal(Person,
		(meetone(Person, slot(time(8,30,am),time(8,45,am))),
		Person \= bob), % Exclude Bob
		People),
	%Bob is the only person who should have this slot available
	asser_equal(People, [bob], "Bob's availability at 8:30 AM test").

% Define a predicate to assert whether two list are equal.
assert_equal(Expectede, Actual, TestName) :-
	(Expected = Actual ->
		format("Test passed: ~w~n", [TestName])
	;
		format("Test failed: ~w~nExpected: ~w~nActual: ~w~n", [TestName, Expected, Actual])
	).

% Run the tests
main :- 
	test_common_meeting_times,
	test_bob_has_slot,
	halt.


:- initialization(main).