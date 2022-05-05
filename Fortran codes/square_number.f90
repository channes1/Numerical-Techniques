!Check if a number is a perfect square
program square_number
IMPLICIT NONE

REAL :: nsqrt, n = 11, nsq
nsqrt=sqrt(real(n))
nsq=nsqrt*nsqrt
if(nsq.eq.n)then
write(*,*)'Perfect Square'
else
write(*,*)'NOT a Perfect Square'
endif
end program square_number
