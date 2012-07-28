my_min([X], X).
my_min([Head|Tail], X) :- my_min(Tail, Y), (Head < Y -> X is Head; X is Y).