fib := method(n,
    if(n <= 2, return 1)
    
    a := 2; b := 1; i := 3 
    
    while(i < n,
    t := a
    a = a + b
    b = t
    i = i + 1)
    
    return a
)

fib(4) println
fib(10) println
