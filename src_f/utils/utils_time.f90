!
! Module for time processing.
!
module utils_time
use utils_configure
implicit none

contains

!---------------------------------------------------------------------------------------------------

!
! Get current time in seconds.
!
! Return:
!   Current time in seconds.
!
real(Configure_Long_Real) function time_DTime()

integer(Configure_Long_Int) :: count, count_rate, count_max
real(Configure_Long_Real)   :: tsec, rate

    call SYSTEM_CLOCK(count, count_rate, count_max)
    tsec = count
    rate = count_rate
    time_DTime = tsec / rate

end function time_DTime

!---------------------------------------------------------------------------------------------------

end module utils_time
