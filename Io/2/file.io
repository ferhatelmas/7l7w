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

Arr2D transpose := method(
	y := call target values size
	x := call target values at(0) size
	b := Arr2D clone
	b dim(y, x)
	for(j, 0, y-1,
		for(i, 0, x-1, 
		b set(j, i, (call target get(i, j))))
	)
	
	return b
)

Arr2D compare := method(b,
	y := call target values size
	x := call target values at(0) size
	
	for(j, 0, y-1,
		for(i, 0, x-1, 
		if(b get(i, j) != (call target get(i, j)), return false))
	)
	return true
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

File with("matrix.txt") open write(a serialized) 
b := doFile("matrix.txt")

"\n--- After reading ---" println
b values println

"\n--- Comparison ---" println
b compare(a) println