!
! Configuration module.
!

module utils_configure
implicit none

! Long integer data type kind.
integer, parameter :: Configure_Long_Int = selected_int_kind(10)

! Long real data type kind.
integer, parameter :: Configure_Long_Real = selected_real_kind(15, 307)

end module utils_configure

