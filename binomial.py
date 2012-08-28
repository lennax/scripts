# 2 February 2011		Lenna Xiao Ping Peterson
# binomial probability finder for stat 503

### factorial function written by jmelloy

def factorial(x):
    total = 1
    while(x > 1):
            total = total * x
            x = x -  1
    return total

def factorial(x):
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

n = 6
p = .25
k = 2

print combine(n,k)
second = pow(p,k) * pow((1-p),(n-k))
print second
probability = combine(n,k) * second
print probability
