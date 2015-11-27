!
! Hello world fortran example.
!

program Helloworld
use utils_time
implicit none

real(Configure_Long_Real) :: tstart, tstop

    tstart = time_DTime()
    print *, "Hello, World!"
    tstop = time_DTime()

    print *, "time = ", tstop - tstart

end program Helloworld

