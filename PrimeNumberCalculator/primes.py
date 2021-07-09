from time import time

# The Greek way
def SieveOfEratosthenes(n):
    primes = []
    for i in range(n+1):
        primes.append(True)
    p = 2
    while (p * p <= n): 
        if (primes[p] == True): 
            for i in range(p * 2, n + 1, p): 
                primes[i] = False
        p += 1
    primes[0] = False

# Basic way
def Primes(n):
    primes = []
    for i in range(n + 1):
        primes.append(True)
    for i in range(3, n + 1):
        for j in range(2, int(i / 2) + 1):
            if (i % j) == 0:
                primes[i] = False
                break

# Driver program 
n = 100000
print("Prime numbers smaller than or equal to: ", n)
start_time1 = time()
Primes(n)
end_time1 = time()
print("It took the standard method: ", end_time1 - start_time1 , "s to finish")
start_time2 = time()
SieveOfEratosthenes(n)
end_time2 = time()
print("It took the greek method: ", end_time2 - start_time2 , "s to finish")