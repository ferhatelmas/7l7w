my_split([], [], []).
my_split([X], [X], []).
my_split([X, Y|Tail], [X|Tail1], [Y|Tail2]) :- my_split(Tail, Tail1, Tail2).

my_merge(X, [], X).
my_merge([], X, X).
my_merge([X|Tail1], [Y|Tail2], [X|Tail]) :- X =< Y, my_merge(Tail1, [Y|Tail2], Tail).
my_merge([X|Tail1], [Y|Tail2], [Y|Tail]) :- X > Y, my_merge([X|Tail1], Tail2, Tail).

my_sort([], []).
my_sort([X], [X]).
my_sort([X, Y|Tail], Sorted) :- my_split([X, Y|Tail], Split1, Split2), 
							 my_sort(Split1, Sorted1), 
							 my_sort(Split2, Sorted2), 
							 my_merge(Sorted1, Sorted2, Sorted).
