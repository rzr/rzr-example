#include "config.h"
#include <stdio.h>
#include <stdlib.h>

int main (int argc,char *argv[])
{
  printf("%s\n", PREFIX);
  printf("%s:%d: %s\n", __FILE__, __LINE__, __PRETTY_FUNCTION__ );
  exit(EXIT_SUCCESS);
}
