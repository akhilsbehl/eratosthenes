#!/bin/bash

echo "C:"
gcc ./eratosthenes.c -o eratosthenes -lm
time ./eratosthenes 1000000 > /dev/null
echo 
echo "Julia:"
./eratosthenes.julia 2> /dev/null
echo 
echo "Lisp:"
./eratosthenes.lisp > /dev/null

exit 0
