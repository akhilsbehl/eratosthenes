#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int main(int argc, char **argv) {
  int n, p, i;
  n = atoi(argv[1]);
  int sieve[n];
  sieve[0] = 1;
  for (i = 1; i < n; sieve[i] = 0, i++);
  for (p = 2; p <= floor(sqrt(n)); p++) {
    if (sieve[p - 1]) continue;
    for (i = p * p; i <= n; sieve[i - 1] = 1, i += p);
  }
  for (i = 1; i <= n; i++) if (!sieve[i - 1]) printf("%d\n", i);
  return EXIT_SUCCESS;
}
