Arr2D := Object clone
Arr2D dim := method(x, y, 
	i := 0
	j := 0
	l := list()
	for(i, 1, y, 
		lr := list() 
		for(j, 1, x, lr append(0)) 
		l append(lr)
	)

	call target values := l
)

Arr2D set := method(x, y, value, 
	call target values at(y) atPut(x, value)
)

Arr2D get := method(x, y, 
	call target values at(y) at(x)
)

a := Arr2D clone
"\n--- After allocation ---" println
a dim(2, 6) println
a set(0, 3, 21) 
a set(1, 4, 53)
a set(1, 1, 7)
a set(0, 2, 13)
"\n--- After setters ---" println
a values println
a get(1, 4) println
a get(1, 1) println
