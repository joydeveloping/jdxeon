/**
 * \file
 * \brief Time utilities realization.
 */

#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>

#include "utils_time.h"

/**
 * \brief Get floating double time value in seconds.
 *
 * \return
 * Floating double time value.
 */
double time_DTime()
{
    double dseconds = 0.0;
    struct timeval mytime;

    gettimeofday(&mytime, NULL);
    dseconds = (double)mytime.tv_sec
               + (double)mytime.tv_usec * 1.0e-6;

    return dseconds;
}

/**
 * \brief Sleep for a while.
 *
 * \param[in] d - sleep duration in seconds
 */
void time_Sleep(double d)
{
    double s = time_DTime();

    while (time_DTime() - s < d)
    {
        /*
         * Do nothing.
         */
        ;
    }
}

