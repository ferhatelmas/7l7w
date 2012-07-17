sum2d := method(array2D,
	sum := 0 
	while((x := array2D pop) != nil, sum = sum + (x sum))
	return sum
)

array2D := list()
sum2d(array2D) println

array2D = list(
	list(1, 2, 3),
	list(4, 5, 6),
	list(7, 8, 9)
)
sum2d(array2D) println
