OperatorTable addAssignOperator(":", "atPutNumber")

Map atPutNumber := method(
	self atPut(
		call evalArgAt(0) asMutable removePrefix("\"") removeSuffix("\""), 
		call evalArgAt(1)
	)
)

Map asAttr := method(
	self foreach(k, v, 
		write(" #{k}=\"#{v}\"" interpolate)
	) 
)

curlyBrackets := method(
	r := Map clone
	call message arguments foreach(arg, 
		r doMessage(arg); 
	)
	r
)

Builder := Object clone do (
	depth := 0
)

Builder indent := method(
	for(i, 1, depth, write("  "));
)

Builder forward := method(

	args := call message arguments 
	self indent
	write("<" , call message name)
	if(args size > 0 and args at(0) name == "curlyBrackets", doMessage(args removeFirst) asAttr)
	writeln(">")

	depth = depth + 1
	args foreach(
		arg,
		content := self doMessage(arg);
		if(content type == "Sequence", indent; writeln(content)))
	depth = depth - 1
	indent
	writeln("</" , call message name, ">" )
)

s := """Builder html(
  head(
    title("Fachoper")
  ),
  body(
    h1("Welcome to my Io test!"),
    div({"class": "content", "id": "main"},
      p(em("Io"), "is down!"),
      p("Go to", em("Prolog!"))
    )
  )
)"""
doString(s)
