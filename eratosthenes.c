#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <math.h>

#define n 100

uint_fast8_t sieve[n];
uint_fast8_t primes[n];

int main(int argc, char *argv[]) {

  sieve[0] = 1;

  int i, j;
  for (i = 2; i <= sqrt(n); i++) {

    if (sieve[i - 1]) break;

    for (j = i * i; j <= n; j += i) {
      sieve[j - 1] = 1;
    }
  }

  i = 0;
  j = 0;
  while (i < n) {
    i++;
    if (!sieve[i - 1]) {
      primes[j] = i;
      printf("%d\n", primes[j]);
    }
    j++;
  }

  return EXIT_SUCCESS;

}
