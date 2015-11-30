!
! Multiplication diaginal matrix on common matrix.
!
! Additional flags:
!   -O3
!   -fno-inline
!

program Diamat
use utils_time
implicit none

real                      :: matd(64), matr(64), diag(5)
integer                   :: i
real(Configure_Long_Real) :: tstart, tstop

    tstart = time_DTime()
    do i = 1, 10000000
        call DIAMAT1(matd, diag, matr, 5)
    end do
    tstop = time_DTime()
    print *, "DIAMAT1     time = ", tstop - tstart

    tstart = time_DTime()
    do i = 1, 10000000
        call DIAMAT1_mod(matd, diag, matr)
    end do
    tstop = time_DTime()
    print *, "DIAMAT1_mod time = ", tstop - tstart

contains

!---------------------------------------------------------------------------------------------------
! Functions.
!---------------------------------------------------------------------------------------------------

!
! Origin function.
!
! Arguments:
!   matd - result matrix
!   diag - diag elements
!   matr - source matrix
!   leng - lenght of diag matrix
!
subroutine DIAMAT1(matd, diag, matr, leng)
implicit none
real, intent(out) :: matd(64)
real, intent(in)  :: matr(64), diag(*)
integer           :: leng

integer :: i, ii, j, ind

    matd = 0.0

    do i = 1, leng

        ii = (i - 1) * 8

        do j = 1, leng
            ind = ii + j
            matd(ind) = matr(ind) * diag(i)
        end do

    end do

end subroutine DIAMAT1

!---------------------------------------------------------------------------------------------------

!
! DIAMAT1 function with modifications.
!
! Arguments:
!   matd - result matrix
!   diag - diag elements of matrxi
!   matr - source matrix
!
! # # # # # * * *
! # # # # # * * *
! # # # # # * * *
! # # # # # * * *
! # # # # # * * *
! * * * * * * * *
! * * * * * * * *
! * * * * * * * *
!
subroutine DIAMAT1_mod(matd, diag, matr)
implicit none
real, intent(out) :: matd(64)
real, intent(in)  :: matr(64), diag(5)

integer :: i, ii, j, ind

    matd( 1: 5) = matr( 1: 5) * diag(1)
    matd( 9:13) = matr( 9:13) * diag(2)
    matd(17:21) = matr(17:21) * diag(3)
    matd(25:29) = matr(25:29) * diag(4)
    matd(33:37) = matr(33:37) * diag(5)

end subroutine Diamat1_mod

!---------------------------------------------------------------------------------------------------

end program Diamat

