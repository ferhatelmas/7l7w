my_reverse([], []).
my_reverse([Head|Tail], [TailReversed|Head]) :- my_reverse(Tail, TailReversed).