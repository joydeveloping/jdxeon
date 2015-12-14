/**
 * \file
 * \brief OMP nested functionality.
 */

#include <stdio.h>

#include "utils_math.h"
#include "utils_time.h"

/**
 * \brief Parallel or sequental interval of program execution.
 */
class Interval
{

public:

    double Duration;   /**< duration is seconds */
    int Threads_Count; /**< threads count processing this interval */

    /**
     * \brief Constructor.
     *
     * \param[in] duration - duration in seconds
     * \param[in] threads_count - count of threads
     */
    Interval(double duration,
             int threads_count)
        : Duration(duration),
          Threads_Count(threads_count)
    {
    }

    /**
     * \brief Destructor.
     */
    ~Interval()
    {
    }

    /**
     * \brief Get perfect duration.
     *
     * \return
     * Perfect duration.
     */
    double Perfect_Duration()
    {
        return Duration / (double)Threads_Count;
    }

    /**
     * \brief Perfect execution.
     */
    void Perfect_Exe()
    {
        time_Sleep(Perfect_Duration());
    }
};

/**
 * \brief Proc (set of intervals).
 */
class Proc
{

public:

    int Count;        /**< intervals count */
    Interval **Items; /**< list of intervals */

    /**
     * \brief Constructor.
     *
     * \param[in] count - count of intervals.
     */
    Proc(int count)
        : Count(count)
    {
        Items = new Interval * [count];
    }

    /**
     * \brief Destructor.
     */
    ~Proc()
    {
        for (int i = 0; i < Count; i++)
        {
            delete Items[i];
        }

        delete [] Items;
    }

    /**
     * \brief Set interval in n-th position.
     *
     * \param[in] n - number
     * \param[in] duration - duration in seconds
     * \param[in] threads_count - count of threads
     *
     * \return
     * Interval pointer.
     */
    Interval *Set_Interval(int n,
                           double duration,
                           int threads_count)
    {
        Items[n] = new Interval(duration, threads_count);

        return Items[n];
    }

    /**
     * \brief Get perfect duration.
     *
     * \return
     * Perfect duration.
     */
    double Perfect_Duration()
    {
        double d = 0.0;

        for (int i = 0; i < Count; i++)
        {
            d += Items[i]->Perfect_Duration();
        }

        return d;
    }

    /**
     * \brief Perfect execution.
     */
    void Perfect_Exe()
    {
        for (int i = 0; i < Count; i++)
        {
            Items[i]->Perfect_Exe();
        }
    }

    /**
     * \brief Simulation execution.
     */
    void Simulation_Exe()
    {
        Perfect_Exe();
    }
};

/**
 * \brief Set of procs.
 */
class Procs
{

public:

    int Count;    /**< procs count */
    Proc **Items; /**< procs array */

    /**
     * \brief Constructor.
     *
     * \param[in] count - count of procs
     */
    Procs(int count)
        : Count(count)
    {
        Items = new Proc * [count];
    }

    /**
     * \brief Destructor.
     */
    ~Procs()
    {
        for (int i = 0; i < Count; i++)
        {
            delete Items[i];
        }

        delete Items;
    }

    /**
     * \brief Set proc.
     *
     * \param[in] n - number of proc
     * \param[in] count - intervals count
     *
     * \return
     * New proc.
     */
    Proc *Set_Proc(int n,
                   int count)
    {
        Items[n] = new Proc(count);

        return Items[n];
    }

    /**
     * \brief Get perfect execution duration.
     *
     * \return
     * Perfect execution duration.
     */
    double Perfect_Duration()
    {
        double d = 0.0;
        double cur = 0.0;

        for (int i = 0; i < Count; i++)
        {
            cur = Items[i]->Perfect_Duration();
            d = MATH_MAX(d, cur);
        }

        return d;
    }

    /**
     * \brief Perfect execution.
     */
    void Perfect_Exe()
    {
        time_Sleep(Perfect_Duration());
    }

    /**
     * \brief Simulation execution.
     */
    void Simulation_Exe()
    {
        Perfect_Exe();
    }
};

/**
 * \brief Main function.
 *
 * \return
 * Status code.
 */
int main()
{
    Procs *ps = NULL;
    Proc *p1 = NULL, *p2 = NULL;
    double tstart = 0.0;
    double tstop = 0.0;
    double texe = 0.0;

    /*
     * Create lntervals.
     */
    ps = new Procs(2);
    p1 = ps->Set_Proc(0, 2);
    p1->Set_Interval(0, 1.0, 2);
    p1->Set_Interval(1, 1.0, 1);
    p2 = ps->Set_Proc(1, 2);
    p2->Set_Interval(0, 1.0, 2);
    p2->Set_Interval(1, 1.0, 1);

    /*
     * Perfect exe.
     */
    tstart = time_DTime();
    ps->Perfect_Exe();
    tstop = time_DTime();
    texe = tstop - tstart;
    printf("Perfect duration    = %le\n", texe);

    /*
     * Siumulation exe.
     */
    tstart = time_DTime();
    ps->Simulation_Exe();
    tstop = time_DTime();
    texe = tstop - tstart;
    printf("Simulation duration = %le\n", texe);

    /*
     * Delete intervals.
     */
    delete ps;

    return 0;
}

