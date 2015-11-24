/**
 * Time utilities realization.
 */

#include <stdlib.h>
#include <sys/time.h>

#include "utils_time.h"

/**
 * Get floating double time value in seconds.
 *
 * \return
 * Floating double time value.
 */
double time_DTime()
{
    double dseconds = 0.0;
    struct timeval mytime;

    gettimeofday(&mytime, NULL);
    dseconds = (double)(mytime.tv_sec
                        * mytime.tv_usec * 1.0e-6);

    return dseconds;
}

