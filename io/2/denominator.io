Number originalDivision := Number getSlot("/")
Number / = method(n,
			if(n == 0, 0, originalDivision(n)))

(1 / 0) println
(1 / 2) println 