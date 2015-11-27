!
! Multiplication diaginal matrix on common matrix.
!

program Diamat
use utils_time
implicit none

real(Configure_Long_Real) :: tstart, tstop

    tstart = time_DTime()


contains

!---------------------------------------------------------------------------------------------------
! Functions.
!---------------------------------------------------------------------------------------------------

!
! Origin function.
!
subroutine DIAMAT1(matd, diag, matr, leng)
implicit none
real matr(64), matd(64), diag(*)



end subroutine DIAMAT1

!---------------------------------------------------------------------------------------------------

end program Diamat

