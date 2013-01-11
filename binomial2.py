#!/usr/bin/env python
# 7 February 2011		Lenna Xiao Ping Peterson
# interactive binomial probability finder for stat 503

### factorial function written by jmelloy

#def factorial(x):
    #total = 1
    #while(x > 1):
            #total = total * x
            #x = x -  1
    #return total

def factorial(x):
    """Recursive factorial function"""
    if x <= 1:
            return 1
    return x * factorial(x - 1)


# Pr (Y = k) = nCk * pow(p,k) * pow((1-p),(n-k))


def combine(n,k):
	if k == n/2:
		return factorial(n) / ( factorial(k) * factorial(n-k) )
	else:
		if k > n/2:
			k = n - k
		numerator = 1
		for i in range(0, k):
			numerator *= n-i
		return numerator / factorial(k)

n = int(raw_input("Number of trials? "))
p = float(raw_input("Probability of success? "))
if p < 0 or p > 1:
	p = float(raw_input("p must be between 0 and 1. Try again: "))

while n < 14: 
	k = raw_input("Number of successes (or Quit)? ")
	if k and k[0].lower() != "q" and int(k) <= n:
		k = int(k)
		print combine(n,k)
		second = pow(p,k) * pow((1-p),(n-k))
		print second
		probability = combine(n,k) * second
		prob = 'probability: ' + repr(probability)
		print prob
	else:
		break
