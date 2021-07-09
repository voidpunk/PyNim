import times

# The Greek way
proc SieveOfEratosthenes(n: int): seq[int] =
    var primes: seq[bool]
    for i in 0..n+1:
        primes.add(true)
    var p: int = 2
    while (p * p <= n):
        if primes[p] == true:
            for i in countup(p * 2 , n + 1, p):
                primes[i] = false
        p += 1
    primes[0] = false

# Basic way
proc Primes(n: int): seq[bool] =
    var primes: seq[bool] = @[]
    for i in 0 .. n + 1:
        primes.add(true)
    for i in 3 .. n + 1:
        for j in 2 .. int(i / 2) + 1:
            if i mod j == 0:
                primes[i] = false
                break

# Driver program
let n: int = 100000
echo "Prime numbers smaller than or equal to: ", n
var start_time1 = cpuTime()
discard Primes(n)
var end_time1 = cpuTime()
echo "It took the standard method: ", end_time1 - start_time1 , "s to finish"
var start_time2 = cpuTime()
discard SieveOfEratosthenes(n)
var end_time2 = cpuTime()
echo "It took the greek method: ", end_time2 - start_time2 , "s to finish"