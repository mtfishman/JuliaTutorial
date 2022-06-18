import math
import time

def estimate_pi(n):
    s = 1.0
    for i in range(1, n + 1):
        if i % 2 == 1:
            si = -1 / (2 * i + 1)
        else:
            si = 1 / (2 * i + 1)
        s += si
    return 4 * s

t0 = time.time()
my_pi = estimate_pi(100_000_000)
t1 = time.time()
total = t1 - t0
print("Estimate of pi: ", my_pi)
print("Error from exact value: ", math.pi - my_pi)
print("Time: ", total, " seconds")
