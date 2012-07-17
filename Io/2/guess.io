r := (Random value(100) + 1) floor

stdio := File standardInput

pguess := nil

10 repeat(
	"Guess number (1..100): " println
	guess := stdio readLine asNumber

	if((guess == r),
		"Congratz found the number " println
		return
	)

	if(pguess,
		if((((pguess - r) abs) <= ((guess - r) abs)),
			"Getting colder..." println,
			"Getting hotter..." println
		)
	)

	pguess = guess
)

"Sorry, next time. Btw number was #{r}" interpolate println 