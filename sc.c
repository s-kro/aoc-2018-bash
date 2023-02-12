#include <stdlib.h>
#include <stdio.h>
#include <errno.h>

/* Advent of Code 2018 Day 2 Part 2 */

int main (int argc, char* argv[]) {
  int result = EXIT_SUCCESS;

  if (argc != 3) {
    fprintf(stderr, "%s: Missing parameter.\n", argv[0]);
    result = EXIT_FAILURE;
  }
  else {
    char g[26] = {'\0'};
    int no_match = 0;
    for (int i = 0; i < 26; i++){
      if (argv[1][i] == argv[2][i]) {
	g[i - no_match] = argv[1][i];
      } else {
	no_match++;
      }
    }
    fprintf(stdout, "%s\n", g);
 }
  return result;
}
