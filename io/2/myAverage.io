List myAverage := method(
	count := 0
	sum := 0
	while((n := (call target pop)) != nil, if((n type) != (Number type), Exception raise("Not all elements are numbers"), 
	sum = sum + n
	count = count + 1))
	return if(count == 0, 0, sum/count)
)

list(1, 3, 5, 7, 9, 11) myAverage println 
list(1, "io is an interesting language!", 3) myAverage println