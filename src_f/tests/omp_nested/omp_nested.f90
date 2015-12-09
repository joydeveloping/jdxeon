!
! OMP. Example for nested OpenMP constructions.
!
program OMP_Nested
use omp_lib
use utils_time
implicit none

integer                   :: n1, n2
real(Configure_Long_Real) :: r2 = 2.0

    call OMP_Set_Nested(.true.)
    print *, "Is nested = ", OMP_Get_Nested()

    do while (.true.)

!$OMP parallel num_threads(2) private(n1)

	if (OMP_Get_Thread_Num() == 0) then
	    call time_Sleep(r2)
	end if

	n1 = OMP_Get_Thread_Num()

!$OMP parallel num_threads(2) private(n2)

	call time_Sleep(r2)

	n2 = OMP_Get_Thread_Num()

	print *, n1, n2

!$OMP end parallel

	if (OMP_Get_Thread_Num() == 1) then
	    call time_Sleep(r2)
	end if

!$OMP end parallel

    end do

end program OMP_Nested
