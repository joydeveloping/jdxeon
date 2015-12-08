#include <stdio.h>

#include "utils_time.h"

int main()
{
    double tstart = 0.0;
    double tstop = 0.0;

    tstart = time_DTime();
    printf("Hello, World!\n");
    tstop = time_DTime();

    printf("time = %le\n", tstop - tstart);

    return 0;
}

