!
! OMP. Hello.
!
program OMP_Hello
use omp_lib
implicit none

    ! Number of threads for parallel scope.
    print *, "Number of threads = ", OMP_Get_Num_Threads()

    ! Maximum number of threads for parallel scope.
    print *, "Max..m of threads = ", OMP_Get_Max_Threads()

    ! Check dynamic threads count.
    call OMP_Set_Dynamic(.TRUE.)
    print *, "OMP dynamic       = ", OMP_Get_Dynamic()

    ! Number of processors.
    print *, "Number of procs.  = ", OMP_Get_Num_Procs()

    ! Check nested OMP.
    call OMP_Set_Nested(.TRUE.)
    print *, "OMP nested        = ", OMP_Get_Nested()

    ! Parallel.
    !$OMP parallel
    print *, "Thread number     = ", OMP_Get_Thread_Num()
    !$OMP end parallel

    ! Check in parallel.
    print *, "Not parallel      : ", OMP_In_Parallel()
    !$OMP parallel
    print *, "    Parallel      : ", OMP_In_Parallel()
    !$OMP end parallel

    ! Single section.
    !$OMP single
    print *, "Single section    : thread ", OMP_Get_Thread_Num()
    !$OMP end single

    ! Master.
    !$OMP master
    print *, "Master thread     : thread ", OMP_Get_Thread_Num()
    !$OMP end master

end program OMP_Hello

