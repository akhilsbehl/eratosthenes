#!/bin/bash

if [[ -z "$1" ]]; then
  echo "Usage: $0 n"
  echo '`n` is the positive integer for which the eratosthenes'"'"
  echo 'sieve must be computed.'
  exit 1
fi

echo "C:"
gcc ./eratosthenes.c -o eratosthenes -lm
time ./eratosthenes "$1" > /dev/null
echo 
echo "Julia:"
./eratosthenes.julia "$1" 2> /dev/null
echo 
echo "Lisp:"
./eratosthenes.lisp "$1" > /dev/null

exit 0
