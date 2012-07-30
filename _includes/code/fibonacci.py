#!/usr/bin/env python
import sys

def fibonacci(i):
    if i <= 1:
        return i
    else:
        return fibonacci(i-1) + fibonacci(i-2)

if len(sys.argv) < 2:
    print "Usage: %s number" % sys.argv[0]
else:
    n = int(sys.argv[1])
    print "F(%d) = %d" % (n, fibonacci(n))
