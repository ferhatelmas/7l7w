curlyBrackets := method(
	r := List clone
	call message arguments foreach(arg,
		r push(r doMessage(arg))
	)
	r
)

s := """{1, {"fsd", 224, 23}, {1, "23"},"ll"}"""
doString(s) println