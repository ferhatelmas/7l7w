Builder := Object clone do (
	depth := 0
)

Builder indent := method(
	for(i, 1, depth, write("  "));
)

Builder forward := method(
	indent
	writeln("<" , call message name, ">" )
	depth = depth + 1
	call message arguments foreach(
		arg,
		content := self doMessage(arg);
		if(content type == "Sequence" , indent; writeln(content)))
	depth = depth - 1
	indent
	writeln("</" , call message name, ">" ))
	

Builder ul(
           li("Io"),
	   li("Lua"),
	   li("JavaScript")
	)
