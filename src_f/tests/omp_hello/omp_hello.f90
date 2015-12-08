!
! OMP. Hello.
!
program OMP_Hello
use omp_lib
implicit none

integer :: num_threads, max_threads

    num_threads = OMP_Get_Num_Threads()
    max_threads = OMP_Get_Max_Threads()
    print *, "Number of threads = ", num_threads
    print *, "Max..m of threads = ", max_threads

end program OMP_Hello

